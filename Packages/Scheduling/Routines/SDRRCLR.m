SDRRCLR  ;10N20/MAH - Reminder Recall CLEAN UP ;APR 08, 2016
 ;;5.3;Scheduling;**536,642**;Aug 13, 1993;Build 23
 ; Option: SDRR CLEAN-UP
EN ;Entry point
 ;Will look at the "D" in file SD(403.5 - and loop through file 2 
 ;to see if appt. has been made then delete entry in file 687065
 ;SDRRDA=IEN FOR FILE SD(403.5
 ;DFN= THE PATIENTS NUMBER
 ;REDT = RECALL DATE
 ;CLINIC = CLINIC ASSIGNED FOR THAT RECALL VISIT
 ;CLIN1 = CLINIC ASSIGN FOR THE APPT - IN FILE 2
 ;CK = APPT DATE IN FILE 2 
 ;CK1 = IS THE APPT DATE MINUS TIME
 ;CAP = DIFFERENCE BETWEEN RECALL DATE AND APPT DATE - LOOKS AT -30 TO +30
DIV Q:'$D(^SD(403.53,0))
 N SDCL,SDKF,SDRRCS,SDRRCRS    ;alb/sat 642
 S CRP=0 F  S CRP=$O(^SD(403.53,CRP)) Q:'CRP  D
 . S PDT=$P($G(^SD(403.53,CRP,0)),"^",5) Q:PDT=""
 . S (CNT,SDRRDA)=1
 . F  S CNT=$O(^SD(403.5,"D",CNT)) Q:CNT<1  D
 .. F  S SDRRDA=$O(^SD(403.5,"D",CNT,SDRRDA)) Q:SDRRDA<1  D
 ...S PROV=$P($G(^SD(403.5,SDRRDA,0)),"^",5) Q:PROV=""
 ...S TEAM=$P($G(^SD(403.54,PROV,0)),"^",2) Q:TEAM=""
 ...S DIV=$P($G(^SD(403.55,TEAM,0)),"^",4) Q:DIV'=CRP
 ...S DFN=$P($G(^SD(403.5,SDRRDA,0)),"^",1) I DFN="" Q
 ...S CLINIC=$P($G(^SD(403.5,SDRRDA,0)),"^",2) I CLINIC="" Q
 ...S SDRRCS=$$GET1^DIQ(44,CLINIC_",",8,"I") S:SDRRCS'="" SDRRCS=$$GET1^DIQ(40.7,SDRRCS_",",1,"E")        ;alb/sat 642
 ...S SDRRCRS=$$GET1^DIQ(44,CLINIC_",",2503,"I") S:SDRRCRS'="" SDRRCRS=$$GET1^DIQ(40.7,SDRRCRS_",",1,"E") ;alb/sat 642
 ...S REDT=$P($G(^SD(403.5,SDRRDA,0)),"^",6) I REDT="" Q
 ...D DEM^VADPT
 ...I $G(VADM(6),U)'="" S DA=SDRRDA,SDRRFTR=3,DIK="^SD(403.5," D ^DIK K DA,DIK Q
 ...N SDARRAY,SDCOUNT,SDDATE,SDAPPT,STATUS,APPT,CC,EDT,SDT
 ...S X1=REDT,X2=+PDT D C^%DTC S EDT=$P(X,".",1) K X,X1,X2
 ...S X1=REDT,X2=-PDT D C^%DTC S SDT=$P(X,".",1) K X,X1,X2
 ...S SDARRAY(1)=""_SDT_";"_EDT_""
 ...S:(SDRRCS="")&(SDRRCRS="") SDARRAY(2)=CLINIC   ;alb/sat 642 SDAPI does not return based on stop code of CLINIC is passed in
 ...S SDARRAY(4)=DFN
 ...S SDARRAY("FLDS")="1;2;3;13;14"   ;alb/sat 642 added 13,14
 ...S SDCOUNT=$$SDAPI^SDAMA301(.SDARRAY)
 ...I SDCOUNT>0 D
 ....S SDKF=0
 ....S SDDATE=0 F  S SDDATE=$O(^TMP($J,"SDAMA301",DFN,CLINIC,SDDATE)) Q:SDDATE=""  D  Q:+SDKF
 .....S SDAPPT=$G(^TMP($J,"SDAMA301",DFN,CLINIC,SDDATE))
 .....S SDKF=$$PROCESS(DFN,CLINIC,SDAPPT,SDDATE,REDT,PDT,SDRRCS,SDRRCRS,SDRRDA)   ;alb/sat 642 moved logic to tag PROCESS
 ....I 'SDKF S SDCL=0 F  S SDCL=$O(^TMP($J,"SDAMA301",DFN,SDCL)) Q:SDCL=""  D  Q:+SDKF   ;alb/sat 642
 .....S SDDATE=0 F  S SDDATE=$O(^TMP($J,"SDAMA301",DFN,SDCL,SDDATE)) Q:SDDATE=""  D  Q:+SDKF
 ......S SDAPPT=$G(^TMP($J,"SDAMA301",DFN,SDCL,SDDATE))
 ......S SDKF=$$PROCESS(DFN,CLINIC,SDAPPT,SDDATE,REDT,PDT,SDRRCS,SDRRCRS,SDRRDA)     ;alb/sat 642 moved logic to tag PROCESS
 ...I SDCOUNT<0 K ^TMP($J,"SDAMA301")
 ..Q
QUIT K CNT,SDRRDA,DFN,CLINIC,CLIN1,REDT,CK,CK1,X,CAP,STATUS,PDT,TEAM,DIV,PROV,CRP,DEATH,SDRRFTR,VADM,^TMP($J,"SDAMA301")
 D KVAR^VADPT
 Q
 ;
PROCESS(DFN,CLINIC,SDAPPT,SDDATE,REDT,PDT,SDRRCS,SDRRCRS,SDRRDA) ;alb/sat 642
 N APPT,CAP,CC,CK1,CLIN1,DA,DIK,SDAPPCST,SDAPPSTP,SDCS,SDCRS,SDKF,SDRRFTR,STATUS
 S SDKF=0
 S SDAPPSTP=$P($P(SDAPPT,U,13),";",2)
 S SDAPPCST=$P($P(SDAPPT,U,14),";",2)
 S STATUS=$P($G(SDAPPT),"^",3)
 S STATUS=$P(STATUS,";",1)
 I STATUS'="R" Q SDKF
 S APPT=$P(SDAPPT,"^",1)
 S CK1=$P(APPT,".",1)
 S CC=$P(SDAPPT,"^",2)
 S CLIN1=$P(CC,";",1)
 S CAP=$$FMDIFF^XLFDT(CK1,REDT)
 S SDCS=$S((SDAPPSTP="")&(SDRRCS=""):1,SDAPPSTP=SDRRCS:1,1:0)   ;clinic stop
 S SDCRS=$S((SDAPPCST="")&(SDRRCRS=""):1,SDAPPCST=SDRRCRS:1,1:0)  ;credit stop
 I CAP>-PDT,CAP<PDT I (CLIN1=CLINIC)!(SDCS&SDCRS) S DA=SDRRDA,SDRRFTR=7,DIK="^SD(403.5," D ^DIK K DA,DIK S SDKF=1
 Q SDKF