PXBPPRV1 ;ISL/JVS - PROMPT FOR PROVIDER ; 5/31/07 5:10pm
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**11,19,27,88,124,186,205**;Aug 12, 1996;Build 6
 ;
 ;
 ;
ACTIVE ;---CHECK TO SEE IF ACTIVE PROVIDER
 ;
 N PROVIDER,VISIT,DIC,DR,DA,INACTIVE,OK,NOT,PROVEX,BDATA,ACTIVE
 S PROVIDER=$P(REQI,"^",1) ;-Provider IEN
 S PROVEX=$P(REQE,"^",1) ;-Provider External form
 S VISIT=$P(IDATE,".",1) ;-Visit date Internal form
 ;
 ; begin patch *186*
 ;S DIC=200,DR=53.4,DA=PROVIDER,DIQ="INACTIVE",DIQ(0)="IN" D EN^DIQ1
 ;I $D(INACTIVE),$G(INACTIVE(200,PROVIDER,53.4,"I"))<VISIT S NOT=1
 ;S DIC=200,DR=9.2,DA=PROVIDER,DIQ="ACTIVE",DIQ(0)="IN" D EN^DIQ1
 ;I $D(ACTIVE),$G(ACTIVE(200,PROVIDER,9.2,"I"))<VISIT S NOT=1
 ;---I $G(NOT) W !,IOEDEOP,IORVON,"--WARNING!-",PROVEX," was INACTIVE on the date of this encounter.",IORVOFF D HELP1^PXBUTL1("CON") R OK:DTIME
 ;I $G(NOT) W !,IOEDEOP,IORVON,"--WARNING!-",PROVEX," was INACTIVE on the date of this encounter.",IORVOFF D PMPT
 ;
 S DIC=200,DR=9.2,DA=PROVIDER,DIQ="ACTIVE",DIQ(0)="IN" D EN^DIQ1
 I $D(ACTIVE),$G(ACTIVE(200,PROVIDER,9.2,"I"))'>VISIT S NOT=1 D
 . D RSET^PXBDREQ("PRV") S FPRI=1
 . W !,IOEDEOP,IORVON,"--ERROR!--",PROVEX," was TERMINATED before the date of this encounter.",IORVOFF D HELP1^PXBUTL1("CON") R OK:DTIME
 ; end patch *186*
 ;
 ;---------3/17/97--PART OF FUTURE PATCH 27
 I '$G(NOT) D
 .N CLASS
 .S CLASS=$$GET^XUA4A72(PROVIDER,$P(VISIT,".")) I +CLASS<0 D  ;PX*1.0*205 moved + from in front of $$ to in front of CLASS
 ..D RSET^PXBDREQ("PRV") S FPRI=1
 ..W !,IOEDEOP,IORVON,"--ERROR!--",PROVEX," does not have an ACTIVE person class.",IORVOFF D HELP1^PXBUTL1("CON") R OK:DTIME
 .;---------END 3/17/97
 .I +CLASS'<0,$P(CLASS,U,7)="" D RSET^PXBDREQ("PRV") S FPRI=1 W !,IOEDEOP,IORVON,"--ERROR!--",PROVEX," does not have a VA CODE on PERSON CLASS.",IORVOFF D HELP1^PXBUTL1("CON") R OK:DTIME ;PX*1.0*205 added
AXIT ;--EXIT AND KILL
 K DIQ
 Q
PMPT ;--PROMT FOR COMFIRMATION OF USING INACTIVE PORVIDER
 S DIR("A")="Are you sure you want to select this provider? "
 S DIR("B")="NO"
 S DIR(0)="YA"
 D ^DIR
 I Y<1 D RSET^PXBDREQ("PRV")
 Q
 ;
ADDM ;--------If Multiple entries have been entered
 Q
 ;---NOT POSSIBLE TO ADD MULTIPLE PROVIDERS
 ;
DELM ;--------If Multiple deleting
 ;
 N DELM,CNT,CPTPRV,PXBJ,BAD,PXBLEN,BDATA
 S (NF,CNT)=0,PXBLEN=0 S $P(DELM,"^",1)=1
 I $E(DATA,1)="@" S DATA=$P(DATA,"@",2),NF=1 D
 .S PXBLEN=$L(DATA,",") F PXI=1:1:PXBLEN S PXBPIECE=$P(DATA,",",PXI) D
 ..I PXBPIECE'["-"&(PXBPIECE'>0!(PXBPIECE'<(PXBCNT+1))) S BAD(+$G(PXBPIECE))="" Q
 ..I PXBPIECE'["-" D
 ...I $D(GONE(PXBPIECE)) Q
 ...Q:PXBPIECE'?.N
 ...Q:+PXBPIECE'=PXBPIECE
 ...S $P(REQI,"^",7)=$O(PXBSKY(PXBPIECE,0)) ;-IEN
 ...S X=$P(PXBSAM(PXBPIECE),"^",1),DIC="^VA(200,",DIC(0)="ZM" D ^DIC
 ...S $P(REQI,"^",1)=+Y S CPTPRV=+Y K Y
 ...S $P(REQI,"^",2)=$P(PXBSAM(PXBPIECE),"^",2) K Y
 ...S GONE(PXBPIECE)=""
 ...D EN0^PXBSTOR(PXBVST,PATIENT,REQI,$G(PXMREQ))
 ...D EN1^PXKMAIN
 ...I $G(WHAT)["CPT" D DCPT^PXBSTOR1(CPTPRV,PXBVST)
 ..I PXBPIECE["-" D
 ...S PXBJ=0 F PXBJ=$P(PXBPIECE,"-",1):1:$P(PXBPIECE,"-",2) D
 ....I $D(GONE(PXBJ)) Q
 ....I PXBJ'>0!(PXBJ'<(PXBCNT+1)) S BAD(PXBJ)="" Q
 ....S $P(REQI,"^",7)=$O(PXBSKY(PXBJ,0)) ;-IEN
 ....S X=$P(PXBSAM(PXBJ),"^",1),DIC="^VA(200,",DIC(0)="ZM" D ^DIC
 ....S $P(REQI,"^",1)=+Y S CPTPRV=+Y K Y
 ....S $P(REQI,"^",2)=$P(PXBSAM(PXBJ),"^",1)
 ....S GONE(PXBJ)=""
 ....D EN0^PXBSTOR(PXBVST,PATIENT,REQI,$G(PXMREQ))
 ....D EN1^PXKMAIN
 ....I $G(WHAT)["CPT" D DCPT^PXBSTOR1(CPTPRV,PXBVST)
 K GONE
 I $G(NF)&($D(BAD)) D  Q
 .S (BDATA,EDATA)="" F  S BDATA=$O(BAD(BDATA)) Q:BDATA=""  S EDATA=EDATA_BDATA_"  "
 .D WIN17^PXBCC(PXBCNT)
 .W ! D HELP^PXBUTL0("PRVMD") W !
 .S DIR(0)="E" D ^DIR K DIR
 .S:Y=1 DATA="^P" S:Y=0!(Y="") DATA="^" K Y
 I $G(NF)&('$D(BAD)) S DATA="^P" Q
 K PRVDR,PXBDPRV
 Q
 ;
PRI ;--Prompt for primary secondary provider
 ;
 N DIR,Y,X
 I $G(FPRI) Q
 W IOCUD,IOELALL,IOCUU
 S DIR("A")="Is this the PRIMARY provider for this ENCOUNTER? "
 S DIR("B")="YES"
 S DIR("?")="One PRIMARY Provider must be established for each patient encounter. 'Yes' will mean PRIMARY and 'No' will mean SECONDARY."
 S DIR(0)="Y,A,O"
 D ^DIR I $G(DIRUT) G PPXIT
PPFIN ;--Finish off variables
 I Y=1 S PRI="P^PRIMARY"
 I Y=0 S PRI="S^SECONDARY"
 S $P(REQI,"^",2)=$P(PRI,"^",1)
 S $P(REQE,"^",2)=$P(PRI,"^",2)
PPXIT ;--EXIT
 Q