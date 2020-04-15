ORCSAVE ;SLC/MKB/JDL-Save ;Mar 06, 2018@10:27
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**7,56,70,73,92,94,116,141,163,187,190,195,243,303,293,280,306,286,269,423,421,382,397**;Dec 17, 1997;Build 22
 ;Per VA Directive 6402, this routine should not be modified.
 ;
 ; DBIA 10103   ^XLFDT
 ;
NEW(ORDIALOG,ORDG,ORPKG,ORCAT,OREVENT,ORDUZ,ORLOG) ; -- New order
 ; Returns ORIFN = [new] order number, if created/saved
 D EN
 Q
 ;
XX ; -- save new/unreleased edited order into Orders file
 ;    Requires: ORDIALOG() = array of dialog values
 ;              ORIFN      = IFN of original order that was edited
 ;
 N OLDIFN S ORIFN=+ORIFN,OLDIFN=0
 I $S($P(^OR(100,ORIFN,3),U,3)=11:0,$P(^(3),U,3)'=10:1,$P(^(8,1,0),U,4)=2:0,1:1) S OLDIFN=ORIFN K ORIFN ; create new order if released or delayed&signed
 D EN Q:'ORIFN  S:'$G(ORDA) ORDA=1
 I $G(OLDIFN) D  ;save links between orders
 . S $P(^OR(100,ORIFN,3),U,5)=OLDIFN,$P(^(3),U,11)=1
 . S $P(^OR(100,OLDIFN,3),U,6)=ORIFN S:$D(^(5)) ^OR(100,ORIFN,5)=^OR(100,OLDIFN,5)
 I $D(^OR(100,+OLDIFN,0)) D
 . Q:'$G(OREVTDF)
 . N OLDEVT,OLDSTS,LSTACT,PATID,NOW,WHEN
 . S (OLDEVT,OLDSTS,LSTACT)=0
 . S NOW=$$NOW^XLFDT
 . S OLDEVT=$P(^OR(100,+OLDIFN,0),U,17),OLDSTS=$P(^OR(100,+OLDIFN,3),U,3)
 . ; Active status = 6 from #100.01
 . I (OLDEVT>0),OLDSTS=6 D
 . . S $P(^OR(100,+ORIFN,0),U,17)=OLDEVT
 . . S $P(^OR(100,+ORIFN,3),U,3)=11
 . . S LSTACT=$P($G(^OR(100,+ORIFN,3)),U,7)
 . . I $D(^OR(100,+ORIFN,8,LSTACT,0)) D
 . . . S $P(^OR(100,+ORIFN,8,LSTACT,0),U,15)=11
 . . . S PATID=$P(^OR(100,+ORIFN,0),U,2)
 . . . S WHEN=$P(^OR(100,+ORIFN,8,LSTACT,0),U)
 . . . S ^OR(100,"AC",PATID,9999999-WHEN,+ORIFN,LSTACT)=""
 Q
 ;
RN ; -- save new/unreleased renewal order into Orders file
 ;    Requires: ORDIALOG() = array of new dialog values
 ;              ORIFN      = IFN of original order that was renewed
 ;
 N OLDIFN S OLDIFN=+ORIFN K ORIFN
 D EN Q:'ORIFN  S:'$G(ORDA) ORDA=1
 S $P(^OR(100,ORIFN,3),U,5)=OLDIFN,$P(^(3),U,11)=2
 S $P(^OR(100,OLDIFN,3),U,6)=ORIFN S:$D(^(5)) ^OR(100,ORIFN,5)=^OR(100,OLDIFN,5)
 Q
 ;
EN ; -- save new/unreleased order in ORDIALOG() into Orders file
 ;    Requires: ORVP, ORNP [and ORL, ORTS, ORAPPT if available]
 ;    If defined: ORCAT,ORPKG,ORDG,ORLOG,ORDUZ,OREVENT,ORDCNTRL,ORSRC
 ;     (else use values from ORDIALOG and current state)
 ;
 N PKG,NOW,NODE,CNT,CDL,I,X,STS,SIGNREQD,LOC,TRSPEC,NATR,CATG,DG,LOG,USR,TYPE,ORK
 Q:'$G(ORVP)  Q:'$G(ORDIALOG)  Q:'$D(^ORD(101.41,+ORDIALOG,0))
 S NOW=$$NOW^XLFDT,SIGNREQD=+$P(^ORD(101.41,+ORDIALOG,0),U,6)
 S CATG=$S($L($G(ORCAT)):ORCAT,1:$S($$INPT^ORCD:"I",1:"O"))
 S PKG=$S($G(ORPKG):ORPKG,1:$P(^ORD(101.41,+ORDIALOG,0),U,7))
 S LOG=$S($G(ORLOG):ORLOG,1:+$E(NOW,1,12)),USR=$S($G(ORDUZ):ORDUZ,1:DUZ)
 I $G(ORIFN),$D(^OR(100,ORIFN,0)) S STS=$P(^(3),U,3) G EN2 ; unrel order
 S DG=$S($G(ORDG):+ORDG,1:$P(^ORD(101.41,+ORDIALOG,0),U,5))
 I $G(OREVENT),"^PSO^RA^"'["^"_$$GET1^DIQ(9.4,+PKG_",",1)_"^",'$G(DGPMT) S LOC="",TRSPEC="" ; p286 added radiology package
 E  S LOC=$G(ORL),TRSPEC=$G(ORTS)
 S TYPE=$S("^B^C^X^P^0^"[(U_$G(ORSRC)_U):ORSRC,$G(ORDCNTRL)="SN":"P",1:0)
 ;S LOG=$S($G(ORLOG):ORLOG,1:+$E(NOW,1,12)),USR=$S($G(ORDUZ):ORDUZ,1:DUZ) moved up before EN2 call
 S NATR=+$O(^ORD(100.02,"C","E",0)) ;assume Elec Entered until changed
 S STS=$S($G(OREVENT):10,1:11),ORIFN=$$NEXTIFN Q:'ORIFN
EN1 S ^OR(100,ORIFN,0)=ORIFN_U_ORVP_U_U_$G(ORNP)_U_+ORDIALOG_";ORD(101.41,^"_USR_U_LOG_U_U_U_LOC_U_DG_U_CATG_U_TRSPEC_U_PKG_U_U_SIGNREQD_U_$G(OREVENT)_U_$G(ORAPPT)
 S ^OR(100,ORIFN,3)=LOG_"^90^"_STS_U_$S($G(ORIT):ORIT_";ORD(101.41,",1:"")_U_$G(ORDIALOG("PREV"))_"^^1^^^^"_TYPE
 S ^OR(100,ORIFN,8,0)="^100.008DA^1^1",^OR(100,ORIFN,8,1,0)=LOG_"^NW^"_$G(ORNP)_U_$S(SIGNREQD:2,1:3)_"^^^^^^^^"_NATR_U_USR_"^1^"_STS,^OR(100,ORIFN,8,"C","NW",1)=""
 S ^OR(100,"AF",LOG,ORIFN,1)=""
 S ^OR(100,"C",+ORDIALOG_";ORD(101.41,",ORIFN)=""  ;patch 423
 S:+$G(ORIT) ^OR(100,"D",+ORIT_";ORD(101.41,",ORIFN)=""  ;patch 423
 S ^OR(100,"ACT",ORVP,9999999-LOG,+DG,ORIFN,1)=""
 ;US10045 - PB - Nov 19, 2015 modification to capture the order create date/time with seconds in HMP(800000 orders multiple to track seconds
 D:$P(ORVP,";",2)="DPT("
 . N RSLT,VALS
 . S VALS(.02)=$$NOW^XLFDT
 . D ADDORDR^HMPOR(.RSLT,.VALS,ORIFN,+ORVP)  ;ORVP is variable pointer
 . Q:RSLT<0  ; sub-file entry not created
 . D COMP^ORMBLDOR(+$G(ORIFN)) ;Nov 12, 2015 - PB - trigger unsolicited sync action when order is saved
 ;
 S:STS'=10 ^OR(100,"AC",ORVP,9999999-LOG,ORIFN,1)=""
 S:SIGNREQD ^OR(100,"AS",ORVP,9999999-LOG,ORIFN,1)=""
 S:$G(OREVENT) ^OR(100,"AEVNT",ORVP,OREVENT,ORIFN)=""
 ;check if OR GTX STUDY REASON is in ORDIALOG and strip out control characters
 N ORRFSID
 S ORRFSID=$O(^ORD(101.41,"B","OR GTX STUDY REASON",""))
 I ORRFSID,$D(ORDIALOG(ORRFSID,1)) D
 .N X,I
 .S X=ORDIALOG(ORRFSID,1)
 .F I=1:1:31 S X=$TR(X,$C(I))
 .S ORDIALOG(ORRFSID,1)=X
EN2 S ORIFN=+ORIFN D RESPONSE ; save responses
 I $P(^OR(100,ORIFN,0),"^",5) D  ;Copy orders PKI fix
 . N OI,ORPKIU
 . S OI=+$O(^OR(100,ORIFN,4.5,"ID","ORDERABLE",0)),OI=+$G(^OR(100,ORIFN,4.5,OI,1)) Q:'OI
 . I PKG'=$O(^DIC(9.4,"B","OUTPATIENT PHARMACY",0)) Q
 . S ORPKIU=0 I $D(^ORD(100.7,"C",DUZ)) S ORPKIU=1
 . D PKI^ORWDPS1(.ORY,OI,CATG,+ORVP,ORPKIU)
 . I $E($G(ORY))=2 S ORDEA=ORY
 K ^OR(100,ORIFN,8,1,.1) D ORDTEXT^ORCSAVE1(ORIFN_";1") ; order text
 S NODE=$G(^OR(100,ORIFN,8,1,0)) D  S ^OR(100,ORIFN,8,1,0)=NODE
 . S $P(NODE,U,3)=$G(ORNP)
 . S $P(NODE,U,13)=USR
 S NODE=$G(^OR(100,ORIFN,0)) D  S ^OR(100,ORIFN,0)=NODE
 . S $P(NODE,U,4)=$G(ORNP)
 . S I=$O(^OR(100,ORIFN,4.5,"ID","LOCATION",0))
 . I I,$P(NODE,U,10) S X=+$G(^OR(100,ORIFN,4.5,+I,1)) S:X $P(NODE,U,10)=X_";SC(" ;reset Loc if prev value
 . S I=$O(^OR(100,ORIFN,4.5,"ID","CLASS",0))
 . I I S X=$G(^OR(100,ORIFN,4.5,+I,1)) S:"^I^O^"[(U_X_U) $P(NODE,U,12)=X
 S $P(^OR(100,ORIFN,3),U)=NOW
 D DELOCC^OROCAPI1(ORIFN,"ACCEPTANCE_CPRS")
 I $G(ORCHECK) D  ; save order checks
 . N ORCROC
 . S (CNT,CDL)=0 F  S CDL=$O(ORCHECK("NEW",CDL)) Q:CDL'>0  S I=0 D
 . . F  S I=$O(ORCHECK("NEW",CDL,I)) Q:I'>0  D
 . . . I $D(ORCHECK("NEW",CDL,I,0)) D
 . . . . N J S J=0,ORCHECK("NEW",CDL,I)=ORCHECK("NEW",CDL,I,J) F  S J=$O(ORCHECK("NEW",CDL,I,J)) Q:'J  S ORCHECK("NEW",CDL,I)=ORCHECK("NEW",CDL,I)_ORCHECK("NEW",CDL,I,J)
 . . . S X=ORCHECK("NEW",CDL,I)
 . . . S ORK(I,1)=+ORIFN_U_"ACCEPTANCE_CPRS"_U_DUZ_U_$$NOW^XLFDT_U_$P(X,U)_U_CDL
 . . . S ORK(I,2,1)=$P(X,U,3)
 . . . I $E(ORK(I,2,1),0,2)="||" D
 . . . . N ORGLOB,ORRULE,ORI,ORLINE
 . . . . S ORGLOB=$P($P(ORK(I,2,1),"||",2),"&"),ORRULE=$P($P(ORK(I,2,1),"||",2),"&",2)
 . . . . S ORCROC(I)=$P($P(ORK(I,2,1),"||",2),"&",3)_U_$P($P(ORK(I,2,1),"||",2),"&",4)
 . . . . S ORK(I,2,1)=ORRULE,ORI=0,ORLINE=2
 . . . . F  S ORI=$O(^TMP($J,"ORK XTRA TXT",ORGLOB,ORRULE,ORI)) Q:'ORI  S ORK(I,2,ORLINE)=^TMP($J,"ORK XTRA TXT",ORGLOB,ORRULE,ORI),ORLINE=ORLINE+1
 . I $D(ORK) D
 . . N OCRET,ORKI
 . . D SAVEOC^OROCAPI1(.ORK,.OCRET)
 . . I $D(ORCROC) D
 . . . N ORCROCI S ORCROCI=0 F  S ORCROCI=$O(ORCROC(ORCROCI)) Q:'ORCROCI  D
 . . . . N OCINST S OCINST=$O(OCRET(ORCROCI,"")) Q:'OCINST  D
 . . . . . S ^ORD(100.05,OCINST,12)=ORCROC(ORCROCI)
 . . S ORKI=0 F  S ORKI=$O(ORK(ORKI)) Q:'ORKI  D
 . . . N OCINST,OCTXT S OCTXT=$G(ORK(ORKI,2,1))
 . . . S OCINST=$O(OCRET(ORKI,0))
 . . . N ORMONOI,ORMONOQ S ORMONOI=0,ORMONOQ=0 F  Q:ORMONOQ=1  S ORMONOI=$O(^TMP($J,"ORMONOGRAPH",ORMONOI)) Q:'ORMONOI  D
 . . . . I OCTXT[$G(^TMP($J,"ORMONOGRAPH",ORMONOI,"OC")) D
 . . . . . S ORMONOQ=1
 . . . . . S ^ORD(100.05,OCINST,17)=^TMP($J,"ORMONOGRAPH",ORMONOI,"INT")
 . . . . . M ^ORD(100.05,OCINST,16)=^TMP($J,"ORMONOGRAPH",ORMONOI,"DATA")
 . . . . . S ^ORD(100.05,OCINST,16,0)="^^"_$O(^ORD(100.05,OCINST,16,""),-1)_U_$O(^ORD(100.05,OCINST,16,""),-1)_U_+$$NOW^XLFDT_U
 . . K ^TMP($J,"ORMONOGRAPH")
 . . K ^TMP($J,"ORK XTRA TXT")
 K ORDEA
ENQ Q
 ;
NEXTIFN() ; -- Returns next available ORIFN
 N I,HDR,LAST,TOTAL,DA
 L +^OR(100,0):$S($G(DILOCKTM)>0:DILOCKTM,1:5)
 I '$T Q "^"
 S HDR=$G(^OR(100,0)),TOTAL=+$P(HDR,U,4),LAST=$O(^OR(100,"?"),-1)
 S I=LAST\1 F I=(I+1):1 Q:'$D(^OR(100,I,0))
 S DA=I,^OR(100,DA,0)=DA,$P(HDR,U,3,4)=DA_U_(TOTAL+1)
 S ^OR(100,0)=HDR L -^OR(100,0)
 Q DA
 ;
RESPONSE ; -- Save responses in ORDIALOG() into ^OR(100,ORIFN,4.5)
 N PROMPT,CNT,ITM,TYPE,INST,VALUE,I,START,PAT,X
 S PAT=$P(^OR(100,ORIFN,0),U,2),START=$P(^(0),U,8) K ^(4.5)
 S (PROMPT,CNT)=0 F  S PROMPT=$O(ORDIALOG(PROMPT)) Q:PROMPT'>0  D
 . S ITM=$G(ORDIALOG(PROMPT)) Q:'ITM
 . S TYPE=$E($G(ORDIALOG(PROMPT,0))) Q:'$L(TYPE)
 . S INST=0 F  S INST=$O(ORDIALOG(PROMPT,INST)) Q:INST'>0  D
 . . S VALUE=$G(ORDIALOG(PROMPT,INST)) Q:VALUE=""  S CNT=CNT+1
 . . S ^OR(100,ORIFN,4.5,CNT,0)=+ITM_U_PROMPT_U_INST_U_$P(ITM,U,2)
 . . S:$L($P(ITM,U,2)) ^OR(100,ORIFN,4.5,"ID",$P(ITM,U,2),CNT)=""
 . . I VALUE<1,TYPE="N" S VALUE=0_+VALUE I VALUE="00" S VALUE=0
 . . S:TYPE'="W" ^OR(100,ORIFN,4.5,CNT,1)=VALUE
 . . M:TYPE="W" ^OR(100,ORIFN,4.5,CNT,2)=@VALUE ; array root
 S ^OR(100,ORIFN,4.5,0)="^100.045A^"_CNT_U_CNT
R1 ; [Reset] Orderables
 I $D(^OR(100,ORIFN,.1)) S I=0 F  S I=$O(^OR(100,ORIFN,.1,I)) Q:I'>0  S X=$G(^(I,0)) I X,PAT,START K ^OR(100,"AOI",X,PAT,9999999-START,ORIFN) ; kill xref
 K ^OR(100,ORIFN,.1) I $D(^OR(100,ORIFN,4.5,"ID","ORDERABLE")) D
 . S (I,CNT)=0
 . F  S I=$O(^OR(100,ORIFN,4.5,"ID","ORDERABLE",I)) Q:I'>0  D
 . . S X=$G(^OR(100,ORIFN,4.5,I,1)) Q:'X
 . . S CNT=CNT+1,^OR(100,ORIFN,.1,CNT,0)=X,^OR(100,ORIFN,.1,"B",X,CNT)=""
 . . I PAT,START S ^OR(100,"AOI",X,PAT,9999999-START,ORIFN)=""
 . S ^OR(100,ORIFN,.1,0)="^100.001PA^"_CNT_U_CNT
 Q
 ;
RESUME(IFN) ; -- add Response nodes for RESUME tray service
 ; S ^OR(100,+IFN,4.5,<next>,0)=DT_"^^^RESUME",^(1)=1
 ;
 N X,Y,DA,DIC,DLAYGO
 S DIC="^OR(100,"_+IFN_",4.5,",DIC(0)="LX",DA(1)=+IFN,X=DT
 S DIC("DR")=".04///RESUME",DIC("P")=$P(^DD(100,4.5,0),U,2),DLAYGO=100
 D ^DIC S:Y ^OR(100,+IFN,4.5,+Y,1)=1
 Q
 ;
PROVIDER(ORDER,PROV) ; -- Change PROVider assigned to ORDER
 Q:'$G(ORDER)  Q:'$G(PROV)
 N ORACT S ORACT=+$P(ORDER,";",2) S:'ORACT ORACT=1
 S $P(^OR(100,+ORDER,8,ORACT,0),U,3)=PROV
 S:ORACT=1 $P(^OR(100,+ORDER,0),U,4)=PROV
 Q
 ;
ACTION(CODE,DA,PROV,REASON,WHEN,WHO) ; -- save new action
 N NEXT,TOTAL,HDR,LAST,X,PAT,DGRP,SIG,NATR,TXT S DA=+DA
 Q:'$D(^OR(100,DA,0)) 0 Q:$G(CODE)'?2U 0
 S:'$G(WHEN) WHEN=+$E($$NOW^XLFDT,1,12) S:'$G(WHO) WHO=DUZ
 S NATR=+$O(^ORD(100.02,"C","E",0)) ;assume Elec Entered until changed
 S PAT=$P(^OR(100,DA,0),U,2),DGRP=$P(^(0),U,11),SIG=$P(^(0),U,16),X=+$P($G(^(3)),U,7),HDR=$G(^(8,0))
 S:X'>0 X=1 S TXT=$P($G(^OR(100,DA,8,X,0)),U,14) ;current actn's txt ptr
 S:HDR="" HDR="^100.008DA^^" S TOTAL=+$P(HDR,U,4)
 S LAST=$O(^OR(100,DA,8,"C",CODE,"?"),-1) I LAST D
 . S X=$G(^OR(100,DA,8,LAST,0)) Q:$P(X,U,15)'=11  Q:$P(X,U,4)'=2
 . S NEXT=LAST I PAT,$P(X,U) D  ; kill old xref entries
 . . K:DGRP ^OR(100,"ACT",PAT,(9999999-$P(X,U)),DGRP,DA,NEXT)
 . . K ^OR(100,"AC",PAT,(9999999-$P(X,U)),DA,NEXT),^OR(100,"AS",PAT,(9999999-$P(X,U)),DA,NEXT),^OR(100,"AF",$P(X,U),DA,NEXT)
 S:'$G(NEXT) NEXT=$O(^OR(100,DA,8,"?"),-1)+1,TOTAL=TOTAL+1
 S ^OR(100,DA,8,NEXT,0)=WHEN_U_CODE_U_$G(PROV)_U_$S(SIG:2,1:3)_"^^^^^^^^"_NATR_U_WHO_U_TXT_"^11",^OR(100,DA,8,"C",CODE,NEXT)=""
 S ^OR(100,"AF",WHEN,DA,NEXT)=""
 I PAT,DGRP S ^OR(100,"ACT",PAT,9999999-WHEN,DGRP,DA,NEXT)=""
 I PAT S ^OR(100,"AC",PAT,9999999-WHEN,DA,NEXT)=""
 I SIG S ^OR(100,"AS",PAT,9999999-WHEN,DA,NEXT)=""
 S:$L($G(REASON)) ^OR(100,DA,8,NEXT,1)=REASON
 S $P(HDR,U,3,4)=NEXT_U_TOTAL,^OR(100,DA,8,0)=HDR
 ;
 D   ; DE3504 - Jan 19, 2016 ,US10045 - PB capture the DC of an order not signed in HMP(800000)
 . N FLD,HMDFN,HMORIS,JDSNOW,RSLT,SRVRNUM,VALS,ORIFN
 . S ORIFN=DA,HMDFN=+$P(^OR(100,+ORIFN,0),U,2),SRVRNUM=$$SRVRNO^HMPOR(HMDFN)
 . Q:'SRVRNUM  ; patient not in the HMP(800000 file
 . S HMORIS=$$ORDRCHK^HMPOR(+ORIFN,HMDFN)  ; does order exist?  ; Jan 26, 2016 - DE3584
 . S JDSNOW=$$NOW^XLFDT
 . ;^(#.03)SIGNED BY^(#.04)SIGNED DATE/TIME^(#.14)ORDER ACTION^(#.15)ACTION DATE/TIME
 . S VALS(.03)=$G(WHO),VALS(.14)=$G(CODE),VALS(.15)=JDSNOW  ; SIGNED BY updated to reflect action user
 . S:$G(SIG)'=2 VALS(.04)=JDSNOW  ; SIG=2 means NOT SIGNED, don't update SIGNED DATE/TIME
 . D:HMORIS UPDTORDR^HMPOR(.RSLT,.VALS,+ORIFN,HMDFN)  ; order exists update it
 . D:'HMORIS ADDORDR^HMPOR(.RSLT,.VALS,+ORIFN,HMDFN)  ; create new order in HMP(800000)
 . D COMP^ORMBLDOR(+$G(ORIFN))  ; send message for completed orders
 ; end DE3504
 Q NEXT
 ;
SET(DLG) ; -- Create new parent for order set ORDIALOG
 ; Returns ORPIFN = ifn of new parent order for set
 ;
 Q:'$G(ORVP)  Q:'$G(DLG)  N OR0,PKG,NOW,CATG,STS,ORLOC,TRSPEC,X
 S OR0=$G(^ORD(101.41,DLG,0)) Q:OR0=""  S ORPIFN=$$NEXTIFN Q:'ORPIFN
 S PKG=$O(^DIC(9.4,"C","OR",0)),CATG=$S($$INPT^ORCD:"I",1:"O"),STS=$S($G(OREVENT):10,1:11),NOW=$S($G(ORSLOG):ORSLOG,1:+$E($$NOW^XLFDT,1,12))
 I $G(OREVENT) S ORLOC="",TRSPEC=""
 S ^OR(100,ORPIFN,0)=ORPIFN_U_ORVP_U_U_$G(ORNP)_U_DLG_";ORD(101.41,^"_DUZ_U_NOW_U_U_U_ORLOC_U_U_CATG_U_TRSPEC_U_PKG_"^^^"_$G(OREVENT),^(3)=NOW_"^90^"_STS_U_$S($G(ORIT):ORIT_"ORD(101.41,",1:"")_"^^^1^^^^0^^"_+$P(OR0,U,6)
 S ^OR(100,ORPIFN,8,0)="^100.008DA^1^1",^(1,0)=NOW_"^NW^"_$G(ORNP)_"^^^^^^^^^^"_DUZ_"^^"_STS,^OR(100,ORPIFN,8,"C","NW",1)="",^OR(100,"AF",NOW,ORPIFN,1)=""
 S ^OR(100,"ACT",ORVP,9999999-NOW,ORPIFN,1)=""
 S:STS=11 ^OR(100,"AC",ORVP,9999999-NOW,ORPIFN,1)=""
 ; AEVNT ??
 S ^OR(100,ORPIFN,1,0)="^100.011^1^1",^(1,0)=$P(OR0,U,2) ; Order text
 Q
