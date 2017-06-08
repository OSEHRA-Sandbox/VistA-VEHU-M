SROATCM3 ;BIR/SJA - STUFF TRANMISSION IN ^TMP ;05/11/10
 ;;3.0;Surgery;**125,135,153,164,166,174,177,182,184**;24 Jun 93;Build 35
 N SRDISP,NYUK S SRDISP="",NYUK=$P(SRRES(1),U,2),SRA(209.1)=$G(^SRF(SRTN,209.1)),SRA(207.1)=$G(^SRF(SRTN,207.1)),SRA(205)=$G(^SRF(SRTN,205)),SRA(208)=$G(^SRF(SRTN,208))
 I NYUK'="" D
 .S SRDISP=$S(NYUK="BOARDING HOUSE":16,NYUK="COMMUNITY HOSPITAL":6,NYUK="COMMUNITY NURSING HOME":8,NYUK="FOSTER HOME":14,NYUK="HALFWAY HOUSE":15,NYUK="HOME-BASED PRIMARY CARE (HBPC)":20,1:NYUK)
 .Q:SRDISP'=NYUK  S SRDISP=$S(NYUK="HOSPICE CARE":22,NYUK="MILITARY HOSPITAL":3,NYUK="NURSE CARE CONTD ANOTHER COMM ":10,NYUK="NURSING CARE CONT AT SAME NURS":9,NYUK="OTHER FEDERAL HOSPITAL":4,1:NYUK)
 .Q:SRDISP'=NYUK  S SRDISP=$S(NYUK="OTHER GOVERNMENT HOSPITAL":5,NYUK="OTHER PLACEMENT/UNKNOWN (NOT S":19,NYUK="PENAL INSTITUTION":17,NYUK="REFER MEDICARE HOME HEALTH CAR":25,NYUK="REFER OTHER AGENCY-PD HOME HEA":26,1:NYUK)
 .Q:SRDISP'=NYUK  S SRDISP=$S(NYUK="REFER VA-PD HOME/COMMUNITY HEA":24,NYUK="RESIDENTIAL HOTEL/RESIDENT (IE":18,NYUK="RESPITE CARE":23,NYUK="RETURN TO COMMUNITY-INDEPENDEN":1,NYUK="SPINAL CORD INJURY-VACO APPROV":21,1:NYUK)
 .Q:SRDISP'=NYUK  S SRDISP=$S(NYUK="STATE HOME":11,NYUK="STATE HOME":13,NYUK="VA DOMICILLARY":12,NYUK="VA MEDICAL CENTER":2,NYUK="VA NURSING HOME CARE UNIT (NHC":7,1:"")
 ;
LN26 S SHEMP=$E(SHEMP,1,11)_" 26"_$J(SRDISP,2)_$J($P(SRA(200),"^",56),2)_$J($P(SRA(206),"^",15),2)_$J("",2)_$J($P(SRA(207),"^",27),2)_$J($P(SRA(209),"^"),2)_$J($P(SRA(209),"^",2),2)
 S SHEMP=SHEMP_$J($P(SRA(209),"^",3),2)_$J($P(SRA(209),"^",4),2)_$J($P(SRA(209),"^",5),2)_$J($P(SRA(209),"^",6),3)_$J($P(SRA(209),"^",7),3)_$J($P(SRA(209),"^",8),3)_$J($P(SRA(209),"^",9),2)_$J($P(SRA(209),"^",10),2)
 S X=$P(SRA(206),"^",42),Y="" F I=1:1:6 S Y=Y_$P(X,",",I)
 S SHEMP=SHEMP_$J($P(SRA(209),"^",11),2)_$J("",5)
 S X=$P(SRA(209),"^",12) S:X="" X="N" S SHEMP=SHEMP_$J(X,2)_$J(Y,6)
 S X=$P(SRA(205),"^",43) S:X="" X="N" S SHEMP=SHEMP_$J(X,2)
 S X=$P(SRA(205),"^",44) S:X="" X="N" S SHEMP=SHEMP_$J(X,2)
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1
LN27 ;Line #27 - Other Cardiac Procedures
 S SHEMP=$E(SHEMP,1,11)_" 27"_$TR($E($G(SRA(209.1)),1,65),",","^")
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1
LN28 ;Lines 28 - New fields added in 2006 update
 S SHEMP=$E(SHEMP,1,11)_" 28"_$J($P(SRA(209),"^",13),2)_$J($P(SRA(209),"^",14),2)_$J($P(SRA(207.1),"^",2),2)_$J($P(SRA(201),"^",28),6)_$J($P(SRA(202.1),"^"),7)
 S SHEMP=SHEMP_$J($P(SRA(201),"^",29),5)_$J($P(SRA(202.1),"^",2),7)
 I $D(SRRES(2)) F I=8,9 S SHEMP=SHEMP_$J($P(SRRES(2),"^",I),8)
 S SRA(210)=$G(^SRF(SRTN,210)),SRA(200.1)=$G(^SRF(SRTN,200.1))
 S SHEMP=SHEMP_$S('$D(SRRES(2)):"                ",1:"")_$J($P(SRA(210),"^"),1)
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1
LN29 ;
 N II,OT S SRA("VER1")=$G(^SRF(SRTN,"VER1"))
 S II=0,OT="" F  S II=$O(^SRF(SRTN,63,"B",II)) Q:'II  S OT=OT_II
 S SHEMP=$E(SHEMP,1,11)_" 29"_$J(OT,7)_$J($P(SRA("VER1"),"^",2),10)_$J($P(SRA("VER1"),"^",3),2)_$J($P(SRA("VER1"),"^",4),2)_$J($P(SRA("VER1"),"^",5),2)
 S SHEMP=SHEMP_$J($P(SRA("VER1"),"^",6),2)_$J($P(SRA("VER1"),"^",7),1)_$J($P(SRA("VER1"),"^",8),1)_$J($P(SRA("VER1"),"^",9),1)_$J($E($P(SRA("VER1"),"^",19),1,12),12)
 S SHEMP=SHEMP_$J($P(SRA("VER1"),"^",10),1)_$J($E($P(SRA("VER1"),"^",21),1,12),12)_$J($P(SRA("VER1"),"^",22),1)_$J($P(SRA("VER1"),"^",12),1)_$J($P(SRA("VER1"),"^",24),1)
 S SHEMP=SHEMP_$J($P(SRA("VER1"),"^",14),1)_$J($P(SRA("VER1"),"^",15),1)_$J($P(SRA("VER1"),"^",16),1)
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1
LN30 ;
 N SRNM11,SRNM13,SRNM23,SRNM25 S (SRNM11,SRNM13,SRNM23,SRNM25)=""
 F II=11,23,13,25 I $P(SRA("VER1"),"^",II) S @("SRNM"_II)=$P($G(^VA(200,$P(SRA("VER1"),"^",II),0)),"^")
 S SHEMP=$E(SHEMP,1,11)_" 30"_$J($E(SRNM11,1,30),30)_$J($E(SRNM23,1,30),30)
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1
LN31 ;
 S SHEMP=$E(SHEMP,1,11)_" 31"_$J($E(SRNM13,1,30),30)_$J($E(SRNM25,1,30),30)
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1
LN32 ;
 S II=0,(SRC,OT)="" F  S SRC=$O(^SRF(SRTN,57,"B",SRC)) Q:SRC=""!(II=7)  S OT=OT_$J($E(SRC,1,10),10),II=II+1
 S SHEMP=$E(SHEMP,1,11)_" 32"_$J($E(OT,1,60),60)
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1
LN33 ;
 S OT1="" F I=1:1:17,19:1:28 S OT1=OT1_$J($P(SRA(211),U,I),2)
 S SHEMP=$E(SHEMP,1,11)_" 33"_$J($E(OT,61,70),10)_OT1
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1
LN34 ;
 S (SRC,OT)="" F  S SRC=$O(^SRF(SRTN,64,"B",SRC)) Q:'SRC  S OT=OT_$J(SRC,1)
 S SHEMP=$E(SHEMP,1,11)_" 34"_$J(OT,6)_$J($P(SRA(211),U,30),2)_$J($P(SRA(211),U,31),5)_$J($P(SRA(211),U,32),5)_$J($P(SRA(211),U,35),5)
 S OT="",II=0 F II="34;4","39;4","33;3","36;3","40;3","37;2","38;2","41;2","42;2","43;2" S OT=OT_$J($P(SRA(211),U,+II),$P(II,";",2))
 S SHEMP=SHEMP_OT_$J($P(SRA("VERD"),U,6),4)_$J($P(SRA("VERD"),U,7),5)_$J($P(SRA("VERD"),U,8),4)
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1
LN35 ;
 S OT="" F II=2:1:4,7,10,11 S OT=OT_$J($P(SRA(210),U,II),2)
 S SHEMP=$E(SHEMP,1,11)_" 35"_OT
 S OT="" F II=44:1:53 S OT=OT_$J($P(SRA(211),U,II),2)
 S SHEMP=SHEMP_OT_$J($E($P(SRA(211),U,54),1,12),12)_$J($E($P(SRA(211),U,55),1,12),12)_$J($P(SRA(211),U,56),3)_$J($P(SRA(211),U,57),3)
 S ^TMP("SRA",$J,SRAMNUM,SRACNT,0)=SHEMP,SRACNT=SRACNT+1
 Q