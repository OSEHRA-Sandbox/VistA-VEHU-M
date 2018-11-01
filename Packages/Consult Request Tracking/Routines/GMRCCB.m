GMRCCB ;SFVAMC/DAD - Consult Closure Tool: Data Gathering ;01/20/17 15:19
 ;;3.0;CONSULT/REQUEST TRACKING;**89**;DEC 27, 1997;Build 62
 ;Consult Closure Tool
 ;
 ; IA#    Usage             Component
 ; ---------------------------
 ;  2699  Private           ^TIU(8925,D0,0  
 ;  6742  Controlled Sub    ^TIU(8925,"ADCPT"
 ;  2054  Supported         $$OREF^DILF
 ;  2056  Supported         $$GET1^DIQ
 ;  4433  Supported         $$SDAPI^SDAMA301
 ;  4837  Private           ^GMR(123,"E"
 ; 10103  Supported         $$FMADD^XLFDT
 ; 10103  Supported         $$NOW^XLFDT
 ; 10105  Supported         $$MIN^XLFMTH
 ;
GETDATA(GMROOT,GMTBEG,GMTEND,GM0CFG,GMAPPT,GMNOTE,GMOPUT,GMDLIM) ;
 ; *** Get consults
 N GM0CON,GM0DFN,GMCLPR,GMPROC,GMPROT,GMSERV,GMTCON
 D CLINLIST^GMRCCD(GMROOT,GM0CFG)
 S GMTCON=GMTBEG-.0000001
 F  S GMTCON=$O(^GMR(123,"E",GMTCON)) Q:(GMTCON'>0)!(GMTCON>(GMTEND+.24))  D
 . S GM0CON=0
 . F  S GM0CON=$O(^GMR(123,"E",GMTCON,GM0CON)) Q:GM0CON'>0  D
 .. I $$CONSCHEK(GM0CON,.GMSERV,.GMPROC,.GMPROT,.GMCLPR) D
 ... S GM0DFN=$$GET1^DIQ(123,GM0CON,.02,"I")
 ... I GM0DFN>0 D
 .... D APPTCHEK(GMROOT,GM0CFG,GM0DFN,GM0CON,GMTCON,GMAPPT,GMNOTE,GMOPUT)
 .... Q
 ... Q
 .. Q
 . Q
 Q
 ;
CONSCHEK(GM0CON,GMSERV,GMPROC,GMPROT,GMCLPR) ;
 ; *** Consult active & part of config?
 N GMFILE,GMGLOB
 I $$CONSOKAY^GMRCCD(GM0CON)>0 D
 . F GMFILE=101,123.3 D
 .. S GMGLOB(GMFILE)=$$GLOBROOT^GMRCCD(GMFILE,";")
 .. Q
 . S GMSERV=$$GET1^DIQ(123,GM0CON,1,"I")
 . S GMCLPR=$$GET1^DIQ(123,GM0CON,1.01,"I")
 . S (GMPROC,GMPROT)=$$GET1^DIQ(123,GM0CON,4,"I")
 . S GMPROC=$S(GMPROC[GMGLOB(123.3):GMPROC,1:"")
 . S GMPROT=$S(GMPROT[GMGLOB(101):GMPROT,1:"")
 . S GMCLPR(0)=''$D(^GMR(123.033,GM0CFG,"CLPR","B",+GMCLPR))
 . S GMSERV(0)=''$D(^GMR(123.033,GM0CFG,"CONS","B",+GMSERV))
 . S GMPROC(0)=''$D(^GMR(123.033,GM0CFG,"CONP","B",+GMPROC))
 . S GMPROT(0)=''$D(^GMR(123.033,GM0CFG,"PROT","B",+GMPROT))
 . S GMSERV=$S(GMSERV(0):$$GET1^DIQ(123,GM0CON,1),1:"")
 . S GMCLPR=$S(GMCLPR(0):$$GET1^DIQ(123,GM0CON,1.01),1:"")
 . S GMPROC=$S(GMPROC(0):$$GET1^DIQ(123,GM0CON,4),1:"")
 . S GMPROT=$S(GMPROT(0):$$GET1^DIQ(123,GM0CON,4),1:"")
 . Q
 E  D
 . S (GMSERV,GMPROC,GMPROT,GMCLPR)=""
 . S (GMSERV(0),GMPROC(0),GMPROT(0),GMCLPR(0))=0
 . Q
 Q (GMSERV(0)!GMPROC(0)!GMPROT(0)!GMCLPR(0))
 ;
APPTCHEK(GMROOT,GM0CFG,GM0DFN,GM0CON,GMTCON,GMAPPT,GMNOTE,GMOPUT) ;
 ; *** Check for appts
 N GMTAPT
 S GMTAPT=$$APPTLIST(GMROOT,GM0CFG,GM0DFN,GMTCON,GMAPPT)
 ; Only seen Pts
 I GMAPPT>0 D
 . ; Pt has been seen
 . I GMTAPT>0 D
 .. D NOTECHEK(GMROOT,GM0CFG,GM0DFN,GM0CON,GMTCON,GMTAPT,GMNOTE,GMOPUT)
 .. Q
 . Q
 ; Only unseen Pts
 E  D
 . ; Pt has NOT been seen
 . I (GMTAPT'>0)!($$UNSEEN^GMRCCD($P(GMTAPT,U,4))>0) D
 .. D NOTECHEK(GMROOT,GM0CFG,GM0DFN,GM0CON,GMTCON,GMTAPT,GMNOTE,GMOPUT)
 .. Q
 . Q
 Q
 ;
NOTECHEK(GMROOT,GM0CFG,GM0DFN,GM0CON,GMTCON,GMTAPT,GMNOTE,GMOPUT) ;
 ; *** Check for notes
 N GMTNOT
 K @GMROOT@("NOTE-LIST")
 S GMTNOT=$$NOTELIST(GMROOT,GM0CFG,GM0DFN,+GMTAPT,+GMTCON,GMOPUT)
 ; Only Pts with notes
 I GMNOTE>0 D
 . ; Pt has note
 . I GMTNOT>0 D
 .. D SETDATA(GMROOT,GM0DFN,GM0CON,GMTAPT,GMTNOT,GMOPUT)
 .. Q
 . Q
 ; Only Pts without notes
 E  D
 . ; Pt does NOT have note
 . I GMTNOT'>0 D
 .. I $O(@GMROOT@("NOTE-LIST",0))'>0 S @GMROOT@("NOTE-LIST",1)="^^*NO NOTE*" ; GMRCC*2.1*1
 .. D SETDATA(GMROOT,GM0DFN,GM0CON,GMTAPT,GMTNOT,GMOPUT)
 .. Q
 . Q
 K @GMROOT@("NOTE-LIST")
 Q
 ;
APPTLIST(GMROOT,GM0CFG,GM0DFN,GMTCON,GMAPPT) ;
 ; *** Get Pt's appts
 ; $$APPTLIST() = ApptDate ^ ClinIEN ^ ClinName ^ ApptStatInt ^ ApptStatExt
 N GMCLIN,GMDATA,GMDATE,GMDAYS,GMFRST,GMLAST
 N GMLIST,GMSDAM,GMSTAT,GMTAPT,GMVSIT
 S GMDAYS=$$GET1^DIQ(123.033,GM0CFG,.04)
 S GMLAST=$$FMADD^XLFDT(GMTCON,GMDAYS,0,0,0)
 S GMLAST=$$MIN^XLFMTH(GMLAST,$$NOW^XLFDT)
 S GMSDAM("FLDS")="1;2;3"
 S GMSDAM("SORT")="P"
 S GMSDAM(1)=GMTCON_";"_GMLAST
 S GMSDAM(2)=$$OREF^DILF($NA(@GMROOT@("XREF-CLIN")))
 S GMSDAM(4)=GM0DFN
 S GMLIST=$NA(^TMP($J,"SDAMA301"))
 K @GMLIST
 S GMVSIT=""
 I $$SDAPI^SDAMA301(.GMSDAM)'=-1 D
 . S GMTAPT=0,GMFRST=""
 . F  S GMTAPT=$O(@GMLIST@(GM0DFN,GMTAPT)) Q:(GMTAPT'>0)!(GMVSIT>0)  D
 .. S GMDATA=$G(@GMLIST@(GM0DFN,GMTAPT))
 .. S GMCLIN=$P($P(GMDATA,U,2),";",1)
 .. S GMSTAT=$P($P(GMDATA,U,3),";",1)
 .. I (GMTAPT>0)&(GMCLIN>0) D
 ... ; Appt already used?
 ... I '$D(@GMROOT@("XREF-APPT",GM0DFN,+GMCLIN,GMTAPT)) D
 .... ; Save first cancelled/no-show appt
 .... I (GMFRST="")&($$UNSEEN^GMRCCD(GMSTAT)>0) S GMFRST=GMDATA
 .... ; Appt kept?
 .... I $$SEEN^GMRCCD(GMSTAT)>0 D
 ..... ; Mark appt used
 ..... S @GMROOT@("XREF-APPT",GM0DFN,+GMCLIN,+GMTAPT)=""
 ..... S GMVSIT=GMDATA
 ..... Q
 .... Q
 ... Q
 .. Q
 . ; (No kept appt found) & (cancelled/no-show appt found)
 . I (GMVSIT'>0)&(GMFRST]"")&(GMAPPT'>0) D
 .. S GMTAPT=$P(GMFRST,U,1)
 .. S GMCLIN=$P(GMFRST,U,2)
 .. ; Mark appt used
 .. S @GMROOT@("XREF-APPT",GM0DFN,+GMCLIN,+GMTAPT)=""
 .. S GMVSIT=GMFRST
 .. Q
 . Q
 K @GMLIST
 S GMDATE=$P(GMVSIT,U,1)
 S GMCLIN("I")=$P($P(GMVSIT,U,2),";",1)
 S GMCLIN("E")=$P($P(GMVSIT,U,2),";",2)
 S GMSTAT("I")=$P($P(GMVSIT,U,3),";",1)
 S GMSTAT("E")=$P($P(GMVSIT,U,3),";",2)
 S GMVSIT=GMDATE_U_GMCLIN("I")_U_GMCLIN("E")_U
 S GMVSIT=GMVSIT_GMSTAT("I")_U_GMSTAT("E")
 Q GMVSIT
 ;
NOTELIST(GMROOT,GM0CFG,GM0DFN,GMTAPT,GMTCON,GMOPUT) ;
 ; *** Get Pt's notes
 ; $$NOTELIST() = RefDate ^ TitleIEN ^ TitleName ^ NoteIEN
 N GM0NOT,GMCLAS,GMDATA,GMDATE,GMDAYS,GMINDX
 N GMTFIN,GMSTAT,GMTITL,GMTNOT,GM0TTL
 S GMDATE=$S(GMTAPT>0:GMTAPT,1:GMTCON)
 S GMDAYS=$$GET1^DIQ(123.033,GM0CFG,$S(GMTAPT>0:.05,1:.04))
 S GMTFIN=9999999-$$FMADD^XLFDT(GMDATE\1,GMDAYS,0,0,0)
 D NOTESTAT^GMRCCD(.GMSTAT)
 S (GMCLAS,GMTITL)=0
 F  S GMCLAS=$O(^TIU(8925,"ADCPT",GM0DFN,GMCLAS)) Q:$$NOTEQUIT(GMCLAS,GMTITL,GMOPUT)  D
 . S GMSTAT=0
 . F  S GMSTAT=$O(GMSTAT(GMSTAT)) Q:$$NOTEQUIT(GMSTAT,GMTITL,GMOPUT)  D
 .. S GMTNOT=9999999-(GMDATE\1)
 .. F  S GMTNOT=$O(^TIU(8925,"ADCPT",GM0DFN,GMCLAS,GMSTAT,GMTNOT),-1) Q:$$NOTEQUIT(GMTNOT,GMTITL,GMOPUT)!(GMTNOT<GMTFIN)  D
 ... S GM0NOT=0
 ... F  S GM0NOT=$O(^TIU(8925,"ADCPT",GM0DFN,GMCLAS,GMSTAT,GMTNOT,GM0NOT)) Q:$$NOTEQUIT(GM0NOT,GMTITL,GMOPUT)  D
 .... ; Note part of config?
 .... S GM0TTL=$$GET1^DIQ(8925,GM0NOT,.01,"I")
 .... I $D(^GMR(123.033,GM0CFG,"NOTE","B",+GM0TTL)) D
 ..... S GMDATA=$$GET1^DIQ(8925,GM0NOT,1301,"I")
 ..... S GMDATA=GMDATA_U_$$GET1^DIQ(8925,GM0NOT,.01,"I")
 ..... S GMDATA=GMDATA_U_$$GET1^DIQ(8925,GM0NOT,.01)
 ..... S GMDATA=GMDATA_U_GM0NOT
 ..... I ((GMOPUT["I")!(GMOPUT["P"))&(GMOPUT'["C") D
 ...... S GMINDX=1+$O(@GMROOT@("NOTE-LIST",1E25),-1)
 ...... S @GMROOT@("NOTE-LIST",GMINDX)=GMDATA
 ...... Q
 ..... ; Note already used?
 ..... I '$D(@GMROOT@("XREF-NOTE",GM0DFN,GM0NOT)) D
 ...... ; Mark note used
 ...... S @GMROOT@("XREF-NOTE",GM0DFN,GM0NOT)=""
 ...... S GMTITL=GMDATA
 ...... Q
 ..... Q
 .... Q
 ... Q
 .. Q
 . Q
 Q GMTITL
 ;
NOTEQUIT(GMORDR,GMTITL,GMOPUT) ;
 ; *** Stop note search?
 Q $S(GMORDR'>0:1,GMOPUT["I":0,1:''GMTITL)
 ;
SETDATA(GMROOT,GM0DFN,GM0CON,GMADAT,GMNDAT,GMOPUT) ;
 ; *** Save report data
 N GMCLIN,GMCLPR,GMCNAM,GMDATA,GMINDX,GMNAME
 N GMNOTE,GMPROC,GMPROT,GMSERV,GMSSN,GMSTAT
 N GMTAPT,GMTCON,GMTNOT
 S GMTCON=$$GET1^DIQ(123,GM0CON,3,"I")
 S GMCNAM="*NO CONSULT*"
 I $$CONSCHEK(GM0CON,.GMSERV,.GMPROC,.GMPROT,.GMCLPR) D
 . I GMCLPR(0) S GMCNAM=GMCLPR
 . I GMPROT(0) S GMCNAM=GMPROT
 . I GMPROC(0) S GMCNAM=GMPROC
 . I GMSERV(0) S GMCNAM=GMSERV
 . Q
 S GMCNAM=GMCNAM_U_(+GM0CON)
 ;
 S GMNAME=$$GET1^DIQ(2,GM0DFN,.01)
 S GMNAME=$S(GMNAME]"":GMNAME,1:"*NO PATIENT*")
 S GMNAME=GMNAME_U_(+GM0DFN)
 S GMSSN=$$GET1^DIQ(2,GM0DFN,.09)
 ;
 S GMCLIN=$P(GMADAT,U,3)
 S GMCLIN=$S(GMCLIN]"":GMCLIN,1:"*NO CLINIC*")
 S GMCLIN=GMCLIN_U_(+$P(GMADAT,U,2))
 S GMTAPT=$P(GMADAT,U,1)
 S GMSTAT("I")=$P(GMADAT,U,4)
 S GMSTAT("E")=$P(GMADAT,U,5)
 ;
 S GMNOTE=$P(GMNDAT,U,3)
 S GMNOTE=$S(GMNOTE]"":GMNOTE,1:"*NO NOTE*")
 S GMNOTE=GMNOTE_U_(+$P(GMNDAT,U,2))_U_(+$P(GMNDAT,U,4))
 S GMTNOT=$P(GMNDAT,U,1)
 ;
 S GMDATA=GMSSN_U_GMTCON_U_GMTAPT_U
 S GMDATA=GMDATA_GMSTAT("I")_U_GMSTAT("E")_U
 S GMDATA=GMDATA_GMTNOT_U_GM0CON_U_(+$P(GMNDAT,U,4))_U
 S GMDATA=GMDATA_"0"_U_""
 ;
 ; Data = SSN ^ ConsultDate ^ ApptDate ^ ApptStatusInt ^ ApptStatusExt ^
 ;        NoteDate ^ ConsultIEN ^ NoteIEN ^ ConsultUpdated ^ ConsultUpdateMsg
 ;
 I ((GMOPUT["I")!(GMOPUT["P"))&(GMOPUT'["C") D
 . S GMINDX=0
 . F  S GMINDX=$O(@GMROOT@("NOTE-LIST",GMINDX)) Q:GMINDX'>0  D
 .. S GMNOTE=$G(@GMROOT@("NOTE-LIST",GMINDX))
 .. S $P(GMDATA,U,6)=$P(GMNOTE,U,1)
 .. S $P(GMDATA,U,8)=$P(GMNOTE,U,4)
 .. S GMNOTE=$P(GMNOTE,U,3)_U_$P(GMNOTE,U,2)_U_$P(GMNOTE,U,4)
 .. I GMOPUT["I" D
 ... ; Root("DATA", PtName ^ PtIEN, Consult ^ ConsultIEN,
 ... ;      Title ^ TitleIEN ^ NoteIEN) = Data
 ... S @GMROOT@("DATA",GMNAME,GMCNAM,GMNOTE)=GMDATA
 ... Q
 .. E  D
 ... ; Root("DATA", Consult ^ ConsultIEN, Clin ^ ClinIEN,
 ... ;      PtName ^ PtIEN, Title ^ TitleIEN ^ NoteIEN) = Data
 ... S @GMROOT@("DATA",GMCNAM,GMCLIN,GMNAME,GMNOTE)=GMDATA
 ... Q
 .. Q
 . Q
 E  D
 . ; Root("DATA", Consult ^ ConsultIEN, Clin ^ ClinIEN,
 . ;      Title ^ TitleIEN ^ NoteIEN, PtName ^ PtIEN) = Data
 . S @GMROOT@("DATA",GMCNAM,GMCLIN,GMNOTE,GMNAME)=GMDATA
 . Q
 S @GMROOT@("XREF-DFN",GM0DFN)=""
 Q