PSOCPF1 ;BIR/BAA - Pharmacy CO-PAY Application Utilities for IB ;02/06/92
 ;;7.0;OUTPATIENT PHARMACY;**463,572**;DEC 1997;Build 1
 ;
SORT ; get the data
 K ^TMP($J,"PSOCPF"),^TMP($J,"PSOCPFX"),^TMP($J,"PSOCPFC"),^TMP($J,"PSOCPFE")
 ; compile data to display here
 N BDATE,EDATE,RXS,PAT,FILDT,END,RIEN,RSX,RFL,DFN,VADM,VAEL,RFDT
 S BDATE=$P(FILTERS(0),U,1),EDATE=$P(FILTERS(0),U,2)
 S RXS=$P(FILTERS(0),U,3),DFN=$P(FILTERS(0),U,4)
 ;read only selected patients RX's
 F RX=0:0 S RX=$O(^PS(55,DFN,"P",RX)) Q:'RX  D
 . S RIEN=$P($G(^PS(55,DFN,"P",RX,0)),U)
 . Q:'RIEN  Q:'$D(^PSRX(RIEN,0))
 . I RXS,'$D(FILTERS(1,RIEN)) Q
 . I '$D(^PSRX(RIEN,0)) Q
 . ; Get this RX's 0 fill and refills for fill date info
 . I $D(^PSRX(RIEN,2)) S FILDT=$P(^PSRX(RIEN,2),U,2) Q:(FILDT<BDATE)!(FILDT>EDATE)  D SORTRF     ;0 fill
 . F RFDT=0:0 S RFDT=$O(^PSRX(RIEN,1,RFDT)) Q:'RFDT  D
 .. S FILDT=$P(^PSRX(RIEN,1,RFDT,0),U) Q:(FILDT<BDATE)!(FILDT>EDATE)  D SORTRF                   ;x refills
 Q
 ;
SORTRF ;Set fill number and call getdata
 S RFL=$O(^PSRX("AD",FILDT,RIEN,"")) Q:'$D(^DPT(DFN,0))  D GETDATA(RIEN)
 Q
 ;
GETDATA(RIEN) ;SET UP DATA FOR LIST MANAGER
 N PTNM,PID,MED,RX,IBST1,SC,SCP,MTSD,MTS,RNB,MIEN,DEBTOR
 N DRG,CPY,BLNO,ARST,ARST1,ARTRN,X,MREC,IBN,IBND,PBIL
 N PRIEN,PIBN
 S RX=$$GET1^DIQ(52,RIEN_",",.01,"E")
 S DRG=$$GET1^DIQ(52,RIEN_",",6,"I"),MED=$$GET1^DIQ(52,RIEN_",",6,"O")
 I DRG="" Q
 D DEM^VADPT S PTNM=VADM(1),PID=$P(VADM(2),U,1),PID=$E(PTNM,1)_$E(PID,6,9)
 D ELIG^VADPT S SC=$P(VAEL(3),U,1),SCP=$P(VAEL(3),U,2),MTS=$P(VAEL(9),U,2)
 S MTSD=$$GET1^DIQ(2,DFN_",",999.2,"I")
 S X=$$RXST^IBARXEU(DFN,DT),CPY=$P(X,U,2)
 I RFL S IBN=$$GET1^DIQ(52.1,RFL_","_RIEN,9,"I")
 I 'RFL S IBN=$$GET1^DIQ(52,RIEN_",",106,"I")
 I IBN="" S (PBIL,BLNO,ARTRN,PRIEN,ARST1,ARST,DEBTOR)="" Q
 ;
 S (PBIL,ARST1,ARST,BLNO,ARTRN,PBIL,PRIEN,PIBN,DEBTOR)=""
 S BLNO=$$GET1^DIQ(350,IBN_",",.11,"I")
 S ARTRN=$$GET1^DIQ(350,IBN_",",.12,"I")
 I ARTRN="" S PIBN=$$GET1^DIQ(350,IBN_",",.09,"I")
 I PIBN'="",PIBN'=IBN D
 . S ARTRN=$$GET1^DIQ(350,PIBN_",",.12,"I")
 . S ARST=$$GET1^DIQ(350,PIBN_",",.05,"I"),ARST1=$$GET1^DIQ(350,PIBN_",",.05,"O")_" CHARGE"
 I ARTRN'="" S (PBIL,PRIEN)=$$GET1^DIQ(433,ARTRN_",",.03,"I")
 I PIBN'="",PIBN=IBN D
 . S ARST=$$GET1^DIQ(350,PIBN_",",.05,"I"),ARST1=$$GET1^DIQ(350,PIBN_",",.05,"O")
 I BLNO="",PBIL'="" S BLNO=$$GET1^DIQ(430,PBIL_",",.01),DEBTOR=$$GET1^DIQ(430,PBIL_",",9,"I")
 I PRIEN'="",PIBN="" S ARST1=$$GET1^DIQ(430,PRIEN_",",8,"O"),ARST=$$GET1^DIQ(430,PRIEN_",",8,"I"),DEBTOR=$$GET1^DIQ(430,PRIEN_",",9,"I")
 I ARST="" S ARST=$$GET1^DIQ(350.21,IBN_",",.01,"I"),ARST1=$$GET1^DIQ(350.21,IBN_",",.01,"O")
 S ^TMP($J,"PSOCPF",PTNM,RIEN,RFL)=PTNM_U_PID_U_MED_U_RIEN_U_RFL_U_ARTRN_U_RX_U_FILDT_U_BLNO_U_ARST1_U_SC_U_SCP_U_MTSD_U_MTS_U_DFN_U_PBIL_U_ARST_U_PRIEN_U_IBN_U_CPY_U_DEBTOR
 Q
 ;
CANCEL ; CANCEL COPAY STATUS
 ;
 D FULL^VALM1
 N I,J,IBXX,VALMY,ECNT,NAME,GOTPAT,RC,IBFR,IBTO
 S CNT=0
 D EN^VALM2($G(XQORNOD(0)))
 I $D(VALMY),$D(^TMP($J,"PSOCPF")) D
 . S IBXX=0 F  S IBXX=$O(VALMY(IBXX)) Q:'IBXX  D
 .. S RC=$G(^TMP($J,"PSOCPFX",IBXX)),CNT=CNT+1
 .. S NAME=$P(RC,U,1),PSODA=$P(RC,U,4),MED=$P(RC,U,3),RX=$P(RC,U,8),RFL=$P(RC,U,7)
 .. I '$D(PSOPAR) D ^PSOLSET
 .. W !!,?17,"PATIENT: ",NAME
 .. W !,?17,"Medication: ",MED
 .. W !,?17,"RX: ",RX_"-"_RFL
 .. D ICN^PSODPT($P(^PSRX(PSODA,0),"^",2))
 .. S PSORXN=$P(^PSRX(PSODA,0),"^"),PREA="R"
 .. S PCOPAY=$G(^PSRX(PSODA,"IB"))
 .. D ASKCAN
 D BLD^PSOCPF
 S VALMBCK="R"
 Q
 ;
RESET ; RESET/CANCEL COPAY STATUS
 ;
 D FULL^VALM1
 N I,J,IBXX,VALMY,ECNT,NAME,GOTPAT,RC,IBFR,IBTO
 S CNT=0
 D EN^VALM2($G(XQORNOD(0)))
 I $D(VALMY),$D(^TMP($J,"PSOCPF")) D
 . S IBXX=0 F  S IBXX=$O(VALMY(IBXX)) Q:'IBXX  D
 .. S RC=$G(^TMP($J,"PSOCPFX",IBXX)),CNT=CNT+1
 .. S NAME=$P(RC,U,1),PSODA=$P(RC,U,4),MED=$P(RC,U,3),RX=$P(RC,U,8),RFL=$P(RC,U,7)
 .. D STATUS(PSODA,RFL)
 D BLD^PSOCPF
 S VALMBCK="R"
 Q
 ;
STATUS(PSODA,RFL) ; PROCESS STATUS CHANGE
 N PSOIBQ,PREA,PSI,PSOCOMM,FLAG,PSOSUMM,PSONW,PSOINDPT,PSONEW,PSOOLD
 S PSOSUMM=""
 I '$D(PSOPAR) D ^PSOLSET
 W !!,?17,"PATIENT: ",NAME
 W !,?17,"Medication: ",MED
 W !,?17,"RX: ",RX_"-"_RFL
 ;
 D ICN^PSODPT($P(^PSRX(PSODA,0),"^",2))
 S PSORXN=$P(^PSRX(PSODA,0),"^"),PREA="R"
 S PCOPAY=$G(^PSRX(PSODA,"IB"))
 W !!,"Rx # ",PSORXN," is a ",$S(+PCOPAY:"Copay",1:"No Copay")," prescription"
 S PSOLFIL=$$LF^PSOPFSU1(PSODA) D PFSA^PSOPFSU1(PSODA,PSOLFIL,3)  ;PSOCPC def PSOPFSA=1 if OP SC/EI's change.
 D EXEMCHK^PSOCPC ; CHECK/CHANGE EXEMPTION FLAGS
 S PSOIBQ=$G(^PSRX(PSODA,"IBQ"))
 ;
 I '$G(^PSRX(PSODA,"IB")),PSOIBQ'["1" D  G ASKCAN
 . K DIR S DIR(0)="Y",DIR("B")="N",DIR("A")="Do you want to reset the status to COPAY" D ^DIR K DIR
 . I Y'=1 Q
 . S DIC="^IBE(350.3,",DIC("S")="I $P(^(0),U,3)'=2",DIC(0)="AEQMZ",DIC("A")="Select Reason for Reset : " D ^DIC K DIC I Y'<0 S PSORSN=+Y
 . S PREA="R",PSOOLD="No Copay",PSONW="Copay",PSOCOMM="" D ACTLOG^PSOCPA
 . S PSI=0,PSOCOMM="Copay status of this Rx has been reset to COPAY." D SETSUMM^PSOCPC
 . S $P(^PSRX(PSODA,"IB"),"^")=1 ;Reset flag to COPAY
 ;
 I $G(^PSRX(PSODA,"IB")) D  G ASKCAN
 . K DIR S DIR(0)="Y",DIR("B")="N",DIR("A")="Do you want to reset the status to NO COPAYMENT" D ^DIR K DIR
 . I Y'=1 Q
 . S DIC="^IBE(350.3,",DIC("S")="I $P(^(0),U,3)'=2",DIC(0)="AEQMZ",DIC("A")="Select Reason for Reset : " D ^DIC K DIC I Y'<0 S PSORSN=+Y
 . S PREA="R",PSOOLD="Copay",PSONW="No Copay",PSOCOMM="" D ACTLOG^PSOCPA
 . S PSI=0,PSOCOMM="Copay status of this Rx has been reset to NO COPAY." D SETSUMM^PSOCPC
 . S $P(^PSRX(PSODA,"IB"),"^")="" ;Reset flag to NO COPAY
ASKCAN D ASKCAN^PSOCPD
 I $$FLAG(.PSOSUMM) S ^TMP($J,"PSOCPFC",NAME,PSODA,RFL)="Cancelled"
 D PRTSUMM^PSOCPB
RESETE K PSODA,PSORXN,PSORSN,PSOREF,X,Y,PCOPAY,PREA,PSOCOMM,PSI
 ;
FLAG(PSOSUMM) ; CHECK FOR CANCELLED CHARGE
 N FLAG,CNT
 S (CNT,FLAG)=0
 F  S CNT=$O(PSOSUMM(CNT)) Q:CNT=""  I PSOSUMM(CNT)["copay charge cancelled" S FLAG=1 Q
 Q FLAG
 ;
EXPORT ; -- print excel spreadsheet.
 I '$D(^TMP($J,"PSOCPF")) D BLD^PSOCPF S VALMBCK="R" Q
 D CLEAR^VALM1,FULL^VALM1
 S LCNT=0
 D ^%ZISC
 D DEVICE("EF")
 ;
 D BLD^PSOCPF
 D PAUSE^VALM1
 S VALMBCK="R"
 Q
 ;
EXCEL(FILTERS) ; print the data in excel format
 ;NAME_U_PID_U_MED_U_RX_"-"_RFL_U_$$FMTE^XLFDT(FILDT,"2DZ")_U_BLN_U_ARST1_U_SCO_U_SCP_U_MTS_U_MTSD_U_CPY
 U IO
 N LCNT,PCE,REC,OUT,NAME,XX,BCNT,CNT,NXT,ZZ,ZZ1,ZZ2,OUT
 N BDATE,EDATE,RIEN,RFL
 S BDATE=$$FMTE^XLFDT($P(FILTERS,U,1),"2DZ")
 S EDATE=$$FMTE^XLFDT($P(FILTERS,U,2),"2DZ")
 D EXHDR
 S LCNT=0,NAME=""
 F  S NAME=$O(^TMP($J,"PSOCPFE",NAME)) Q:NAME=""  D
 . S RIEN=0
 . F  S RIEN=$O(^TMP($J,"PSOCPFE",NAME,RIEN)) Q:RIEN=""  D
 .. S RFL=""
 .. F  S RFL=$O(^TMP($J,"PSOCPFE",NAME,RIEN,RFL)) Q:RFL=""  D
 ... S REC=^TMP($J,"PSOCPFE",NAME,RIEN,RFL)
 ... W !,REC
 W !,"END OF REPORT"
 Q
 ;
DEVICE(TYPE) ; Ask user to select device
 ;
 D CLEAR^VALM1
 D FULL^VALM1
 N %ZIS,CRT,MAXCNT,POP,IOST,MAXCNT,IOSL,ZTREQ
 W !,"NO QUEUING ALLOWED FOR THIS REPORT"
 W !,"This report must have a line length of at least 256.",!
 S %ZIS="M" D ^%ZIS G:POP ENQ
 ; print report
 I IOST["C-" S MAXCNT=IOSL-3,CRT=1
 E  S MAXCNT=IOSL,CRT=0
 ;
 I TYPE="EF" U IO D EXCEL(FILTERS(0))
 ;
 D ^%ZISC
 ; 
 I $D(ZTQUEUED) S ZTREQ="@"
 ;
ENQ Q
 ;
EXHDR ; -- excel header
 N HDR
 ;^TMP($J,"PSOCPF",PTNM,RIEN,RFL)=PTNM_U_PID_U_MED_U_RIEN_U_RFL_U_RX_U_FILDT_U_BLNO_U_IBST1_U_SC_U_SCP_U_MTSD_U_MTS_U_DFN_U_IBST
 W !,"Reset/Cancel Report"
 W !,"From ",BDATE," TO ",EDATE
 S HDR="Patient Name"_U_"ID"_U_"MEDICATION"_U_"RX"_U_"FILL DATE"_U_"BILL NO."_U_"STATUS"_U_"SC"_U_"PERCENT"_U_"MEANS TEST"_U_"MEANS DATE"_U_"RX STATUS"
 W !,HDR
 Q
