DGENUPLB ;ALB/TDM - PROCESS INCOMING (Z11 EVENT TYPE) HL7 MESSAGES ;4/10/13 6:53pm
 ;;5.3;REGISTRATION;**625,763,842,871,952**;Aug 13,1993;Build 160
 ;
EP N MSGARY
 D CHECK
 Q
 ;
CHECK ;Check for Rated Disability Changes
 Q:'$D(DGELG)
 N RDOCC,TMPARY,RD,RDOCC1,RDOCC2,RDFLG,RDNOD
 ;
 ;Change in Rated Disabilities
 I $D(OLDELG("RATEDIS")) D
 .S RDOCC=0 F  S RDOCC=$O(OLDELG("RATEDIS",RDOCC)) Q:RDOCC=""  D
 ..S RD=$P(OLDELG("RATEDIS",RDOCC,"RD"),"^") Q:RD=""
 ..S TMPARY(RD)=RDOCC
 ;
 I $D(DGELG("RATEDIS")) D
 .S RDOCC=0 F  S RDOCC=$O(DGELG("RATEDIS",RDOCC)) Q:RDOCC=""  D
 ..S RD=$P(DGELG("RATEDIS",RDOCC,"RD"),"^") Q:RD=""
 ..S $P(TMPARY(RD),"^",2)=RDOCC
 ;
 I $D(TMPARY) D
 .S RD=""
 .F  S RD=$O(TMPARY(RD)) Q:RD=""  D
 ..S RDOCC2=+$P(TMPARY(RD),"^",2) Q:'RDOCC2
 ..S RDOCC1=+$P(TMPARY(RD),"^")
 ..I 'RDOCC1 D STOR390 Q
 ..S RDFLG=0
 ..F RDNOD="RD","PER","RDSC","RDEXT","RDORIG","RDCURR" D  Q:RDFLG
 ...I $G(OLDELG("RATEDIS",RDOCC1,RDNOD))'=$G(DGELG("RATEDIS",RDOCC2,RDNOD)) D STOR390
 Q
 ;
STOR390 ;Store Data in file# 390
 S RDFLG=1
 N DATA,DA
 S DATA(.01)=$$NOW^XLFDT
 S DATA(2)=DFN
 S DATA(3)=DGELG("RATEDIS",RDOCC2,"RD")
 S DATA(4)=DGELG("RATEDIS",RDOCC2,"PER")
 S DATA(5)=DGELG("RATEDIS",RDOCC2,"RDEXT")
 S DATA(6)=DGELG("RATEDIS",RDOCC2,"RDORIG")
 S DATA(7)=DGELG("RATEDIS",RDOCC2,"RDCURR")
 I '$$ADD^DGENDBS(390,,.DATA) S ERROR="FILEMAN FAILED TO ADD RATED DISABILITY UPLOAD AUDIT"
 Q
 ;
ZE2 ; Process ZE2 segment
 N HL7REP,HL7SC,SUB
 S HL7SC=$E(HLECH,1)
 S DGPAT("PENAEFDT")=$$CONVERT^DGENUPL1($P(SEG(1),HL7SC),"DATE",.ERROR)
 I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZE2 SEGMENT , SEQ 1-1",.ERRCOUNT) Q
 S DGPAT("PENTRMDT")=$$CONVERT^DGENUPL1($P(SEG(1),HL7SC,2),"DATE",.ERROR)
 I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZE2 SEGMENT , SEQ 1-2",.ERRCOUNT) Q
 S DGPAT("PENAREAS")=$$CONVERT^DGENUPL1($P(SEG(2),HL7SC),"PENSIONCD",.ERRCOUNT)
 I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZE2 SEGMENT , SEQ 2",.ERRCOUNT) Q
 F HL7REP=1:1:4 D  Q:ERROR
 .Q:$P($P(SEG(3),"|",HL7REP),HL7SC)=""
 .S SUB="PENTRMR"_HL7REP
 .S DGPAT(SUB)=$$CONVERT^DGENUPL1($P($P(SEG(3),"|",HL7REP),HL7SC),"PENSIONCD",.ERRCOUNT)
 .I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZE2 SEGMENT , SEQ 3",.ERRCOUNT)
 ;
 ; Convert to deletion indicator if null
 N SUB F SUB="PENAEFDT","PENTRMDT","PENAREAS","PENTRMR1","PENTRMR2","PENTRMR3","PENTRMR4" S:$G(DGPAT(SUB))="" DGPAT(SUB)="@"
 Q
 ;
ZHP ;Process ZHP segment
 N CTR
 S CTR=$O(DGHBP(""),-1)+1
 S $P(DGHBP(CTR),U)=$$CONVERT^DGENUPL1(SEG(2),"HBP",.ERROR)
 I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZHP SEGMENT , SEQ 2",.ERRCOUNT) Q
 S $P(DGHBP(CTR),U,2)=$$CONVERT^DGENUPL1(SEG(3),"TS",.ERROR)
 I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZHP SEGMENT , SEQ 3",.ERRCOUNT) Q
 S $P(DGHBP(CTR),U,3)=.5                          ;Postmaster
 S $P(DGHBP(CTR),U,4)=$$CONVERT^DGENUPL1(SEG(5),"INSTITUTION",.ERROR)
 I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZHP SEGMENT , SEQ 5",.ERRCOUNT) Q
 S $P(DGHBP(CTR),U,5)=$$CONVERT^DGENUPL1(SEG(4),,.ERROR)
 I (($P(DGHBP(CTR),U,5)'="V")&($P(DGHBP(CTR),U,5)'="E")) S ERROR=1
 I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"BAD VALUE, ZHP SEGMENT , SEQ 4",.ERRCOUNT) Q
 Q
 ;
ZTE ; process ZTE segment DG*5.3*952
 N CHKFLG,CNT,EDITTS,ENTBY,FCLTY,ORIGTS,QFLG,SUBDT,TYPE
 S TYPE=$$CONVERT^DGENUPL1(SEG(4),,.ERROR)  I "^A^D^P^"'[(U_TYPE_U) S ERROR=1
 I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid value in ZTE segment, field 4",.ERRCOUNT) Q
 ; fields common to all 3 request types
 S SUBDT=$$CONVERT^DGENUPL1(SEG(2),"DATE",.ERROR)
 I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid value in ZTE segment, field 2",.ERRCOUNT) Q
 S CHKFLG=$S(SUBDT="@":0,1:1)
 S ORIGTS=$$CONVERT^DGENUPL1(SEG(3),"TS",.ERROR)
 I ERROR!(ORIGTS="") D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid value in ZTE segment, field 3",.ERRCOUNT) Q
 S EDITTS=$$CONVERT^DGENUPL1(SEG(5),"TS",.ERROR)
 I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid value in ZTE segment, field 5",.ERRCOUNT) Q
 S ENTBY=$$CONVERT^DGENUPL1(SEG(6),,.ERROR)
 I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid value in ZTE segment, field 6",.ERRCOUNT) Q
 I ENTBY="" S ENTBY="ES HL7 INTERFACE"
 S FCLTY=$$CONVERT^DGENUPL1(SEG(7),"INSTITUTION",.ERROR)
 I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid value in ZTE segment, field 7",.ERRCOUNT) Q
 S QFLG=0
 I TYPE="P" D  Q:QFLG
 .I $G(DGOTH("P"))'="" S ERROR=1
 .I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid ZTE segment, only one pending request is allowed.",.ERRCOUNT) S QFLG=1 Q
 .S DGOTH("P")="1"_U_SUBDT_U_ENTBY_U_FCLTY_U_ORIGTS_U_EDITTS
 .Q
 I TYPE="D" D  Q:QFLG
 .S CNT=$O(DGOTH("D",""),-1)+1
 .S DGOTH("D",CNT)=SUBDT
 .S $P(DGOTH("D",CNT),U,2)=$$CONVERT^DGENUPL1(SEG(13),,.ERROR)
 .I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid value in ZTE segment, field 13",.ERRCOUNT) S QFLG=1 Q
 .S DGOTH("D",CNT)=DGOTH("D",CNT)_U_ENTBY_U_FCLTY_U_ORIGTS_U_EDITTS
 .Q
 I TYPE="A" D  Q:QFLG
 .S CNT=$O(DGOTH("A",""),-1)+1
 .S DGOTH("A",CNT)=$$CONVERT^DGENUPL1(SEG(8),,.ERROR)
 .I CHKFLG,+DGOTH("A",CNT)'>0 S ERROR=1
 .I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid value in ZTE segment, field 8",.ERRCOUNT) S QFLG=1 Q
 .S $P(DGOTH("A",CNT),U,2)=$$CONVERT^DGENUPL1(SEG(9),,.ERROR)
 .I CHKFLG,+$P(DGOTH("A",CNT),U,2)'>0 S ERROR=1
 .I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid value in ZTE segment, field 9",.ERRCOUNT) S QFLG=1 Q
 .S $P(DGOTH("A",CNT),U,3)=SUBDT
 .S $P(DGOTH("A",CNT),U,4)=$$CONVERT^DGENUPL1(SEG(11),,.ERROR)
 .I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid value in ZTE segment, field 11",.ERRCOUNT) S QFLG=1 Q
 .S $P(DGOTH("A",CNT),U,5)=$$CONVERT^DGENUPL1(SEG(10),"DATE",.ERROR)
 .I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid value in ZTE segment, field 10",.ERRCOUNT) S QFLG=1 Q
 .S $P(DGOTH("A",CNT),U,6)=$$CONVERT^DGENUPL1(SEG(12),"DATE",.ERROR)
 .I CHKFLG,$P(DGOTH("A",CNT),U,6)="" S ERROR=1
 .I ERROR D ADDERROR^DGENUPL(MSGID,$G(DGPAT("SSN")),"Invalid value in ZTE segment, field 12",.ERRCOUNT) S QFLG=1 Q
 .S DGOTH("A",CNT)=DGOTH("A",CNT)_U_ENTBY_U_FCLTY_U_ORIGTS_U_EDITTS
 .Q
 Q
