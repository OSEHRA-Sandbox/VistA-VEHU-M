XQOR1 ; SLC/KCM - Main Unwinding Loop ;08/24/98  12:35
 ;;8.0;KERNEL;**48,56,94**;Jul 10, 1995
LOOP ;From: EN^XQOR
 I "QOLD"[$P(^TMP("XQORS",$J,XQORS,"FLG"),"^"),'$D(^TMP("XQORS",$J,0,"CTXT","ADD")) D ENTRY^XQORO G:$D(XQORQUIT)!$D(XQORPOP)!$D(DIROUT)!$D(DTOUT) EXCT
 D EACH G:$D(XQORQUIT)!$D(XQORPOP)!$D(DIROUT)!$D(DTOUT) EXCT
 ; resource usage monitor
 D:$D(XQXFLG)[0 ABT^XQ12 I $P(XQXFLG,U,2) D
 .I $D(^TMP("XQORS",$J,XQORS,"REF")) N ORX S ORX=$P(@(^("REF")_"0)"),"^") ; D RP^%ZOSVKR($S($D(XQY0):$P(XQY0,U),1:"")_"^"_ORX)
 I $D(@(^TMP("XQORS",$J,XQORS,"REF")_"20)"))'[0 S Y=^(20) I $L(Y) N X X Y S:$D(X)'[0 ^TMP("XQORS",$J,XQORS,"X")=X
 I $D(XQORQUIT)!$D(XQORPOP)!$D(DIROUT)!$D(DTOUT) G EXAT
 I $D(XQORFLG) S:$D(XQORFLG("PS")) $P(^TMP("XQORS",$J,XQORS,"FLG"),"^",2)=+XQORFLG("PS") S:$D(XQORFLG("SH")) $P(^TMP("XQORS",$J,XQORS,"FLG"),"^",5)=+XQORFLG("SH") K XQORFLG
REDO D @$S("QM"[$P(^TMP("XQORS",$J,XQORS,"FLG"),"^"):"MENU^XQOR3","DOX"[$P(^TMP("XQORS",$J,XQORS,"FLG"),"^"):"ACT^XQOR2","T"[$P(^TMP("XQORS",$J,XQORS,"FLG"),"^"):"EN^XQORD",1:"NUL^XQOR2")
 G:'^TMP("XQORS",$J,XQORS,"ITM") EXAT S ^TMP("XQORS",$J,XQORS,"TOT")=^TMP("XQORS",$J,XQORS,"ITM"),^TMP("XQORS",$J,XQORS,"ITM")=0
STAK S ^TMP("XQORS",$J,XQORS,"ITM")=^TMP("XQORS",$J,XQORS,"ITM")+1 G:^TMP("XQORS",$J,XQORS,"ITM")>^TMP("XQORS",$J,XQORS,"TOT") EXST
 I '^TMP("XQORS",$J,XQORS,"ITM",^TMP("XQORS",$J,XQORS,"ITM")) S $P(^TMP("XQORS",$J,XQORS,"FLG"),"^",4)=1 D DJMP^XQOR4 K XQORPOP,XQORQUIT G NXT
 I $D(^TMP("XQORS",$J,XQORS,"ITM",^TMP("XQORS",$J,XQORS,"ITM"),"MA")) S X=^TMP("XQORS",$J,XQORS,"ITM",^TMP("XQORS",$J,XQORS,"ITM"),"MA") D EN^XQOR G:$D(XQORQUIT)!$D(XQORPOP)!$D(DIROUT)!$D(DTOUT) NXT
 S X=^TMP("XQORS",$J,XQORS,"ITM",^TMP("XQORS",$J,XQORS,"ITM")) D EN^XQOR
NXT K XQORQUIT I '$D(XQORPOP),'$D(DIROUT),'$D(DTOUT) G STAK
EXST S ^TMP("XQORS",$J,0,"FILE")=";"_$P(^TMP("XQORS",$J,XQORS,"VPT"),";",2) S:$D(^TMP("XQORS",$J,XQORS,"INP")) $P(^TMP("XQORS",$J,XQORS,"INP"),"^",4)="" K XQORPOP
 S XQORNOD=^TMP("XQORS",$J,XQORS,"VPT"),XQORNOD(0)=^TMP("XQORS",$J,XQORS,"INP")
 I $P(^TMP("XQORS",$J,XQORS,"FLG"),"^",2)!$P(^TMP("XQORS",$J,XQORS,"FLG"),"^",4) S $P(^TMP("XQORS",$J,XQORS,"FLG"),"^",4)=""
 I  I '$D(DIROUT),'$D(DTOUT) D EACH I '$D(XQORQUIT),'$D(XQORPOP),'$D(DIROUT),'$D(DTOUT) K ^TMP("XQORS",$J,XQORS,"ITM") G REDO
EXAT I $P(^TMP("XQORS",$J,XQORS,"FLG"),"^",6) G EX^XQOR
 I $D(@(^TMP("XQORS",$J,XQORS,"REF")_"15)"))'[0 S X=^(15) I $L(X) D  X X
 .; resource usage monitor
 .D:$D(XQXFLG)[0 ABT^XQ12
 .I $P(XQXFLG,U,2) I $D(^TMP("XQORS",$J,XQORS,"REF")) N ORX S ORX=$P(@(^("REF")_"0)"),"^") D RP^%ZOSVKR($S($D(XQY0):$P(XQY0,U),1:"")_"^"_ORX)
EXCT I $D(^TMP("XQORS",$J,XQORS,"CTX","AD")) D EXIT^XQORO
 G EX^XQOR
EACH I $P(^TMP("XQORS",$J,XQORS,"FLG"),"^",3),"AXLOD"[$P(^TMP("XQORS",$J,XQORS,"FLG"),"^") D SHDR^XQOR4
 D:$D(OROLD) RSTR^XQORO ;OE/RR Context
 I $D(XQORHSTK),$D(^TMP("XQORHSTK",$J,XQORHSTK)) K XQORMSG M XQORMSG=^TMP("XQORHSTK",$J,XQORHSTK)
 I "QOLD"[$P(^TMP("XQORS",$J,XQORS,"FLG"),"^"),$D(^TMP("XQORS",$J,0,"CTXT","ADD")) D EVERY^XQORO
 Q
