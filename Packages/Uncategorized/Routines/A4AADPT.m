A4AADP1 ;HINES-CIOFO/JJM - PROGRAM TO AUDIT DEBTOR 7/22/98 10:00
 ;;1.0;**** CLASS III ****;;JUN 30, 1998
START ;;
DEBTOR ;; RETURNS DEBTOR
 N ERRCNT,OK,I,ICS,BN,TN,RCNT,DCNT,BCNT,TCNT,TERRCNT
 D INIT
 D DEBTOR^A4AARPT I Y=-1 D EXIT Q
 K DIC
 S DEBTOR=+Y
 W #,?10,"DEBTOR",?20,"BILL NO.",?30,"TRANSACTION",?45,"ERROR  MESSAGES"
 D LOOPBN
 W !,$J(RCNT,10)," RECORDS CHECKED (",+$P(^PRCA(430,0),U,3),")"
 D:ERRCNT>0 ERRLIST^A4AADP2
 D EXIT
 W !,"EOJ"
 QUIT
 ;;
GETBILLS ;
 F  D GETBILL Q:'Y  D PBILL
 QUIT
GETBILL ;
 S DIC="^PRCA(430,",DIC(0)="AEMNQZ" D ^DIC
 S BILL=+Y
 K DIC
 QUIT
SETUP ;
 D NOW^%DTC
 S RBAL=0,NATOTAL=0,TAO=0,SRBAL=0
 S (LST1,LST2,LST3,LST4,LST5,LST6,SRBAL)=0
 QUIT
BYCXREF ;;
 N ERRCNT,OK,I,ICS,BN,TN,RCNT,DCNT,BCNT,TCNT,TERRCNT
 S DEBTOR=0
 D INIT,SETUP^A4AARPT1
 W #,"CHECKING C CROSS-REFERENCE OF FILE 430"
 S DEBTOR=0,DCNT=0,RCNT=0,ERRCNT=0
 F I=1:1 S DEBTOR=$O(^PRCA(430,"C",DEBTOR)) W:(I#10)=0 "." Q:'DEBTOR  D LOOPBN
 W !,$J(ERRCNT,10)," ERRORS FOUND"
 W !,$J(RCNT,10)," BILLS CHECKED (",+$P(^PRCA(430,0),U,3),")"
 D:ERRCNT>0 ERRLIST^A4AADP2
 D EXIT
 W !,"EOJ"
 QUIT
BCHK1 ;; CHECK BILLS BY DEBTOR
 ; N ERRCNT,OK,I,ICS,BN,TN,RCNT,DCNT,BCNT,TCNT,TERRCNT,NATOTAL,SRBAL,DEBTOR
 S DEBTOR=0,TEAMT=0
 D INIT,SETUP
 W #,"CHECKING FILE 430 FOR BAD BILLS "
BLOOP1 S DEBTOR=0,DCNT=0,RCNT=0,ERRCNT=0
 F  S DEBTOR=$O(^PRCA(430,"C",DEBTOR)) W:(DCNT#10)=0 "." Q:'DEBTOR  D BLOOP2
 W !,?65,"__________",!,?65,$J(TEAMT,10,2)
 W !,$J(ERRCNT,10)," ERRORS FOUND"
 W !,$J(DCNT,10)," DEBTORS CHECKED (",+$P(^RCD(340,0),U,3),")"
 W !,$J(RCNT,10)," BILLS CHECKED (",+$P(^PRCA(430,0),U,3),")"
EBCHK1 ;
 N ERRCNT,OK,I,ICS,BN,TN,RCNT,DCNT,BCNT,TCNT,TERRCNT,NATOTAL,SRBAL,DEBTOR
 D EXIT
 QUIT
BLOOP2 ;
 D SETUP^A4AARPT
 S BN=0,DCNT=DCNT+1
 F  S BN=$O(^PRCA(430,"C",DEBTOR,BN)) Q:'BN  W:(RCNT#1000)=0 "-" D
    . S BILL=BN
    . S RCNT=RCNT+1
    . D PBILLSS
 QUIT
PBILL ;
 Q:'$G(BILL)
 S:'$D(DEBTOR) DEBTOR=+$P($G(^PRCA(430,BILL,0)),U,9)
 D SETUP
 S FLAG1=0
 D PRTBILL^A4AARPT1
 K DATE1,DATE2,DATE3,LST1,LST2,LST3,LST4,LST5,LST6,NAME,PAT,PG,SDAY,SRBAL
 K SSN,U1N4,X,DATE,F433N0,F433N1,F433N8,SFLAG,XDATE,BN,FLAG1,RBAL,TAO
 QUIT
PBILLS ;
 D SETUP
 S FLAG1=1
 D ^A4AARPT7
 I (BAL'=RBAL)!(CS=40)!((BAL'=0)&(CS=39))!((RBAL<0)&(CAT'=26)) D
   . S FLAG1=0
   . W !,"****  INCORRECT BILL BALANCE  ****"
 D PRTBILL^A4AARPT1
 S FLAG1=1
 QUIT
PBILLSS  ;
 D ^A4AARPT7
 I ((RBAL'=0)&(CS=23))!((BAL'=RBAL)&(CS'=23))!((BAL'=0)&(CS=39))!((RBAL<0)&(CAT'=26)) D
   . S ERRCNT=ERRCNT+1
   . W !,ERRCNT,?10,DEBTOR,?20,BILL,"  ",CAT,"  ",CS,?40,$J(BAL,10,2)," -",$J(RBAL,10,2),?65,$J((BAL-RBAL),10,2)
   . S TEAMT=TEAMT+(BAL-RBAL)
 ; . D PRTBILL
 QUIT
BYASXR ;;
 N ERRCNT,OK,I,ICS,BN,TN,RCNT,DCNT,BCNT,TCNT,TERRCNT
 D INIT
 W #,"CHECKING AS CROSS-REFERENCE OF FILE 430"
 S DEBTOR=0,DCNT=0,RCNT=0
 F I=1:1 S DEBTOR=$O(^PRCA(430,"AS",DEBTOR)) W:(I#10)=0 "." Q:'DEBTOR  D
   . S ICS=0
   . F  S ICS=$O(^PRCA(430,"AS",DEBTOR,ICS)) Q:'ICS  D
      .. S BN=0
      .. F  S BN=$O(^PRCA(430,"AS",DEBTOR,ICS,BN)) Q:'BN  D LOOPBTN
 W !,$J(ERRCNT,10)," ERRORS FOUND"
 W !,$J(RCNT,10)," BILLS CHECKED (",+$P(^PRCA(430,0),U,3),")"
 D:ERRCNT>0 ERRLIST^A4AADP2
 D EXIT
 W !,"EOJ"
 QUIT
BY430 ;;
 N ERRCNT,OK,I,ICS,BN,TN,RCNT,DCNT,BCNT,TCNT,TERRCNT
 D INIT
 W #,"CHECKING FILE 430"
 S BN=0,DCNT=0,RCNT=0
 F I=1:1 S BN=$O(^PRCA(430,BN)) W:(I#10)=0 "." Q:'BN  D
   . S DCNT=DCNT+1,TERRCNT=ERRCNT
   . D GET430D^A4AADP3
   . S DEBTOR=+$G(FAN0P9)
   . D CHK430,LOOPBTN
   . I ERRCNT'=TERRCNT D
       .. W !,$J(BN,6)," HAS ",$J((ERRCNT-TERRCNT),5)," ERRORS"
 W !,$J(ERRCNT,10)," ERRORS FOUND"
 W !,$J(RCNT,10)," BILLS CHECKED (",+$P(^PRCA(430,0),U,3),")"
 D:ERRCNT>0 ERRLIST^A4AADP2
 D EXIT
 W !,"EOJ"
 QUIT
BY433 ;;
 N ERRCNT,OK,I,ICS,BN,TN,RCNT,DCNT,BCNT,TCNT,TERRCNT
 D INIT
 W #,"CHECKING FILE 433"
 S TN=0,DCNT=0,RCNT=0
 F I=1:1 S TN=$O(^PRCA(433,TN)) W:(I#10)=0 "." Q:'TN  D
   . S DCNT=DCNT+1,TERRCNT=ERRCNT
   . D GET433D^A4AADP3 Q:(FBN0P4=1)&(FBN0P10=1)
   . S BN=+$G(BN433)
   . D GET430D^A4AADP3
   . S DEBTOR=+$G(FAN0P9)
   . D CHK433
   . D C430XR^A4AADP3
   . I ERRCNT'=TERRCNT D
       .. W !,$J(TN,6)," HAS ",$J((ERRCNT-TERRCNT),5)," ERRORS"
 W !,$J(ERRCNT,10)," ERRORS FOUND"
 W !,$J(RCNT,10)," TRANSACTIONS  CHECKED (",+$P(^PRCA(433,0),U,3),")"
 D:ERRCNT>0 ERRLIST^A4AADP2
 D EXIT
 W !,"EOJ"
 QUIT
AT433 ;;
 N ERRCNT,OK,I,ICS,BN,TN,RCNT,DCNT,BCNT,TCNT,TERRCNT
 D INIT
 W #,"CHECKING ""AT"" CROSS-REFERENCE FOR FILE 433"
 S AT2=0,DCNT=0,RCNT=0
 F I=1:1 S AT2=$O(^PRCA(433,"AT",AT2)) W:(I#10)=0 "." Q:'AT2  D
    . S DCNT=DCNT+1,TERRCNT=ERRCNT
    . D LOOPAT2
 W !,$J(ERRCNT,10)," ERRORS FOUND"
 W !,$J(RCNT,10)," RECORDS CHECKED (",+$P(^PRCA(433,0),U,3),")"
 D:ERRCNT>0 ERRLIST^A4AADP2
 D EXIT
 W !,"EOJ"
 QUIT
ATD433 ;;
 N ERRCNT,OK,I,ICS,BN,TN,RCNT,DCNT,BCNT,TCNT,TERRCNT
 D INIT
 W #,"CHECKING ""ATD"" CROSS-REFERENCE FOR FILE 433"
 S DEBTOR=0,DCNT=0,RCNT=0
 F I=1:1 S DEBTOR=$O(^PRCA(433,"ATD",DEBTOR)) W:(I#10)=0 "." Q:'DEBTOR  D
    . S DCNT=DCNT+1,TERRCNT=ERRCNT
    . D LOOPDAT
    . I ERRCNT'=TERRCNT D
      .. W !,$J(DEBTOR,6)," HAS ",$J((ERRCNT-TERRCNT),5)," ERRORS"
 W !!,$J(DCNT,10)," DEBTORS CHECKED"
 W !,$J(ERRCNT,10)," ERRORS FOUND"
 W !,$J(RCNT,10)," RECORDS CHECKED (",+$P(^PRCA(433,0),U,3),")"
 D:ERRCNT>0 ERRLIST^A4AADP2
 D EXIT
 W !,"EOJ"
 QUIT
PERROR1 ;;
 Q:'ERRCODE
 S ERRCNT=ERRCNT+1
 W !,$J(ERRCNT,8),$J(DEBTOR,8),$J(BN,8),$J(TN,8),?40,"ERROR # ",ERRCODE
 S ERRCODE=0
 QUIT
EXIT ;;
 K DEBTOR,A4AFRB,END,TEAMT
 D EOR^A4AARPT
CLEANUP ;;
 K ERRCNT,OK,RCNT,DCNT,TERRCNT,AT2,BCNT,BN,BN433,DAT,DCNT,DPT,ERRCNT
 K ERRCODE,NATD,RBAL,TAO,BAL,CAT,BILL,CS,DIC,FAN0P2,FLAG1
 K FAN0,FAN0P1,FAN0P8,FAN0P9,FAN6,FAN6P21
 K FBN0,FBN0P1,FBN0P10,FBN0P2,FBN0P4,FBN1,FBN1P2,FBN1P9
 K NAC,NACTDT,NAS,NAT,NAW,NB,NC,ND,OK,RCNT,TCNT,TDT,TERRCNT,TN,XTN
 K DAT,I,TN
 K X,Y
 QUIT
INIT ;; 
 S ERRCNT=0,OK=0,RCNT=0,DCNT=0,BCNT=0,TCNT=0,TERRCNT=0
 QUIT
LOOPAT2 ;;
 S DAT=0
 F  S DAT=$O(^PRCA(433,"AT",AT2,DAT)) Q:'DAT  D LOOPAT1
 QUIT
LOOPAT1 ;; LOOP THRU TRANSACTIONS
 S TN=0
 F  S TN=$O(^PRCA(433,"AT",AT2,DAT,TN)) Q:'TN  D
   . D GET433D^A4AADP3
   . D GET430D^A4AADP3
   . S DEBTOR=+FAN0P9
   . D CHK433
 D C430XR^A4AADP3
 QUIT
LOOPDAT ;; LOOP THRU DATES
 S DAT=0
 F  S DAT=$O(^PRCA(433,"ATD",DEBTOR,DAT)) Q:'DAT  D LOOPDTN
 QUIT
LOOPDTN ;; LOOP THRU TRANSACTIONS
 D C430XR^A4AADP3
 S TN=0
 F  S TN=$O(^PRCA(433,"ATD",DEBTOR,DAT,TN)) Q:'TN  D CHK433
 QUIT
LOOPBN ;;
 S BN=0
 F  S BN=$O(^PRCA(430,"C",DEBTOR,BN)) Q:'BN  D CHK430,LOOPBTN
 QUIT
LOOPBTN ;;
 S TN=0
 F  S TN=$O(^PRCA(433,"C",BN,TN)) Q:'TN  D CHK433
 QUIT
CHK433 ;;
 S RCNT=RCNT+1,ERRCODE=0
 D CHK1^A4AADP3,PERROR1
 D CHK10^A4AADP3,PERROR1
 D CHK11^A4AADP3,PERROR1
 D CHK12^A4AADP3,PERROR1
 D CHK13^A4AADP3,PERROR1
 D C433XR^A4AADP3,PERROR1
 QUIT
CHK430 D GET430D^A4AADP3
 D C430XR^A4AADP3
 D CHK2^A4AADP3,PERROR1
 D CHK20^A4AADP3,PERROR1
 D CHK21^A4AADP3,PERROR1
 D CHK22^A4AADP3,PERROR1
 D CHK23^A4AADP3,PERROR1
 QUIT