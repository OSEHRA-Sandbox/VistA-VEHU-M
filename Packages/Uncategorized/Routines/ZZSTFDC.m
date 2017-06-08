ZZSTFDC ;HRN/ART ; STS Text File Deployment ; 19-NOV-2008
 ;;1.0;HEALTH DATA & INFORMATICS;****;Feb 22, 2005;Build 6
 ;;
 ;
EN ; -- main entry point for HDISTFD FOF VIEW
 D EN^VALM("ZZSTFD FOF VIEW")
 Q
 ;
HDR ; -- header code
 N HDMODE
 S HDMODE=$G(^TMP("HDISTFD",$J,"PARAMS","MODE"))
 S VALMHDR(1)="View Downloaded HL7 Records"
 S VALMHDR(2)="Mode: "_$S(HDMODE="F":"File of",HDMODE="R":"Remote",HDMODE="L":"Local",1:"?")_" Files"
 Q
 ;
INIT ; -- init variables and list array
 N HDDIR,HDLCNT,HDIDX,HDNODE,HDFILE,HDIENS,HDSTAT,HDLINE,HDREC,HDSELECT
 S HDLCNT=0
 S HDDIR=$G(^TMP("HDISTFD",$J,"PARAMS","LOCAL DIR"))
 S HDSELECT=$NA(^TMP("HDISTFD",$J,"SELECT"))
 S HDIDX=""
 F  S HDIDX=$O(@HDSELECT@(HDIDX)) Q:HDIDX=""  D
 . S HDLCNT=HDLCNT+1
 . S HDNODE=$G(@HDSELECT@(HDIDX))
 . S HDIENS=$P(HDNODE,U,1)_","
 . S HDFILE=$P(HDNODE,U,2)
 . S HDSTAT=$P(HDNODE,U,3)
 . S HDSTAT=$S(HDSTAT=0:"NOT LOADED",HDSTAT=1:"LOADED",HDSTAT=-1:"ERROR (-1)",HDSTAT=-2:"ERROR (-2)",HDSTAT=-3:"ERROR (-3)",1:"")
 . S HDLINE=HDDIR_HDFILE_"     "_HDSTAT
 . D SET^VALM10(HDLCNT,HDLINE)
 . ;Display records
 . I $$OPEN^ZZSTFDU("FILE",HDDIR,HDFILE,"R") D
 . . F  Q:$$EOF^ZZSTFDU  U IO R HDREC:DTIME D
 . . . S HDLCNT=HDLCNT+1
 . . . S HDLINE="   "_HDREC
 . . . D SET^VALM10(HDLCNT,HDLINE)
 . . D CLOSE^ZZSTFDU("FILE")
 S VALMCNT=HDLCNT
 Q
 ;
HELP ; -- help code
 S X="?" D DISP^XQORM1 W !!
 Q
 ;
EXIT ; -- exit code
 D CLEAN^VALM10
 D FULL^VALM1
 Q
 ;
EXPND ; -- expand code
 Q
 ;