PSSORPH ;BIR/RSB/RTR-Dosage choices by Dispense Drug ; 8/31/12 1:57pm
 ;;1.0;PHARMACY DATA MANAGEMENT;**34,38,49,69,150**;9/30/97;Build 2
 ;Reference to ^PS(50.607 supported by DBIA 2221
 ;Reference to ^YSCL(603.01 supported by DBIA 2697
 ;Reference to ^PSNAPIS supported by DBIA 2531
 ;
DOSE(PSSX,PD,TYPE,PSSDFN,PSSUPD) ;
 K PSSX
 ; PSSX - Target variable for returned data
 ; PD - Pharmacy Dispense Drug
 ; TYPE - Type of Drug (O:Outpt, U:Unit Dose, I:IV, X:Non-VA Med)
 ; PSSDFN - Patient IEN
 ; PSSUPD - Units per Dose
 N DLOOP,DCNT1,DLOOP1,LOW,FORM,PSSOIU,PSSLOW,PSSLOW1,PSSLOW2,PSOLC,PL,PSSHOLD,PSSA,PSSZ,PSSC,PSIEN,PSSTRN,PSSDSE,PSSVERB,PSSPREP,PSSCLO,PSSDEA,PSSMAX,PSSDLP,PSNN,PSNNN,PSSREQS,PSSLOW4,PL2,PSSA1,PL3,POPD,PSSUNITZ,PSSLDV,PSSLDN,PSSUNITX
 N PSSDOSE,PSSUNTS,PSSUDOS,PSSMD,PSSMD1,PSSMDN,PSSBC,PSSOLDN
 S POPD=+$P($G(^PSDRUG(PD,2)),"^")
 S PSSOIU=$S(TYPE="I":1,TYPE="U":1,1:0)
 I $G(PSSUPD) G ^PSSORPH1
 S DLOOP=PD D
 .Q:'$O(^PSDRUG(DLOOP,"DOS1",0))
 .S PSSTRN=$P($G(^PSDRUG(DLOOP,"DOS")),"^"),PSSUNITZ=$P($G(^("DOS")),"^",2) Q:PSSTRN=""
 .S PSSUNITX=$S($P($G(^PS(50.607,+$G(PSSUNITZ),0)),"^")'=""&($P($G(^(0)),"^")'["/"):$P($G(^(0)),"^"),1:"")
 .Q:$G(^PSDRUG(DLOOP,"I"))]""&($G(^("I"))'>DT)  ; omit inactive drugs
 .;Q:$P($G(^PSDRUG(DLOOP,2)),"^",3)'[TYPE
 .S PSSDSE=+$P($G(^PS(50.7,POPD,0)),"^",2),PSSVERB=$P($G(^PS(50.606,PSSDSE,"MISC")),"^"),PSSPREP=$P($G(^("MISC")),"^",3)
 .K PSNNN F PSNN=0:0 S PSNN=$O(^PS(50.606,PSSDSE,"NOUN",PSNN)) Q:'PSNN!($D(PSNNN))  S:$P($G(^(PSNN,0)),"^")'="" PSNNN=$P($G(^(0)),"^")
 .; Set each possible dose node
 .F DLOOP1=0:0 S DLOOP1=$O(^PSDRUG(DLOOP,"DOS1",DLOOP1)) Q:'DLOOP1  D
 ..Q:'$D(^PSDRUG(DLOOP,"DOS1",DLOOP1,0))
 ..I PSSOIU,$P($G(^PSDRUG(DLOOP,"DOS1",DLOOP1,0)),"^",3)'["I" Q
 ..I 'PSSOIU,$P($G(^PSDRUG(DLOOP,"DOS1",DLOOP1,0)),"^",3)'["O" Q
 ..S (PSSDOSE,PSSUNTS,PSSUDOS,PSSBC)=""
 ..S PSSDOSE=$P($G(^PSDRUG(DLOOP,"DOS1",DLOOP1,0)),"^",2)
 ..S PSSUNTS=$P($G(^PS(50.607,+$P($G(^PSDRUG(DLOOP,"DOS")),"^",2),0)),"^")
 ..S PSSUDOS=$P($G(^PSDRUG(DLOOP,"DOS1",DLOOP1,0)),"^"),PSSBC=$P($G(^(0)),"^",4)
 ..I PSSDOSE]""&(PSSUDOS]"") D
 ...S DCNT1=$S('$D(DCNT1):1,1:DCNT1+1)
 ...S LOW(PSSDOSE,PSSUDOS,DCNT1)=""
 ...S FORM(PSSDOSE,$S($P($G(^PSDRUG(DLOOP,0)),"^",9)=1:1,1:0),DCNT1)=PSSUDOS
 ...D PARN
 ...S PSSX(DCNT1)=PSSDOSE_"^"_$S("OX"[$G(TYPE):$G(PSSUNITZ),1:$G(PSSUNTS))_"^"_PSSUDOS_"^"_DLOOP_"^"_$G(PSSTRN)_"^"_$S($G(PSSNP)'="":$G(PSSNP),1:$G(PSNNN))_"^"_$P($G(^PS(50.606,+$G(PSSDSE),0)),"^")_"^"_$G(PSSVERB)_"^"_$G(PSSPREP)
 ...S PSSX(DCNT1)=PSSX(DCNT1)_$S("OX"'[$G(TYPE):"^^^"_$G(PSSBC),1:"")
 ...K PSSNP,PSSBC
 I '$O(PSSX(0)) G DOSE2
 ; delete non-formulary doses if formulary doses exist
 S PSSLOW="" F  S PSSLOW=$O(FORM(PSSLOW)) Q:PSSLOW=""  D
 .I $O(FORM(PSSLOW,0,0)) S PSSLOW2="" F  S PSSLOW2=$O(FORM(PSSLOW,1,PSSLOW2)) Q:PSSLOW2=""  K PSSX(PSSLOW2),LOW(PSSLOW,+$G(FORM(PSSLOW,1,PSSLOW2)),PSSLOW2)
 ;Find lowest units per dose
 S PSSLOW="" F  S PSSLOW=$O(LOW(PSSLOW)) Q:PSSLOW=""  D
 .S PSOLC=0 S PSSLOW1="" F  S PSSLOW1=$O(LOW(PSSLOW,PSSLOW1)) Q:PSSLOW1=""  D
 ..S PSOLC=PSOLC+1 S:PSOLC=1 PSSLOW4=$O(LOW(PSSLOW,PSSLOW1,0))
 ..S PSSLOW2="" F  S PSSLOW2=$O(LOW(PSSLOW,PSSLOW1,PSSLOW2)) Q:PSSLOW2=""  D
 ...I PSOLC>1 S PSSX(PSSLOW4,(PSOLC-1))=PSSX(PSSLOW2) K PSSX(PSSLOW2)
 K PSSHOLD S PL="" F  S PL=$O(PSSX(PL)) Q:PL=""  S PSSHOLD($P(PSSX(PL),"^"),PL)=PSSX(PL) I $O(PSSX(PL,0)) D
 .S PL2="" F  S PL2=$O(PSSX(PL,PL2)) Q:PL2=""  S PSSHOLD($P(PSSX(PL,PL2),"^"),PL,PL2)=PSSX(PL,PL2)
 K PSSX S PSSA=1,PSSZ="" F  S PSSZ=$O(PSSHOLD(PSSZ)) Q:PSSZ=""  F PSSC=0:0 S PSSC=$O(PSSHOLD(PSSZ,PSSC)) Q:'PSSC  S PSSX(PSSA)=PSSHOLD(PSSZ,PSSC) D SLS D:'$D(PSSX("DD",+$P(PSSX(PSSA),"^",4)))  D:$O(PSSHOLD(PSSZ,PSSC,0)) MULTI S PSSA=PSSA+1
 .S (PSIEN,DLOOP)=+$P(PSSX(PSSA),"^",4) K PSSMAX D:$G(TYPE)["O" MAX
 .S PSSX("DD",PSIEN)=$P($G(^PSDRUG(PSIEN,0)),"^")_"^"_$P($G(^(660)),"^",6)_"^"_$P($G(^(0)),"^",9)_"^"_$P($G(^(660)),"^",8)_"^"_$P($G(^("DOS")),"^")_"^"_$G(PSSUNITX)_"^"_$G(PSSMAX)
 .D REQS S PSSX("DD",PSIEN)=PSSX("DD",PSIEN)_"^"_$G(PSSREQS)_"^"_$G(PSNNN)_"^"_$G(PSSVERB)_"^"_1
 K PSSHOLD
 D LEADP^PSSUTLA1
 Q
DOSE2 ;Local Dose
 N PSOCT,PSONDS,PSOND,PSOND1,PSONDX,PSONDU,PSODOS,PSLOC,PSLOCV,PSODUPD
 S PSOCT=1
 S DLOOP=PD D
 .I $P($G(^PSDRUG(DLOOP,"I")),"^"),+$P($G(^("I")),"^")<DT Q
 .;Q:$P($G(^PSDRUG(DLOOP,2)),"^",3)'[TYPE
 .Q:'$O(^PSDRUG(DLOOP,"DOS2",0))
 .S PSONDS=$P($G(^PSDRUG(DLOOP,"DOS")),"^"),PSONDU=$P($G(^("DOS")),"^",2),PSOND=$P($G(^("ND")),"^",3),PSOND1=$P($G(^("ND")),"^")
 .I PSOND,PSOND1 I PSONDS=""!('PSONDU) S PSONDX=$$DFSU^PSNAPIS(PSOND1,PSOND)
 .I PSONDS="",PSOND,PSOND1 S PSONDS=$P($G(PSONDX),"^",4)
 .I 'PSONDU,PSOND,PSOND1 S PSONDU=$P($G(PSONDX),"^",5)
 .S PSODOS=+$P($G(^PS(50.7,POPD,0)),"^",2)
 .;LOOK IN DOS2 NODE FOR LOCAL DOSES
 .F PSLOC=0:0 S PSLOC=$O(^PSDRUG(DLOOP,"DOS2",PSLOC)) Q:'PSLOC  D
 ..S PSLOCV=$P($G(^PSDRUG(DLOOP,"DOS2",PSLOC,0)),"^") Q:PSLOCV=""
 ..S PSSBC=$P($G(^PSDRUG(DLOOP,"DOS2",PSLOC,0)),"^",3)
 ..S PSSOLDN=$P($G(^PSDRUG(DLOOP,"DOS2",PSLOC,0)),"^",4)
 ..I PSSOIU,$P($G(^PSDRUG(DLOOP,"DOS2",PSLOC,0)),"^",2)'["I" Q
 ..I 'PSSOIU,$P($G(^PSDRUG(DLOOP,"DOS2",PSLOC,0)),"^",2)'["O" Q
 ..D SET2
 ;IF NO LOCAL DOSES, RETURN ANY DRUGS YOU CAN
 K PSSBC,PSSOLDN
 I '$O(PSSX(0)) K PSLOCV S PSOCT=1 D
 .S DLOOP=PD D
 ..I $P($G(^PSDRUG(DLOOP,"I")),"^"),+$P($G(^("I")),"^")<DT Q
 ..;Q:$P($G(^PSDRUG(DLOOP,2)),"^",3)'[TYPE
 ..S PSONDS=$P($G(^PSDRUG(DLOOP,"DOS")),"^"),PSONDU=$P($G(^("DOS")),"^",2),PSOND=$P($G(^("ND")),"^",3),PSOND1=$P($G(^("ND")),"^")
 ..K PSONDX I PSOND,PSOND1 I PSONDS=""!('PSONDU) S PSONDX=$$DFSU^PSNAPIS(PSOND1,PSOND)
 ..I PSONDS="",PSOND,PSOND1 S PSONDS=$P($G(PSONDX),"^",4)
 ..I 'PSONDU,PSOND,PSOND1 S PSONDU=$P($G(PSONDX),"^",5)
 ..S PSODOS=+$P($G(^PS(50.7,POPD,0)),"^",2)
 ..D SET2
 D LEADP^PSSUTLA1
 Q
SET2 ;
 D ZSET
 I $G(PSLOCV)'="",$G(PSLOCV)["&" D AMP^PSSORPH1
 S PSSX(PSOCT)="^"_$S($G(PSONDU)=0:"",1:$G(PSONDU))_"^"_$G(PSLOCV)_"^"_DLOOP_"^"_$G(PSONDS)_"^"_$G(PSSLDN)_"^"_$P($G(^PS(50.606,+$G(PSODOS),0)),"^")_"^"_$P($G(^("MISC")),"^")_"^"_$P($G(^("MISC")),"^",3)
 S PSSX(PSOCT)=PSSX(PSOCT)_"^"_$P($G(^PS(50.606,+$G(PSODOS),"MISC")),"^",4)_$S("OX"'[$G(TYPE):"^^"_$G(PSSBC),1:"")
 S $P(PSSX(PSOCT),"^",13)=$G(PSSOLDN)
 I '$D(PSSX("DD",DLOOP)) D
 .D REQS
 .K PSSMAX I $G(TYPE)["O" D MAX
 .S PSSX("DD",DLOOP)=$P($G(^PSDRUG(DLOOP,0)),"^")_"^"_$P($G(^(660)),"^",6)_"^"_$P($G(^(0)),"^",9)_"^"_$P($G(^(660)),"^",8)_"^"_$G(PSONDS)_"^"_$S($G(PSONDU):$P($G(^PS(50.607,+$G(PSONDU),0)),"^"),1:"")_"^"_$G(PSSMAX)_"^"_$G(PSSREQS)
 .S PSSX("DD",DLOOP)=PSSX("DD",DLOOP)_"^"_$G(PSSLDN)_"^"_$G(PSSLDV)_"^"_0
 S PSOCT=PSOCT+1
 Q
ZSET ;
 K PSSLDN,PSSLNV
 S PSSLDV=$P($G(^PS(50.606,+$G(PSODOS),"MISC")),"^")
 ;K PSSLDN F PSSLDNN=0:0 S PSSLDNN=$O(^PS(50.606,+$G(PSODOS),"NOUN",PSSLDNN)) Q:'PSSLDNN!($D(PSSLDN))  S:$P($G(^(PSSLDNN,0)),"^")'="" PSSLDN=$P($G(^(0)),"^")
 K PSSLDNN
 Q
MAX ;
 K PSSMAX S PSSDEA=$P($G(^PSDRUG(DLOOP,0)),"^",3)
 I PSSDEA["1"!(PSSDEA["2") S PSSMAX=0 Q
 I PSSDEA["A",PSSDEA'["B" S PSSMAX=0 Q
 I $P($G(^PSDRUG(DLOOP,"CLOZ1")),"^")="PSOCLO1",$G(PSSDFN) D  Q
 .S PSSCLO=$O(^YSCL(603.01,"C",PSSDFN,0)) I PSSCLO,$P($G(^YSCL(603.01,+PSSCLO,0)),"^",3)="B" S PSSMAX=1 Q
 .S PSSMAX=0
 I PSSDEA["3"!(PSSDEA["4")!(PSSDEA["5") S PSSMAX=5 Q
 S PSSMAX=11
 Q
SLS ;Convert dosage with /
 Q:'$D(PSSX(PSSA))
 ;*150 Correct Slash dosages
 K PSSDZUNT
 N PSSF,PSSF1,PSSF2,PSSG,PSSFA,PSSFA1,PSSFB,PSSFB1,PSSDZI,PSSDZSL,PSSDZND,PSSDZSL1,PSSDZSL2,PSSDZSL3,PSSDZSL4,PSSDZSL5,PSSDZ50,PSSGIEN
 S PSSF=$P($G(PSSX(PSSA)),"^"),PSSG=$P($G(PSSX(PSSA)),"^",2)
 I $G(^PS(50.607,PSSG,0))]"" S PSSGIEN=PSSG,PSSG=$P($G(^PS(50.607,PSSG,0)),"^")
 I PSSG'["/" S $P(PSSX(PSSA),"^",11)=$P($G(PSSX(PSSA)),"^")_$G(PSSUNTS) Q
 S PSSDZSL=0,PSSDZI=+$P($G(PSSX(PSSA)),"^",4),PSSDZ50=$P($G(^PSDRUG(PSSDZI,"DOS")),"^")
 S PSSDZND=$$PSJST^PSNAPIS(+$P($G(^PSDRUG(PSSDZI,"ND")),"^"),+$P($G(^PSDRUG(PSSDZI,"ND")),"^",3)) S PSSDZND=+$P($G(PSSDZND),"^",2) ;I $G(PSSDZND),$G(PSSDZ50),+$G(PSSDZND)'=+$G(PSSDZ50) S PSSDZSL=1
 S PSSFA=$P(PSSG,"/"),PSSFB=$P(PSSG,"/",2),PSSFA1=+$G(PSSFA),PSSFB1=+$G(PSSFB)
 I '$G(PSSDZND) S $P(PSSX(PSSA),"^",11)=$P(PSSX(PSSA),"^") G SLSQ
 S PSSDZSL2=PSSDZ50/PSSDZND,PSSDZSL3=PSSDZSL2*+$P($G(PSSX(PSSA)),"^",3) S PSSDZSL4=PSSDZSL3*$S($G(PSSFB1):PSSFB1,1:1) S PSSDZSL5=$S('$G(PSSFB1):PSSDZSL4_$G(PSSFB),1:PSSDZSL4_$P(PSSFB,PSSFB1,2))
 S PSSF2=$S('$G(PSSFA1):PSSF,1:($G(PSSFA1)*PSSF))_$S($G(PSSFA1):$P(PSSFA,PSSFA1,2),1:PSSFA)_"/"_$G(PSSDZSL5)
 ;S PSSDZUNT=$P(PSSG,"/")_"/"_$G(PSSDZSL4)_$S('$G(PSSFB1):$G(PSSFB),1:$P(PSSFB,PSSFB1,2)) S $P(PSSX(PSSA),"^",2)=PSSDZUNT
 S PSSDZUNT=$P(PSSG,"/")_"/"_$G(PSSDZSL4)_$S('$G(PSSFB1):$G(PSSFB),1:$P(PSSFB,PSSFB1,2)) S $P(PSSX(PSSA),"^",2)=PSSDZUNT
 S $P(PSSX(PSSA),"^",11)=PSSF2
 S:$G(PSSGIEN) $P(PSSX(PSSA),"^",2)=PSSGIEN
SLSQ K PSSDZUNT
 Q
REQS ;Schedule requirement flag
 N PSSRF,PSSRFX,PSSRFZ
 S PSSREQS=1
 ;No longer needed
 Q
MULTI ;
 S PL3="" F  S PL3=$O(PSSHOLD(PSSZ,PSSC,PL3)) Q:PL3=""  S PSSX(PSSA,PL3)=PSSHOLD(PSSZ,PSSC,PL3) D:'$D(PSSX("DD",+$P(PSSX(PSSA,PL3),"^",4)))
 .S (PSIEN,DLOOP)=+$P(PSSX(PSSA,PL3),"^",4) K PSSMAX D:$G(TYPE)["O" MAX
 .S PSSX("DD",PSIEN)=$P($G(^PSDRUG(PSIEN,0)),"^")_"^"_$P($G(^(660)),"^",6)_"^"_$P($G(^(0)),"^",9)_"^"_$P($G(^(660)),"^",8)_"^"_$P($G(^("DOS")),"^")_"^"_$G(PSSUNITX)_"^"_$G(PSSMAX)
 .D REQS S PSSX("DD",PSIEN)=PSSX("DD",PSIEN)_"^"_$G(PSSREQS)_"^"_$G(PSNNN)_"^"_$G(PSSVERB)_"^"_1
 Q
PARN ;
 N PSSNPL K PSSNP
 Q:$G(PSNNN)=""
 Q:$L(PSNNN)'>3
 S PSSNPL=$E(PSNNN,($L(PSNNN)-2),$L(PSNNN))
 I $G(PSSNPL)="(S)"!($G(PSSNPL)="(s)") D
 .I $G(PSSUDOS)'>1 S PSSNP=$E(PSNNN,1,($L(PSNNN)-3))
 .I $G(PSSUDOS)>1 S PSSNP=$E(PSNNN,1,($L(PSNNN)-3))_$E(PSSNPL,2)
 Q
LEAD ;Add leading zeros
 F PSSMD=0:0 S PSSMD=$O(PSSX(PSSMD)) Q:'PSSMD  D
 .F PSSMDN=1,5,11 I $E($P(PSSX(PSSMD),"^",PSSMDN),1)="." S $P(PSSX(PSSMD),"^",PSSMDN)="0"_$P(PSSX(PSSMD),"^",PSSMDN)
 .I $O(PSSX(PSSMD,0)) D
 ..F PSSMD1=0:0 S PSSMD1=$O(PSSX(PSSMD,PSSMD1)) Q:'PSSMD1  D
 ...F PSSMDN=1,5,11 I $E($P(PSSX(PSSMD,PSSMD1),"^",PSSMDN),1)="." S $P(PSSX(PSSMD,PSSMD1),"^",PSSMDN)="0"_$P(PSSX(PSSMD,PSSMD1),"^",PSSMDN)
 S PSSMD="" F  S PSSMD=$O(PSSX("DD",PSSMD)) Q:PSSMD=""  D
 .I $E($P(PSSX("DD",PSSMD),"^",5),1)="." S $P(PSSX("DD",PSSMD),"^",5)="0"_$P(PSSX("DD",PSSMD),"^",5)
 Q