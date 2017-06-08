IBCNESI2 ;ALB/TAZ - MEDICARE PATIENTS WITH SUBSEQUENT INSURANCE ;15 Jan 13
 ;;2.0;INTEGRATED BILLING;**497**;21-MAR-94;Build 122
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 Q  ;Only enter at labels.
 ;
EN(IBRIEN) ; Main Entry Point
 N IBRVST,IBRVIEN
 D EN^VALM("IBCNE MEDICARE COB DISPLAY")
ENQ ;Exit
 S VALMBCK="R"
 Q
 ;
INIT ; Initialize Variables
 S IBRVST="Not Reviewed."
 S IBRVIEN=$$GETREV(IBRIEN)
 D BLD
 Q
 ;
GETREV(IBRIEN) ;Set Review IEN if not already defined.
 N IEN,MSGID
 S IEN=$G(^TMP($J,"IBCNESI2",IBRIEN,"REV IEN"))
 I 'IEN D
 . S MSGID=$$GET1^DIQ(365,IBRIEN_",",.01)
 . S DIC=365.2,DIC(0)="L",DLAYGO=365.2,X=MSGID
 . ; Set Response IEN into .01 field and Not Reviewed in .02 field
 . S DIC("DR")=".01///"_MSGID_";.02///0"
 . D ^DIC
 . S IEN=+Y I IEN>0 S ^TMP($J,"IBCNESI2",IBRIEN,"REV IEN")=IEN
 Q IEN
 ;
BLD ; Build Screen
 N IBLN,IBSTR,IBSTR1,LINEVAR,DIWF,DIWL,DIWR,IBCMDT,IBCMIEN,IBCNT,IBEIEN,IBSEQ,IBURTE,IENS
 K @VALMAR
 S (VALMCNT,IBEIEN)=0
 F  S IBEIEN=$O(^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN)) Q:'IBEIEN  D
 . S IBSTR="",IBSTR=$$SETSTR^VALM1(^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN,"ENT ID CD"),IBSTR,2,4)
 . S IBSTR=$$SETSTR^VALM1($G(^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN,"EMFLAG")),IBSTR,7,7)
 . K IBSTR1 S IBSTR1=$G(^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN,"NAME")) D WRAP(.IBSTR1,70)
 . F IBCNT=1:1:$O(IBSTR1(""),-1) S IBSTR=$$SETSTR^VALM1(IBSTR1(IBCNT),IBSTR,8,78) D SET(IBSTR)
 . S IBSTR=""
 . K IBSTR1 S IBSTR1=$G(^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN,"ID QUAL")) I $L(IBSTR1) S IBSTR1=IBSTR1_": "
 . S IBSTR1=IBSTR1_$G(^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN,"ID")) D WRAP(.IBSTR1,70)
 . F IBCNT=1:1:$O(IBSTR1(""),-1) S IBSTR=$$SETSTR^VALM1(IBSTR1(IBCNT),IBSTR,8,78) D SET(IBSTR)
 . S IBSTR1=$G(^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN,"ADDRESS 1")) I IBSTR1'="" S IBSTR=$$SETSTR^VALM1(IBSTR1,IBSTR,8,78) D SET(IBSTR)
 . S IBSTR1=$G(^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN,"ADDRESS 2")) I IBSTR1'="" S IBSTR=$$SETSTR^VALM1(IBSTR1,IBSTR,8,78) D SET(IBSTR)
 . S IBSTR=$G(^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN,"CITY")) I $L(IBSTR) S IBSTR1=IBSTR_", "
 . S IBSTR=$G(^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN,"STATE")) I $L(IBSTR) S IBSTR1=IBSTR1_IBSTR_" "
 . S IBSTR=$G(^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN,"ZIP")) I $L(IBSTR) S IBSTR1=IBSTR1_IBSTR,IBSTR=""
 . S IBSTR=$$SETSTR^VALM1(IBSTR1,IBSTR,8,78) D SET(IBSTR)
 . F IBURTE="TE","UR" D
 .. S IBSEQ=0
 .. S IBSEQ=$O(^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN,IBURTE,IBSEQ)) Q:'IBSEQ  D
 ... K ^UTILITY($J,"W")
 ... K IBSTR1 S IBSTR1=$S(IBURTE="TE":"Phone: ",1:"Website: ")_^TMP($J,"IBCNESI2",IBRIEN,"INS",IBEIEN,IBURTE,IBSEQ) D WRAP(.IBSTR1,70)
 ... F IBCNT=1:1:$O(IBSTR1(""),-1) S IBSTR=$$SETSTR^VALM1(IBSTR1(IBCNT),IBSTR,8,78) D SET(IBSTR)
 . S IBSTR=" " D SET(IBSTR)
 S IBSTR=$$SETSTR^VALM1("Comments:",IBSTR,8,78) D SET(IBSTR)
 S IBSTR=" " D SET(IBSTR)
 I '$D(^IBCN(365.2,IBRVIEN,1)) S IBSTR=$$SETSTR^VALM1("No Comments Entered.",IBSTR,8,78) D SET(IBSTR)
 S (IBCNT,IBSEQ)=0
 S IBCMDT=""
 F  S IBCMDT=$O(^IBCN(365.2,IBRVIEN,1,"B",IBCMDT),-1) Q:'IBCMDT  D
 . N IBX
 . S IBCMIEN=$O(^IBCN(365.2,IBRVIEN,1,"B",IBCMDT,"")) I IBCMIEN="" Q
 . S IENS=IBCMIEN_","_IBRVIEN_",",IBSTR=""
 . S IBSTR=$$SETSTR^VALM1($$FMTE^XLFDT($$GET1^DIQ(365.21,IENS,.01),"5Z"),IBSTR,8,38)
 . S IBSTR=$$SETSTR^VALM1("Entered by: "_$$GET1^DIQ(365.21,IENS,.02),IBSTR,40,38)
 . D SET(IBSTR)
 . K ^UTILITY($J,"W")
 . F IBLN=1:1:$P($G(^IBCN(365.2,IBRVIEN,1,IBCMIEN,1,0)),U,3) D
 .. S X=$G(^IBCN(365.2,IBRVIEN,1,IBCMIEN,1,IBLN,0)) S DIWL=1,DIWR=70,DIWF="" D ^DIWP
 . I $D(^UTILITY($J,"W")) S IBLN=0 F  S IBLN=$O(^UTILITY($J,"W",1,IBLN)) Q:'IBLN  D
 .. S IBSTR="",IBSTR=$$SETSTR^VALM1($G(^UTILITY($J,"W",1,IBLN,0)),IBSTR,8,78)
 .. D SET(IBSTR)
 . I $O(^IBCN(365.2,IBRVIEN,1,"B",IBCMDT),-1)'="" D SET(" ")
 Q
 ;
SET(IBX) ; Set up Build Array
 S VALMCNT=VALMCNT+1
 D SET^VALM10(VALMCNT,IBX)
 Q
 ;
WRAP(STR,LEN) ; Wrap Lines
 N PCE,CNT,DATA
 S CNT=1,STR(CNT)=""
 F PCE=1:1:$L(STR," ") D
 . S DATA=$P(STR," ",PCE)
 . I $L(DATA)>LEN F  D  I $L(DATA)<LEN Q
 .. S STR(CNT)=STR(CNT)_$S($L(STR(CNT)):" ",1:"")_$E(DATA,1,LEN),CNT=CNT+1,STR(CNT)="",DATA=" "_$E(DATA,LEN+1,$L(DATA))
 . I $L(STR(CNT))+$S($L(STR(CNT)):1,1:0)+$L(DATA)>LEN S CNT=CNT+1,STR(CNT)=""
 . S STR(CNT)=STR(CNT)_$S($L(STR(CNT)):" ",1:"")_$E(DATA,1,LEN)
 Q
 ;
HDR ; -- header code
 N IBPNAM,IBRVST
 S IBRVST=$$GET1^DIQ(365.2,IBRVIEN_",",.02) I 
 S IBPNAM=$G(^TMP($J,"IBCNESI2",IBRIEN,"PATIENT NAME"))
 S (VALMHDR(1),VALMHDR(2))=""
 S VALMHDR(2)=$$SETSTR^VALM1("Patient: "_IBPNAM,VALMHDR(2),1,(75-$L(IBRVST)))
 S VALMHDR(2)=$$SETSTR^VALM1(IBRVST,VALMHDR(2),(78-$L(IBRVST)),80)
 S VALM("TITLE")="Medicare Potential COB List",VALMSG="*Exact Match"
 Q
 ;
HELP ; -- help code
 D FULL^VALM1
 S VALMBCK="R"
 W @IOF
 W !,"The CODE, if populated, indicates if the insurance is primary, secondary",!,"or tertiary."
 D PAUSE^VALM1
 Q
 ;
EXIT ; -- exit code
 K ^TMP("IBCNCE",$J)
 D CLEAN^VALM10
 Q
 ;
EXPND ; -- expand code
 Q
 ;
CMNT ; Enter Comments
 N DA,DD,DIC,DIK,DLAYGO,X,Y
 W !
 ; make sure this entry is not locked already
 L +^IBCN(365.2,IBRVIEN):3 I '$T W !,*7,"Sorry, another user currently editing this entry." D PAUSE^VALM1 G CMNTQ
 S DA(1)=IBRVIEN
 K DO S DIC="^IBCN(365.2,"_DA(1)_",1,",DIC(0)="L",DIC("DR")="1",X=$$NOW^XLFDT,DLAYGO=365.21
 D FILE^DICN
 S DA=+Y I DA>0 D
 . ;Make sure a comment or followup date was created.  Otherwise delete the entry.
 . I '$D(^IBCN(365.2,DA(1),1,DA,1)) S DIK=DIC D ^DIK Q
 . ;There is a comment or follow up date so ask status prompt
 . K DIC
 . D STATUS1
 L -^IBCN(365.2,IBRVIEN)
CMNTQ ;
 S VALMBCK="R"
 D BLD
 Q
 ;
STATUS ; change review status
 L +^IBCN(365.2,IBRVIEN):3 I '$T W !,*7,"Sorry, another user currently editing this entry." D PAUSE^VALM1 G STATUSX
 D STATUS1
STATUSX ;
 ;update list manager display
 L -^IBCN(365.2,IBRVIEN)
 D HDR,BLD
 S VALMBCK="R"
 Q
 ;
STATUS1 ; Entry point from comments section
 N IBSTAT,IBTEXT,DR,DTOUT,DUOUT,DTSS,DFNSS
 ; make sure this entry is not locked already
 ; Prompt for status change
 W !
 S DIR(0)="365.2,.02",DIR("B")="In Process"
 D ^DIR K DIR
 I $D(DTOUT)!$D(DUOUT) G STATUS1X
 M IBSTAT=Y
 I IBSTAT=2 D
 . W !
 . S DIR(0)="Y",DIR("A")="Marking the review complete will remove the entry from the list. Are you sure?",DIR("B")="NO"
 . D ^DIR K DIR
 . I $D(DTOUT)!$D(DUOUT)!'Y S IBSTAT="" Q
 . ; Enter comment for removal from worklist
 . S IBTEXT(1)="Review completed and entry removed from worklist."
 . S DA(1)=IBRVIEN
 . K DO S DIC="^IBCN(365.2,"_DA(1)_",1,",DIC(0)="",X=$$NOW^XLFDT,DLAYGO=365.21
 . D FILE^DICN
 . S DA=+Y I DA'>0 Q
 . D WP^DIE(365.21,DA_","_DA(1)_",",1,,"IBTEXT")
 . K DIC
 I IBSTAT'="" S DIE=365.2,DA=IBRVIEN,DR=".02///"_IBSTAT(0) D ^DIE,CLEAN^DILF S IBRVST=IBSTAT(0) K DIE
 ; need to update the REV STATUS node of the temporary global array
 S DTSS=$P(^TMP($J,"IBCNESI2",IBRIEN,"REV STATUS"),U,2),DFNSS=$P(^TMP($J,"IBCNESI2",IBRIEN,"REV STATUS"),U,3)
 S $P(^TMP($J,"IBCNESI1",DTSS,DFNSS,IBRIEN,"REV STATUS"),U)=IBSTAT  ; update with internal representation of review status
STATUS1X ;
 Q
 ;