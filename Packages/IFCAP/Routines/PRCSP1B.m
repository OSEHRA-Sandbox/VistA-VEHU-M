PRCSP1B ;WISC/SAW-CONTROL POINT ACTIVITY ;10-11-91/10:24
V ;;5.1;IFCAP;**150**;Oct 20, 2000;Build 24
 ;Per VHA Directive 2004-038, this routine should not be modified.
PROJ ;PROJECT NUMBER REPORT
 D EN1^PRCSUT G W2:'$D(PRC("SITE")),EXIT:Y<0
 S PRCSAZ=PRC("SITE")_"-"_PRC("FY")_"-"_PRC("QTR")_"-"_$P(PRC("CP")," ")
 S L=0,DIC="^PRCS(410,",FLDS="[PRCSPROJ]",DHD="SORT GROUP REPORT - CP: "_PRC("CP"),BY="+49;S1,.01",FR="?,"_PRCSAZ_"-0001",TO="?,"_PRCSAZ_"-9999"
 D EN1^DIP K L,DIC,FLDS,DHD,BY,FR,TO,PRC("CP"),PRCSAZ Q
TEMPT ;LIST OF TEMPORARY TRANSACTIONS
 ;Changed via PRC*5.1*150 ^DIP print logic to controlled print to handle FCP editing mid stream for reporting older temp tx
 K ^TMP($J,"PRCSP1B")
 D EN3^PRCSUT G W2:'$D(PRC("SITE")),EXIT:Y<0
DATE S U="^",%DT="XEA",%DT("A")="Start Date of Request: " D ^%DT G:X[U!$D(DTOUT) TEXIT
 I X="" W "   Start Date REQUIRED" G DATE
 S PRCDATE(1)=+Y
EDATE S %DT="XEA",%DT("A")="Go To Date of Request: " D ^%DT G:X[U!$D(DTOUT) TEXIT
 I X="" W "   Go to Date REQUIRED" G EDATE
 S PRCDATE(2)=+Y
 I PRCDATE(1)>PRCDATE(2) W !!,$C(7),"ENDING DATE RANGE IS LESS THAN BEGINNING DATE RANGE",! G EDATE
 ;
QUE S %ZIS="Q" D ^%ZIS G:POP EXIT I '$D(IO("Q")) U IO G TCMP
 S ZTRTN="TCMP^PRCSP1B",ZTSAVE("DATE*")="",ZTSAVE("PRC*")="",ZTDESC="TEMPORARY TRANSACTION LISTING" D ^%ZTLOAD,HOME^%ZIS G TEXIT
 ;
TCMP ;COMPILE FCP TEMP REQUESTS
 S PRCANX=$P(PRC("CP")," ")_" ",PRCANXH=PRCANX,PRCEND=0,PRCTTOT=0
TC1 S PRCANX=$O(^PRCS(410,"AN",PRCANX)),PRCSIEN=0 G TPRT:PRCANX=""!(+PRCANX>+PRCANXH)
TC2 S PRCSIEN=$O(^PRCS(410,"AN",PRCANX,PRCSIEN)) G TC1:PRCSIEN=""
 I '$D(^PRCS(410,PRCSIEN)) G TC2
 S PRCR0=$G(^PRCS(410,PRCSIEN,0)) G TC2:PRCR0=""
 I +$P(PRCR0,U)'=0!($P(PRCR0,U,2)="CA") G TC2
 S PRCR1=$G(^PRCS(410,PRCSIEN,1)) G TC2:PRCR1=""
 I $P(PRCR1,U)<PRCDATE(1)!($P(PRCR1,U)>PRCDATE(2)) G TC2
 S ^TMP($J,"PRCSP1B",$P(PRCR1,U),PRCSIEN)=""
 G TC2
 ;
TPRT ;PRINT OF THE TEMP TX REPORT
 S PRCNOW=$$NOW(),PRCDSH="",$P(PRCDSH,"-",81)="",PRCTTOT=0
 S (PRCEND,PRCPAGE,PRCEXIT)=0 D HDR
 S PRCDATEA=0
PT1 S PRCDATEA=$O(^TMP($J,"PRCSP1B",PRCDATEA)),PRCSIEN=0 I PRCDATEA="" S PRCEXIT=1 G TQUIT
PT2 S PRCSIEN=$O(^TMP($J,"PRCSP1B",PRCDATEA,PRCSIEN)) I PRCSIEN="" G PT1
 S PRCTTOT=PRCTTOT+1
 S PRCR0=$G(^PRCS(410,PRCSIEN,0)),PRCR1=$G(^PRCS(410,PRCSIEN,1)),PRCR2=$G(^PRCS(410,PRCSIEN,2)),PRCR4=$G(^PRCS(410,PRCSIEN,4)),PRCR7=$G(^PRCS(410,PRCSIEN,7))
 S PRCRDATE=$P(PRCR1,U),PRCREQTR=$P(PRCR7,U),PRCVEND=$E($P(PRCR2,U),1,9),PRCCOST=$P(PRCR4,U)
 S PRCFITEM=$P($G(^PRCS(410,PRCSIEN,"IT",1,1,1,0)),U),PRCREQTR=$E($G(^VA(200,PRCREQTR,0),U),1,9),PRCRDATE=$$FMTE^XLFDT(PRCRDATE)
 W !,$P(PRCR0,U),?19,PRCRDATE,?32,PRCREQTR,?43,PRCVEND,?54,$E(PRCFITEM,1,15),?70,$J($FN(PRCCOST,",",2),10)
 D HDR:$Y+2>IOSL G TEXIT:PRCEND
 G PT2
TQUIT I PRCTTOT=0 W !!,"     << NO TEMPORARY TRANSACTIONS TO PRINT FOR TIME PERIOD SELECTED >>" S PRCPAGE=1
TEXIT S:$E(IOST,1,2)="C-" IOSL=24
 K ^TMP($J,"PRCSP1B") D:$G(PRCPAGE)>0 HDR
 D ^%ZISC
 K PRCDATE,%DT,X,DTOUT,PRCANX,PRCANXH,ZTRTN,ZTSAVE,ZTDESC,PRCSIEN,PRCR0,PRCR1,PRCR2,PRCR4,PRCR7,PRCNOW,PRCDSH,PRCEND,PRCPAGE,PRCDATEA
 K PRCRDATE,PRCREQTR,PRCVEND,PRCCOST,PRCFITEM,PRCTTOT,%ZIS,POP,NOW,PRCEXIT
 Q
HDR ;PRINT HEADING
 I PRCPAGE>0,$E(IOST,1,2)="C-" S PRCEND=$$EOP() Q:PRCEND
 I PRCEXIT=1 W @IOF Q
 S PRCPAGE=PRCPAGE+1 W @IOF,!,"TEMPORARY TRANSACTION LISTING - CONTROL POINT ",PRC("CP")
 W !,?45,PRCNOW,"Page ",$J(PRCPAGE,3)
 W !,"TEMPORARY",?19,"DATE OF",?54,"FIRST LINE ITEM  COMM"
 W !,"TRANSACTION #",?19,"REQUEST",?32,"REQUESTOR  VENDOR",?54,"DESCRIPTION",?71,"COST"
 W !,PRCDSH
 QUIT
EOP() ; end of page check - return 1 to quit, 0 to continue
 ; 
 N DIR,DIROUT,DIRUT,DTOUT,DUOUT,X,Y
 I $E(IOST,1,2)'="C-" Q 0  ; not to terminal
 F I=1:1 Q:($Y>(IOSL-2))  W !
 S DIR(0)="E"
 D ^DIR
 Q 'Y
 ;
 ;
NOW() ; return NOW in external format for print on reports
 N X
 S X=$$FMTE^XLFDT($$NOW^XLFDT())
 Q $P($$UP^XLFSTR(X),":",1,2)
 ;
SUBCP ;SUB-CONTROL POINT REPORT
 W !,"Would you like the report printed for a full Fiscal Year"
 S %=1 D ^PRCFYN G EXIT:%<0 G S2:%=1
S1 D EN1^PRCSUT G W2:'$D(PRC("SITE")),EXIT:Y<0
 G:'$D(PRC("CP")) EXIT
 S PRCSAZ=PRC("SITE")_"-"_PRC("FY")_"-"_PRC("QTR")_"-"_$P(PRC("CP")," ")
 S DIC="^PRCS(410,",DHD="SUB-CONTROL POINT EXPENDITURES - "_PRC("CP")_" for FY-Q: "_PRC("FY")_"-"_PRC("QTR")
 S FLDS="[PRCSSBCPT]",BY="16,+.01;S1,@.01",FR="?,"_PRCSAZ_"-0001"
 S TO="?,"_PRCSAZ_"-9999",L=0 D EN1^DIP
 K DIS(0),PRC("SCP"),PRC("CP"),PRC("QTR"),PRC("FY"),PRCS(1) G SUBCP
S2 D STA^PRCSUT G W2:'$D(PRC("SITE")) D FY^PRCSUT Q:'$D(PRC("FY"))  Q:PRC("FY")="^"  G EXIT:Y<0 D CP^PRCSUT
 G EXIT:Y<0 ;S DIC="^PRCS(410.4,",DIC(0)="AEMQ" D ^DIC G S2:Y<0
 S DIC="^PRCS(410," S DHD="SUB-CONTROL POINT EXPENDITURES - "_PRC("CP"),FLDS="[PRCSSBCPT1]"
 S BY="16,+.01;S1,@.01",FR="?,"_PRC("SITE")_"-"_PRC("FY")_"-1-"_$P(PRC("CP")," ")_"-0001",TO="?,"_PRC("SITE")_"-"_PRC("FY")_"-4-"_$P(PRC("CP")," ")_"-9999",L=0
 S DIS(0)="I $D(^PRCS(410,D0,0)),$P(^(0),""-"",4)=$P(PRC(""CP""),"" "")"
 D EN1^DIP K DIS(0),PRC("CP"),PRC("FY"),PRCS(1) G EXIT
POS ;PURCHASE ORDER STATUS
 D EN3^PRCSUT G W2:'$D(PRC("SITE")),EXIT:Y<0
 S DIC="^PRC(442,",DIC(0)="AEQM",DIC("A")="Select PURCHASE ORDER NUMBER: ",DIC("S")="I +^(0)=PRC(""SITE""),+$P(^(0),""^"",3)=+PRC(""CP"")" D ^DIC G EXIT:Y<0 K DIC S D0=+Y,X=$S($D(^PRC(442,+Y,7)):+^(7),1:0)
 S X=$S($D(^PRCD(442.3,X,0)):^(0),1:"UNKNOWN") W !!,"Purchase Order Status: ",$P(X,"^") I $P(X,"^",2)<10 D EXIT G POS
POS1 W !!,"Would you like the purchase order display" S %=2 D YN^DICN G POS1:%=0 G:%=2 POS2 D:%=1 ^PRCHDP1 I %=-1 D EXIT,W1 Q:$D(PRCSX)  G POS
POS2 W !!,"Would you like to review the entire purchase order" S %=2 D YN^DICN G POS2:%=0 I %'=1 D EXIT,W1 Q:$D(PRCSX)  G POS
 S PRCHQ="^PRCHFPNT",PRCHQ("DEST")="US" D ^PRCHQUE K IOP D EXIT,W1 K ZTSK Q:$D(PRCSX)  G POS
S S L=0,DIC="^PRCS(410,"
 D EN1^DIP Q
DEV K IO("Q") S %ZIS("B")="HOME",%ZIS="MQ" D ^%ZIS Q
W1 W !!,"Enter information for another report or an uparrow to return to the menu.",! Q
W2 W !!,"You are not an authorized control point user.",!,"Contact your control point official." R X:5 G EXIT
NONE W !!,"A status has not yet been reported for this purchase order." G EXIT
W I (IO=IO(0))&('$D(ZTQUEUED)) W !!,"Press return to continue:  " R X:DTIME
 I (IO'=IO(0))!($D(ZTQUEUED)) D ^%ZISC U IO(0)
EXIT K %,%DT,BY,C,C0,C2,C3,D,DA,DHD,DIC,DIE,PRCS,FLDS,FR,I,L,N,TO,X,Y,Z,Z1,ZTRTN,ZTSAVE Q