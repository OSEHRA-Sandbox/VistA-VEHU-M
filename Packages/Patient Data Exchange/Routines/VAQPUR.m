VAQPUR ;ALB/JRP - PURGING;15JUL93 [ 05/03/95  8:25 AM ]
 ;;1.5;PATIENT DATA EXCHANGE;;NOV 17, 1993
DEFAULT ;ENTRY POINT TO USE DEFAULT LIFETIME FOR PURGING
 ;INPUT  : None
 ;OUTPUT : None
 ;
 ;DECLARE VARIABLES
 N X1,X2,X,%H,VAQDATE
 ;GET LIFETIME FROM PARAMETER FILE (DEFAULTS TO 30)
 S X2=0
 S X1=$O(^VAT(394.81,0))
 S:(X1) X2=+$G(^VAT(394.81,X1,"LIFE"))
 S:('X2) X2=30
 ;INCREMENT LIFETIME BY 3
 S X2=X2+3
 ;DETERMINE PURGE DATE (SUBTRACT LIFETIME FROM TODAY)
 S X2=0-X2
 S X1=+$G(DT)
 S:('X1) X1=$$NOW^VAQUTL99(1,0)
 D C^%DTC
 S VAQDATE=X
 ;CALL PURGER (IF JOBBED)
 I ($D(ZTQUEUED)) S X1=$$PURGER^VAQPUR10(VAQDATE,0) Q
 ;TASK PURGER
 ;D TASKIT
 Q
 ;
USERLIF ;ENTRY POINT TO GET LIFETIME FOR PURGING FROM USER
 ;INPUT  : None
 ;OUTPUT : None
 ;
 ;DECLARE VARIABLES
 N X1,X2,X,%H,DIR,Y,VAQDATE
 ;GET LIFETIME FROM USER (DEFAULT IS 30)
 S DIR(0)="NAO^1:99999:0"
 S DIR("A")="Lifetime to use for purging : "
 S DIR("B")=30
 S DIR("?",1)="Enter the number of days a PDX transaction is considered valid."
 S DIR("?",2)="Transactions, and their data, that are older than this value"
 S DIR("?")="plus three will be deleted."
 D ^DIR
 I ($D(DTOUT)!$D(DUOUT)) K DTOUT,DUOUT,DIRUT,DIROUT Q
 ;INCREMENT LIFETIME BY 3
 S X2=Y+3
 ;DETERMINE PURGE DATE (SUBTRACT LIFETIME FROM TODAY)
 S X2=0-X2
 S X1=+$G(DT)
 S:('X1) X1=$$NOW^VAQUTL99(1,0)
 D C^%DTC
 S VAQDATE=X
 ;TASK PURGER
 D TASKIT
 Q
 ;
USERDAT ;ENTRY POINT TO GET DATE TO USE FOR PURGING FROM USER
 ;INPUT  : None
 ;OUTPUT : None
 ;
 ;DECLARE VARIABLES
 N X1,X2,X,%H,DIR,Y
 ;DEFAULT IS 30 DAYS BACK
 S X1=+$G(DT)
 S:('X1) X1=$$NOW^VAQUTL99(1,0)
 S X2=-30
 D C^%DTC
 S X1=$$DOBFMT^VAQUTL99(X,0)
 S DIR("B")=X1
 ;FORCE USER TO PUT IN A DATE OLDER THAN 3 DAYS BACK
 S X1=+$G(DT)
 S:('X1) X1=$$NOW^VAQUTL99(1,0)
 S X2=-3
 D C^%DTC
 S DIR(0)="DAO^:"_X_":EX"
 S DIR("A")="Date to use for purging : "
 S DIR("?",1)="Enter the day after which a PDX transaction is considered valid."
 S DIR("?",2)="Transactions, and their data, that were created before this date"
 S DIR("?")="will be deleted."
 D ^DIR
 I ($D(DTOUT)!$D(DUOUT)) K DTOUT,DUOUT,DIRUT,DIROUT Q
 S VAQDATE=Y
 ;TASK PURGER
 D TASKIT
 Q
 ;
TASKIT ;TASKS PURGER USING DATE PROVIDED BY USER
 N ZTRTN,ZTDESC,ZTDTH,ZTIO,ZTSAVE,ZTSK
 ;SET UP VARIABLES FOR CALL TO %ZTLOAD
 S ZTRTN="JOB^VAQPUR10"
 S ZTDESC="Purging of PDX Transactions"
 S ZTSAVE("VAQDATE")=VAQDATE
 S ZTSAVE("VAQINTR")=0
 S ZTIO=""
 S ZTDTH=""
 S ZTSK=0
 W !!
 ;TASK
 D ^%ZTLOAD
 ;COULD NOT BE TASKED
 I ('(+$G(ZTSK))) D  Q
 .W !!,$C(7)
 .W "** Purging of PDX Transactions could not be queued **"
 .W !!,$C(7)
 ;TELL USER TASK NUMBER
 W !!
 W "Purging of PDX Transactions has been queued."
 W !,?2,"Task number: ",ZTSK
 W !!
 Q