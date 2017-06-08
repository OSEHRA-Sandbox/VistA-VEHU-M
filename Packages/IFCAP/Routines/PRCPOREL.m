PRCPOREL ;WISC/RFJ-release secondary distribution order ;20 Oct 92
 ;;4.0;IFCAP;**17**;9/23/93
 D ^PRCPUSEL Q:'$G(PRCP("I"))
 I PRCP("DPTYPE")'="S" W !,"THIS OPTION SHOULD ONLY BE USED BY A SECONDARY INVENTORY POINT." Q
 N %,DIC,X,Y
TOP ;     |-> select order for release to fill
 S DIC="^PRCP(445.3,",DIC(0)="QEAMZ",DIC("S")="I $P(^(0),U,3)=PRCP(""I""),$P(^(0),U,6)=""""",DIC("A")="Select Distribution Order to RELEASE: ",PRCPPRIV=1 W ! D ^DIC K PRCPPRIV,DIC I +Y'>0 Q
 D RELEASE(+Y) G TOP
 ;
 ;
RELEASE(V1) ;    |-> release order v1
 N %,COUNT,DATA,ERROR,ITEMDA,ITEMDATA,ORDERNO,ORDRDATA,PRCPFLAG,PRIMARDA,PRIMARY,SECOND,SECONDA,VDA,VDATA,X,Y
 S ORDERNO=+V1,ORDRDATA=$G(^PRCP(445.3,ORDERNO,0))
 S SECONDA=+$P(ORDRDATA,"^",3),SECOND=$$INVNAME^PRCPUX1(SECONDA) I SECOND="" W !,"SECONDARY INVENTORY POINT IS MISSING, DELETING ORDER..." D DELORD^PRCPOPO1(ORDERNO) Q
 S PRIMARDA=+$P(ORDRDATA,"^",2),PRIMARY=$$INVNAME^PRCPUX1(PRIMARDA) I PRIMARY="" W !,"PRIMARY INVENTORY SOURCE MISSING, PLEASE RE-EDIT THIS ORDER." Q
 S XP="Is this order READY to be RELEASED to "_PRIMARY_" for FILLING",XH="Enter 'YES' to RELEASE this order for filling, 'NO' or '^' to exit.",%=1 W ! D YN^PRCPU4 I %'=1 Q
 ;
 D LOCK^PRCPOENU(ORDERNO) I $G(PRCPFLAG) W !!,"YOUR ORDER HAS NOT BEEN RELEASED !  TRY RELEASING YOUR ORDER AGAIN IN A MINUTE." Q
 ;
 ;     |-> check items
 W !!,"Checking items on distribution order..."
 S IOP="HOME" D ^%ZIS K IOP
 K ^TMP($J,"PRCPOREL")
 S (COUNT,ERROR,ITEMDA)=0 F  S ITEMDA=$O(^PRCP(445.3,ORDERNO,1,ITEMDA)) Q:'ITEMDA!($G(PRCPFLAG))  S DATA=^(ITEMDA,0) D
 .   S COUNT=COUNT+1 I COUNT>20 D P^PRCPU4 Q:$G(PRCPFLAG)  S COUNT=0 W !
 .   W !,"ITEM #: ",ITEMDA,?15,$E($$DESCR^PRCPUX1(PRIMARDA,ITEMDA),1,20),?40,"QTY: ",$P(DATA,"^",2)
 .   I '$P(DATA,"^",2) W !?5,"** THERE IS NO QUANTITY ORDERED, ITEM IS DELETED FROM ORDER **" D DELITEM^PRCPOPO1(ORDERNO,ITEMDA) S COUNT=COUNT+1 Q
 .   I '$D(^PRCP(445,SECONDA,1,ITEMDA,0)) W !?5,"** ITEM NOT STORED IN SECONDARY INVENTORY POINT **" S COUNT=COUNT+1,^TMP($J,"PRCPOREL",ITEMDA)=$P(DATA,"^",2)_"^1" Q
 .   S ITEMDATA=$G(^PRCP(445,PRIMARDA,1,ITEMDA,0)) I ITEMDATA="" W !?5,"** ITEM NOT STORED IN PRIMARY INVENTORY POINT **" S ERROR=1,COUNT=COUNT+1 Q
 .   S VDATA=$$GETVEN^PRCPUVEN(SECONDA,ITEMDA,PRIMARDA_";PRCP(445,",1)
 .   I 'VDATA W !?5,"** PRIMARY INVENTORY POINT IS NOT LISTED AS A SOURCE **" S ERROR=1,COUNT=COUNT+1 Q
 .   I $P(VDATA,"^",2,3)'=($P(ITEMDATA,"^",5)_"^"_$P(ITEMDATA,"^",14)) W !?5,"** SECONDARY UNIT PER RECEIPT DOES NOT EQUAL PRIMARY UNIT PER ISSUE **" S ERROR=1,COUNT=COUNT+1 Q
 .   W ?55,"CONV FACTOR: ",$P(VDATA,"^",4)
 .   S ^TMP($J,"PRCPOREL",ITEMDA)=$P(DATA,"^",2)_"^"_$P(VDATA,"^",4)
 I $G(PRCPFLAG) D UNLOCK^PRCPOENU(ORDERNO,PRIMARDA,SECONDA) K ^TMP($J,"PRCPOREL") Q
 I $G(ERROR) W !!,"THIS ORDER CANNOT BE RELEASED UNTIL THE ERRORS HAVE BEEN CORRECTED." D UNLOCK^PRCPOENU(ORDERNO,PRIMARDA,SECONDA) K ^TMP($J,"PRCPOREL") Q
 I '$O(^TMP($J,"PRCPOREL",0)) W !!,"THERE ARE NO ITEMS ON THIS ORDER, DELETING ORDER..." D DELORD^PRCPOPO1(ORDERNO),UNLOCK^PRCPOENU(ORDERNO,PRIMARDA,SECONDA) Q
 ;
 W !!,"Everything checks out OK !  The order is being RELEASED...",!!,"Updating the DUE-INS in ",SECOND," and DUE-OUTS in ",PRIMARY
 S ITEMDA=0 F  S ITEMDA=$O(^TMP($J,"PRCPOREL",ITEMDA)) Q:'ITEMDA  S DATA=^(ITEMDA) D
 .   I $D(^PRCP(445,PRIMARDA,1,ITEMDA,0)) S $P(^(0),"^",20)=$P(^(0),"^",20)+$P(DATA,"^")
 .   I $D(^PRCP(445,SECONDA,1,ITEMDA,0)) S $P(^(0),"^",8)=$P(^(0),"^",8)+($P(DATA,"^")*$P(DATA,"^",2))
 S $P(^PRCP(445.3,ORDERNO,0),"^",6)="R" W !!,"** This order has been RELEASED for filling **"
 D UNLOCK^PRCPOENU(ORDERNO,PRIMARDA,SECONDA) K ^TMP($J,"PRCPOREL")
 Q