PRCPRNSN ;WISC/RFJ-national stock number report ;22 July 91
 ;;4.0;IFCAP;;9/23/93
 D ^PRCPUSEL Q:'$G(PRCP("I"))
 N %,PRCPINV,X W !?2,"START WITH NSN: FIRST// @    <<-- ENTER '@' TO PRINT ITEMS WITHOUT A NSN"
 S PRCPINV=$$INVNAME^PRCPUX1(PRCP("I")),DIC="^PRCP(445,",L=0,FLDS="[PRCP REPORT:NSN]",BY=".01,1,@.01:5;""NSN""",FR=PRCPINV_",?",TO=PRCPINV_",?",DIOEND="D END^PRCPUREP" D EN1^DIP Q