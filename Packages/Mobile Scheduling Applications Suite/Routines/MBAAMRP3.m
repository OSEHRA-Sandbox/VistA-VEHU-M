MBAAMRP3 ;MTZ/CKU - APPOINTMENT RPC ; 10 MAR 2014
 ;;1.0;Scheduling Calendar View;****;10 MAR 2014;Build 11
 Q
MERGE(RV,RESULT) ;
 N NODE,COUNTER S NODE="RESULT",COUNTER=1
 F  S NODE=$Q(@NODE) Q:NODE=""  D
 . S RV(COUNTER)=NODE_"="_@NODE
 . S COUNTER=$G(COUNTER)
 Q