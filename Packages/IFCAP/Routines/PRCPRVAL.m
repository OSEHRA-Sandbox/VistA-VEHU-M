PRCPRVAL ;WISC/RFJ-value of inventory report ;28 Aug 91
 ;;4.0;IFCAP;;9/23/93
 D ^PRCPUSEL Q:'$G(PRCP("I"))
 N %,ACCT,PRCPDATA,PRCPDOT,PRCPINV,TONHAND,TDUEIN,TDUEOUT,X W !?2,"START WITH GROUP CATEGORY CODE: FIRST// @   <<-- ENTER '@' TO PRINT ITEMS",!?51,"WITHOUT A GROUP CATEGORY CODE"
 S PRCPINV=$$INVNAME^PRCPUX1(PRCP("I")),(TONHAND,TDUEIN,TDUEOUT)=0,DIC="^PRCP(445,",L=0,FLDS="[PRCP REPORT:VALUE OF INV]",BY=".01,1,.5,1,@.01:5;""NSN"""
 S FR=PRCPINV_",?,@",TO=PRCPINV_",?,",DIOEND="D TOTAL^PRCPRVAL,END^PRCPUREP"
 D EN1^DIP Q
 ;
TOTAL ;called at end of printing template
 W !!,"TOTAL ON-HAND VALUE:",?21,"$",$J(TONHAND,12,2)
 S %="" F  S %=$O(ACCT(%)) Q:%=""  W !?40,"ACCOUNT CODE ",%,": $",$J(ACCT(%),12,2)
 W !,"TOTAL DUE-INS VALUE:",?21,"$",$J(TDUEIN,12,2),!?21,"-------------"
 W !,"TOTAL ",$S($G(PRCP("DPTYPE"))="W":"CAP ",1:""),"VALUE:",?21,"$",$J(TONHAND+TDUEIN,12,2)
 W !!,"TOTAL DUE-OUT VALUE:",?21,"$",$J(TDUEOUT,12,2),! Q