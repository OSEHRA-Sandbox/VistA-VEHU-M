PSOLMAO ;BHAM ISC/LC - ACTIVE ORDERS ;14-MAR-1995
 ;;7.0;OUTPATIENT PHARMACY;**225,251,387,372**;DEC 1997;Build 54
 ;External reference to TERM^VALM0 supported by DBIA 2615
EN ; -- main entry point for PSO LM ACTION ORDER
 D EN^VALM("PSO LM ACTIVE ORDERS")
 Q
 ;
HDR ; -- header code
 D HDR^PSOLMUTL
 Q
 ;
INIT ; -- init variables and list array
 S VALMCNT=PSOPF D RV^PSOORFL
 Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 Q
 ;
EXIT ; -- exit code
 D KILL^VALM10() K PSODCREV,PSOONOFC S PSOQFLG=1
 Q
 ;
EXPND ; -- expand code
 Q
 ;
PENTRY ;
 D KILL^VALM10()
 N PSORVIEN
 I $O(PSODCREV(0)) F PSORVIEN=0:0 S PSORVIEN=$O(PSODCREV(PSORVIEN)) Q:'PSORVIEN  D
 .I '$D(IORVON),$D(IOST(0)) D ENS^%ZISS,TERM^VALM0
 .D CNTRL^VALM10(PSORVIEN,1,80,IORVON,IORVOFF,0)
 K PSORVIEN
 S VALMCNT=$G(PSOPF)
 Q:'$G(VALMCNT)
 N PSLIST S PSLIST=0 F PSLIST=1:1:VALMCNT I $D(^TMP("PSOPF",$J,PSLIST,"RV")) D
 . D CNTRL^VALM10(PSLIST,1,3,IORVON,IORVOFF,0)
 Q