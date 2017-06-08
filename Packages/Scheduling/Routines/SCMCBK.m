SCMCBK ;ALB/SCK - Broker Utilities for multiple patient assignments; 4/8/96 ; 11/30/11 4:23pm
 ;;5.3;Scheduling;**41,51,148,157,177,205,564**;AUG 13, 1993;Build 9
 ;
 Q
 ;
PTCLBLD(SCOK,SC) ; Build patient list for a selected clinic
 ;  'SC BLD PAT CLN LIST'
 ;
 D NEWVAR^SCMCBK1
 D CHK^SCUTBK
 D TMP^SCUTBK
 ;
 D PARSE^SCMCBK1(.SC)
 ;
 I SCPOS'="" S SCOK=$$PTCLBRTP^SCAPMC26(.SCCLN,.SCPOS,"SCDTRNG")
 E  S SCOK=$$PTCLBR^SCAPMC26(.SCCLN,.SCTEAM,"SCDTRNG")
 K ^TMP("SCMC",$J,"EXCLUDE PT")
 G:SCOK=0 PTCLNQ
 ;
 M ^TMP($J,"SC PCMM IN")=^TMP(SCOK,"SCCLPT")
 K ^TMP(SCOK,"SCCLPT")
 ;
 D ALPHA^SCAPMCU2("^TMP($J,""SC PCMM IN"")","^TMP($J,""SCCLPT"")")
 ;
 S SCOK=$J_U_^TMP($J,"SC PCMM IN",0)
 ;
PTCLNQ D CLRVAR^SCMCBK1
 Q
 ;
PTSCBLD(SCOK,SC) ; Build patient list for selected stop code
 ;  'SC BLD PAT SCDE LIST'
 ;
 D NEWVAR^SCMCBK1
 ;
 D CHK^SCUTBK
 D TMP^SCUTBK
 ;
 D PARSE^SCMCBK1(.SC)
 ;
 K ^TMP($J,"SCSCDE")
 ;
 ;  Build exclude list
 S BLOCK=$S(SCPOS'="":"BLKPOS",1:"BLKTM")
 S SCBLOCK=$S(SCPOS'="":SCPOS,1:SCTEAM)
 D @BLOCK
 ;
 IF 'SCOK1 S SCOK="0^0^0^0" G PTSCQ
 ;
 S SCOK=0
 S SCOK=$$PTST^SCAPMC27(SCSCDE,"SCDTRNG",SCNUM,.SCLOC,"SCERMSG",SCMORE)
 K ^TMP("SCMC",$J,"EXCLUDE PT")
 ;
 M ^TMP($J,"SC PCMM IN")=@SCLOC
 S I1=$G(^TMP($J,"SC PCMM IN",0))
 F I=1:1:I1 S ^TMP($J,"PCMM TMP",I)=$G(^TMP($J,"SC PCMM IN",I))
 ;
 D ALPHA^SCAPMCU2("^TMP($J,""PCMM TMP"")","^TMP($J,""SCSCDE"")")
 S SCOK=$J_U_+I1_U_SCOK
 ;
PTSCQ D CLRVAR^SCMCBK1
 Q
 ;
PTTMBLD(SCOK,SC) ; Build a list of patients for a selected team and return the $J of the TMP globall
 ;  where the list is stored.
 ;  ' SC BLD PAT TM LIST ' 
 ;
 D NEWVAR^SCMCBK1
 D CHK^SCUTBK
 D TMP^SCUTBK
 ;
 D PARSE^SCMCBK1(.SC)
 K ^TMP($J,"SCTEAM")
 ;
 ;   Build exclude list
 S SCOK=0
 S BLOCK=$S(SCPOS'="":"BLKPOS",1:"BLKTM")
 S SCBLOCK=$S(SCPOS'="":SCPOS,1:SCTEAM)
 D @BLOCK
 ;
 S SCOK=$$PTTM^SCAPMC2(SCFRMTM,"SCDTRNG",.SCLOC,"SCERMSG")
 K ^TMP("SCMC",$J,"EXCLUDE PT")
 M ^TMP($J,"SC PCMM IN")=@SCLOC
 ;
 S I="" F  S I=$O(^TMP($J,"SC PCMM IN",I)) Q:'I  D
 . S ^TMP($J,"PCMM TMP",I)=^TMP($J,"SC PCMM IN",I)
 ;
 D ALPHA^SCAPMCU2("^TMP($J,""PCMM TMP"")","^TMP($J,""SCTEAM"")")
 S I1="" F  S I1=$O(^TMP($J,"SCTEAM",I1)) Q:'I1  S I=I1
 ;
 S SCOK=$J_U_+I_U_SCOK
 ;
 D CLRVAR^SCMCBK1
 Q
 ;
PTPSBLD(SCOK,SC) ;
 ;  ' SC BLD PAT POS LIST '
 ;
 D NEWVAR^SCMCBK1
 D CHK^SCUTBK
 D TMP^SCUTBK
 ;
 D PARSE^SCMCBK1(.SC)
 ;
 K ^TMP($J,"SCPOS")
 ;
 ;   Build exclude list
 S BLOCK=$S(SCPOS'="":"BLKPOS",1:"BLKTM")
 S SCBLOCK=$S(SCPOS'="":SCPOS,1:SCTEAM)
 D @BLOCK
 ;
 S SCOK=0
 ;
 S SCOK=$$PTTP^SCAPMC11(SCFRMPOS,"SCDTRNG",.SCLOC,.SCERMSG)
 K ^TMP("SCMC",$J,"EXCLUDE PT")
 M ^TMP($J,"SC PCMM IN")=@SCLOC
 ;
 S I1=$G(^TMP($J,"SC PCMM IN",0))
 F I=1:1:I1 S ^TMP($J,"PCMM TMP",I)=$G(^TMP($J,"SC PCMM IN",I))
 D ALPHA^SCAPMCU2("^TMP($J,""PCMM TMP"")","^TMP($J,""SCPOS"")")
 S SCOK=$J_U_+I1_U_SCOK
 ;
 ;IF '+$G(^TMP($J,"SCPOS",0)) D  S SCOK=$J_U_SCOK
 ;. S I="" F  S I=$O(^TMP($J,"SCPOS",I)) Q:'I  S SCOK=I
 ;
 D CLRVAR^SCMCBK1
 Q
 ;
PTAPBLD(SCOK,SC) ;  Build patient list for selected appointment range.
 ;     '  SC BLD PAT APT LIST '
 ;
 ;SD/564-this build includes modification as follows:
 ;- patients already assigned to another PC team then evaluated team SCTEAM are excluded
 ;- patients previously assigned and unassigned to evaluated position are included
 ;
 ;N SCCLN,SCTEAM,SCDTRNG,SCLOC,SCERMSG,SCNUM,SCCOUNT,SCMORE,SCOK1,SCER2,SCOUT,SCBLOCK
 ;
 D NEWVAR^SCMCBK1
 D CHK^SCUTBK
 D TMP^SCUTBK
 ;
 D PARSE^SCMCBK1(.SC)
 ;
 K ^TMP($J,"SCCLN")
 ;
 ;   Build exclude list
 S BLOCK=$S(SCPOS'="":"BLKPOS",1:"BLKTM")
 S SCBLOCK=$S(SCPOS'="":SCPOS,1:SCTEAM)
 D @BLOCK
 ;
 IF 'SCOK1 S SCOK="0^0^0^0" G PTAPQ
 S SCOK=0
 S SCOK=$$PTAP^SCAPMC28(SCCLN,"SCDTRNG",SCNUM,.SCLOC,"SCERMSG",SCMORE)
 ;
 ;identify excluded to be included if unassigned from evaluated position-sd/564
 N SCTMP S SCTMP=$G(^TMP("SC TMP LIST",$J,0))
 N SS S SS=$G(^TMP("SCMC",$J,"EXCLUDE PT",0))
 N SDFN,XX F XX=1:1:SS S SDFN=+$G(^TMP("SCMC",$J,"EXCLUDE PT",XX)) D
 .N SCI S SCI=^TMP("SCMC",$J,"EXCLUDE PT",XX) D
 ..N SCII S SCII=$P(SCI,U,5) I SCII>0&(SCII<(DT+1)) D
 ...;PROCEED ONLY WITH THE CURRENT MONTH ASSIGNMENT
 ...N SCAS S SCAS=$P(SCI,U,4) I SCAS>0 I $E(DT,1,5)'=$E(SCAS,1,5) Q
 ...N SCPOS S SCPOS=$P(SCI,U,3) I SCPOS>0 I $P(^SCPT(404.43,SCPOS,0),U,2)'=$G(SC("POSITION")) Q
 ...N SCN,SCS S SCN=$P(SCI,U,2),SCS=$P(SCI,U,6)
 ...S SCTMP=SCTMP+1
 ...S ^TMP("SC TMP LIST",$J,SCTMP)=SDFN_U_SCN_U_SC("CLINIC")_U_U_SCS
 ...S ^TMP("SC TMP LIST",$J,"SCPTAP",SDFN,SCTMP)=""
 S ^TMP("SC TMP LIST",$J,0)=SCTMP
 ;
 K ^TMP("SCMC",$J,"EXCLUDE PT")
 ;
 ;eliminate patients if assigned to another PC team-SD/564
 N DFN S DFN="" F  S DFN=$O(^TMP("SC TMP LIST",$J,"SCPTAP",DFN)) Q:DFN=""  D
 .N SCEX S SCEX=$$GETPC^SCAPMCU2(DFN) ;call to get patient's PC assignment
 .N NSAS S NSAS=$P(SCEX,U,2) I +SCEX>0!(NSAS>0&(NSAS'=SCTEAM)) D
 ..N SCN S SCN=$O(^TMP("SC TMP LIST",$J,"SCPTAP",DFN,""))
 ..K ^TMP("SC TMP LIST",$J,"SCPTAP",DFN)
 ..K ^TMP("SC TMP LIST",$J,SCN)
 ..S ^TMP("SC TMP LIST",$J,0)=^TMP("SC TMP LIST",$J,0)-1
 ;
 M ^TMP($J,"SC PCMM IN")=@SCLOC
 S I1=$G(^TMP($J,"SC PCMM IN",0))
 ;reindex entries in ^TMP global list - SD/564
 N SCC S SCC=0 F I=1:1:I1 S SCC=$O(^TMP($J,"SC PCMM IN",SCC)) D
 .S ^TMP($J,"PCMM TMP",I)=^TMP($J,"SC PCMM IN",SCC)
 ;
 D ALPHA^SCAPMCU2("^TMP($J,""PCMM TMP"")","^TMP($J,""SCAPP"")")
 S SCOK=$J_U_I1_U_SCOK
 ;
 D CLRVAR^SCMCBK1
PTAPQ Q
 ;
PTGET(SCDATA,SC) ;  Return a block of patients to the client
 ;     'SC GET PAT BLOCK'
 ;
 ;     SCJOB   = $J for the ^TMP global
 ;     SCJOBID = The second subscript id for the ^TMP global
 ;     SCSTART = Beginning entry number for the block retrieval in the ^TMP global
 ;     SCEND   = The ending entry number for the block retrieval
 ;     SCLAST  = The last entry number in the ^TMP global
 ;
 N SCJOB,SCSTART,SCEND,I,SCLAST,SCJOBID
 ;
 D CHK^SCUTBK
 D TMP^SCUTBK
 ;
 D PARSE^SCMCBK1(.SC)
 ;
 F I=SCSTART:1:SCEND Q:'$G(^TMP(SCJOB,SCJOBID,I),0)  D
 . S SCDATA(I)=^TMP(SCJOB,SCJOBID,I)
 I SCEND>SCLAST K ^TMP(SCJOB,SCJOBID)
 ;
 D CLRVAR^SCMCBK1
 Q
 ;
PTLSTBLD(SCOK,SCVAL) ;  Build the list of patients to be assigned in the ^TMP($J,"SC PATIENT LIST",DFN) global
 ;  'SC BLD PAT LIST'
 ;
 N SCJOB,SCDFN
 ;
 D CHK^SCUTBK
 D TMP^SCUTBK
 ;
 S SCOK=0
 I SCVAL["Start" D  G PTBLDQ
 .S SCOK=$J
 .K ^TMP(SCOK,"SC PATIENT LIST")
 ;
 S SCJOB=$P(SCVAL,U,1)
 S SCDFN=$P(SCVAL,U,2)
 S ^TMP(SCJOB,"SC PATIENT LIST",SCDFN)=""
 S SCOK=1
PTBLDQ Q
 ;
PTFILE(SCOK,SC) ;  File the patient assignments in the ^TMP($J,"SC TEAM ASSIGN",SCDFN) global
 ;    'SC FILE PAT TM ASGN'
 ;
 ;205 remove;I XWBAPVER=177 D QUEUED^SCMCBK4(1) Q
 ;205 remove;I $$VPROGMR^SCUTBK3()'=1 Q
 ; pre 177 code follows....
 I XWBAPVER=1 D QUEUED^SCMCBK4(1) Q
 ;
 N SCADDFLD,SCTEAM,SCFILE,SCJOB,SCNEW,SCOLD,SCBAD,SCERMSG,SCX,SCDTVAR
 ;
 D CHK^SCUTBK
 D TMP^SCUTBK
 ;
 D PARSE^SCMCBK1(.SC)
 G:+$G(SCJOB)=0 FILEQ
 ;
 ;
 S SCADDFLD(.08)=$G(SC("TYPE"),99)
 S SCADDFLD(.1)=$G(SC("RESTRICT"),0)
 S SCADDFLD(.11)=DUZ
 S SCADDFLD(.12)=DT
 ;
 S SCX=$$ACPTATM^SCAPMC6("^TMP(SCJOB,""SC PATIENT LIST"")",SCTEAM,"SCADDFLD",SCDTVAR,"SCERMSG","SCNEW","SCOLD","SCBAD")
 D BAD^SCMCBK1(.SCBAD,.SCOLD,.SCOK)
 S SCOK(.1)=SCX
 ;
 K ^TMP(SCJOB,"SC PATIENT LIST")
 ;
 D CLRVAR^SCMCBK1
FILEQ Q
 ;
POSFILE(SCOK,SC) ;  File the patient assignments in the ^TMP($J,"SC PATIENT LIST") global 
 ;   ' SC FILE PAT POS ASGN '
 ;
 ;205 remove;I XWBAPVER=177 D QUEUED^SCMCBK4(2) Q
 ;205 remove;I $$VPROGMR^SCUTBK3()'=1 Q
 ; pre 177 code follows...
 I XWBAPVER=1 D QUEUED^SCMCBK4(2) Q
 ;
 N SCADDFLD,SCTEAM,SCFILE,SCJOB,SCNEW,SCOLD,SCBAD,SCERMSG,SCX,SCPOS,SCDTVAR,SCMAFLD,SCADTM,SCNEW1
 ;
 D CHK^SCUTBK
 D TMP^SCUTBK
 ;
 D PARSE^SCMCBK1(.SC)
 G:+$G(SCJOB)=0 FILEQ
 S SCADTM=1
 ;
 S SCADDFLD(.05)=$G(SC("TYPE"),0)
 S SCADDFLD(.06)=DUZ
 S SCADDFLD(.07)=DT
 ;
 S SCX=$$ACPTATP^SCAPMC21("^TMP(SCJOB,""SC PATIENT LIST"")",SCPOS,"SCADDFLD",SCDTVAR,"SCERMSG",SCADTM,"","SCNEW","SCNEW1","SCOLD","SCBAD")
 ;
 D BAD2^SCMCBK1(.SCBAD,.SCOLD,.SCOK)
 S SCOK(.1)=SCX
 K ^TMP(SCJOB,"SC PATIENT LIST")
 ;
 D CLRVAR^SCMCBK1
 Q
 ;
BLKPOS ;
 N SCX
 S SCX=$G(SCDTRNG("END"))
 S SCDTRNG("END")=3990101 ;check forever
 S SCOK1=$$PTTP^SCAPMC(SCBLOCK,"SCDTRNG","^TMP(""SCMC"",$J,""EXCLUDE PT"")","SCER2")
 S SCDTRNG("END")=SCX
 Q
 ;
BLKTM ;
 N SCX
 S SCX=$G(SCDTRNG("END"))
 S SCDTRNG("END")=3990101 ;check forever
 S SCOK1=$$PTTM^SCAPMC(SCBLOCK,"SCDTRNG","^TMP(""SCMC"",$J,""EXCLUDE PT"")","SCER2")
 S SCDTRNG("END")=SCX
 Q
 ;