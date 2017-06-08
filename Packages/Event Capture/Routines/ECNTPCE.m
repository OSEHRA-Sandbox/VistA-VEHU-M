ECNTPCE ;ALB/JAM-Event Capture Records failing transmission to PCE;14 Jan 04 ;11/7/12  11:27
 ;;2.0;EVENT CAPTURE;**61,72,119**;8 May 96;Build 12
EN ; entry point
 K %DT S %DT="AEX",%DT("A")="Start with Date:  " D ^%DT I Y<0 G END
 S ECSD=Y,%DT("A")="End with Date:  " D ^%DT G:Y<0 END S ECED=Y
 I ECED<ECSD W !,"End date must be after start date",! G EN
 S ECDATE=$$FMTE^XLFDT(ECSD)_U_$$FMTE^XLFDT(ECED)
 S ECSD=ECSD-.0001,ECED=ECED+.9999
 K IOP,%ZIS,POP,IO("Q") S %ZIS("A")="Select Device: ",%ZIS="QM"
 D ^%ZIS G:POP END
 I $D(IO("Q")) K IO("Q") D  G END
 .S (ZTSAVE("ECDFN"),ZTSAVE("ECDATE"),ZTSAVE("ECED"),ZTSAVE("ECSD"))=""
 .S ZTDESC="ECS RECORDS FAILING TRANSMISSION TO PCE REPORT",ZTRTN="START^ECNTPCE"
 .S ZTIO=ION D ^%ZTLOAD,HOME^%ZIS
 W !,?5,"Please be patient, this may take a few moments..."
 ;
START ; entry when queued
 N ECOUT,X,Y,DIR,LINE,ECPG,ECRDT,%H,CNT ;119
 S ECOUT=0,ECPG=1
 S %H=$H D YX^%DTC S ECRDT=Y
 U IO
 I $G(ECPTYP)="E" S CNT=1,^TMP($J,"ECRPT",CNT)="DATE/TIME^LOCATION^DSS UNIT^CATEGORY^PATIENT^SSN^PROCEDURE CODE^PROCEDURE NAME^PROV 1^PROV 2^PROV 3^PROV 4^PROV 5^PROV 6^PROV 7^REASON 1^REASON 2^REASON 3" ;119
 I $G(ECPTYP)="E" D GET,^ECKILL Q  ;119 get data to export and stop processing.
 D GET
 D END
 Q
GET ; start processing or records
 N DATE,ECL,ECNT,ECFN,ECEC,ECPX,ECSTR,ECD
 K ^TMP("ECNTPCE",$J)
 S DATE=ECSD,ECNT=0
 F  S DATE=$O(^ECH("AC",DATE)) Q:('DATE)!(DATE>ECED)  D
 .S ECFN=0 F  S ECFN=$O(^ECH("AC",DATE,ECFN)) Q:'ECFN  D 
 ..Q:'$D(^ECH(ECFN,"R"))  S ECEC=$G(^ECH(ECFN,0)) Q:ECEC=""
 ..S ECL=$P(ECEC,U,4),ECD=$P(ECEC,U,7),ECPX=$P(ECEC,U,9)
 ..S ECDFN=$P(ECEC,U,2)
 ..I (ECL="")!(ECD="")!(ECPX="")!(ECDFN="") Q
 ..S ECSTR=ECFN_U_$P(ECEC,U,8)_U_ECPX
 ..S ECNT=ECNT+1,^TMP("ECNTPCE",$J,DATE,ECL,ECD,ECDFN,ECNT)=ECSTR
 ..K ECPRV S ECPRV=$$GETPRV^ECPRVMUT(ECFN,.ECPRV) I 'ECPRV D  K ECPRV
 ...M ^TMP("ECNTPCE",$J,DATE,ECL,ECD,ECDFN,ECNT,"PRV")=ECPRV
 I $G(ECPTYP)="E" D PRT Q  ;119
 D HDR
 I '$O(^TMP("ECNTPCE",$J,0)) D  Q
 .W !!,?10,"No Data found during the time selected."
 D PRT
 Q
 ;
END K ECSD,ECED
 I $D(ECGUI) D ^ECKILL Q
 W !
 I $E(IOST,1,2)="C-",$G(ECOUT)=0 W !!,"Press <RET> to continue" R X:DTIME
 ;W @IOF
 D ^%ZISC D ^ECKILL S:$D(ZTQUEUED) ZTREQ="@"
 Q
PAGE ; end of page
 I $E(IOST,1,2)="C-" S DIR(0)="E" D ^DIR K DIR I 'Y S ECOUT=1 Q
 D HDR
 Q
HDR ; print header
 W @IOF
 W ECRDT,?70,"Page: ",ECPG,!
 W !,?17,"ECS RECORDS FAILING TRANSMISSION TO PCE REPORT",!,?24
 W "FROM "_$P(ECDATE,U)_" TO "_$P(ECDATE,U,2),!!
 W "DATE/TIME",?16,"PATIENT",?39,"SSN",?44,"PROVIDER(S)",?61,"REASONS"
 W !,"LOCATION",?16,"PROCEDURE",!,"DSS UNIT",?16,"CATEGORY",!
 F LINE=1:1:80 W "-"
 W !
 S ECPG=ECPG+1
 Q
 ;
PRT N ECLN,ECDN,ECPAT,ECEC,ECPS,ECDFN,ECUN,ECUN1,ECUN2,ECDTE,ECDT,ECRS,ECDE
 N ECX,ECAT,ECSSN,DFN,VA,VADM,ECEPN,ECECPT ;119
 S ECDTE=0 F  S ECDTE=$O(^TMP("ECNTPCE",$J,ECDTE)) Q:'ECDTE  D  Q:ECOUT
 .S ECDT=$$FMTE^XLFDT(ECDTE,2),ECL=0
 .F  S ECL=$O(^TMP("ECNTPCE",$J,ECDTE,ECL)) Q:'ECL  D  Q:ECOUT
 ..S ECLN=$P($G(^DIC(4,ECL,0)),U),ECLN=$S(ECLN="":"UNKNOWN",1:ECLN),ECD=0
 ..F  S ECD=$O(^TMP("ECNTPCE",$J,ECDTE,ECL,ECD)) Q:'ECD  D  Q:ECOUT
 ...S ECDN=$P($G(^ECD(ECD,0)),U),ECDN=$S(ECDN="":"UNKNOWN",1:ECDN)
 ...S ECDFN=0
 ...F  S ECDFN=$O(^TMP("ECNTPCE",$J,ECDTE,ECL,ECD,ECDFN)) Q:'ECDFN  D  Q:ECOUT
 ....S DFN=ECDFN D DEM^VADPT
 ....S ECPAT=VADM(1),ECSSN=$P($P(VADM(2),U,2),"-",3),ECNT=0
 ....F  S ECNT=$O(^TMP("ECNTPCE",$J,ECDTE,ECL,ECD,ECDFN,ECNT)) Q:'ECNT  D PR2  Q:ECOUT
 Q
 ;
PR2 S ECEC=$G(^TMP("ECNTPCE",$J,ECDTE,ECL,ECD,ECDFN,ECNT))
 S ECPS="",ECFN=$P(ECEC,U)
 D PROV
 S ECAT=$S($P(ECEC,U,2):$P($G(^EC(726,$P(ECEC,U,2),0)),U),1:"")
 I $P(ECEC,U,3)'="" S ECDE=+$P(ECEC,U,3) D
 .I $P(ECEC,U,3)[";EC" D  Q
 ..S ECPS=$G(^EC(725,+ECDE,0)),ECEPN=$P(ECPS,U),ECECPT=$P(ECPS,U,2),ECPS=$P(ECPS,U,2)_" "_$P(ECPS,U) ;119
 .S ECPS=$$CPT^ICPTCOD(ECDE,ECDTE),ECEPN=$S(+ECPS:$P(ECPS,U,3),1:"CPT NAME UNKNOWN"),ECECPT=$P(ECPS,U,2) ;119
 .S ECPS=$S(+ECPS>0:$P(ECPS,U,2)_" "_$P(ECPS,U,3),1:"CPT NAME UNKNOWN")
 S ECRS=^ECH(ECFN,"R")
 I $G(ECPTYP)="E" D EXPORT K ECPRV Q  ;119
 W ECDT,?16,$E(ECPAT,1,20),?39,ECSSN,?44,$E(ECUN1,1,16),?61,$E($P(ECRS,";"),1,19),!
 W $E(ECLN,1,15),?16,$E(ECPS,1,27),?44,$E(ECUN2,1,16)
 W ?61,$E($P(ECRS,";",2),1,19),!
 W $E(ECDN,1,15),?16,$E(ECAT,1,27),?44,$E(ECUN3,1,16)
 W ?61,$E($P(ECRS,";",3),1,198)
 S ECUN=0 F ECX=4:1 S ECUN=$O(ECPRV(ECUN)) Q:(ECUN="")&($P(ECRS,";",ECX)="")  D  I ECOUT Q
 .W !
 .I ($Y+6)>IOSL D PAGE I ECOUT Q
 .I ECUN'="" W ?44,$E($P(ECPRV(ECUN),"^",2),1,16) K ECPRV(ECUN)
 .W ?61,$E($P(ECRS,";",ECX),1,19)
 W !!
 I ($Y+6)>IOSL D PAGE I ECOUT Q
 Q
PROV ;Set provider 1-3 in variables
 M ECPRV=^TMP("ECNTPCE",$J,ECDTE,ECL,ECD,ECDFN,ECNT,"PRV")
 S ECUN=0,ECUN1="UNKNOWN",(ECUN2,ECUN3)=""
 F I=1:1:3 S ECUN=$O(ECPRV(ECUN)) Q:'ECUN  D
 .S @("ECUN"_I)=$P(ECPRV(ECUN),"^",2) K ECPRV(ECUN)
 Q
 ;
EXPORT ;Section added in patch 119
 N J
 S CNT=CNT+1
 S ^TMP($J,"ECRPT",CNT)=ECDT_U_ECLN_U_ECDN_U_ECAT_U_ECPAT_U_ECSSN_U_ECECPT_U_ECEPN_U_ECUN1_U_ECUN2_U_ECUN3
 F J=4:1:7 S ^TMP($J,"ECRPT",CNT)=^TMP($J,"ECRPT",CNT)_U_$P($G(ECPRV(J)),U,2) ;Set providers 4 through 7
 F J=1:1:3 S ^TMP($J,"ECRPT",CNT)=^TMP($J,"ECRPT",CNT)_U_$P(ECRS,";",J) ;add up to 3 reasons
 Q