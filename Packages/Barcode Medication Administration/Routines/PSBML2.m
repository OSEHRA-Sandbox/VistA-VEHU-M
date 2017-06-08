PSBML2 ;BIRMINGHAM/TEJ-BCMA UTILITY TO EDIT THE PSB MED LOG  ; 2/11/13 4:47pm
 ;;3.0;BAR CODE MED ADMIN;**3,18,22,23,13,45,42,70,72**;Mar 2004;Build 16
 ;Per VHA Directive 2004-038, this routine should not be modified.;
 ; Reference/IA
 ; EN^PSJBCMA3/3320
 ; ENE^PSJBCMA4/3416
 ; ENR^PSJBCMA4/3416
 ;
 ;*70 - update Witness if present and Giving now as an updated, could 
 ;      mean undo given or a hold/refused was done first.
 ;
EDIT ;
 K RESULTS S PSBEDIEN=PSBIEN_",",RESULTS(0)=0
 I $G(PSBREC(7))']"" S RESULTS(0)=1,RESULTS(1)="-1^Data NOT filed - Comment is required" Q
 D
 .S PSBEDTFL=1,PSBMODS=0,PSBREC(1)=""
 .D:PSBREC(4)]"" VAL^PSBML(53.79,PSBEDIEN,.06,PSBREC(4))
 .I (PSBREC(0)="N") D
 ..I ($$GET1^DIQ(53.79,PSBEDIEN,.11)["V") F PSBX=1:1:6 S PSBREC(PSBX)=""
 .I ("NHR"[PSBREC(0)),$D(^PSB(53.79,+PSBEDIEN,.2)) D
 ..; Audit PRN
 ..D:$P(^PSB(53.79,+PSBEDIEN,.2),U,2)]"" AUDIT^PSBUTL(+PSBEDIEN,53.79,.22,$P(^PSB(53.79,+PSBEDIEN,.2),U,2),"K")
 ..I ($P(^PSB(53.79,+PSBEDIEN,0),U,9)="G")!($P(^PSB(53.79,+PSBEDIEN,0),U,9)="I") D
 ...I $D(^PSB(53.79,"APRN",$P(^PSB(53.79,+PSBEDIEN,0),U,1),$P(^PSB(53.79,+PSBEDIEN,0),U,6),+PSBEDIEN)) D
 ....K ^PSB(53.79,"APRN",$P(^PSB(53.79,+PSBEDIEN,0),U,1),$P(^PSB(53.79,+PSBEDIEN,0),U,6),+PSBEDIEN) K ^PSB(53.79,+PSBEDIEN,.2)
 .I ("NHR"'[PSBREC(0)) D:$G(PSBREC(5))]"" VAL^PSBML(53.79,PSBEDIEN,.21,$G(PSBREC(5))) D:$G(PSBREC(6))]"" VAL^PSBML(53.79,PSBEDIEN,.22,$G(PSBREC(6)))
 .I +$G(RESULTS(0))<0 S RESULTS(1)="-1^Data NOT filed - "_$P(RESULTS(0),U,2),RESULTS(0)=1 Q
 .D:$D(^PSB(53.79,+PSBEDIEN,.2)) VAL^PSBML(53.79,PSBEDIEN,.21,$G(PSBREC(5))),VAL^PSBML(53.79,PSBEDIEN,.22,$G(PSBREC(6)))
 .D VAL^PSBML(53.793,"+2,"_PSBIEN,.01,PSBREC(7))
 .D VAL^PSBML(53.793,"+2,"_PSBIEN,.02,"`"_DUZ)
 .D VAL^PSBML(53.793,"+2,"_PSBIEN,.03,PSBNOW)
 Q:+$G(RESULTS(1))<0
 S PSBMODS=$$CHANGE^PSBML3(.PSBREC,PSBEDIEN)
 D:PSBMODS UPDATED
 D:('$G(PSBERR))&('$G(PSBMODS)) FILEIT^PSBML
 ; Audit DD
 I $D(PSBORDMD) S (PSBXY,PSBXZ)="" D
 .F  S PSBXY=$O(PSBORDMD(PSBXY)) Q:PSBXY=""  S PSBFDAX=$S(PSBXY=.6:53.796,PSBXY=.7:53.797,1:53.795) F  S PSBXZ=$O(PSBORDMD(PSBXY,PSBXZ)) Q:PSBXZ=""  D
 ..S PSBXACT="",PSBXACT=$G(PSBORDMD(PSBXY,PSBXZ,0))
 ..D:PSBXACT["ADD" AUDIT^PSBUTL(+PSBEDIEN,PSBFDAX,.01,PSBXZ,"S") D:PSBXACT["DELETE" AUDIT^PSBUTL(+PSBEDIEN,PSBFDAX,.01,PSBXZ,"K")
 ;
 K PSBORDMD,PSBCHNG,PSBDDX,PSBEDTFL,PSBEDIEN,PSBFILED
 Q
 ;
UPDATED ;
 N PSBADD
 S PSBIEN=PSBIEN_",",PSBXPTCH=0
 S PSBRECNO=$S(PSBEDTFL:8,1:4)
 I "^G^N^H^R^RM^S^C^I^M^"[(U_PSBREC(0)_U) D
 .D:('PSBEDTFL) VAL^PSBML(53.79,PSBIEN,.06,PSBNOW)
 .D:$D(PSBREC(4,0)) VAL^PSBML(53.79,PSBIEN,.06,PSBREC(4))
 .D VAL^PSBML(53.79,PSBIEN,.07,"`"_DUZ)
 .D:('PSBEDTFL)!($G(PSBREC(0,0))) VAL^PSBML(53.79,PSBIEN,.09,PSBREC(0))
 .I $G(PSBREC(3))]"" D VAL^PSBML(53.79,PSBIEN,.26,PSBREC(3))
 I $D(PSBREC(PSBRECNO)) D:($G(PSBREC(0))="G")&($P(PSBREC(PSBRECNO),U,5)["PATCH")  Q:+$G(RESULTS(1))<0
 .Q:$$GET1^DIQ(53.79,PSBIEN,.09,"I")=""
 .S PSBXDFN=$$GET1^DIQ(53.79,PSBIEN,.01,"I")
 .S PSBXORN=$$GET1^DIQ(53.79,+PSBIEN,.11,"I")
 .S PSBXDT="" F  S PSBXDT=$O(^PSB(53.79,"AORDX",PSBXDFN,PSBXORN,PSBXDT)) Q:PSBXDT=""  D  Q:+$G(RESULTS(1))<0
 ..S PSBYZ="" F  S PSBYZ=$O(^PSB(53.79,"AORDX",PSBXDFN,PSBXORN,PSBXDT,PSBYZ)) Q:'PSBYZ  I ($$GET1^DIQ(53.79,PSBYZ,.09,"I")="G"),(PSBYZ'=+PSBIEN) S RESULTS(0)=1,RESULTS(1)="-1^Previous Patch has not been removed. Administration canceled." Q
 S:'$D(PSBXDFN) PSBXDFN=$$GET1^DIQ(53.79,PSBIEN,.01,"I"),PSBXORN=$$GET1^DIQ(53.79,+PSBIEN,.11,"I")
 I $G(PSBREC(3))']"",$G(PSBREC(0))="G",$P($G(PSBREC(4)),U)'="DD",$P($G(PSBREC(8)),U)'="DD" S PSBUID=$$GETWSID^PSBVDLU2(+PSBXDFN,+PSBXORN) D VAL^PSBML(53.79,PSBIEN,.26,PSBUID)
 D:$G(PSBREC(0))="N"
 .I (PSBREC(0)="N"),($$GET1^DIQ(53.79,+PSBIEN,.09,"I")="G") S PSBREC(1)="Undo Given: "_$G(PSBREC(1))
 .I ((PSBREC(0)="N")!(PSBREC(0)="G")),($$GET1^DIQ(53.79,+PSBIEN,.09,"I")="RM") S PSBREC(1)="Undo Remove: "_$G(PSBREC(1))
 .; Undo PRN
 .I $D(^PSB(53.79,+PSBIEN,.2)) D
 ..I $P(^PSB(53.79,+PSBIEN,0),U,9)="G"!($P(^PSB(53.79,+PSBIEN,0),U,9)="I") D VAL^PSBML(53.79,PSBIEN,.21,"@") D  ;Use BCMA Edit function to delete PRN Reason Field
 ...N DIK,DA
 ...I $$GET1^DIQ(53.79,PSBIEN_",",.22)]"" D VAL^PSBML(53.79,PSBIEN,.22,"@"),VAL^PSBML(53.79,PSBIEN,.23,"@"),VAL^PSBML(53.79,PSBIEN,.24,"@"),VAL^PSBML(53.79,PSBIEN,.25,"@") ;Use BCMA Edit function to delete PRN Effectiveness fields
 ...S DIK(1)=".12",DA=+PSBIEN,DIK="^PSB(53.79,"_DA_"," D EN2^DIK ;Use FM to properly delete order status and clean up "APRN" cross reference,PSB*3*72
 ..D:$$GET1^DIQ(53.79,PSBIEN_",",.27)=1 VAL^PSBML(53.79,PSBIEN,.27,"@") ;Use BCMA Edit function to delete PRN Reason Flag field, PSB*3*72
 D:$G(PSBREC(1))]""
 .S:PSBREC(0)="H" PSBREC(1)="Held: "_PSBREC(1)
 .S:PSBREC(0)="R" PSBREC(1)="Refused: "_PSBREC(1)
 .S:PSBREC(0)="RM" PSBREC(1)="Removed: "_PSBREC(1)
 .I $D(PSBFDA(53.793,"+2,"_PSBIEN,.01)) S PSBREC(1)=PSBREC(1)_(PSBFDA(53.793,"+2,"_PSBIEN,.01))
 .D VAL^PSBML(53.793,"+2,"_PSBIEN,.01,PSBREC(1)),VAL^PSBML(53.793,"+2,"_PSBIEN,.02,"`"_DUZ),VAL^PSBML(53.793,"+2,"_PSBIEN,.03,PSBNOW)
 S PSBXDFN=$$GET1^DIQ(53.79,PSBIEN,.01,"I")
 I ($$GET1^DIQ(53.79,+PSBIEN,.09,"I")="RM"),((PSBREC(0)="N")!(PSBREC(0)="G")) D
 .I '(($D(^XUSEC("PSB MANAGER",DUZ)))!($$GET1^DIQ(53.79,+PSBIEN,.07,"I")=DUZ)) S RESULTS(0)=1,RESULTS(1)="-1^Verify PSB MANAGER allocation" Q
 .S PSBXPTCH=1,PSBYY="",PSBGIVEN=0 F  S PSBYY=$O(^PSB(53.79,+PSBIEN,.9,PSBYY),-1) Q:'PSBYY  Q:(+$G(RESULTS(0))<0)  Q:PSBGIVEN  S PSBXDAT=$G(^(PSBYY,0))  D
 ..;PSB*3*45 Should be checking if action status changed to GIVEN
 ..I $P(PSBXDAT,"^",4)["GIVEN" D
 ...S PSBXDATE=$P(^PSB(53.79,+PSBIEN,.9,PSBYY,0),U)
 ...S PSBXORN=$$GET1^DIQ(53.79,+PSBIEN,.11,"I")
 ...S PSBYX=(PSBYY-2) I (PSBYX)>0 I ^PSB(53.79,+PSBIEN,.9,PSBYX,0)["ACTION DATE/TIME '" S PSBXDATE=$P(^PSB(53.79,+PSBIEN,.9,PSBYX,0),"'",2),X=$P(PSBXDATE,"@"),%DT="" D ^%DT S PSBXDATE=Y_"."_$TR($P(PSBXDATE,"@",2),":")
 ...S PSBXDT="" F  S PSBXDT=$O(^PSB(53.79,"AORDX",PSBXDFN,PSBXORN,PSBXDT)) Q:PSBXDT=""  D  Q:+$G(RESULTS(1))<0
 ....S PSBYZ="" F  S PSBYZ=$O(^PSB(53.79,"AORDX",PSBXDFN,PSBXORN,PSBXDT,PSBYZ)) Q:'PSBYZ  I ($$GET1^DIQ(53.79,PSBYZ,.09,"I")="G"),(PSBYZ'=+PSBIEN) S RESULTS(0)=1,RESULTS(1)="-1^Cannot UNDO! Order has GIVEN patch" Q
 ...I '(+$G(RESULTS(1))<0) D  S PSBGIVEN=1
 ....;PSB*3*45 Added PSBLSTG for the last user who gave the patch. this will be logged in order to undo multiple removed.
 ....S PSBLSTG=$P(PSBXDAT,"^",2),I="" F  S I=$O(^PSB(53.79,+PSBIEN,.9,I),-1) Q:'I  I $P(^PSB(53.79,+PSBIEN,.9,I,0),"^",4)["GIVEN" D  Q
 .....S PSBLSTG=$S($P($G(PSBXDAT),"^",5):$P(PSBXDAT,"^",5),1:$P(PSBXDAT,"^",2))
 ....D VAL^PSBML(53.79,PSBIEN,.06,PSBXDATE),VAL^PSBML(53.79,PSBIEN,.07,"`"_PSBLSTG),VAL^PSBML(53.79,PSBIEN,.09,"G") K PSBLSTG
 ..D:('(+$G(RESULTS(1))<0))&('PSBGIVEN)&($G(PSBXPTCH))&(PSBYY'>1)
 ...S PSBXDATE=$P(^PSB(53.79,+PSBIEN,.9,PSBYY,0),"'",2),X=$P(PSBXDATE,"@"),%DT="" D ^%DT S PSBXDATE=Y_"."_$TR($P(PSBXDATE,"@",2),":")
 ...D VAL^PSBML(53.79,PSBIEN,.06,PSBXDATE),VAL^PSBML(53.79,PSBIEN,.07,"`"_$$GET1^DIQ(53.79,+PSBIEN,.07,"I")),VAL^PSBML(53.79,PSBIEN,.09,"G") S PSBGIVEN=1
 Q:(+$G(RESULTS(1))<0)
 I PSBEDTFL,$G(PSBGIVEN),PSBXPTCH S PSBREC(0)="G",PSBUNTSG=$P(PSBREC(8),U,4) D VAL^PSBML(53.795,(1_","_PSBIEN),.03,$S(PSBUNTSG'=0:PSBUNTSG,1:1)) K PSBXPTCH
 I $G(PSBREC(2))]"" D VAL^PSBML(53.79,PSBIEN,.16,PSBREC(2))
 S PSBOLDUZ=$P(^PSB(53.79,+PSBIEN,0),U,7),PSBOLSTS=$P(^PSB(53.79,+PSBIEN,0),U,9)
 I $G(PSBREC(PSBRECNO))]"" D  ; DD/SOL/ADD
 .I PSBREC(0)="G"!(PSBREC(0)="I")!(PSBREC(0)="H")!(PSBREC(0)="R")!(PSBREC(0)="M") D  ; Only if gvn or infus
 ..Q:(PSBEDTFL)&('$G(PSBCHNG))
 ..F PSBCNT=PSBRECNO:1 Q:'$D(PSBREC(PSBCNT))  D
 ...S Y=$P(PSBREC(PSBCNT),U)
 ...S PSBDD=$S(Y="DD":53.795,Y="ADD":53.796,Y="SOL":53.797,1:0)
 ...Q:'PSBDD
 ...I $G(PSBCHNG) D
 ....I $D(PSBFIND(PSBCNT)) S PSBIENS=$QS($Q(PSBFIND(PSBCNT)),2)_","_PSBIEN
 ....I '$D(PSBFIND(PSBCNT)) S PSBIENS="+1,"_PSBIEN
 ....D VAL^PSBML(PSBDD,PSBIENS,.01,"`"_$P(PSBREC(PSBCNT),U,2))
 ....D:PSBDD=53.795 VAL^PSBML(PSBDD,PSBIENS,.02,$P(PSBREC(PSBCNT),U,3))
 ....I (PSBDD=53.796!(PSBDD=53.797))&($P(PSBREC(PSBCNT),U,4)) D VAL^PSBML(PSBDD,PSBIENS,.02,$P(PSBREC(PSBCNT),U,4)) ;Store units in Units ordered field, PSB*3*72
 ....D:PSBREC(0)="G"!(PSBREC(0)="I") VAL^PSBML(PSBDD,PSBIENS,.03,$P(PSBREC(PSBCNT),U,4)) ;only store units given when infusing or given, PSB*3*72
 ....D:Y="DD" VAL^PSBML(PSBDD,PSBIENS,.04,$P(PSBREC(PSBCNT),U,5))
 ....D VAL^PSBML(PSBDD,PSBIENS,.05,$P(PSBREC(PSBCNT),U,7))     ;HR *70
 .I ('PSBEDTFL)!((PSBREC(0)'="G")&($$GET1^DIQ(53.79,PSBIEN,.09,"I")="G")) D
 ..S (PSBDCNT,PSBACNT,PSBSCNT)=0,PSBADD=3 F PSBCNT=PSBRECNO:1 Q:'$D(PSBREC(PSBCNT))  D
 ...S Y=$P(PSBREC(PSBCNT),U)
 ...S PSBDD=$S(Y="DD":53.795,Y="ADD":53.796,Y="SOL":53.797,1:0)
 ...Q:'PSBDD
 ...S @("PSB"_$E(Y)_"CNT")=@("PSB"_$E(Y)_"CNT")+1
 ...S PSBIENS=(@("PSB"_$E(Y)_"CNT"))_","_PSBIEN
 ...I '$$GET1^DIQ(PSBDD,PSBIENS,.01,"I") S PSBIENS="+"_PSBADD_","_PSBIEN,PSBADD=PSBADD+1
 ...D VAL^PSBML(PSBDD,PSBIENS,.01,"`"_$P(PSBREC(PSBCNT),U,2))
 ...D:PSBDD=53.795 VAL^PSBML(PSBDD,PSBIENS,.02,$P(PSBREC(PSBCNT),U,3))
 ...I (PSBDD=53.796!(PSBDD=53.797))&($P(PSBREC(PSBCNT),U,4)) D VAL^PSBML(PSBDD,PSBIENS,.02,$P(PSBREC(PSBCNT),U,4)) ;Store units in Units ordered field, PSB*3*72
 ...D:Y="DD" VAL^PSBML(PSBDD,PSBIENS,.03,$S(PSBREC(0)="G"!(PSBREC(0)="RM"):$P(PSBREC(PSBCNT),U,4),1:0)),VAL^PSBML(PSBDD,PSBIENS,.04,$P(PSBREC(PSBCNT),U,5))
 ...I PSBDD=53.796!(PSBDD=53.797),PSBREC(0)="G" D VAL^PSBML(PSBDD,PSBIENS,.03,$P(PSBREC(PSBCNT),U,4))
 I ($G(PSBREC(PSBRECNO))']""),(PSBREC(0)="N"),($$GET1^DIQ(53.79,PSBIEN,.09,"I")="G") D
 .S PSBX=0 F  S PSBX=$O(^PSB(53.79,+PSBIEN,.5,PSBX)) Q:'+PSBX  D VAL^PSBML(53.795,(PSBX_","_PSBIEN),.03,0)
 I PSBWITHR>1,PSBREC(0)="G" D     ;Witness logic and Give?  *70
 .D:PSBWITN VAL^PSBML(53.79,PSBIEN,.28,PSBNOW)        ;Witness dt/time
 .D:PSBWITN VAL^PSBML(53.79,PSBIEN,.29,"`"_PSBWITN)   ;Witness duz
 .D:PSBWITCM]"" VAL^PSBML(53.79,PSBIEN,.31,PSBWITCM)  ;Witness comment
 .D VAL^PSBML(53.79,PSBIEN,.32,PSBWITHR)          ;Witness HR ord code
 .D VAL^PSBML(53.79,PSBIEN,.33,PSBWITFL)          ;Witnessed? flag
 ;
 I PSBWITHR>1,PSBREC(0)="N" D      ;Undo Give of Witness fields    *70
 .N WTDT,WTNS,WTCM,WTHR,WTFL       ;only delete if currently has data
 .S WTDT=$$GET1^DIQ(53.79,+PSBIEN,.28,"I")
 .S WTNS=$$GET1^DIQ(53.79,+PSBIEN,.29,"I")
 .S WTCM=$$GET1^DIQ(53.79,+PSBIEN,.31,"I")
 .S WTHR=$$GET1^DIQ(53.79,+PSBIEN,.32,"I")
 .S WTFL=$$GET1^DIQ(53.79,+PSBIEN,.33,"I")
 .D:WTDT VAL^PSBML(53.79,PSBIEN,.28,"@")
 .D:WTNS VAL^PSBML(53.79,PSBIEN,.29,"@")
 .D:WTCM]"" VAL^PSBML(53.79,PSBIEN,.31,"@")
 .D:WTHR>1 VAL^PSBML(53.79,PSBIEN,.32,"@")
 .D:WTFL]"" VAL^PSBML(53.79,PSBIEN,.33,"@")
 D FILEIT^PSBML
 I $P($G(RESULTS(1)),U,1)=1 D
 .S PSBUID=$P(^PSB(53.79,+PSBIEN,0),U,10) I PSBUID]"",PSBUID'["WS" D
 ..S PSBTS=PSBREC(0)
 ..S PSBON=$P(^PSB(53.79,+PSBIEN,.1),U,1)
 ..S PSBDFN=$P(^PSB(53.79,+PSBIEN,0),U,1)
 ..I PSBREC(0)="N" S PSBTS="" D
 ...M PSBAR=^PSB(53.79,+PSBIEN,.9)
 ...S (PSBDN,X)="" F  S X=$O(PSBAR(X),-1) Q:X=0!(PSBDN=1)  D
 ....I PSBAR(X,0)["ACTION STATUS",PSBAR(X,0)["deleted",PSBAR(X,0)'["GIVEN" D
 .....S PSBTS=$P($P(PSBAR(X,0),"'",2),"'",1)
 .....S PSBTS=$S(PSBTS="HELD":"H",PSBTS="REFUSED":"R",PSBTS="REMOVED":"RM",PSBTS="MISSING":"M",1:""),PSBDN=1
 ...D VAL^PSBML(53.79,PSBIEN,.26,"") D CLEAN^DILF,UPDATE^DIE("","PSBFDA","PSBIEN","PSBMSG")
 ..D EN^PSJBCMA3(PSBDFN,+PSBON,PSBUID,PSBTS,PSBNOW)
 I ($$GET1^DIQ(53.79,+PSBIEN,.12,"I")="O")&($$GET1^DIQ(53.79,+PSBIEN,.09,"I")="N") S PSBDFN=$$GET1^DIQ(53.79,+PSBIEN,.01,"I") D ENR^PSJBCMA4(PSBDFN,$$GET1^DIQ(53.79,+PSBIEN,.11))
 I ($$GET1^DIQ(53.79,+PSBIEN,.12,"I")="O")&($$GET1^DIQ(53.79,+PSBIEN,.09,"I")="G") S PSBDFN=$$GET1^DIQ(53.79,+PSBIEN,.01,"I") D ENE^PSJBCMA4(PSBDFN,$$GET1^DIQ(53.79,+PSBIEN,.11))
 I (PSBREC(0)="N")&($$GET1^DIQ(53.79,+PSBIEN,.09,"I")="N") D NGRESET^PSBML3(.PSBREC,PSBIEN)
 Q