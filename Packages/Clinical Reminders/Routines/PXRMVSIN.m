PXRMVSIN ;SLC/PKR - Value set inquiry for general use. ;01/27/2015
 ;;2.0;CLINICAL REMINDERS;**47**;Feb 04, 2005;Build 289
 ;==========================================
BVSALL ;Value set inquiry, return the formatted text OUTPUT.
 N BOP,IEN,INQTYPE,NAME,OUTPUT
 S INQTYPE=$$GTYPE
 S BOP=$$BORP^PXRMUTIL("B")
 I BOP="" Q
 S NAME=""
 F  S NAME=$O(^PXRM(802.2,"B",NAME)) Q:NAME=""  D
 . S IEN=$O(^PXRM(802.2,"B",NAME,""))
 . D VSINQ(INQTYPE,IEN,.OUTPUT)
 . I BOP="B" D BROWSE^DDBR("OUTPUT","NR","Value Set Inquiry")
 . I BOP="P" D GPRINT^PXRMUTIL("OUTPUT")
 Q
 ;
 ;==========================================
BVSINQ(IEN) ;Display a value set inquiry, defaults to the Browswer.
 N BOP,DIR0,INQTYPE,OUTPUT,TITLE
 I '$D(^PXRM(802.2,IEN)) Q
 S INQTYPE=$$GTYPE
 S TITLE="Value Set Inquiry - "_$S(INQTYPE="C":"Condensed",INQTYPE="F":"Full",1:"")
 D VSINQ(INQTYPE,IEN,.OUTPUT)
 S BOP=$$BORP^PXRMUTIL("B")
 I BOP="" Q
 I BOP="B" D BROWSE^DDBR("OUTPUT","NR",TITLE)
 I BOP="P" D GPRINT^PXRMUTIL("OUTPUT")
 Q
 ;
 ;==========================================
CODESLC(VSIEN,CSIND,CHDR,NCODES,NL,OUTPUT) ;Produce the condensed listing.
 N CODE,DESC,IND,NPAD
 S NL=NL+1,OUTPUT(NL)=CHDR(1)
 S NL=NL+1,OUTPUT(NL)=CHDR(2)
 S (IND,NCODES)=0
 F  S IND=+$O(^PXRM(802.2,VSIEN,2,CSIND,1,IND)) Q:IND=0  D
 . S NCODES=NCODES+1
 . S CODE=^PXRM(802.2,VSIEN,2,CSIND,1,IND,0)
 . I $L(CODE)<5 S CODE=$$RJ^XLFSTR(CODE,5," ")
 . S DESC=^PXRM(802.2,VSIEN,2,CSIND,1,IND,1,1,0)
 . I $L(DESC)>60 S DESC=$E(DESC,1,57)_"..."
 . S NPAD=20-$L(CODE)
 . S NL=NL+1,OUTPUT(NL)=CODE_$$INSCHR^PXRMEXLC(NPAD," ")_DESC
 Q
 ;
 ;==========================================
CODESLF(VSIEN,CSIND,CHDR,NCODES,NL,OUTPUT) ;Produce the full listing.
 N CODE,DESC,FMTSTR,IND,JND,NIN,NOUT,NPAD,TEXTIN,TEXTOUT
 S FMTSTR="18L2^60L"
 S NL=NL+1,OUTPUT(NL)=CHDR(1)
 S NL=NL+1,OUTPUT(NL)=CHDR(2)
 S (IND,NCODES)=0
 F  S IND=+$O(^PXRM(802.2,VSIEN,2,CSIND,1,IND)) Q:IND=0  D
 . S NCODES=NCODES+1
 . S CODE=^PXRM(802.2,VSIEN,2,CSIND,1,IND,0)
 . I $L(CODE)<5 S CODE=$$RJ^XLFSTR(CODE,5," ")
 . S NIN=$P(^PXRM(802.2,VSIEN,2,CSIND,1,IND,1,0),U,3)
 . I (NIN=1) D  Q
 .. S DESC=^PXRM(802.2,VSIEN,2,CSIND,1,IND,1,1,0)
 .. I $L(DESC)<61 S NPAD=20-$L(CODE),NL=NL+1,OUTPUT(NL)=CODE_$$INSCHR^PXRMEXLC(NPAD," ")_DESC
 .. E  D
 ... S TEXTIN=CODE_U_DESC
 ... D COLFMT^PXRMTEXT(FMTSTR,TEXTIN," ",.NOUT,.TEXTOUT)
 ... F JND=1:1:NOUT S NL=NL+1,OUTPUT(NL)=TEXTOUT(JND)
 .;
 .;Multiple line code description.
 . K ^TMP($J,"INTEXT"),^TMP($J,"OUTTEXT")
 . S ^TMP($J,"INTEXT",1)=CODE_U_^PXRM(802.2,VSIEN,2,CSIND,1,IND,1,1,0)
 . F JND=2:1:NIN D
 .. S ^TMP($J,"INTEXT",JND)=" "_U_^PXRM(802.2,VSIEN,2,CSIND,1,IND,1,JND,0)
 . D COLFMTA^PXRMTEXT(FMTSTR,"INTEXT"," ",.NOUT,"OUTTEXT")
 . F JND=1:1:NOUT S NL=NL+1,OUTPUT(NL)=^TMP($J,"OUTTEXT",JND)
 K ^TMP($J,"INTEXT"),^TMP($J,"OUTTEXT")
 Q
 ;
 ;==========================================
GTYPE() ;Prompt the user for the type of output.
 N DIR,POP,X,Y
 S DIR(0)="SA"_U_"C:Condensed;F:Full"
 S DIR("A")="Condensed or full inquiry? "
 S DIR("B")="C"
 D ^DIR
 I $D(DIROUT) S DTOUT=1
 I $D(DTOUT)!($D(DUOUT)) Q "F"
 Q Y
 ;
 ;==========================================
MLISTC(NUM,MIEN,NL,OUTPUT) ;Produce the condensed measure list.
 N IND,NOUT,TEXTIN,TEXTOUT
 S TEXTIN=NUM_". "_$P(^PXRM(802.3,MIEN,0),U,1)
 D FORMATS^PXRMTEXT(2,78,TEXTIN,.NOUT,.TEXTOUT)
 F IND=1:1:NOUT S NL=NL+1,OUTPUT(NL)=TEXTOUT(IND)
 Q
 ;
 ;==========================================
MLISTF(NUM,MIEN,NL,OUTPUT) ;Produce the full measure list.
 N IND,NIN,NOUT,STEWARD,TEMP,TEXTIN,TEXTOUT
 S TEXTIN=NUM_". "_$P(^PXRM(802.3,MIEN,0),U,1)
 D FORMATS^PXRMTEXT(2,78,TEXTIN,.NOUT,.TEXTOUT)
 F IND=1:1:NOUT S NL=NL+1,OUTPUT(NL)=TEXTOUT(IND)
 S TEMP=^PXRM(802.3,MIEN,1)
 S NL=NL+1,OUTPUT(NL)="  CMS ID: "_$P(TEMP,U,1)
 S NL=NL+1,OUTPUT(NL)="  Version number: "_$P(TEMP,U,2)
 S NL=NL+1,OUTPUT(NL)="  GUID: "_$P(TEMP,U,3)
 S NL=NL+1,OUTPUT(NL)="  NQF number: "_$P(TEMP,U,4)
 S TEXTIN="Steward: "_$G(^PXRM(802.3,MIEN,5))
 D FORMATS^PXRMTEXT(3,78,TEXTIN,.NOUT,.TEXTOUT)
 F IND=1:1:NOUT S NL=NL+1,OUTPUT(NL)=TEXTOUT(IND)
 K TEXTIN,TEXTOUT
 S NIN=$P(^PXRM(802.3,MIEN,2,0),U,3)
 S TEXTIN(1)="Description: "_^PXRM(802.3,MIEN,2,1,0)
 F IND=2:1:NIN S TEXTIN(IND)=^PXRM(802.3,MIEN,2,IND,0)
 D FORMAT^PXRMTEXT(2,78,NIN,.TEXTIN,.NOUT,.TEXTOUT)
 F IND=1:1:NOUT S NL=NL+1,OUTPUT(NL)=TEXTOUT(IND)
 S NL=NL+1,OUTPUT(NL)=""
 Q
 ;
 ;==========================================
VSINQ(INQTYPE,IEN,OUTPUT) ;Value set inquiry, return the formatted text OUTPUT.
 ;Use 80 column output.
 N CHDR,CODESYSN,CODESYSP,DUPL,IENSTR,IND,OCL,NL
 N LEXSAB,MIEN,MNAME,NCODES,NCODESA,NCS,NOUT,NPAD,NUCODES,RM
 N TCODES,TEMP,TERM,TEXT,TEXTOUT,UID,WPARRAY
 S RM=80
 S CHDR(1)=" Code"_$$INSCHR^PXRMEXLC(15," ")_"Description"
 S CHDR(2)=" ----"_$$INSCHR^PXRMEXLC(15," ")_"-----------"
 S IENSTR="No. "_IEN
 S OUTPUT(1)=$$REPEAT^XLFSTR("-",RM)
 S TEXT=$P(^PXRM(802.2,IEN,0),U,1)
 D FORMATS^PXRMTEXT(1,70,TEXT,.NOUT,.TEXTOUT)
 S NPAD=RM-$L(TEXTOUT(1))-1
 S OUTPUT(2)=TEXTOUT(1)_$$RJ^XLFSTR(IENSTR,NPAD," ")
 S NL=2
 I NOUT>1 F IND=2:1:NOUT S NL=NL+1,OUTPUT(NL)=TEXTOUT(IND)
 S NL=NL+1,OUTPUT(NL)=$$REPEAT^XLFSTR("-",RM)
 S NL=NL+1,OUTPUT(NL)=""
 S TEMP=^PXRM(802.2,IEN,1)
 S NL=NL+1,OUTPUT(NL)="OID: "_$P(TEMP,U,1)
 S NL=NL+1,OUTPUT(NL)="Short ID: "_$P(TEMP,U,2)
 S NL=NL+1,OUTPUT(NL)="Version date: "_$$FMTE^XLFDT($P(TEMP,U,3))
 S NL=NL+1,OUTPUT(NL)=""
 S NL=NL+1,OUTPUT(NL)=$$CJ^XLFSTR("Code List",80," ")
 ;Coding systems and codes.
 S (IND,NCS,TCODES)=0
 F  S IND=+$O(^PXRM(802.2,IEN,2,IND)) Q:IND=0  D
 . S CODESYSP=^PXRM(802.2,IEN,2,IND,0)
 . S TEMP=^PXRM(802.1,CODESYSP,0)
 . S NCS=NCS+1
 . S NL=NL+1,OUTPUT(NL)=""
 . S CODESYSN=$P(TEMP,U,1)
 . S NL=NL+1,OUTPUT(NL)="NLM Coding System: "_CODESYSN
 . S NL=NL+1,OUTPUT(NL)="Code System OID: "_$P(TEMP,U,2)
 . S NL=NL+1,OUTPUT(NL)="Version: "_$P(TEMP,U,3)
 . S LEXSAB=$P(TEMP,U,4)
 . S TEXT="Lexicon equivalent: "
 . I LEXSAB="" S TEXT=TEXT_"None"
 . I LEXSAB'="" S TEXT=TEXT_$P($$CSYS^LEXU(LEXSAB),U,4)
 . S NL=NL+1,OUTPUT(NL)=TEXT
 . I INQTYPE="C" D CODESLC(IEN,IND,.CHDR,.NCODES,.NL,.OUTPUT)
 . I INQTYPE="F" D CODESLF(IEN,IND,.CHDR,.NCODES,.NL,.OUTPUT)
 . S NCODESA(CODESYSP)=NCODES_U_CODESYSN
 . S TCODES=TCODES+NCODES
 ;Code summary
 S NL=NL+1,OUTPUT(NL)=""
 S NL=NL+1,OUTPUT(NL)="There are "_NCS_" coding systems."
 S NL=NL+1,OUTPUT(NL)="Coding System"_$$INSCHR^PXRMEXLC(10," ")_"Number of Codes"
 S NL=NL+1,OUTPUT(NL)="-------------"_$$INSCHR^PXRMEXLC(10," ")_"----------------"
 S CODESYSP=""
 F  S CODESYSP=$O(NCODESA(CODESYSP)) Q:CODESYSP=""  D
 . S TEMP=NCODESA(CODESYSP)
 . S CODESYSN=$P(TEMP,U,2)
 . S NPAD=23-$L(CODESYSN)
 . S NL=NL+1,OUTPUT(NL)=" "_CODESYSN_$$INSCHR^PXRMEXLC(NPAD," ")_$P(TEMP,U,1)
 S NL=NL+1,OUTPUT(NL)=" "
 S NL=NL+1,OUTPUT(NL)="There are "_TCODES_" total codes."
 ;Measures
 S NL=NL+1,OUTPUT(NL)=""
 S NL=NL+1,OUTPUT(NL)="Clinical Quality Measures that use this Value Set:"
 S IND=0
 F  S IND=+$O(^PXRM(802.2,IEN,3,IND)) Q:IND=0  D
 . S MIEN=$P(^PXRM(802.2,IEN,3,IND,0),U,1)
 . I INQTYPE="C" D MLISTC(IND,MIEN,.NL,.OUTPUT)
 . I INQTYPE="F" D MLISTF(IND,MIEN,.NL,.OUTPUT)
 Q
 ;