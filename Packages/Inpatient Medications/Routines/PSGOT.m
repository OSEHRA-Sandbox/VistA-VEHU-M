PSGOT ;BIR/CML3-TRANSFERS DATA FROM 53.1 TO 55 ;24 SEP 97 / 7:54 AM
 ;;5.0;INPATIENT MEDICATIONS;**13,68,90,110,173,134,161,254,267,257**;16 DEC 97;Build 105
 ;
 ; Reference to ^PS(55 supported by DBIA 2191.
 ; Reference to ^PSUHL supported by DBIA 4803.
 ;
START ; get internal record number, lock record, and write
 S ODA=+PSGORD S:$D(^PS(55,PSGP,0))[0 ^(0)=PSGP,^PS(55,"B",PSGP,PSGP)="",$P(^PS(55,0),U,3,4)=PSGP_U_($P($G(^PS(55,0)),U,4)+1) F  L +^PS(55,PSGP,5,0):$S($G(DILOCKTM)>0:DILOCKTM,1:3) I  Q
 S ZND=$G(^PS(55,PSGP,5,0)) S:ZND="" ZND="^55.06IA" F DA=$P(ZND,"^",3)+1:1 I '$D(^PS(55,PSGP,5,DA)),'$D(^("B",DA)) L +^PS(55,PSGP,5,DA):$S($G(DILOCKTM)>0:DILOCKTM,1:3) I  S $P(ZND,"^",3)=DA,$P(ZND,"^",4)=$P(ZND,"^",4)+1,^PS(55,PSGP,5,0)=ZND Q
 L -^PS(55,PSGP,5,0) S ND0=^PS(53.1,ODA,0),$P(ND0,"^",23)=PSJPWD,^PS(55,PSGP,5,DA,0)=ND0
 S (ND1,^PS(55,PSGP,5,DA,.2))=$G(^PS(53.1,ODA,.2)),^PS(55,PSGP,5,DA,.3)=$G(^PS(53.1,ODA,.3)),(ND2,^PS(55,PSGP,5,DA,2))=^PS(53.1,ODA,2),^PS(55,PSGP,5,DA,4)=$G(^PS(53.1,ODA,4)),^PS(55,"AUD",+$P(ND2,"^",4),PSGP,DA)=""
 S X=^PS(55,PSGP,0) I $P(X,"^",7)="" S $P(X,"^",7)=$P($P(ND0,"^",16),"."),$P(X,"^",8)="A",^(0)=X D LOGDFN^PSUHL(PSGP)
 I $P($G(^PS(55,PSGP,5,DA,2)),"^",6)="" S $P(^PS(55,PSGP,5,DA,2),"^",6)=$S($G(PSGS0XT)'="":PSGS0XT,$P($G(ZZND),"^",3)'="":$P(ZZND,"^",3),1:""),$P(^PS(53.1,ODA,2),"^",6)=$P(^PS(55,PSGP,5,DA,2),"^",6)
 F X=6,7,13 I $D(^PS(53.1,ODA,X)) S ^PS(55,PSGP,5,DA,X)=^(X)
 I $D(^PS(53.1,ODA,"DSS")) S ^PS(55,PSGP,5,DA,8)=^("DSS") D CIMOU^PSJIMO1(PSGP,DA,"",ODA)
 I $O(^PS(53.1,ODA,1,0)) S (C,X)=0 F  S X=$O(^PS(53.1,ODA,1,X)) Q:'X  S:$D(^(X,0)) C=C+1,^PS(55,PSGP,5,DA,1,C,0)=^(0),^PS(55,PSGP,5,DA,1,"B",+$P($G(^(0)),U),C)=""
 I $O(^PS(53.1,ODA,1,0)) S ^PS(55,PSGP,5,DA,1,0)="^55.07P^"_C_"^"_C
 F X=3,12 D  S ^PS(55,PSGP,5,DA,X,0)="^55.0"_$S(X=3:8,1:612)_U_CNT_U_CNT
 .S CNT=0 F C=0:0 S C=$O(^PS(53.1,ODA,X,C)) Q:'C  I $D(^(C,0)) S ^PS(55,PSGP,5,DA,X,C,0)=^(0),CNT=CNT+1
 S $P(^PS(53.1,ODA,0),"^",19)=DA
 D SETUDINT^PSGSICH1(ODA_"P",DA_"U")
CR ; set x-refs
 N A
 I $D(^PS(55,PSGP,5.1)),$P(^(5.1),"^",6) S X=$P(^(5.1),"^",6) I $P(ND2,"^",3),$P(ND2,"^",6)'>X S $P(^(5.1),"^",6)=$P(ND2,"^",3)
 S ^PS(55,PSGP,5,"B",+ODA,DA)="",^PS(55,PSGP,5,"AU",$P(ND0,"^",7),+$P(ND2,"^",4),DA)=""
 S ^PS(55,PSGP,5,"AUS",+$P(ND2,"^",4),DA)=""
 S ^PS(55,PSGP,5,"C",+ND1,DA)="",^PS(55,"AUE",PSGP,DA)=""
 S ^PS(55,"AUDS",+$P(ND2,"^",2),PSGP,DA)=""
 I $D(^PS(55,PSGP,5,DA,8)) S A=^(8),^PS(55,"AUDC",+$P(ND2,"^",4),+A,PSGP,DA)=""
 I $$PATCH^XPDUTL("PXRM*1.5*12") S X(1)=+$P(ND2,"^",2),X(2)=+$P(ND2,"^",4),DA(1)=PSGP D SPSPA^PSJXRFS(.X,.DA,"UD")
 K DIK S DA(1)=PSGP S DIK="^PS(55,"_DA(1)_",5,",DIK(1)=125 D EN1^DIK K DIK
 S PSGTOL=2,PSGTOO=1 F PSGUOW=0:0 S PSGUOW=$O(^PS(53.41,2,1,PSGUOW)) Q:'PSGUOW  I $D(^(PSGUOW,1,PSGP,1,2,1,+ODA)) K ^(+ODA) D ENL^PSGVDS
DONE I $D(PSGOE2),PSGOE2]"",$D(^TMP("PSJON",$J,PSGOE2)) S ^(PSGOE2)=DA_"U"
 N PSJTMPTX,PSJOVRMX,PSJTMPLIN
 S PSGODA=ODA,PSGORD=DA_"U"
 S PSGNODE=$G(^PS(55,PSGP,5,DA,0)),PSG25=$P(PSGNODE,"^",25),PSG26=$P(PSGNODE,"^",26)
 I PSG25 S X=$S(PSG25["V":"^PS(55,"_PSGP_",""IV"",",PSG25["U"!(PSG25["A"):"^PS(55,"_PSGP_",5,",1:"^PS(53.1,")_+PSG25_","_$E("02",PSG25["V"+1)_")" I $D(@X) S $P(@X,"^",$S(PSG25["V":6,1:26))=DA_"U"
 I $P(PSGNODE,"^",26),$P(PSGNODE,"^",26)'["V",$D(^PS(55,PSGP,5,+$P(PSGNODE,"^",26),0)) S $P(^(0),"^",25)=DA_"U"
 F Q=0:0 S Q=$O(^PS(53.44,Q)) Q:'Q  I $D(^(Q,1,PSGP,+ODA,0)) S $P(^(0),"^",2)=DA
 I $D(^PS(53.1,+ODA,15,0)) S ^PS(55,PSGP,5,DA,15,0)="^55.6135^"_$P($G(^PS(53.1,+ODA,15,0)),"^",3)_"^"_$P($G(^PS(53.1,+ODA,15,0)),"^",4) D
 .N LN,LNCNT,SIMSG S SIMSG="Instructions too long. See Order View or BCMA for full text."
 .S LNCNT=0,LN=9999 F  S LN=$O(^PS(53.1,+ODA,15,LN),-1) Q:'LN  D
 ..I 'LNCNT,($G(^PS(53.1,+ODA,15,LN,0))="") Q
 ..S ^PS(55,PSGP,5,DA,15,LN,0)=^PS(53.1,+ODA,15,LN,0) S LNCNT=LNCNT+1
 .I LNCNT S $P(^PS(55,PSGP,5,DA,15,0),"^",3,4)=LNCNT_"^"_LNCNT
 .S PSJTMPTX="",PSJOVRMX=0 S TMPLIN=0 F  S TMPLIN=$O(^PS(55,+DFN,5,DA,15,TMPLIN)) Q:'TMPLIN!(PSJOVRMX)  D
 ..S:($L(PSJTMPTX)+$L($G(^PS(55,+DFN,5,DA,15,TMPLIN,0))))>180 PSJOVRMX=1 Q:$G(PSJOVRMX)  S PSJTMPTX=$G(PSJTMPTX)_$S($G(PSJTMPTX)]"":" ",1:"")_$G(^PS(55,+DFN,5,DA,15,TMPLIN,0))
 .S TXT=$S(PSJOVRMX:SIMSG,1:PSJTMPTX)
 .S:($TR(TXT,"^ ")="")!'($D(^PS(55,PSGP,5,DA,15,1))) TXT="" S ^PS(55,PSGP,5,DA,6)=TXT S $P(^PS(55,PSGP,5,DA,6),"^",2)=$P(^PS(53.1,+ODA,6),"^",2)
 .N LSTLNUM,LSTLNTXT S LSTLNUM=$O(^PS(55,+PSGP,5,+DA,15,""),-1) I LSTLNUM>1 S LSTLNTXT=$G(^PS(55,+PSGP,5,+DA,15,LSTLNUM,0)) I $TR(LSTLNTXT," ")="" D
 ..K ^PS(55,+PSGP,5,+DA,15,LSTLNUM,0)
 L -^PS(53.1,+ODA) L -^PS(55,PSGP,5,+DA) K CNT,ND,ODA,XX,ZND
 Q
 ;