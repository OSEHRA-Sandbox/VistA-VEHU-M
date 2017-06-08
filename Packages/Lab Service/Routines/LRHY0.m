LRHY0 ;DALOI/HOAK - HOWDY MAIN DRIVER ;10/15/10 11:00am
 ;;5.2;LAB SERVICE;**405,435,446,457**;Sep 27, 1994;Build 6
 ;
PICK ;
 ;  pick the site from Howdy Site FILE 69.86
 S LREND=0
 S DIC(0)="AEMQZ"
 S DIC=69.86
 D ^DIC
 I Y=-1 S LREND=1 QUIT
 S LRHYSITE=+Y
 K DIC
 ;
 I $G(^LRHY(69.86,LRHYSITE,0))["ALTER" S LRDEV=$O(^%ZIS(1,"B","NULL DEVICE",0)) G ALT
 ;
 ; Pick a printer
 S LRDEV=0
 K DIC
 S DIC(0)="EMQZ" K Y S LRHYCT2=1
 F  S LRDEV=$O(^LRHY(69.86,LRHYSITE,10,"B",LRDEV)) Q:+LRDEV'>0  D
 .  W !,LRHYCT2,". ",$P(^%ZIS(1,LRDEV,0),U)
 .  S LRX(LRHYCT2)=LRDEV S LRHYCT2=LRHYCT2+1
CHOOO W !,"Choose a label printer: " R X:DTIME W !
 I U[X S LREND=1 QUIT
 I X="" W !,"NOTHING SELECTED" S LREND=1 H 1 QUIT
 I '$D(LRX(X)) W !,"NUMBER NOT IN RANGE" H 1 G CHOOO
 I U[X S LREND=1 QUIT
 I 'X I $G(X)'="" W !,"enter the number please" G CHOOO
 S LRDEV=LRX(X)
 ;
 ;
ALT ;
 W ?11,$P(^%ZIS(1,LRDEV,0),U) H 2
 K DIC
 K LRHYCT2
 D USER^LRHYU
 ;
 ;
 QUIT
 ;
VET ; Primary API for Howdy!  Called by [LRHY PATIENT CARD SCAN] option.
 D XTMP^LRHYU
 N LRNPZZX,LRNODUP,LRLLOC,LRTSTZ99,LRACC,LRCDT,LRDPF,LRI
 N LRORD3,LRHYFIX,LRPLICK,LRPR,LRPRAC,LRQUIET,LRRB,LRSAMP,LRSND
 N LRSS,LRST,LRSTATUS,LRSUB1,LRTIC,LRTIM,LRTN,LRTREA,LRTS,LRTSORU
 N LRTST6,LRTT,LRUN,LRWLO,LRWLC,LRWRD,LRXYZ,LR3DTIME,LR3DTN
 N LR3SN,LRDT0,LREAL,LRFUTURE,LRGOTIT,LRHOWDY,LRHYHOK,LRIENZZ
 N LRNOTST,LRLBLBP,LRLLOC66,LRMAX2,LRNLT,LRNODUP,LRNONE,LRNPZZX,LRODT
 N LRODT0,LRHYOK,LRORD24,LRORU3,LRPAST,LRPIX,LRAHEAD,LRCHK,LRHYCT,LRCOL99
 N LRDT0,LRDUPT,LRHT1,LRIX,LROLLOC,LRX,LR3X
 ;
VET1 ; Code below executes to handle Patient episode.
 ; Then, Howdy waits here for next Patient
 ;
 K LRCCOMX,LRDUX,LREDT,LRDX,DIK
 K LR3D,LR33ORD,LR3T,LRANX6,LRCSQ,LRUP,LRHY3DT,LRHY3SN3
 K LRHYDJOB,LRHYSPC7,LRHYURG3,LRS3333,LRTAT,LREXORD
 K LRMERG,LRODRNUM,LRORDNUM,LRUNC,LRPARAM
 K LRHYCT3,LRHYCTC,IOTLC,LRC,LRHYCT3,LRHYCTC,LRHYTOK,LRKIL,LRLABNOD
 K LRLABSTP,LRLINE,LRLWC,LRN5,LRNONONO,LRNOT,LRNOTEST,LRNOUP,LRNT,LRNX0
 K LRODRUM,LRONE,LRORDSIZ,LRORDT,LRORDT1,LRM1,LRM2,LRM3,LRPHONE,LRORIEN
 K LRS,LRSC0,LRSDT,LRSN1,LRSPIEN,LRSSN,LRSTAR,LRSTOP,LRSTUCK
 K LRT0,LRTECH,LRTKX,LRTM7,LRTOTAL,LRTST,LRTUBE,LRTXT,LRUDT,LRUNK,LRURG7
 K LRURGA,LRURGNCY,LRURGT,LRURGZ19,LRX1,LRX2,LRX3,LRY1,LRYTAT,LR3,LR3MULT
 K LR3NX0,LR3ODT,M9,V,LRHYORDZ
 K LABCNT,LN,LR0NODE,LR68,LR6987,LR700,LR7LESS
 K LR7MORE,LRAANAME,LRAAZ,LRAC1,LRACCER,LRACCTM,LRACCXX
 K LRACNODE,LRACO,LRACTM,LRADD,LRBAR0,LRBAR1,LRBBRD
 K LRBINGO,LRCEN,LRCNTX,LRCTYPE,LRD,LRDA,LRDRAW0
 K LRDRAW1,LRDRAW7,LRDT,LRDTX,LRDUP,LRDUX,LREDT,LRDX
 K LRFINX
 ;
 I '$G(LRDEV) D PICK Q:LREND
 ;
 K LRDFN,PNM,LRSN,SSN,LRIDT,LRAA,LRAN,LRAD
 K ^TMP("LRHYDY",$J)
 D ^LRPARAM ; Set Howdy up as Lab user
 S LRHOWDY=1
 S LRHYCT=$G(LRHYCT,0)
 I LRHYCT=2 W !,"Please ask the clerk for assistance." K LRHYCT QUIT
 S LRODT=DT
 W @IOF
 K X
 ; 
 W !!,"Please swipe your ID CARD or Type SSN: "
 ;  %ZOSF("EOFF") = U $I:NOECHO
 ;  %ZOSF("EON") = U $I:ECHO
 X ^%ZOSF("EOFF")
 R X:9999999 W !
 I X=U X ^%ZOSF("EON") D BAKUSER^LRHYU QUIT
 X ^%ZOSF("EON")
 ; Code is set to read all types of VIC card as of 9/05/2005
 ;I $E(X,1,9)["-" D
 ;.  S X=$P(X,"-")_$P(X,"-",2)_$P(X,"-",3)
 ;I $E(X,1,1)'=0 I '$E(X,1,1) S X=$E(X,2,10)
 ;I $L(X)>10 S X=$E(X,2,10)
 ;I $L(X)'=9 W !,"Didn't read that Partner. " W:LRHYCT'=2 "Try again." H 2 S LRHYCT=LRHYCT+1 G VET
 ;
 K DFN,LRDFN,LRDPA,LRDPF,PNM,LRHYCT
 ; 
 ;S DFN=$O(^DPT("SSN",X,0))
 ;
 ; NEW CODE FOR VIC 4.0
 D RPCVIC^DPTLK(.DFN,X)
 ;
 I DFN<1 W !,"No record for this person." R X:15 G VET1
 S LRDFN=$G(^DPT(DFN,"LR"))
 ;
 I LRDFN D PT^LRX
 I 'LRDFN W !,"No Lab Data Available... Please check with clerk at the Desk." H 5 D LOG K X G VET1
 K ^TMP("LRHYDY",$J,"LRHYDY",$J,LRDFN)
 ;
 ; this call checks order against the 69.86
 D ORDCHK^LRHYB
 ;
 ;
 ;
 I $G(LRLOCS) W !!!,"Please check with clerk at the Desk" H 5 K X G QUITH
 I $G(LRMULT) W !!!,"Please check with clerk at the Desk" H 5 D LOG K X G QUITH
 I '$G(LRORD) S LREND=1 W !,$G(LRCTYPE)," No Orders found. Please check with clerk at the Desk" H 5 D LOG K X G QUITH
 D NOW^%DTC
 ;
 ;
 ;
PRT1 ;
 ;
 W @IOF
 D SCRNON^LRHYUTL
 S PNMALL="Howdy "_$P(PNM,",",2)_" "_$P(PNM,",")
 W !
 W IODHLT,"     ",PNMALL
 W !
 W IODHLB,"     ",PNMALL
 W !
 W !,$$CJ^XLFSTR($G(^LRHY(69.86,LRHYSITE,40)),IOM)
 W !,$$CJ^XLFSTR("Your Host is: "_$G(^LRHY(69.86,LRHYSITE,42)),IOM)
 W !,$$CJ^XLFSTR($G(^LRHY(69.86,LRHYSITE,44)),IOM)
 W !
 W IODHLT,"    Orders for date: "_$$Y2K^LRX(DT)
 W !
 W IODHLB,"    Orders for date: "_$$Y2K^LRX(DT)
 W !
 S LRXYZ=0
 F  S LRXYZ=$O(^LRHY(69.86,LRHYSITE,32,LRXYZ)) Q:+LRXYZ'>0  D
 .  W !
 .  W !,$$CJ^XLFSTR($G(^LRHY(69.86,LRHYSITE,32,LRXYZ,0)),IOM)
 .  W !
 W *7 H 1 W *7 H 1 W *7
 ;
 I $D(^LRHY(69.86,7,54,"B")) D BINBRD^LRHYBC1
 H 5
QUITH ; 
 D SCRNOFF^LRHYUTL ; Turn off screen variables
 K LRDFN,PNM,LRSN,SSN,LRIDT,LRAA,LRAN,LRAD,LRHYCT
 K LRNPZZX,LRNODUP,LRLLOC,LRTSTZ99,LRACC,LRCDT,LRDPF,LRI
 K LRORD3,LRHYFIX,LRPLICK,LRPR,LRPRAC,LRQUIET,LRRB,LRSAMP,LRSND
 K LRSS,LRST,LRSTATUS,LRSUB1,LRTIC,LRTIM,LRTN,LRTREA,LRTS,LRTSORU
 K LRTST6,LRTT,LRUN,LRWLO,LRWLC,LRWRD,LRXYZ,LR3DTIME,LR3DTN,LREXORD
 K LR3SN,LRDT0,LREAL,LRFUTURE,LRGOTIT,LRHOWDY,LRHYHOK,LRIENZZ
 K LRNOTST,LRLBLBP,LRLLOC66,LRMAX2,LRNLT,LRNODUP,LRNONE,LRNPZZX,LRODT
 K LRODT0,LRHYOK,LRORD24,LRORU3,LRPAST,LRPIX,LRAHEAD,LRCHK,LRHYCT,LRCOL99
 K LRDT0,LRDUPT,LRHT1,LRIX,LROLLOC,LRX,LR3X,LRLOCS
 K VAIN
 ;
 ;
 G VET1
 ;
 ;
 ;
ORDCHK ; This block to be used for future version
 QUIT
LOG ; Howdy will default to the clerks judgement when multiple orders found.
 I $G(LRMULT) QUIT
 Q:$G(LRSKIPNO)
 ;
 W !,"NO ORDERS"
 ;
 K LRDPF,PNM
 D PT^LRX
 D NOW^%DTC
 I '$G(LRDFN) S ^TMP("LRHYDY",$J,"LR NO ORDERS",%)=$G(DFN) QUIT
 S ^TMP("LRHYDY",$J,"LR NO ORDERS",%)=$G(PNM)_U_$G(^LR(LRDFN,.1))_U_$G(SSN)
 QUIT
 ;
 ;
LOG1 ; Howdy will default to the clerks judgement when multiple orders found.
 K LRORD,LRDPT,PNM
 W !,"MULTIPLE ORDERS"
 K LRDPF,PNM
 D PT^LRX
 D NOW^%DTC
 S ^TMP("LRHYDY",$J,"LR MULTIPLE ORDERS",%)=$G(PNM)_U_$G(^LR(LRDFN,.1))_U_$G(SSN)
 S LRSKIPNO=1
 QUIT
ORDERS ;
 QUIT