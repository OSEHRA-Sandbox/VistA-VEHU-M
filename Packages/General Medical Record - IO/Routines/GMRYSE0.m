GMRYSE0 ;HIRMFO/YH-ITEMIZED PATIENT I/O REPORT BY SHIFT PART 1 ;5/13/96
 ;;4.0;Intake/Output;;Apr 25, 1997
EN1 ;PATIENT INTAKE/OUTPUT BY SHIFT AND EVENT
 S GRPT=8,GMROUT=0 D DATE^GMRYRP1 G:GMROUT Q S GMROP(1)=$S($D(GMRNUR):"WARDPAT^GMRYUT4",1:"MASPT^GMRYRP5") D @GMROP(1) G:GMROUT Q
 D DEV^GMRYRP0 G:POP Q
 I $D(IO("Q")) K IO("Q"),IO("C") S ZTDESC="ITEMIZED PATIENT I/O REPORT BY SHIFT",ZTRTN="START^GMRYSE0",ZTIO=ION_";"_IOM_";"_IOSL D LOOP1^GMRYRP0,^%ZTLOAD,HOME^%ZIS D Q2^GMRYRP0 K GMROUT Q
START ;
 D START^GMRYRP0 I GMROUT D Q K GMROUT Q
 I "Pp"[GMREDB D PATIENT^GMRYUT9 G:GMROUT Q D SETARRY G:GMROUT Q D REPORT^GMRYSE1 D Q,Q2^GMRYRP0 K GMROUT Q
 I "SsWw"[GMREDB D:$D(GMRNUR) PATIENT^GMRYUT11
 G:'$D(^TMP("GMRPT",$J)) Q0
 S GROOM="" F J=0:0 S GROOM=$O(^TMP("GMRPT",$J,GROOM)) Q:GROOM=""!GMROUT  S GBED="" F J=0:0 S GBED=$O(^TMP("GMRPT",$J,GROOM,GBED)) Q:GBED=""!GMROUT  S DFN=0 F J=0:0 S DFN=$O(^TMP("GMRPT",$J,GROOM,GBED,DFN)) Q:DFN'>0!GMROUT  D
 .S GMRNAM=^TMP("GMRPT",$J,GROOM,GBED,DFN)
 .D PRNT
Q0 D Q D Q2^GMRYRP0 Q
PRNT S (GQ,GQT)=0 K ^TMP($J) D PT^GMRYUT0,SETARRY D REPORT^GMRYSE1
 Q
Q ;
 K GMRVHLOC,GMRVWLOC,GPORT,GSTAR,GDA,GMRY,GSAVE,GSAVEH,GMRHLOC,GDATA D Q^GMRYRP0
 K VAROOT,GTYPI,GTYPO,GN,GNN,GLN,GTXT,GMR100,GMRLEN,GMROP,GMRFIN,GMRSTRT,GRPT,GMROUT,DFN,GMREDB Q
SETARRY ;SET DATA IN ^TMP($J,"GMRY", FOR EACH PATIENT
 I '$D(^GMR(126,"B",DFN)) Q
 S GSAVEH=0,DA(1)=$O(^GMR(126,"B",DFN,0)) K ^TMP($J,"GMRY")
 F II="IN","OUT" D SAVE^GMRYRP2
 D SAVEIV^GMRYRP2,IVM
 Q
IVM ;SET IV MAINTENANCE IN ^TMP($J,"GMRY"
 Q:'$D(^GMR(126,DFN,"IVM","B"))
 S GSITE="" F  S GSITE=$O(^GMR(126,DA(1),"IVM","B",GSITE)) Q:GSITE=""  S DA=$O(^(GSITE,0)) Q:DA'>0  D SCARE
 Q
SCARE ;
 Q:'$D(^GMR(126,DA(1),"IVM",DA,1,"B"))
 S GSTRT=0 F  S GSTRT=$O(^GMR(126,DA(1),"IVM",DA,1,"B",GSTRT)) Q:GSTRT'>0  S GDA=0 F  S GDA=$O(^GMR(126,DA(1),"IVM",DA,1,"B",GSTRT,GDA)) Q:GDA'>0  D
 . S GMRINDT=GSTRT,GDAY=0 D NEXT^GMRYRP1 I '(GMRINDT<GMRSTRT!(GMRINDT>GMRFIN)) D SETSIFT^GMRYRP2,SETUT
 Q
SETUT S ^TMP($J,"GMRY",$P(GMRINDT,"."),GSHIFT,"IV",GMRINDT,GSTRT,"Z",DA,GDA)=$P(^GMR(126,DA(1),"IVM",DA,1,GDA,0)_"^^^^","^",1,8)_GSITE Q