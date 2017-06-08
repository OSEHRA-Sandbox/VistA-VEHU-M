MCRH1 ;WISC/HAG-RHEUMATOLOGY PATIENT HISTORY EDIT ;7/3/96  09:13
 ;;2.3;Medicine;**31,35**;09/13/1996
 ; Reference IA #10061 VADPT calls
 ;           IA #  681 Get Lab data
 ;           IA #10035 PATIENT file (#2)
CONS S MCARCODE="Z" D CONSULT^MCARGE G EXIT
CONSS S MCARCODE="Z" D CONSULT^MCARGES G EXIT
CONSP D CONSULT^MCARGP G EXIT
MCRHMED S MCARCODE="R" D EN1^MCARSUP G EXIT
ALLP S MCRHLP="P",MCRH=0 G SEL
DIAGP S MCRHLP="P",MCRH=1 G SEL
BACKP S MCRHLP="P",MCRH=2 G SEL
NARRP S MCRHLP="P",MCRH=3 G SEL
LABP S MCRHLP="P",MCRH=4 G SEL
HAQP S MCRHLP="P",MCRH=6 G SEL
HISTP S MCRHLP="P",MCRH=7 G SEL
PHYSP S MCRHLP="P",MCRH=8 G SEL
DEATHP S MCRHLP="P",MCRH=9 G SEL
DIAGL S MCRHLP="L",MCRH=1 G SEL
NARRL S MCRHLP="L",MCRH=3 G SEL
HAQL S MCRHLP="L",MCRH=6 G SEL
HISTL S MCRHLP="L",MCRH=7 G SEL
PHYSL S MCRHLP="L",MCRH=8 G SEL
DEATHL S MCRHLP="L",MCRH=9 G SEL
BRIEFL S MCRHLP="L",MCRH=10 G SEL
DIAGF S MCRH=1 G SEL
BACKF S MCRH=2 G SEL
NARRF S MCRH=3 G SEL
TRETF S MCRH=5 G SEL
LABF S MCRH=4 G SEL
HAQF S MCRH=6 G SEL
HISTF S MCRH=7 G SEL
PHYSF S MCRH=8 G SEL
DEATHF S MCRH=9 G SEL
BRIEFF S MCRH=10
SEL ; Visit Date Selection
 N MCRHB
 S MCFILE=701,MCPRO="RHEUM"
 S DIC("A")="Select prior visit by entering the patient name or visit date"_$S(MCRH=2:" or enter the date@time for a new visit: ",1:": ")
PRT I $D(MCRHLP),(MCRHLP="P"),(MCRH'=4) D RHFULL^MCARP G EXIT
 S DIC="^MCAR(701,",DIC(0)=$S(MCRH=2:"AELQMZ",1:"AEQMZ") S:MCRH=2 DLAYGO=701 D ^DIC K DLAYGO G:Y<0 EXIT S (DJDN,DA,MCARGDA)=+Y,DFN=$P(Y(0),U,2),MC0=Y(0) D DEM^VADPT S MCSEX=$P(VADM(5),U),Y(0)=MC0 K MC0
 I MCRH=2 N MCARR1,MCARRC,MCHOLD S (MCARRC,MCHOLD)=$P(VADM(8),U,2),MCARRC=$$ETHN^MCPFTP1(MCHOLD,.VADM) D GETDATA
 I MCRH=5 S Y=$P(Y(0),U,2),PSOPAR="" D DOIT^MCPSOP G SEL
 I MCRH=4 S DJDIS=1,MCLRDFN=$G(^DPT($P(Y(0),U,2),"LR")) W:MCLRDFN="" !!,*7,*27,*91,*49,*109,"  Patient laboratory information has not been processed!",*27,*91,*109 G:MCLRDFN="" SEL D GETLAB G:Y<0 SEL I '$D(MCRHLP) D HOME^%ZIS,QSTART G EXIT
 I MCRH=4,$D(MCRHLP),(MCRHLP="P") D QUE G EXIT
LIN I $D(MCRHLP),(MCRHLP="L") S V=MCRH,DIE="^MCAR(701," S DR=$S($G(MCBL)=1:"[MCRHBRIEF]",1:"[MCRH"_$S(V=1:"DIAG",V=3:"NARR",V=6:"HAQ",V=7:"HIST",V=9:"DEATH",1:"PHYS")) K V D ORDERA G EXIT:$D(DTOUT)!$D(DUOUT) D ^DIE,ORDER1,QTASK^MCPARAM G SEL
FUL S:MCRH=2 DJDN=$P(^MCAR(701,DA,0),U,2),DJDIS=1 S V=MCRH,(MCRHB,DJSC)=$S($G(MCBS)=1:"MCRHBRSCREEN",1:"MCRH"_$S(V=1:"DIAG",V=2:"BACK",V=3:"NARR",V=4:"LAB010",V=6:"HAQ",V=7:"HIST",V=9:"DEATH",1:"PHYS"))
 I MCRH=2&(MCRHB="MCRHBACK") D ORDERA G EXIT:$D(DTOUT)!$D(DUOUT) D ^MCRH3,ORDER1,QTASK^MCPARAM G SEL
 D ORDERA G EXIT:$D(DTOUT)!$D(DUOUT) K V D EN^MCARD,ORDER1,QTASK^MCPARAM G SEL
DEL ;DELETE RHEUMATOLOGY VISIT
 S DIC("A")="Select a prior visit by entering the patient's name or visit date: "
 W !! S DIC="^MCAR(701,",DIC(0)="AEQM"
 ;S:MCESON DIC("S")="I $$SCRDEL^MCESSCR(MCFILE,Y)"
 D ^DIC G:Y<0 EXIT S (MCRH1,DA)=+Y
DISP W !!,"Would you like a display of the data for this visit" S %=1 D YN^DICN G DISP:%=0,USURE:%=2 I %<0 G DEL
 S (DJDN,DA)=MCRH1,DJSC="MCRHHIST",DJDIS=1 D EN^MCARD
USURE W !!,"Are you sure you want to delete this entry" S %=2 D YN^DICN G DEL:%=0 I %'=1 W !,"Nothing Deleted" G DEL
 S (DIK,DIC)="^MCAR(701,",DA=MCRH1 D ^DIK W !!,"Entry deleted." R X:2 G DEL
GETLAB ;
 S DIC("B")=$O(^LR(MCLRDFN,"CH",0))
 S DIC="^LR(MCLRDFN,""CH"",",DIC(0)="AEQMZ",DIC("A")="Select DATE/TIME SPECIMEN TAKEN: " D ^DIC S:Y>0 (DJDN,MCLRDA)=+Y,MCARGDT=$P(Y,U,2),MCLABDT=9999999-MCARGDT S DA(1)=MCLRDFN K DIC("A") Q
QUE K IO("Q") S %ZIS="MQ" D ^%ZIS G:POP EXIT
 I $D(IO("Q")) S MCARZ="RHEUMATOLOGY REPORT",(ZTSAVE("MC*"),ZTSAVE("DFN"),ZTSAVE("DA"),ZTSAVE("DT"))="",ZTRTN="QSTART^MCRH1",ZTDESC=MCARZ D ^%ZTLOAD K ZTSK Q
QSTART K ^UTILITY("DIQ1",$J) S PG=0,DIC="^LR(MCLRDFN,""CH"",",DA=MCLRDA
 S DR="2:7;9:20;41;45;63;96;174;384;386;387;395:399;428;430;431;454;468;469;547:549;553;561;563;581;587;594;595;625;627;631;639;649;690;691;693;694;700;703;738;741;748;771;750"
 S Y=MCLRDA,DA(1)=MCLRDFN,DA(63.04)=MCLABDT D EN^DIQ1
 S MCARGRTN="RHFULL1" U IO D RHPRT^MCARP D ^%ZISC Q
LOCK ;LOCK GLOBAL THAT IS BEING ACCESSED BY ANOTHER USER
 ;L @(DIC_DA_"):1") S MCRHL=$T Q:MCRHL'=0  I MCRHL=0 W !!,*7,"THIS ENTRY IS BEING EDITED BY ANOTHER USER.  TRY LATER." Q
EXIT D KVAR^VADPT K %,DA,DFN,DIC,DIE,DIK,DJDIS,DJDN,DJSC,DR,DT1,H,I,K,K1
 K MCFILE,MCARCODE,MCARGDT,MCARGRTN,MCARZ,MCRH1,MCRH,MCRHL,MCLABDT,MCLRDFN,MCRHLP,MCRHY,PG,POP,PSOPAR,STA,V,X,X1,Z,ZTDESC,ZTRTN,ZTSAVE,MCARGNUM,MCARGDA,MCSEX Q
ORDERA S MCARGNUM=$O(^MCAR(697.2,"C","MCAR(701",0))
ORDER D:'$D(MCOEON) ORDER^MCPARAM Q:'$D(MCOEON)
 Q
ORDER1 G IM:'$D(MCOEON) Q:'$D(^MCAR(MCFILE,MCARGDA))  Q:$D(DTOUT)
IM Q:MCRH'=1  D EN1^MCMAG Q
GETDATA ; Get Patient Demographic data
 N MCARR2
 S MCARR1(1)=$G(VADM(1))
 S MCARR1(2)=$P($G(VADM(2)),"^",2)
 S MCARR1(9)=$P($G(VADM(3)),"^",2)
 S MCARR1(10)=$P($G(VADM(5)),"^",2),MCARR1(11)=$G(MCARRC)
 S MCARR1(12)=$P($G(VADM(10)),"^",2)
 D GETS^DIQ(2,DFN_",",".07;.111;.112;.115;.116;.131;.132;.31115","E","MCARR2")
 S MCARR1(3)=$G(MCARR2(2,DFN_",",.111,"E"))
 S MCARR1(4)=$G(MCARR2(2,DFN_",",.112,"E"))
 S MCARR1(5)=$G(MCARR2(2,DFN_",",.115,"E"))
 S MCARR1(6)=$G(MCARR2(2,DFN_",",.116,"E"))
 S MCARR1(7)=$G(MCARR2(2,DFN_",",.131,"E"))
 S MCARR1(8)=$G(MCARR2(2,DFN_",",.132,"E"))
 S MCARR1(13)=$G(MCARR2(2,DFN_",",.31115,"E"))
 S MCARR1(14)=$G(MCARR2(2,DFN_",",.07,"E"))
 Q