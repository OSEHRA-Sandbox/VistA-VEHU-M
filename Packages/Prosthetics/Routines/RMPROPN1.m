RMPROPN1 ;PHX/RFM-LISTS OPEN STOCK ISSUES ;8/29/1994
 ;;3.0;PROSTHETICS;**13,77,179**;Feb 09, 1996;Build 7
 ;RVD 3/17/03 patch #77 - allow queing to p-message.  IO to ION
 ;
 ;RMPR*3.0*179 Insure work file is killed before processing report
 ;
 D DIV4^RMPRSIT G:$D(X) EXIT
START K ^TMP($J)     ;RMPR*3.0*179
 S RMPRCOUN=0 D HOME^%ZIS W !! S %DT("A")="Starting Date: ",%DT="AEPX" D ^%DT S RMPRBDT=Y G:Y<0 EXIT
 S %DT("A")="Ending Date: ",%DT="AEX" D ^%DT G:Y<0 EXIT I RMPRBDT>Y W !,$C(7),"Invalid Date Range Selection!!" G START
 S RMPREDT=Y,RMPREDT=RMPREDT+1 G:Y<0 EXIT S Y=RMPRBDT D DD^%DT S RMPRX=Y,Y=RMPREDT-1 D DD^%DT S RMPRY=Y
 S %ZIS="MQ" K IOP D ^%ZIS G:POP EXIT
 I '$D(IO("Q")) U IO G PRINT
 S ZTDESC="OPEN STOCK ISSUES",ZTRTN="PRINT^RMPROPN1",ZTIO=ION,ZTSAVE("RMPRBDT")="",ZTSAVE("RMPREDT")="",ZTSAVE("RMPRX")="",ZTSAVE("RMPRY")="",ZTSAVE("RMPR(""STA"")")=""
 D ^%ZTLOAD W:$D(ZTSK) !,"REQUEST QUEUED!" H 1 G EXIT
PRINT S X1=RMPRBDT,X2=-1 D C^%DTC S RO=X,RP=0,PAGE=1,RMPRCOUN=0,RMPREND="" I IOST["C-" D WAIT^DICD
 F  S RO=$O(^RMPR(660,"B",RO)) Q:RO'>0  Q:RO>RMPREDT  F  S RP=$O(^RMPR(660,"B",RO,RP)) Q:RP'>0  D CK
 S RP=0 F  S RP=$O(^TMP($J,RP)) Q:RP=""!(RMPREND=1)  D WRI
 I $D(RMPREDT)&(RMPRCOUN=0) W @IOF D HDR W $C(7),!!,"NO SELECTIONS MADE DURING THIS DATE RANGE!!"
 I $D(RMPREDT),RMPRCOUN>0,RMPREND'=1 W !!?32,"END OF REPORT" H 1
EXIT I $E(IOST)["C"&($Y<20) F  W ! Q:$Y>20
 I $D(RMPREDT),'$D(DTOUT),'$D(DUOUT),$E(IOST)["C",'$D(RMPRFLL),RMPREND'=1 S DIR(0)="E" D ^DIR
EX K RMPREND,RMPROBL,RMPRFLL,RMPRFLG,DUOUT,DIR,RO,RP,RMPRY,RMPRCOUN,RMPRX,RMPRBDT,RMPREDT,RMPRCK,%DT,X,Y,PAGE,IT,ZTSK,^TMP($J) D ^%ZISC Q
 Q
CK N RMPRX
 S RMPRX=$G(^RMPR(660,RP,0))
 Q:'RMPRX
 Q:+$P(RMPRX,U,12)!($P(RMPRX,U,10)'=RMPR("STA"))!($P(RMPRX,U,13)=13)
 Q:$P(RMPRX,U,13)'>10
 ;screen VISA
 Q:$P(RMPRX,U,13)=14
 S ^TMP($J,RP)="",RMPRCOUN=RMPRCOUN+1
 Q
WRI I '$D(RMPRFLG) D HDR W !,"PATIENT NAME",?14,"SSN",?20,"REQUEST DATE",?34,"VENDOR",?49,"ITEM",?70,"ITEM COST"
 W !,$E($P(^DPT($P(^RMPR(660,RP,0),U,2),0),U,1),1,12),?14,$E($P(^(0),U,9),6,9)
 S Y=$P(^RMPR(660,RP,0),U,1) D DD^%DT S Y=$E(Y,1,12) W ?20,Y,?34 I +$P(^RMPR(660,RP,0),U,9),$D(^PRC(440,$P(^(0),U,9),0)) W $E($P(^PRC(440,$P(^RMPR(660,RP,0),U,9),0),U,1),1,13)
 W ?49 I $D(^PRC(441,$P(^RMPR(661,+$P(^RMPR(660,RP,0),U,6),0),U),0)) W $E($P(^(0),U,2),1,18)
 W ?70,$J($FN(+$P(^RMPR(660,RP,0),U,16),"P",2),10)
 S RMPRFLG=1
 I $E(IOST)["C-"&($Y>(IOSL-6)) W ! S DIR(0)="E" D ^DIR S:Y<1 RMPREND=1 Q:Y=""  S:Y<1 RMPRFLL=1 Q:Y<1  S:$D(DTOUT) RMPREND=1 Q:$D(DTOUT)  D HDR Q
 I $Y>(IOSL-6) K RMPRFLG
 Q
HDR I PAGE'=1!($E(IOST)["C") W @IOF
 W !,"FROM: ",RMPRX_"-",RMPRY,?34,"OPEN STOCK ISSUES",?72,"PAGE ",PAGE,! S PAGE=PAGE+1 Q