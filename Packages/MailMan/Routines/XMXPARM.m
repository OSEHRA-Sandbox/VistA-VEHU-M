XMXPARM ;ISC-SF/GMB-Parameter check ;03/26/2003  08:00
 ;;8.0;MailMan;**15,45**;Jun 28, 2002;Build 8
ACTMSGS(XMDUZ,XMK,XMKZA) ;
 K XMERR,^TMP("XMERR",$J)
 D XMDUZ(.XMDUZ,.XMV)
 I $G(XMK)'="" S XMK=$$XMK(XMDUZ,"XMK",XMK)
 D XMKZA^XMXPARM1(.XMKZA)
 Q
ACTMSG(XMDUZ,XMK,XMKZ) ;
 K XMERR,^TMP("XMERR",$J)
 D XMDUZ(.XMDUZ,.XMV)
 I $G(XMK)'="" D
 . S XMK=$$XMK(XMDUZ,"XMK",XMK)
 . D XMKZ^XMXPARM1(XMK,.XMKZ)
 E  D XMZ(.XMKZ)
 Q
ANSRMSG(XMDUZ,XMK,XMKZ,XMSUBJ,XMBODY,XMTO,XMINSTR) ;
 D ACTMSG(.XMDUZ,.XMK,.XMKZ)
 I $G(XMSUBJ)'="" S XMSUBJ=$$XMSUBJ("XMSUBJ",$G(XMSUBJ))
 D XMBODY^XMXPARM1(.XMBODY)
 D:$D(XMTO) XMTO^XMXPARM1(.XMTO,$G(XMINSTR("ADDR FLAGS"))["I") ; truly optional
 D:$D(XMINSTR) XMINSTR(.XMINSTR)
 Q
BULLETIN(XMDUZ,XMBN,XMPARM,XMBODY,XMTO,XMINSTR,XMATTACH) ;
 K XMERR,^TMP("XMERR",$J)
 D XMDUZ(.XMDUZ,.XMV)
 D XMBN^XMXPARM1(.XMBN)
 D:$D(XMBODY) XMBODY^XMXPARM1(.XMBODY,1)
 D:$D(XMTO) XMTO^XMXPARM1(.XMTO,$G(XMINSTR("ADDR FLAGS"))["I") ; truly optional
 D:$D(XMINSTR) XMINSTR(.XMINSTR)
 Q
FWDMSG(XMDUZ,XMK,XMKZA,XMTO,XMINSTR) ;
 D ACTMSGS(.XMDUZ,.XMK,.XMKZA)
 D XMTO^XMXPARM1(.XMTO,$G(XMINSTR("ADDR FLAGS"))["I") ; need at least one
 D:$D(XMINSTR) XMINSTR(.XMINSTR)
 Q
LATERMSG(XMDUZ,XMK,XMKZA,XMINSTR) ;
 D ACTMSGS(.XMDUZ,.XMK,.XMKZA)
 I $D(XMINSTR("LATER")) D  Q
 . ;I XMINSTR("LATER")="@" Q
 . S XMINSTR("LATER")=$$XMDATE("XMINSTR(""LATER"")",XMINSTR("LATER"))
 I $G(XMINSTR)'="" D  Q
 . ;I XMINSTR="@" Q
 . S XMINSTR=$$XMDATE("LATER",XMINSTR)
 D ERRSET^XMXUTIL(39419) ;Later date must be supplied.
 Q
MOVEMSG(XMDUZ,XMK,XMKZA,XMKTO) ;
 D ACTMSGS(.XMDUZ,.XMK,.XMKZA)
 D XMKTO(XMDUZ,.XMKTO)
 Q
PRTMSG(XMDUZ,XMK,XMKZA,XMPRTTO,XMINSTR,XMSUBJ,XMTO) ;
 D ACTMSGS(.XMDUZ,.XMK,.XMKZA)
 Q:'$D(XMINSTR)
 I $D(XMINSTR("WHEN")) S XMINSTR("WHEN")=$$XMDATE("XMINSTR(""WHEN"")",XMINSTR("WHEN"))
 I $D(XMINSTR("HDR")) D XMCODE^XMXPARM1("XMINSTR(""HDR"")",XMINSTR("HDR"),"^0^1^")
 I $D(XMINSTR("RECIPS")) D XMCODE^XMXPARM1("XMINSTR(""RECIPS"")",XMINSTR("RECIPS"),"^0^1^2^")
 I $G(XMSUBJ)'="" S XMSUBJ=$$XMSUBJ("XMSUBJ",$G(XMSUBJ))
 I $D(XMTO) D XMTO^XMXPARM1(.XMTO,$G(XMINSTR("ADDR FLAGS"))["I") ; ok
 Q
REPLYMSG(XMDUZ,XMK,XMKZ,XMBODY,XMINSTR) ;
 D ACTMSG(.XMDUZ,.XMK,.XMKZ)
 D XMBODY^XMXPARM1(.XMBODY)
 D:$D(XMINSTR) XMINSTR(.XMINSTR)
 I $G(XMINSTR("NET REPLY")),$G(XMINSTR("NET SUBJ"))'="" S XMINSTR("NET SUBJ")=$$XMSUBJ("XMINSTR(""NET SUBJ"")",XMINSTR("NET SUBJ"))
 Q
SENDMSG(XMDUZ,XMSUBJ,XMBODY,XMTO,XMINSTR,XMATTACH) ;
 K XMERR,^TMP("XMERR",$J)
 D XMDUZ(.XMDUZ,.XMV)
 S XMSUBJ=$$XMSUBJ("XMSUBJ",$G(XMSUBJ))
 D XMBODY^XMXPARM1(.XMBODY)
 D XMTO^XMXPARM1(.XMTO,$G(XMINSTR("ADDR FLAGS"))["I") ; need at least one
 D:$D(XMINSTR) XMINSTR(.XMINSTR)
 D:$D(XMATTACH) XMATTACH^XMXPARM1(.XMATTACH)
 Q
VAPORMSG(XMDUZ,XMK,XMKZA,XMINSTR) ;
 D ACTMSGS(.XMDUZ,.XMK,.XMKZA)
 I $D(XMINSTR("VAPOR")) D  Q
 . I XMINSTR("VAPOR")="@" Q
 . S XMINSTR("VAPOR")=$$XMDATE("XMINSTR(""VAPOR"")",XMINSTR("VAPOR"))
 I $G(XMINSTR)'="" D  Q
 . I XMINSTR="@" Q
 . S XMINSTR=$$XMDATE("VAPOR",XMINSTR)
 D ERRSET^XMXUTIL(39417) ;Vaporize date must be supplied.
 Q
ADDRNSND(XMDUZ,XMZ,XMTO,XMINSTR) ;
 K XMERR,^TMP("XMERR",$J)
 D XMDUZ(.XMDUZ,.XMV)
 D XMZ(.XMZ)
 D XMTO^XMXPARM1(.XMTO,$G(XMINSTR("ADDR FLAGS"))["I") ; need at least one
 D:$D(XMINSTR) XMINSTR(.XMINSTR)
 Q
MOVEBODY(XMZ,XMBODY) ;
 K XMERR,^TMP("XMERR",$J)
 D XMZ(.XMZ)
 D XMBODY^XMXPARM1(.XMBODY)
 Q
VSUBJ(XMSUBJ) ;
 K XMERR,^TMP("XMERR",$J)
 S XMSUBJ=$$XMSUBJ("XMSUBJ",$G(XMSUBJ))
 Q
ITOWHOM(XMDUZ,XMZ,XMTYPE,XMINSTR) ;
 K XMERR,^TMP("XMERR",$J)
 D XMDUZ(.XMDUZ,.XMV)
 D XMFLAG("XMTYPE",XMTYPE,"SF")
 I XMTYPE'="S",XMINSTR("ADDR FLAGS")'["R" D XMZ(.XMZ)
 D:$D(XMINSTR) XMINSTR(.XMINSTR)
 Q
TOWHOM(XMDUZ,XMZ,XMTYPE,XMTO,XMINSTR) ;
 D ITOWHOM(.XMDUZ,.XMZ,.XMTYPE,.XMINSTR)
 D XMTO^XMXPARM1(XMTO,$G(XMINSTR("ADDR FLAGS"))["I") ; need at least one
 Q
XMDUZ(XMDUZ,XMV) ;
 S:$G(XMDUZ)="" XMDUZ=DUZ
 D CHKUSER^XMXPARM1(.XMDUZ)
 ; Need XMV "NAME","DUZ NAME", "NETNAME", "VERSION"
 ; ^XMB("NETNAME"),^XMB("NUM"),^XMB("VIA")
 I XMDUZ'=DUZ D
 . I $D(^XUSEC("XMNOPRIV",DUZ)) D  Q  ;You have been given the XMNOPRIV
 . . D ERRSET^XMXUTIL(38053) ;key and may not become anyone's surrogate.
 . I XMDUZ'=.6,'$D(^XMB(3.7,"AB",DUZ,XMDUZ)) D  Q
 . . ;You are not authorized to be a surrogate of DUZ |1|.
 . . D ERRSET^XMXUTIL(39401,XMDUZ)
 I $D(XMV("VERSION")),$G(XMV("DUZ NAME"))=$$NAME^XMXUTIL(DUZ),$G(XMV("NAME"))=$$NAME^XMXUTIL(XMDUZ) Q
 D INITAPI^XMVVITAE
 Q
XMSUBJ(XMPARM,XMSUBJ) ; Validate a prospective message subject
 ;I $G(XMSUBJ)="" D ERRSET^XMXUTIL(39402) Q ""  ;No subject.
 I XMSUBJ?.E1C.E S XMSUBJ=$$CTRL^XMXUTIL1(XMSUBJ)
 I $E(XMSUBJ,1)=" "!($E(XMSUBJ,$L(XMSUBJ))=" ") S XMSUBJ=$$STRIP^XMXUTIL1(XMSUBJ)
 I XMSUBJ["   " S XMSUBJ=$$MAXBLANK^XMXUTIL1(XMSUBJ)
 I $G(XMSUBJ)="" Q $$EZBLD^DIALOG(34012) ;* No Subject *
 I $L(XMSUBJ)+(2*($L(XMSUBJ,U)-1))>65!($L(XMSUBJ)<3) D  Q XMSUBJ
 . D ERRSET^XMXUTIL(39403) ;Subject must be from 3 to 65 characters long.
 I XMSUBJ?1"R".N D  Q XMSUBJ
 . D ERRSET^XMXUTIL(39404) ;Subject 'Rnnn' reserved.
 ;D CHK^DIE(3.9,.01,"H",XMSUBJ)
 Q XMSUBJ
XMINSTR(XMINSTR) ; Validate special instructions
 S:$D(XMINSTR("RCPT BSKT")) XMINSTR("RCPT BSKT")=$$XMKN^XMXPARMB(XMDUZ,"XMINSTR(""RCPT BSKT"")",XMINSTR("RCPT BSKT"),1)
 S:$D(XMINSTR("SELF BSKT")) XMINSTR("SELF BSKT")=$$XMK(XMDUZ,"XMINSTR(""SELF BSKT"")",XMINSTR("SELF BSKT"),1)
 I $D(XMINSTR("SHARE DATE")) S XMINSTR("SHARE DATE")=$$XMDATE("XMINSTR(""SHARE DATE"")",XMINSTR("SHARE DATE"))
 S:$D(XMINSTR("SHARE BSKT")) XMINSTR("SHARE BSKT")=$$XMK(.6,"XMINSTR(""SHARE BSKT"")",XMINSTR("SHARE BSKT"),1)
 I $D(XMINSTR("VAPOR")) S XMINSTR("VAPOR")=$$XMDATE("XMINSTR(""VAPOR"")",XMINSTR("VAPOR"))
 I $D(XMINSTR("LATER")) S XMINSTR("LATER")=$$XMDATE("XMINSTR(""LATER"")",XMINSTR("LATER"))
 I $D(XMINSTR("FROM")) S XMINSTR("FROM")=$$XMFROM("XMINSTR(""FROM"")",XMINSTR("FROM"))
 I $D(XMINSTR("FWD BY")) S XMINSTR("FWD BY")=$$XMFROM("XMINSTR(""FWD BY"")",XMINSTR("FWD BY"))
 D:$D(XMINSTR("FLAGS")) XMFLAG("XMINSTR(""FLAGS"")",XMINSTR("FLAGS"),"CIPRSX")
 I $D(XMINSTR("SCR KEY"))!$D(XMINSTR("SCR HINT")) D
 . D XMKEY^XMXPARM1($G(XMINSTR("SCR KEY")))
 . D XMHINT^XMXPARM1($G(XMINSTR("SCR HINT")))
 D:$D(XMINSTR("TYPE")) XMTYPE(XMINSTR("TYPE"))
 D:$D(XMINSTR("STRIP")) XMSTRIP^XMXPARM1(XMINSTR("STRIP"))
 Q
XMDATE(XMPARM,XMDATE) ;
 N %DT,Y,X
 S X=XMDATE
 S %DT="FT",%DT(0)="NOW"
 D ^%DT
 Q:Y>0 Y
 N XMP
 S XMP("PARAM","ID")=XMPARM
 S XMP("PARAM","VALUE")=XMDATE
 D ERRSET^XMXUTIL(39409,.XMP) ;Must be a date in the future.
 Q XMDATE
XMFROM(XMPARM,XMFROM) ;
 ;Code below is preventing valid new person file entries from Processing
 ;N XMHOLD
 Q:XMFROM=.5 XMFROM
 I +XMFROM=XMFROM!(XMFROM[U)!($L(XMFROM)>65)!(XMFROM="") D  Q XMFROM
 . N XMP S XMP("PARAM","ID")=XMPARM,XMP("PARAM","VALUE")=XMFROM
 . ;S XMP("PARAM","FILE")=X,XMP("PARAM","FIELD")=Y
 . ;Must be from 1 to 65 characters, no # or ^.
 . D ERRSET^XMXUTIL(39410,.XMP)
 ;S XMHOLD=XMFROM
 ;S XMFROM=$$CTRL^XMXUTIL1(XMFROM)
 ;S XMFROM=$$STRIP^XMXUTIL1(XMFROM)
 ;S XMFROM=$$MAXBLANK^XMXUTIL1(XMFROM)
 ;Q:XMFROM["POSTMASTER" XMFROM
 ; "B^BB^C^D" = name^alias^initial^nickname
 ;I '$$FIND1^DIC(200,"","O",$$UP^XLFSTR(XMFROM),"B^BB^C^D")!$D(DIERR) D  Q XMHOLD
 ;. N XMP S XMP("PARAM","ID")=XMPARM,XMP("PARAM","VALUE")=XMHOLD
 ;. ;S XMP("PARAM","FILE")=X,XMP("PARAM","FIELD")=Y
 ;. D ERRSET^XMXUTIL(39411,.XMP) ;May not be a real person.
 Q XMFROM
XMTYPE(XMTYPE) ; Validate a message type
 I $L(XMTYPE)'=1 D  Q
 . N XMP S XMP("PARAM","ID")="XMINSTR(""TYPE"")",XMP("PARAM","VALUE")=XMTYPE
 . ;S XMPARM("PARAM","FILE")=3.9,XMPARM("PARAM","FIELD")=1.7
 . D ERRSET^XMXUTIL(39412,.XMP) ;Must be 1 character.
 D XMFLAG("XMINSTR(""TYPE"")",XMTYPE,"BDKOSX")
 Q
XMFLAG(XMPARM,XMFLAG,FLAGSET) ;
 N XMLEFT
 S XMLEFT=$TR(XMFLAG,FLAGSET,"")
 Q:XMLEFT=""
 N XMP S XMP("PARAM","ID")=XMPARM,XMP("PARAM","VALUE")=XMFLAG,XMP(1)=XMLEFT
 D ERRSET^XMXUTIL(39413,.XMP) ;|1| is not valid.
 Q
XMKTO(XMDUZ,XMKTO) ;
 I $G(XMKTO)="" D  Q
 . N XMP S XMP("PARAM","ID")="XMKTO",XMP("PARAM","VALUE")=""
 . D ERRSET^XMXUTIL(39416,.XMP) ;Destination basket must be supplied.
 S XMKTO=$$XMK(XMDUZ,"XMKTO",XMKTO)
 Q
XMK(XMDUZ,XMPARM,XMK,XMOPTNL) ;
 I +XMK=XMK,$D(^XMB(3.7,XMDUZ,2,XMK)) Q XMK
 ; Just in case a name was passed...
 N XMKN
 S XMKN=XMK
 S XMK=$$FIND1^DIC(3.701,","_XMDUZ_",","OQ",XMKN)
 Q:XMK XMK
 I '$D(DIERR),$G(XMOPTNL) Q XMKN  ; Basket not found.  Will create on delivery.
 N XMP S XMP("PARAM","ID")=XMPARM,XMP("PARAM","VALUE")=XMKN,XMP(1)=XMKN
 ;Basket name '|1|' ambiguous / not found.
 D ERRSET^XMXUTIL($S($D(DIERR):39414,1:39415),.XMP)
 Q XMKN
XMZ(XMZ) ;
 I $G(XMZ),$D(^XMB(3.9,XMZ,0)) Q
 D ERRSET^XMXUTIL(34353,XMZ) ;Message '|1|' does not exist.
 Q