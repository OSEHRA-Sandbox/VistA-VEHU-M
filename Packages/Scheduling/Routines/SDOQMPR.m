SDOQMPR ;LRVAMC/JRC ;ALB/SCK - Monitoring Report ; 7/17/96 
 ;;5.3;SCHEDULING;**47**;AUG 13, 1993
 ;  MODIFIED FOR NATIONAL RELEASE
 Q
 ;
START U IO
 S (ALDCTOTL,ALDCNT)=0,$P(ALDCDASH,"-",133)=""
 S (END,PAGE)=0
 S $P(DASH,"=",132)=""
 S Y=DT D DD^%DT S ALDCNOW=Y
 S Y=$P($G(^TMP("SDPM",$J,0)),U) D DD^%DT S ALDCSTDT=Y
 S Y=$P($G(^TMP("SDPM",$J,0)),U,2) D DD^%DT S ALDCLAST=Y
 ;
 I '$D(^TMP("SDPM",$J,0)) D  Q
 . D HEADER
 . W !!?5,"Either no appointment monitoring data found, or there was no data available for these clinics"
 ;
 K ^TMP($J)
 D SET,LOOP,KILL
 Q
SET ;
 N PMDIV
 ;
 S ALDCIEN=0 F  S ALDCIEN=$O(^TMP("SDPM",$J,ALDCIEN)) Q:ALDCIEN'>0  D
 .S ALDCDATE=0 F  S ALDCDATE=$O(^TMP("SDPM",$J,ALDCIEN,ALDCDATE)) Q:ALDCDATE'>0  D
 ..Q:'$D(^SC(ALDCIEN,0))
 ..S ALDCNAME=$P(^SC(ALDCIEN,0),U)
 ..Q:$E(ALDCNAME,1,2)="ZZ"                              ;ZZ clinics
 ..S ALDCNCT=$P($G(^SC(ALDCIEN,0)),U,17) Q:ALDCNCT="Y"  ;Non-Count Clincis
 ..S ALDCSTOP="UNKNOWN",ALDCSCD=$P($G(^SC(ALDCIEN,0)),U,7) S:ALDCSCD]"" ALDCSTOP=$P($G(^DIC(40.7,+ALDCSCD,0)),U)
 .. Q:+$P($G(^DIC(40.7,+ALDCSCD,0)),U,2)=0
 .. S ALDCODE=$P($G(^DIC(40.7,+ALDCSCD,0)),U,2)
 .. S ALDCGET=$G(^TMP("SDPM",$J,ALDCIEN,ALDCDATE))
 .. S PMDIV=$P(ALDCGET,U,7) S:PMDIV']"" PMDIV="ND" ;Get Division
 .. S ALDCGET=$P(ALDCGET,U,1,6) ;Remove division
 .. S ^TMP($J,PMDIV,ALDCSTOP,ALDCNAME,ALDCDATE,ALDCIEN)=ALDCGET_U_ALDCODE
 Q
 ;
LOOP ;
 N PMDIV
 S (ALDCNT,ALDCTOTL,ALDC2T,ALDCSLTA,ALDCDAYT,ALDCDAYS,ALDCAVG,ALDCOPEN,ALDCOST,ALDC2,ALDC3T,ALDC4T,ALDC4A,ALDC3A,ALDC5,ALDC5T,ALDC5A,ALDC6,ALDC6T,ALDC6A,ALDCOB)=0
 ;
 S PMDIV="" F  S PMDIV=$O(^TMP($J,PMDIV)) Q:PMDIV=""  D  Q:END
 . D HEADER
 . S ALDCSTOP="" F  S ALDCSTOP=$O(^TMP($J,PMDIV,ALDCSTOP)) Q:ALDCSTOP=""  D  Q:END
 .. D HDR2
 .. S ALDCNAME="",ALDCLINE=0 F  S ALDCNAME=$O(^TMP($J,PMDIV,ALDCSTOP,ALDCNAME)) Q:ALDCNAME=""  D  Q:END
 ...S ALDCDATE=0 F  S ALDCDATE=$O(^TMP($J,PMDIV,ALDCSTOP,ALDCNAME,ALDCDATE)) Q:ALDCDATE'>0  D  Q:END
 ....S ALDCIEN=0 F  S ALDCIEN=$O(^TMP($J,PMDIV,ALDCSTOP,ALDCNAME,ALDCDATE,ALDCIEN)) Q:ALDCIEN'>0  D  Q:END
 .....S ALDCGET=$G(^TMP($J,PMDIV,ALDCSTOP,ALDCNAME,ALDCDATE,ALDCIEN))
 .....S ALDC1=$P(ALDCGET,U),ALDC2=$P(ALDCGET,U,2),ALDC3=$P(ALDCGET,U,3),ALDC4=$P(ALDCGET,U,4),ALDC5=$P(ALDCGET,U,5),ALDC6=$P(ALDCGET,U,6),ALDCD=" ("_$P(ALDCGET,U,7)_") ",ALDCPSTP=" "_ALDCSTOP_ALDCD
 .....K ALDCSTAR S ALDCWK=66-($L(ALDCPSTP)*.5),$P(ALDCSTAR,"*",ALDCWK)="",ALDCPSTP=ALDCSTAR_ALDCPSTP_ALDCSTAR
 .....S:ALDC2>0 ALDCOPEN=ALDCOPEN+1
 .....S ALDC2T=ALDC2T+ALDC2  ;# slots on run date
 .....S ALDC3T=ALDC3T+ALDC3  ;# appts on run date
 .....S ALDC4T=ALDC4T+ALDC4  ;# slots from run date to first avlbe appt
 .....S ALDC5T=ALDC5T+ALDC5  ;# appts from run date to first avlbe appt
 .....S ALDC6T=ALDC6T+ALDC6  ;# of open days (days clinic held)
 .....D ADD
 .....S ALDCNT=ALDCNT+1
 .... D:$Y+5>IOSL HEADER  Q:END
 ....W:ALDCSTOP'=ALDCOST !!,ALDCPSTP
 ....S ALDCOST=ALDCSTOP
 ...S ALDCTOTL=ALDCTOTL+ALDCNT
 ...S ALDC4A=ALDC4T/ALDCNT   ;average slots to first available appt 
 ...S ALDC5A=ALDC5T/ALDCNT   ;average appts to first available appt
 ...S ALDC6A=ALDC6T/ALDCNT   ;average open days (days clinic is held)
 ...I (ALDC3T>0)&(ALDCOPEN>0) S ALDC3A=ALDC3T/ALDCOPEN   ;avg appts
 ...I (ALDC2T>0)&(ALDCOPEN>0) S ALDCSLTA=ALDC2T/ALDCOPEN ;avg slots
 ...I (ALDC4A>0)&(ALDC5A>0) S ALDCOB=ALDC5A/ALDC4A   ;overbooks
 ...S ALDCAVG=ALDCDAYT/ALDCNT
 ...I ALDCLINE=3 W ! S ALDCLINE=0
 ...W !,?2,$E(ALDCNAME,1,23),?30,$J(ALDCAVG,6,2),?42,$J(ALDCSLTA,6,2),?55,$J(ALDC3A,6,2),?70,$J(ALDC4A,6,2),?82,$J(ALDC5A,6,2),?95,$J(ALDC6A,6,2),?107,$J(ALDCOPEN,6),?120,$J(ALDCOB,6,2)
 ...S ALDCLINE=ALDCLINE+1
 ...S (ALDCNT,ALDCDAYS,ALDCDAYT,ALDC2T,ALDC3T,ALDC4T,ALDCOPEN,ALDCSLTA,ALDC3A,ALDC4A,ALDC5,ALDC5A,ALDC5T,ALDC6,ALDC6T,ALDC6A,ALDCOB)=0
 Q
ADD ;Calculate number of days to next available appointment
 S X2=ALDCDATE,X1=ALDC1 D ^%DTC S ALDCDAYS=X
 S ALDCDAYT=ALDCDAYT+ALDCDAYS
 Q
HEADER ;
 I PAGE,$E(IOST,1,2)="C-" W !,"Press RETURN to continue or '^' to exit: " R X:DTIME S END='$T!(X="^") Q:END
HDR1 W:$E(IOST,1,2)'="C-" @IOF
 S PAGE=PAGE+1
 W !?110,"Run Date: ",ALDCNOW
 W !?3,"OUTPATIENT CLINIC WAITING TIME PROJECT from "_ALDCSTDT_" thru "_ALDCLAST,?114,"PAGE:  ",PAGE,!
 W !?32,"[****************************** AVERAGE ******************************]"
 W !,?70,"SLOTS TO",?82,"APPTS TO",?95,"OPEN"
 W !,?32,"WAIT",?55,"APPTS",?70,"FIRST",?82,"FIRST",?95,"DAYS TO",?120,"OVER"
 W !,?32,"IN",?42,"SLOTS PER",?55,"PER OPEN",?70,"AVAIL",?82,"AVAIL",?95,"FIRST",?109,"OPEN",?120,"BOOK"
 W !?5,"Clinic",?32,"DAYS",?42,"OPEN DAY",?55,"DAY",?70,"APPT",?82,"APPT",?95,"APPT",?109,"DAYS",?120,"RATE"
 W !,DASH
 W !!,"DIVSION: ",$S(+PMDIV>0:$P($G(^DG(40.8,PMDIV,0)),U),1:"None Specified")
 Q
 ;
HDR2 W:ALDCSTOP=ALDCOST !!,ALDCPSTP
 S ALDCLINE=0
 Q
 ;
KILL K X,Y,ALDCDATE,ALDC1,ALDCSTDT,ALDCLAST,ALDCNT,ALDCDAYT,ALDC3T,ALDCSTOP,ALDCOST,ALDCPAGE,ALDC2,ALDC3,ALDC4,ALDC5,ALDC6,ALDC2T
 K ALDCAVG,ALDCDASH,ALDCDAYS,X1,X2,ALDCGET,ALDCIEN,ALDCNAME,ALDCOPEN,ALDCSCD,ALDCSLTA,ALDCTOTL,ALDCNCT,ALDC3A,ALDC4A,ALDC5A
 K ALDC6A,ALDC4T,ALDC5T,ALDC6T,ALDCOB
 K ^TMP($J)
 Q