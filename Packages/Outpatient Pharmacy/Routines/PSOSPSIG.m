PSOSPSIG ;BIR/RTR,SAB-Parse out and create other lang. Sig ;9/24/01
 ;;7.0;OUTPATIENT PHARMACY;**117,333,282**;DEC 1997;Build 18
 ;PSSORPH - DBIA 3234 ;^PS(50.606 - DBIA 2174 ;^PS(50.7 - DBIA 2223
 ;^PS(51.2 - DBIA 2226 ;^PS(51 - DBIA 2224 ;^PSDRUG - DBIA 221
 ;^PS(59.7 - DBIA 694 ;^PS(51.1 - DBIA 2225
 ;
EN(PSOFX) ;
 K SIG9,PSNOUN,PSOROUTE,SIG0 S OI=$P($G(^PSRX(RX,"OR1")),"^") Q:'$G(OI)
 S (FND,TODOSE)=0 F WW=0:0 S WW=$O(PSOFX("DOSE",WW)) Q:'WW  S TODOSE=WW
 S:TODOSE FND=1 Q:'TODOSE  S SIGDS=+$P($G(^PS(50.7,OI,0)),"^",2)
 S PREP=$S($P($G(^PS(50.606,SIGDS,"MISC1")),"^",2)]"":$P(^PS(50.606,SIGDS,"MISC1"),"^",2),1:$P($G(^PS(50.606,SIGDS,"MISC")),"^",3))
 S RTCNT=0 K RTC,RTCA,RTCF F SSS=1:1:TODOSE D
 .S SIG0(SSS)=$S($G(PSOFX("DOSE ORDERED",SSS))'="":$G(PSOFX("DOSE ORDERED",SSS)),1:$G(PSOFX("DOSE",SSS))) ;local dosage check
 .I $G(PSOFX("DOSE ORDERED",SSS))="" S LODS=$O(^PSDRUG($P(^PSRX(RX,0),"^",6),"DOS2","B",SIG0(SSS),0)) I LODS D
 ..S:$P(^PSDRUG($P(^PSRX(RX,0),"^",6),"DOS2",LODS,0),"^",4)]"" PSOFX("DOSE ORDERED",SSS)=$P(^PSDRUG($P(^PSRX(RX,0),"^",6),"DOS2",LODS,0),"^",4) K LODS
 .S VERBX(SSS)=$S($G(PSOFX("VERB",SSS))]""&($P($G(^PS(50.606,SIGDS,"MISC1")),"^")]""):$P(^PS(50.606,SIGDS,"MISC1"),"^"),1:$G(PSOFX("VERB",SSS)))
 .I $G(PSOFX("NOUN",SSS))]"" D NON
 .S RTC=+$G(PSOFX("ROUTE",SSS)) I RTC S:'RTCNT RTCA=RTC S RTCNT=RTCNT+1
 .I RTCNT>1,$G(RTC),$G(RTC)'=$G(RTCA) S RTCF=1
 .S PSOROUTE(SSS)=$S($P($G(^PS(51.2,+$G(PSOFX("ROUTE",SSS)),0)),"^",7)]"":$P(^(0),"^",7),$P($G(^(0)),"^",2)]"":$P(^(0),"^",2),$P($G(^(0)),"^",3)]"":$P(^(0),"^",3),1:$P($G(^(0)),"^"))
 .S MEDEXP(SSS)=$S($P($G(^PS(51.2,+$G(PSOFX("ROUTE",SSS)),0)),"^",2)="":0,1:1)
 .S PDAYS(SSS)=$G(PSOFX("DURATION",SSS))
 .I $G(PSOFX("DURATION",SSS))]"",($E(PSOFX("DURATION",SSS),$L(PSOFX("DURATION",SSS)))'?1A) S PDAYS(SSS)=PDAYS(SSS)_"D"
 .S FOR=$O(^PS(59.7,"AOTH","FOR","")) S FOR=$S(FOR]"":FOR,1:"FOR")
 .S PSDUR(SSS)=$S($G(PDAYS(SSS))']"":"NULL",1:FOR_" "_$E($G(PDAYS(SSS)),1,($L($G(PDAYS(SSS)))-1))) D  I PSDUR(SSS)'="NULL" S PSDUR(SSS)=PSDUR(SSS)_" "_INTERVAL
 ..I PSDUR(SSS)'="NULL" S INTERVAL=$E(PDAYS(SSS),$L(PDAYS(SSS))),INTERVAL=$S(INTERVAL="D":"DAYS",INTERVAL="W":"WEEKS",INTERVAL="H":"HOURS",INTERVAL="L":"MONTHS",INTERVAL="M":"MINUTES",INTERVAL="S":"SECONDS",1:"") D
 ...Q:$G(INTERVAL)']""  S INTERVAL=$O(^PS(59.7,"AOTH",INTERVAL,""))
 ...I $G(PSOFX("DURATION",SSS)),$G(PSOFX("DURATION",SSS))'>1 S INTERVAL=$E(INTERVAL,1,($L(INTERVAL)-1))
 ;282 Schedule Expander Changed
 F GGG=1:1:TODOSE S SCHED(GGG)=$$SCHE^PSOSIG($G(PSOFX("SCHEDULE",GGG)))
 ;282 End Change
 S (RTC,RTCA,PSOBDCT)=0 F FFF=0:0 S FFF=$O(SIG0(FFF)) Q:'FFF  D
 .K PSOSG1,PSOSG2 S VERB=$G(VERBX(FFF)) D VERB D:$G(PSNOUN(FFF))'=""&('$G(PSOSG1)) SSS
 .D FRAC
 .S SIG2(FFF)=$S($G(VERB)'=""&('$G(PSOSG1)):$G(VERB)_" ",1:"")_$S($G(PSOFX("DOSE ORDERED",FFF))'="":$S($G(PSOFRAC)'="":$G(PSOFRAC),1:$G(PSOFX("DOSE ORDERED",FFF)))_" ",1:$G(PSOFX("DOSE",FFF))_" ")
 .S PSOBDCT=PSOBDCT+1
 .K PSOFRAC,PSOFRACX
 .I RTC>0,$G(PSOROUTE(FFF))'="",'$G(RTCF) S RTCA=1
 .I $G(PSOROUTE(FFF))'="" S RTC=RTC+1
 .S SIG2(FFF)=SIG2(FFF)_$S($G(PSNOUN(FFF))'=""&('$G(PSOSG2)):$G(PSNOUN(FFF))_" ",1:"")_$S(PREP'=""&($G(MEDEXP(FFF)))&('RTCA):PREP_" ",1:"")
 .S SIG2(FFF)=SIG2(FFF)_$S(PSOROUTE(FFF)'=""&('RTCA):PSOROUTE(FFF)_" ",1:"")
 .S SIG2(FFF)=SIG2(FFF)_$S(SCHED(FFF)'="":SCHED(FFF)_$S($G(PSDUR(FFF))="NULL"&($G(PSOFX("CONJUNCTION",FFF))="")&('$O(SIG0(FFF))):"",1:" "),1:"")
 .S PSOCJ=$E($G(PSOFX("CONJUNCTION",FFF)))
 .S CON=$S($G(PSOCJ)="A":"AND",$G(PSOCJ)="T":"THEN",$G(PSOCJ)="S":"THEN",$G(PSOCJ)="X":"EXCEPT",1:"") I CON]"" S CON=$O(^PS(59.7,"AOTH",CON,""))
 .S SIG2(FFF)=SIG2(FFF)_$S(PSDUR(FFF)'="NULL":PSDUR(FFF)_$S($G(PSOFX("CONJUNCTION",FFF))=""&('$O(SIG0(FFF))):"",1:", "),1:"")_CON
 .K PSOSG1,PSOSG2
 .K PSOUCS S SIG2(FFF)=$$UPPER(SIG2(FFF)) K PSOUCS
 S PSODCT="" F  S PSODCT=$O(PSOFX("SIG",PSODCT)) Q:PSODCT=""  S PSOBDCT=PSOBDCT+1 S SIG2(PSOBDCT)=$G(PSOFX("SIG",PSODCT)) K PSOUCS S SIG2(PSOBDCT)=$$UPPER(SIG2(PSOBDCT)) K PSOUCS
STUFF ;
 S DCOUNT=0
 I '$D(SIG2(1)) G QUIT
 I '$O(SIG2(1)),$L(SIG2(1))<71 S SIG9(1)=SIG2(1)
 S (VAR,VAR1)="",II=1
 F FF=0:0 S FF=$O(SIG2(FF)) Q:'FF  S CT=0 F NN=1:1:$L(SIG2(FF)) I $E(SIG2(FF),NN)=" "!($L(SIG2(FF))=NN) S CT=CT+1 D  I $L(VAR)>70 S SIG9(II)=LIM_" ",II=II+1,VAR=VAR1
 .S VAR1=$P(SIG2(FF)," ",(CT))
 .S LIM=VAR
 .S VAR=$S(VAR="":VAR1,1:VAR_" "_VAR1)
 I $G(VAR)'="" S SIG9(II)=VAR
QUIT K SSS,TT,DCOUNT,PREP,VERB,FFF,GGG,SIGDS,SIGRT,PSOROUTE,PSOSG1,PSOSG2 Q
SIG1 ;
 F FFF=0:0 S FFF=$O(SIG0(FFF)) Q:'FFF  S SIG2(FFF)=SIG0(FFF)
 Q
DAYS I +$E($P(SIG1(TT),"^",2))!($E($P(SIG1(TT),"^",2))=0) S $P(SIG1(TT),"^",2)="D"_$P(SIG1(TT),"^",2)
 Q
NON ;
 S NN=PSOFX("NOUN",SSS)
 S NOUN=$O(^PS(50.606,SIGDS,"NOUN","B",NN,0)) I NOUN S PSNOUN(SSS)=$S($G(^PS(50.606,SIGDS,"NOUN",NOUN,1))]"":^PS(50.606,SIGDS,"NOUN",NOUN,1),1:NN) K NN Q
 N PSONN S PSONN=NN K NN,NOUN D DOSE^PSSORPH(.XDOSE,$P(^PSRX(RX,0),"^",6),"O") I $P($G(XDOSE("DD",$P(^PSRX(RX,0),"^",6))),"^",9)="" S PSNOUN(SSS)=PSONN Q  ;*333
 S NN=$P(XDOSE("DD",$P(^PSRX(RX,0),"^",6)),"^",9),NOUN=$O(^PS(50.606,SIGDS,"NOUN","B",NN,0))
 I NOUN S PSNOUN(SSS)=$S($G(^PS(50.606,SIGDS,"NOUN",NOUN,1))]"":^PS(50.606,SIGDS,"NOUN",NOUN,1),1:NN)
 K XDOSE,NN Q
VERB ;Check if verb and noun need to be added to SIG
 K PSOLCS,PSOUCS,PSOISL,PSOVL
 I $G(VERB)'="" S PSOVL=$L(VERB),PSOISL=$E($G(SIG0(FFF)),1,$G(PSOVL)) I $G(PSOISL)'="" D
 .S PSOUCS=VERB
 .S PSOUCS=$$UPPER(PSOUCS) I PSOUCS=PSOISL S PSOSG1=1 Q
 .S PSOUCS=$$LOWER(PSOUCS) I PSOUCS=PSOISL S PSOSG1=1 Q
 .S PSOUCS=$$UPPER($E(PSOUCS,1))_$$LOWER($E(PSOUCS,2,99)) I PSOUCS=PSOISL S PSOSG1=1 Q
 I $G(PSNOUN(FFF))="" G VERBEX
 S PSOISL=$G(SIG0(FFF)) I $G(PSOISL)="" G VERBEX
 S PSOVL=$F(PSNOUN(FFF),"(")
 I $G(PSOVL)>2 S PSOUCS=$E(PSNOUN(FFF),1,(PSOVL-2))
 I $G(PSOVL)'>2 S PSOUCS=PSNOUN(FFF)
 I $G(PSOISL)'="" D
 .S PSOUCS=$$UPPER(PSOUCS) I PSOISL[PSOUCS S PSOSG2=1 Q
 .S PSOUCS=$$LOWER(PSOUCS) I PSOISL[PSOUCS S PSOSG2=1 Q
 .S PSOUCS=$$UPPER($E(PSOUCS,1))_$$LOWER($E(PSOUCS,2,99)) I PSOISL[PSOUCS S PSOSG2=1
VERBEX K PSOLCS,PSOUCS,PSOISL,PSOVL Q
 ;
UPPER(PSOUCS) ;
 Q $TR(PSOUCS,"abcdefghijklmnopqrstuvwxyz","ABCDEFGHIJKLMNOPQRSTUVWXYZ")
 ;
LOWER(PSOLCS) ;
 Q $TR(PSOLCS,"ABCDEFGHIJKLMNOPQRSTUVWXYZ","abcdefghijklmnopqrstuvwxyz")
 Q
 ;
SSS ;
 K PSOFNL,PSOFNLF,PSOFNLX
 Q:$G(PSNOUN(FFF))=""
 Q:$L(PSNOUN(FFF))'>3
 Q:'$G(PSOFX("DOSE ORDERED",FFF))
 S PSOFNL=$E(PSNOUN(FFF),($L(PSNOUN(FFF))-2),$L(PSNOUN(FFF)))
 I $G(PSOFNL)="(S)"!($G(PSOFNL)="(s)") D
 .I $G(PSOFX("DOSE ORDERED",FFF))'>1 S PSNOUN(FFF)=$E(PSNOUN(FFF),1,($L(PSNOUN(FFF))-3))
 .I $G(PSOFX("DOSE ORDERED",FFF))>1 S PSNOUN(FFF)=$E(PSNOUN(FFF),1,($L(PSNOUN(FFF))-3))_$E(PSOFNL,2)
 Q
FRAC ;
 K PSOFRAC,PSOFRACX,PSOFRAC1,PSOFRAC2
 I $G(PSOFX("DOSE ORDERED",FFF))="" Q
 I $G(PSOFX("DOSE ORDERED",FFF))'["." S (PSOFRAC1,PSOFRAC)=$G(PSOFX("DOSE ORDERED",FFF)) D NUM D  G FRACQ
 .I $G(PSOFRAC1)=$G(PSOFRAC) K PSOFRAC,PSOFRAC1 Q
 .S PSOFRAC=$G(PSOFRAC1)
 S PSOFRAC1=$P(PSOFX("DOSE ORDERED",FFF),"."),PSOFRAC2=$P(PSOFX("DOSE ORDERED",FFF),".",2)
 S PSOFRACX="."_$G(PSOFRAC2)
 S PSOFRAC=$S(PSOFRACX=".5":"ONE-HALF",PSOFRACX=".25":"ONE-FOURTH",PSOFRACX=".33":"ONE-THIRD",PSOFRACX=".34":"ONE-THIRD",PSOFRACX=".50":"ONE-HALF",PSOFRACX=".66":"TWO-THIRDS",PSOFRACX=".67":"TWO-THIRDS",PSOFRACX=".75":"THREE-FOURTHS",1:PSOFRACX)
 S PSOFRAC9=$O(^PS(59.7,"AOTH",PSOFRAC,"")) I PSOFRAC9]"" S PSOFRAC=PSOFRAC9
 K PSOFRAC9
 I $G(PSOFRAC)="" K PSOFRAC G FRACQ
 I $G(PSOFRAC1)'="",+$G(PSOFRAC1) D
 .D NUM S AND=$O(^PS(59.7,"AOTH","AND",""))
 .S PSOFRAC=$G(PSOFRAC1)_" "_$S(AND]"":AND,1:"AND")_" "_$S($E($G(PSOFRAC),1)=".":"0",1:"")_$G(PSOFRAC)
 I $E($G(PSOFRAC),1)="." S PSOFRAC="0"_$G(PSOFRAC)
FRACQ K PSOFRAC1,PSOFRAC2,AND
 Q
NUM ;
 Q:$G(PSOFRAC1)=""
 S PSOFRAC1=$S(PSOFRAC1="1":"ONE",PSOFRAC1="2":"TWO",PSOFRAC1="3":"THREE",PSOFRAC1="4":"FOUR",PSOFRAC1="5":"FIVE",PSOFRAC1="6":"SIX",PSOFRAC1="7":"SEVEN",PSOFRAC1="8":"EIGHT",PSOFRAC1="9":"NINE",PSOFRAC1="10":"TEN",1:PSOFRAC1)
 S PSOFRAC9=$O(^PS(59.7,"AOTH",PSOFRAC1,"")) I PSOFRAC9]"" S PSOFRAC1=PSOFRAC9
 K PSOFRAC9
 Q