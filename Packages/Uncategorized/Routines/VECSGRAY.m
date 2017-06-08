VECSGRAY
 ;PAPER WAREHOUSE INVENTORY
 ;;1
 ;VARIABLE LIST
 ;RECNR......RECORD BEING PROCESSED
 ;RECORD.....RECORD PULLED FROM THE TEXT LINE IN DATA
 ;FTOTAL.....FINAL TOTAL (ACCUMULATOR)
 ;TOTITEMS...TOTAL NR. OF ITEMS
 ;CURRDEPT...DEPT. NUMBER OF CUERRENT RECORD'S DEPT. NR.
 ;ITEM.......ITEM DESCRIPTION
 ;QTY........QUANTITY
 ;UNITPR.....UNIT PRICE
 ;TOTAL......TOTAL PRICE PER ITEM (CALCULATED)
 ;PREVDEPT...A TEMPORARY VARIABLE THAT HOLDS THE 
 ;...........PREVIOUS RECORD'S DEPARTMENT NUMBER
 ;SUBTOT.....SUBTOTAL FOR CURRENT DEPARTMENT
INIT ;
 S RECNR=1,FTOTAL=0,TOTITEMS=0,SUBTOT=0
HEADING ;
 W !,?30,"THE PAPER WAREHOUSE"
 W !,?32,"INVENTORY REPORT"
 W !!,"DEPT",?10,"ITEM",?30,"QTY",?40,"UNIT PRICE",?55,"TOTAL PRICE",!!
INPUT ;
 S RECORD=$P($TEXT(DATA+RECNR),";;",2)                                 
 I RECORD="" GOTO EXIT
 S CURRDEPT=$P(RECORD,"^",1)
 S ITEM=$P(RECORD,"^",2)
 S QTY=$P(RECORD,"^",3)
 S UNITPR=$P(RECORD,"^",4)
 I RECNR=1 S PREVDEPT=CURRDEPT
 I PREVDEPT'=CURRDEPT D SUBTOT
 S PREVDEPT=CURRDEPT
CALC ;
 S TOTAL=QTY*UNITPR
 S SUBTOT=SUBTOT+TOTAL
 S FTOTAL=FTOTAL+TOTAL ;ADD TO ACCUMULATOR
 S TOTITEMS=TOTITEMS+1 ;ADD TO COUNTER
OUTPUT ;
 W !,CURRDEPT,?10,ITEM,?30,$J($FN(QTY,","),6),?40
 W $J($FN(UNITPR,"P",2),9),?55,$J($FN(TOTAL,"P",2),11)
 S RECNR=RECNR+1
 GOTO INPUT
SUBTOT   ;
 W !!,?21,"SUBTOTAL FOR THIS DEPARTMENT IS $",?55,$J($FN(SUBTOT,"P",2),11)
 S SUBTOT=0
 QUIT
EXIT ;
 DO SUBTOT
 W !!,?38,"FINAL TOTAL IS $",?55,$J($FN(FTOTAL,"P",2),11)
 W !!,"TOTAL NUMBER OF ITEMS IS ",TOTITEMS
 K TOTAL,FTOTAL,TOTITEMS,UNITPR,CURRDEPT,ITEM,QTY,RECNR,RECORD,SUBTOT,PREVDEPT           
 QUIT
DATA ;
 ;;01^YELLOW PAPER PADS^5^2.95
 ;;01^PENCILS^15^.25
 ;;01^ERASERS^2^1
 ;;02^PICTURE FRAMES^1^8
 ;;02^PICTURE WIRE^5^2.95
 ;;02^PICTURE HANGERS^20^3.7
  