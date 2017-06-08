TIUZOBJ2 ;SFVAMC/APC - Active Problem List Object ;7/24/97
 ;;1
 ;Copied from GMTSPLST v2.7
PL(DFN,DISPLAY,TARGET,LINE) ;7/24/97 Object entry
ACTIVE ;Get active problems
 N STATUS,DA
 S STATUS="A"
 D GETLIST^GMPLHS(DFN,STATUS)
 ;Q;'$D(^TMP("GMPLHS",$J))
 I '$D(^TMP("GMPLHS",$J)) D NODATA G EXIT
 ;D SUBHDR
 D PLWRT
EXIT ;
 K ^TMP("GMPLHS",$J)
 Q "~@"_$NA(@TARGET)
 ;
NODATA ;
 N %
 S LINE=LINE+1
 S @TARGET@(0)="^^"_LINE_U_LINE_U_DT_"^^"
 D NOW^%DTC
 S @TARGET@(LINE,0)="No active problems in computerized problem list as of "_$$FMTE^XLFDT(%,"2M")
 S LINE=LINE+1,@TARGET@(LINE,0)=" "
 Q
 ;
PLWRT ; Writes Problem List Component,X
 N GMREC,GMTSICL,GMTAB,DIWL,ARHSTR
 S GMTSICL=30 ;# of blank columns for problem
 S DIWL=0 ;used in TXTFMT call & to print returned data
 S GMTAB=0 ;Used to offset data from TXTFMT call after 1st line
 S GMREC=0
        ;SFVAMC/APC 12/17/97 Add computer msg
 S LINE=LINE+1,@TARGET@(LINE,0)="Computerized Problem List is the source for the following: ",LINE=LINE+1,@TARGET@(LINE,0)=" "
 F  S GMREC=$O(^TMP("GMPLHS",$J,GMREC)) Q:GMREC'>0  D  Q:$D(GMTSQIT)
 . N GMNODE,DIAG,LASTMDT,STAT,ONSETDT,PROV,SERV,RESDT,NARR,GMICD
 . N ADDINFO,GMTSX,X
 . S GMNODE=$G(^TMP("GMPLHS",$J,GMREC,0))
 . Q:GMNODE']""
 . S DIAG=$P(GMNODE,U),LASTMDT=$P(GMNODE,U,2),STAT=$P(GMNODE,U,5)
 . S X=LASTMDT D REGDT^GMTSU S LASTMDT=X
 . S ONSETDT=$P(GMNODE,U,6),PROV=$P(GMNODE,U,7)
 . S RESDT=$P(GMNODE,U,10),GMICD=""
 . I STAT="A",+ONSETDT S X=ONSETDT D REGDT^GMTSU S ADDINFO="Onset "_X
 . I STAT="I",+RESDT S X=RESDT D REGDT^GMTSU S ADDINFO="Resolved "_X
 . S:$G(GMPXNARR)'="N" NARR=$G(^TMP("GMPLHS",$J,GMREC,"N"))
 . I $G(GMPXICDF)]"",$G(GMPXICDF)'="N",DIAG]"" D GETICDDX^GMTSPXU1(.DIAG,$G(GMPXICDF)) S GMICD=DIAG
 . ;I $G(NARR)]"" S NARR=NARR_$S($G(ADDINFO)]"":", "_ADDINFO,1:"")
 . I $G(NARR)]"" S NARR=GMREC_". "_NARR_$S($G(ADDINFO)]"":", "_ADDINFO,1:"")
 . E  S NARR=$G(ADDINFO)
 . D TXTFMT^GMTSPXU1(GMICD,$G(NARR),GMTSICL,GMTAB,DIWL)
 . I '$D(^UTILITY($J,"W")) Q
 . S GMTSX=0,LINE1=1
 . F  S GMTSX=$O(^UTILITY($J,"W",DIWL,GMTSX)) Q:GMTSX'>0!$D(GMTSQIT)  D
 . . ;D CKP^GMTSUP Q:$D(GMTSQIT)  I GMTSNPG D SUBHDR2
 . . S LINE=LINE+1
 . . ;I LINE1 W:STATUS="ALL" STAT W ?3,$G(^UTILITY($J,"W",DIWL,GMTSX,0)),?55,LASTMDT,?65,$E(PROV,1,15),!
 . . ;I LINE1 S @TARGET@(LINE,0)=$G(^UTILITY($J,"W",DIWL,GMTSX,0))
 . . I LINE1 S ARHSTR=$G(^UTILITY($J,"W",DIWL,GMTSX,0)),ARHSTR=$$SETSTR^VALM1(LASTMDT_"  "_$E(PROV,1,15),ARHSTR,55,25) S @TARGET@(LINE,0)=ARHSTR
 . . ;E  W ?3,$G(^UTILITY($J,"W",DIWL,GMTSX,0)),!
 . . E  S @TARGET@(LINE,0)=$G(^UTILITY($J,"W",DIWL,GMTSX,0))
 . . S LINE1=0
 . D DSPCOMM
 . S @TARGET@(0)="^^"_LINE_U_LINE_U_DT_"^^"
 . ;W !
 Q
DSPCOMM ;Comments are displayed if there are any
 N LOC,GMR,NODE,DATE,X
 S LOC=""
 F  S LOC=$O(^TMP("GMPLHS",$J,GMREC,"C",LOC)) Q:LOC']""  D  Q:$D(GMTSQIT)
 . S GMR=0
 . F  S GMR=$O(^TMP("GMPLHS",$J,GMREC,"C",LOC,GMR)) Q:GMR'>0  D  Q:$D(GMTSQIT)
 . . S NODE=$G(^TMP("GMPLHS",$J,GMREC,"C",LOC,GMR,0))
 . . Q:NODE']""
 . . ;D CKP^GMTSUP Q:$D(GMTSQIT)  I GMTSNPG D SUBHDR2
 . . ;W ?5,$P(NODE,U),?68,!
 . . S LINE=LINE+1,@TARGET@(LINE,0)="     "_$P(NODE,U)
 Q