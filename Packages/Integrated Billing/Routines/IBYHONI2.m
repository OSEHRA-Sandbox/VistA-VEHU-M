IBYHONI2 ; ; 21-NOV-1995
 ;;Version 2.0 ; INTEGRATED BILLING ;**43**; 21-MAR-94
 ;
 ;
 K ^UTILITY("ORVROM",$J),DIC
 Q
DT W !
 I '$D(DTIME) S DTIME=999
 K %DT D NOW^%DTC S DT=X
 K DIK,DIC,%I,DICS Q
 ;