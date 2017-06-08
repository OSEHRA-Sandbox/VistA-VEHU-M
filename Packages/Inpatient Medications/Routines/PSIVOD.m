PSIVOD ;BIR/JCH-CREATE NEW IV ORDER FROM OLD ONE ;25 Nov 98 / 3:34 PM
 ;;5.0;INPATIENT MEDICATIONS;**110,127,181,281**;16 DEC 97;Build 113
 ;
 ; Reference to ^PS(55 is supported by DBIA 2191.
 ; Reference to ^ORX2 is supported by DBIA 867.
 ;
COPY(DFN,OLDON) ;Ask to enter new order.
 N PSIVOORD,OLDP,PSIVCOPY,PSGCOPY,I,% M OLDP=P
 Q:'$$HIDDEN^PSJLMUTL("COPY")  D ^PSJHVARS
 I $P($G(^PS(55,PSGP,"IV",+PSGORD,.2)),U,4)="D",'$P($G(^(4)),"^",3) D  G Q
 .W !!,"Nurse verified orders with a priority of DONE may not be Copied." D PAUSE^VALM1 Q
 S PSGOEAV=$P(PSJSYSP0,U,9)&PSJSYSU S PSIVOORD=PSJORD
 D FULL^VALM1
 F  W !!,"Do you want to copy this order" S %=2 D YN^DICN Q:%  D CH
 G:%'=1 Q
 S P("RES")="N",PSIVAC="PN",P("PON")=ON55,PSIVUP=+$$GTPCI^PSIVUTL,PSJORD=ON55,PSGORD=PSJORD
 N OLDACT,PSIVCHG S OLDACT=PSGACT S PSGACT=PSGACT_"E",P(17)="N",(P("LOG"),P("LF"))="",P(21)="" K P("NAT")
 S:'$G(PSGDT) PSGDT=$$DATE^PSJUTL2() S P("LOG")=PSGDT,P("PRNTON")=""
 D ENT^PSIVCAL,ENSTOP^PSIVCAL S ND4="^^^^" F I=5,6,8,9 S $P(ND2,"^",I)=""
 S P(17)=$S($G(PSGOEAV):"A",1:"N") S P("CLRK")=DUZ_"^"_$P($G(^VA(200,+DUZ,0)),"^")
 S PSIVCHG=0,PSJNEWOE=0,PSIVCOPY=1,VALMBCK="Q" K PSIVACEP
 NEW PSGORQF K PSGORQF D OC^PSIVOC G:$G(PSGORQF) Q
 N PSGORD,ON,ON55,PSJORD D NEW55^PSIVORFB S (PSJORD,ON)=ON55,PSIVCOPY=2
 D EN^VALM("PSJ LM IV AC/EDIT")
 I $G(P("NAT"))=""&($G(PSJORNAT)="") D  G Q
 .D FULL^VALM1 W !!,"Order not copied" D PAUSE^VALM1
 W !!,"...copying..."
 ;RTC 178789 - not to store allergy OC until either verify or quit as non-vf order
 ;D SETOC^PSJNEWOC(ON55)
 ;
 I '$G(PSGOEAV) D INMED
 ;
 D FULL^VALM1 W !!?5,"You are finished with the new order.",!,"The following ACTION prompt is for the original order." D PAUSE^VALM1
Q ; Kill and exit.
 L:'$D(PSJOE) -^PS(53.45,DUZ) S PSJNKF=1 D Q^PSIV
 K FIL,I1,ND,PC,PDM,PSGDT,PSGID,PSGLMT,PSGSI,PSJNARC,PSIVAC,PSIVCHG,PSIVUP,PSIVX,PSJOPC,PSJAGYSV
 S VALMBCK="R"
 I '$G(PSGDT) S PSGDT=$$DATE^PSJUTL2
 S PSGACT=$$ENACTION^PSGOE1(PSGP,PSIVOORD) ; resets PSGACT after copy
 D RESTORE^PSJHVARS
 K P M P=OLDP
 Q
 ;
INMED ;
 K PSJACEPT S VALMBCK="Q",PSIVCOPY=2,PSIVCHG=0 ;D ACEDIT^PSJLIACT
 N ON55TMP,P21TMP S ON55TMP=ON55,P21TMP=$G(P(21)) S P(21)="" I $G(ON55)["P",($G(PSJORD)["V") S ON55=PSJORD
 D DEL55^PSIVORE2 I $G(ON55TMP)]"" S ON55=ON55TMP,P(21)=P21TMP
 ;S (PSJORNAT,P("NAT"))="W"
 ;D OK^PSIVORE
 D EN^VALM("PSJ LM IV INPT ACTIVE")
 ;RTC 178789 - Store allergy OC as non-vf order
 D:$G(ON55)["P" SETOC^PSJNEWOC($G(ON55))
 L -^PS(55,DFN,"IV",+ON55) D ULK
 I $G(P("NAT"))="" D  G Q
 .D FULL^VALM1 W !!,"Order not copied" D PAUSE^VALM1
 Q
ULK ;
 Q:'$G(PSJLSORX)  ;If NEW^PSIVORE did not lock, don't kill it here.
 NEW X S X=DFN_";DPT(" D ULK^ORX2 K PSJLSORX
 Q
HK ;Queue job to print MAR labels generated for this patient.
 I PSGOP,PSGOP'=DFN D
 .N PSJACPF,PSJACNWP,PSJPWD,PSJSYSL,PSJSYSW,PSJSYSW0,DFN,VAIN,VAERR S DFN=PSGOP
 .D INP^VADPT S PSJPWD=+VAIN(4) I PSJPWD S PSJACPF=10 S PSJACPF=10 D WP^PSJAC D:$P(PSJSYSL,U,2)]"" ENQL^PSGLW
 S PSGOP=DFN
 Q
 ;
SPSOL S SPSOL=0 F XXX=0:0 S XXX=$O(^PS(55,DFN,"IV",+ON55,"SOL",XXX)) Q:'XXX  S SPSOL=SPSOL+$P(^(XXX,0),U,2)
 K XXX Q
CH ;
 W !!?2,"Answer 'YES' to have a new, non-verified order created for this patient,"
 W !,"using the information from this order.  (The START and STOP dates will be",!,"recalculated.)  Enter 'NO' (or '^') to stop now."
 Q