PRCH192 ;WISC/DJM Re-index "B" x-ref ; 6/2/99 11:55am
 ;;5.0;IFCAP;**192**;4/21/95
 ;
 ; RE-INDEX THE "B" CROSS REFERENCE IN THE "NAME" FIELD, #.01.
 ; ENALL^DIK WILL ONLY "SET" THE "B" CROSS REFERENCE.
 ; THEREFOR THE NEED TO KILL THE "B" CROSS REFERENCE FIRST.
 ;
 N DIK
 K ^PRC(440,"B")
 S DIK="^PRC(440,"
 S DIK(1)=".01^B"
 D ENALL^DIK
 Q