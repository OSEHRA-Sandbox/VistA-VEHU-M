PRCPONI2 ; ; 28-FEB-1995
 ;;5.0;GENERIC INVENTORY PACKAGE;;FEB 28, 1995
 ;
 ;
 K ^UTILITY("ORVROM",$J),DIC
 Q
DT W !
 I '$D(DTIME) S DTIME=999
 K %DT D NOW^%DTC S DT=X
 K DIK,DIC,%I,DICS Q
 ;