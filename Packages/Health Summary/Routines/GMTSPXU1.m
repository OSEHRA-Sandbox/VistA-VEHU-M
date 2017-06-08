GMTSPXU1 ; SLC/SBW,TC - PCE Utilities sub-routines ;06/25/15  15:51
 ;;2.7;Health Summary;**10,37,71,86,101,111**;Oct 20, 1995;Build 17
 ;
 ; External References
 ;   ICR  5699  $$ICDDATA,ICDDESC^ICDXCODE
 ;   ICR  1995  $$CPT^ICPTCOD
 ;   ICR  5679  $$IMPDATE^LEXU
 ;   ICR 10026  ^DIR
 ;   ICR 10011  ^DIWP
 ;
GETICDDX(GMTSICD,GMTSICF,GMMOD,GMTSDATE,GMTSCSYS) ; Entry point to get ICD data
 N REC,CODE,NAME,DESC,ICDX,ICDI,GMTSICDA
 S GMTSICD=$G(GMTSICD),GMTSICF=$G(GMTSICF),GMMOD=$G(GMMOD),GMTSDATE=$G(GMTSDATE,DT),GMTSCSYS=$G(GMTSCSYS)
 S ICDX=$$ICDDATA^ICDXCODE(GMTSCSYS,+GMTSICD,GMTSDATE,"I")
 S REC(80,GMTSICD,.01,"E")=$P(ICDX,"^",2)
 S REC(80,GMTSICD,.01,"I")=$P(ICDX,"^",2)
 S REC(80,GMTSICD,3,"E")=$P(ICDX,"^",4)
 S REC(80,GMTSICD,3,"I")=$P(ICDX,"^",4)
 S ICDI=$$ICDDESC^ICDXCODE(GMTSCSYS,$P(ICDX,"^",2),GMTSDATE,.GMTSICDA)
 S REC(80,GMTSICD,10,"E")=$G(GMTSICDA(1))
 S REC(80,GMTSICD,10,"I")=$G(GMTSICDA(1))
 S CODE=REC(80,GMTSICD,.01,"I")
 S NAME=REC(80,GMTSICD,3,"E")
 S DESC=REC(80,GMTSICD,10,"E")
 S:GMTSICF="L"!(GMTSICF["LONG TEXT")!(GMTSICF="") GMTSICD=CODE_"-"_DESC
 S:GMTSICF="S"!(GMTSICF["SHORT TEXT") GMTSICD=CODE_"-"_NAME
 S:GMTSICF="C"!(GMTSICF["CODE ONLY") GMTSICD=CODE
 S:GMTSICF="T"!(GMTSICF["TEXT ONLY") GMTSICD=DESC
 I $G(GMMOD)]"" S GMMOD=$P(GMMOD,","),GMTSICD=GMMOD_" "_GMTSICD
 S:GMTSICF="N"!(GMTSICF["NONE") GMTSICD=""
 Q
 ;
GETICDOP(GMTSICD,GMTSICF,GMMOD,GMTSDATE,GMTSSHCS) ; Entry point to get ICD data
 S GMTSICD=$G(GMTSICD),GMTSICF=$G(GMTSICF),GMMOD=$G(GMMOD),GMTSDATE=$G(GMTSDATE,DT),GMTSSHCS=$G(GMTSSHCS,0)
 N REC,CODE,NAME,DESC,ICDX,ICDI,GMTSICDA
 S ICDX=$$ICDDATA^ICDXCODE("PROC",+GMTSICD,GMTSDATE)
 S REC(80.1,GMTSICD,.01,"E")=$P(ICDX,"^",2)
 S REC(80.1,GMTSICD,.01,"I")=$P(ICDX,"^",2)
 S REC(80.1,GMTSICD,4,"E")=$P(ICDX,"^",5)
 S REC(80.1,GMTSICD,4,"I")=$P(ICDX,"^",5)
 S ICDI=$$ICDDESC^ICDXCODE("PROC",$P(ICDX,"^",2),GMTSDATE,.GMTSICDA)
 S REC(80.1,GMTSICD,10,"E")=$G(GMTSICDA(1))
 S REC(80.1,GMTSICD,10,"I")=$G(GMTSICDA(1))
 S CODE=REC(80.1,GMTSICD,.01,"I")
 S NAME=REC(80.1,GMTSICD,4,"E")
 S DESC=REC(80.1,GMTSICD,10,"E")
 I GMTSSHCS S CODE=CODE_"("_$$GETICDCD(GMTSDATE,"PROC")_")"
 S:GMTSICF="L"!(GMTSICF="") GMTSICD=CODE_"-"_DESC
 S:GMTSICF="S" GMTSICD=CODE_"-"_NAME
 S:GMTSICF="C" GMTSICD=CODE
 S:GMTSICF="T" GMTSICD=DESC
 S:GMTSICF="N" GMTSICD=""
 Q
 ;
GETCPT(GMTSCPT) ; Entry point to get CPT data
 N ICPT S GMTSCPT=+($G(GMTSCPT)) Q:GMTSCPT=0 ""
 S ICPT=$$CPT^ICPTCOD(+GMTSCPT),ICPT=$P(ICPT,"^",2)_"-"_$P(ICPT,"^",3)
 Q ICPT
 ;
TXTFMT(GMTSICD,GMTSNARR,GMICL,GMTAB,DIWL,GMTSQTY,GMTSPRIM) ; Formats GMTSICD & GMTSNARR together
 I GMTSICD="",GMTSNARR="" Q
 N DIWR,DIWF,X
 S DIWR=80-(GMICL+GMTAB)
 K ^UTILITY($J,"W")
 I $G(GMTSICD)]"" S X=GMTSICD S:$G(GMTSNARR)]"" X=X_"; "
 I $G(GMTSNARR)]"" S X=$G(X)_GMTSNARR D
 . I $G(GMTSPRIM)]"" S X=X_GMTSPRIM
 . I $G(GMTSQTY)]"" S X=X_GMTSQTY
 . D ^DIWP
 I $G(GMTSNARR)']"" D
 . I $G(GMTSQTY)]"" S X=$G(X)_GMTSQTY
 . I $G(GMTSPRIM)]"" S X=X_GMTSPRIM
 . D ^DIWP
 Q
 ;
ORDERPRO(GMPROV,GMLEN) ; Re-order and format providers for visit
 N GMCNT,GMTSP,GMNODE,GMP
 S GMCNT=0
 F GMP="P","S","Z" S GMTSP="" F  S GMTSP=$O(^TMP("PXHSV",$J,GMTSIVD,GMTSVDF,"P",GMP,GMTSP)) Q:GMTSP'>0  D
 . S GMNODE=^TMP("PXHSV",$J,GMTSIVD,GMTSVDF,"P",GMP,GMTSP)
 . Q:GMNODE']""
 . S GMCNT=GMCNT+1
 . S GMPROV(GMCNT)=$E($P(GMNODE,U),1,GMLEN-4)_$S(GMP="P"!(GMP="S"):" ("_GMP_")",1:"")
 Q
 ;
 ; The following code segments are called from "ROUTINE" type
 ; Menu Options to display items in a file
 ;
LM ;   Entry Point - for GMTS Measurement Panel
 S GMTSLST="^GMT(142.7," G DSPLST
 ;
DSPLST ;   Common code for Health Summary MNX Lists
 K DIR
 I '$D(@(GMTSLST_"""B"")")) W !,"NO ",$P(@(GMTSLST_"0)"),U),"S DEFINED.",! Q
 W @IOF,!!,"Existing ",$P(@(GMTSLST_"0)"),U),"S:",! S GMTSCNT=""
CONT ;   Continue
 F  S GMTSCNT=$O(@(GMTSLST_"""B"",GMTSCNT)")) Q:GMTSCNT=""  D  G:1'[$G(Y)&($L($G(Y))) QUIT
 . N DIR K Y W !,?5,GMTSCNT I (IOSL-3)<$Y S DIR(0)="E" D
 . . D ^DIR W @IOF
 K DIR S DIR(0)="E" D ^DIR W !
QUIT ;   Quit
 K DIR,X,Y,GMTSLST,GMTSCNT
 Q
GETICDCD(DATE,TYPE) ;
 ; TYPE is either "PROC" or "DIAG"
 ; DATE is the date you want to check the coding system for
 N RET,OUT
 I TYPE="DIAG" S TYPE="10D"
 I TYPE="PROC" S TYPE="10P"
 S RET="ICD-"
 S OUT=10
 I DATE<$$IMPDATE^LEXU(TYPE) S OUT=9
 I TYPE="10P"&(OUT=9) S OUT=OUT_" Proc"
 I TYPE="10P"&(OUT=10) S OUT=OUT_"-PCS"
 S RET=RET_OUT
 Q RET
 ;
CODESYS(GMTSCODA,GMTSFILE) ; create coding system and label based on IEN
 ;input
 ;  GMTSCODA - IEN of code in either file 80 or 80.1
 ;  GMTSFILE - 80 or 80.1, should be able to tell based on context when this API is called
 ;ouput
 ;  GMTSRET - code from 80 or 80.1 ^ coding system label
 ; or -1 ^ error message
 ; check for error condition using $P($G(GMTSRET),U)=-1 vice +$G(GMTSRET)=-1 as urnary operator
 ; can interpret some procedure codes as scientific notation and trigger <MAXNUMBER> error (e.g. "3E1988X").
 N GMTSCSYS,GMTSCODE,GMTSRET
 S GMTSCSYS=$$CSI^ICDEX($G(GMTSFILE),$G(GMTSCODA)) ;Coding system for IEN or NULL
 I $G(GMTSCSYS)="" S GMTSRET="-1^Error determining coding system" Q GMTSRET
 S GMTSCSYS=$$SNAM^ICDEX($G(GMTSCSYS)) ;short versioned description or -1
 I $G(GMTSCSYS)="-1" S GMTSRET="-1^Error determining coding system" Q GMTSRET
 ;
 S GMTSCODE=$$CODEC^ICDEX($G(GMTSFILE),$G(GMTSCODA)) ;Code from an IEN or -1^error message
 I $P($G(GMTSCODE),U)=-1 S GMTSRET="-1^Error: "_$P($G(GMTSCODE),U,2) Q GMTSRET
 S GMTSRET=$G(GMTSCODE)_U_$G(GMTSCSYS)
 Q GMTSRET