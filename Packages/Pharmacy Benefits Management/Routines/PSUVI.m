PSUVI ;BHM ISC/DEB - Gather IV statistics ;20SEP93
 ;;1.0; D&PPM ;;11 May 94
 K PSU,PSU1,PSU10,PSU2,PSU3,PSU4,PSU5,PSU41,PSU51,PSU6,PSU7,PSU8,DATA,PSUD,PSUD1,PSUDATA,X,XX,XXX,XXXX
 ;
IV ;loop through IV statisitcs global
ROOM S PSU=$S('$D(PSU):$O(^PS(50.8,0)),1:$O(^PS(50.8,PSU))) G Q:PSU'>0 K PSUDT G ROOM:'$D(^PS(50.8,PSU,2))
 ;
LOOPDT S PSUDT=$S('$D(PSUDT):PSUDT1,1:$O(^PS(50.8,PSU,2,PSUDT))) G ROOM:PSUDT="" G ROOM:PSUDT>PSUDT2 G LOOPDT:'$D(^PS(50.8,PSU,2,PSUDT,2)) K PSU1
 ;
DRUG S PSU1=$S('$D(PSU1):$O(^PS(50.8,PSU,2,PSUDT,2,0)),1:$O(^PS(50.8,PSU,2,PSUDT,2,PSU1))) G LOOPDT:PSU1'>0 S PSUD=^PS(50.8,PSU,2,PSUDT,2,PSU1,0)
 ;
 S PSUD(1)=$P(PSUD,U,6),PSUDTA=$S(PSUD(1)=1:"ML",PSUD(1)=2:"LITER",PSUD(1)=3:"MCG",PSUD(1)=4:"MG",PSUD(1)=5:"GM",PSUD(1)=6:"UNITS",PSUD(1)=7:"IU",PSUD(1)=8:"MEQ",PSUD(1)=9:"MM",PSUD(1)=10:"MU",PSUD(1)=11:"THOUU",1:"NONE")
 ;
 F X=1:1:3 S PSUD(X)=$S($P(PSUD,U,(X+1))="":0,1:$P(PSUD,U,(X+1)))
 S PSUD(4)=$S($P(PSUD,U,8)="":0,1:$P(PSUD,U,8))
 S PSUD1=$P(PSUD,U,1)_"\"_PSUDTA
 ;
VAPN ;Get VA Product Name and VA Class pointer ;9MAR92 (again)
 ;
 S TYPE=$P(PSUD,U,7) K PSUAC
LOOPAC S PSUAC=$S('$D(PSUAC):$O(^PS(50.8,PSU,2,PSUDT,2,"AC",TYPE,0)),1:$O(^PS(50.8,PSU,2,PSUDT,2,"AC",TYPE,PSUAC))) G DONEAC:PSUAC'>0 K PSUAC1
 ;
LOOPAC1 ;
 S PSUAC1=$S('$D(PSUAC1):$O(^PS(50.8,PSU,2,PSUDT,2,"AC",TYPE,PSUAC,0)),1:$O(^PS(50.8,PSU,2,PSUDT,2,"AC",TYPE,PSUAC,PSUAC1))) G LOOPAC:PSUAC1'>0 I PSUAC1=PSU1 G DONEAC
 G LOOPAC1
 ;
DONEAC ;Should have internal number
 S XXX=$S('$D(^PS(TYPE,PSUAC,0)):0,1:$P(^PS(TYPE,PSUAC,0),U,2)) I XXX=0 S (VPN,VCL)=0 G PNTR1
 S VPN=$S('$D(^PSDRUG(XXX,"ND")):0,1:$S($P(^PSDRUG(XXX,"ND"),U,2)="":0,1:$P(^PSDRUG(XXX,"ND"),U,2)))
 ;
PNTR ;Get VA Drug Class pointer
 ;
 S VCL=$S('$D(^PSDRUG(XXX,"ND")):0,1:$S($P(^PSDRUG(XXX,"ND"),U,6)="":0,1:$S('$D(^PS(50.605,$P(^PSDRUG(XXX,"ND"),U,6))):0,1:$P(^PS(50.605,$P(^PSDRUG(XXX,"ND"),U,6),0),U,1))))
 ;
PNTR1 S VPN=$S(VPN=0:" ",1:$E(VPN,1,65)),VCL=$S(VCL=0:" ",1:VCL)
 ;
SETUT I '$D(^TMP($J,"IV",PSUD1)) S ^TMP($J,"IV",PSUD1)=PSUD(1)_U_PSUD(2)_U_PSUD(3)_U_PSUD(4)_U_VPN_U_VCL G DRUG
 F X=1:1:4 S $P(^TMP($J,"IV",PSUD1),U,X)=$P(^TMP($J,"IV",PSUD1),U,X)+PSUD(X)
 G DRUG
Q ;Done, now set TMP for shipping
 K TYPE
 Q