SDBT ; GENERATED FROM 'SDB' INPUT TEMPLATE(#102), FILE 44;11/21/19
 D DE G BEGIN
DE S DIE="^SC(",DIC=DIE,DP=44,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^SC(DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,1) S:%]"" DE(1)=% S %=$P(%Z,U,2) S:%]"" DE(2)=% S %=$P(%Z,U,7) S:%]"" DE(17)=% S %=$P(%Z,U,8) S:%]"" DE(9)=% S %=$P(%Z,U,15) S:%]"" DE(15)=% S %=$P(%Z,U,17) S:%]"" DE(10)=% S %=$P(%Z,U,19) S:%]"" DE(4)=%
 I  S %=$P(%Z,U,21) S:%]"" DE(12)=% S %=$P(%Z,U,24) S:%]"" DE(30)=% S %=$P(%Z,U,25) S:%]"" DE(19)=% S %=$P(%Z,U,30) S:%]"" DE(34)=%
 I $D(^(99)) S %Z=^(99) S %=$P(%Z,U,1) S:%]"" DE(20)=%
 I $D(^(99.1)) S %Z=^(99.1) S %=$P(%Z,U,1) S:%]"" DE(22)=%
 I $D(^("AT")) S %Z=^("AT") S %=$P(%Z,U,1) S:%]"" DE(18)=%
 I $D(^("LTR")) S %Z=^("LTR") S %=$P(%Z,U,1) S:%]"" DE(26)=% S %=$P(%Z,U,2) S:%]"" DE(27)=% S %=$P(%Z,U,3) S:%]"" DE(28)=% S %=$P(%Z,U,4) S:%]"" DE(29)=%
 I $D(^("PA")) S %Z=^("PA") S %=$P(%Z,U,1) S:%]"" DE(3)=% S %=$P(%Z,U,2) S:%]"" DE(5)=% S %=$P(%Z,U,3) S:%]"" DE(7)=%
 I $D(^("PC")) S %Z=^("PC") S %=$P(%Z,U,1) S:%]"" DE(32)=%
 I $D(^("PS")) S %Z=^("PS") S %=$P(%Z,U,1) S:%]"" DE(25)=%
 I $D(^("RAD")) S %Z=^("RAD") S %=$P(%Z,U,1) S:%]"" DE(24)=%
 I $D(^("SDP")) S %Z=^("SDP") S %=$P(%Z,U,1) S:%]"" DE(35)=% S %=$P(%Z,U,2) S:%]"" DE(36)=% S %=$P(%Z,U,3) S:%]"" DE(40)=% S %=$P(%Z,U,4) S:%]"" DE(41)=%
 I $D(^("SL")) S %Z=^("SL") S %=$P(%Z,U,3) S:%]"" DE(38)=% S %=$P(%Z,U,8) S:%]"" DE(42)=%
 K %Z Q
 ;
W W !?DL+DL-2,DLB_": "
 Q
O D W W Y W:$X>45 !?9
 I $L(Y)>19,'DV,DV'["I",(DV["F"!(DV["K")) G RW^DIR2
 W:Y]"" "// " I 'DV,DV["I",$D(DE(DQ))#2 K X S X("FIELD")=DIFLD,X("FILE")=DP W "  ("_$$EZBLD^DIALOG(710,.X)_")" K X S X="" Q  ;**
TR Q:DV["K"&(DUZ(0)'="@")  R X:DTIME E  S (DTOUT,X)=U W $C(7)
 Q
A K DQ(DQ) S DQ=DQ+1
B G @DQ
RE G A:DV["K"&(DUZ(0)'["@"),PR:$D(DE(DQ)) D W,TR
N I X="" G NKEY:$D(^DD("KEY","F",DP,DIFLD)),A:DV'["R",X:'DV,X:D'>0,A
RD G QS:X?."?" I X["^" D D G ^DIE17
 I X="@" D D G Z^DIE2
 I X=" ",DV["d",DV'["P",$D(^DISV(DUZ,"DIE",DLB)) S X=^(DLB) I DV'["D",DV'["S" W "  "_X
T G M^DIE17:DV,^DIE3:DV["V",P:DV'["S" I X?.ANP D SET^DIED I 'DDER G V
 K DDER G X
P I DV["P" S DIC=U_DU,DIC(0)=$E("EN",$D(DB(DQ))+1)_"M"_$E("L",DV'["'") S:DIC(0)["L" DLAYGO=+$P(DV,"P",2) G:DV["*" AST^DIED D NOSCR^DIED S X=+Y,DIC=DIE G X:X<0
 G V:DV'["N" D D I $L($P(X,"."))>24 K X G Z
 I $P(DQ(DQ),U,5)'["$",X?.1"-".N.1".".N,$P(DQ(DQ),U,5,99)["+X'=X" S X=+X
V D @("X"_DQ) K YS
UNIQ I DV["U",$D(X),DIFLD=.01 K % M %=@(DIE_"""B"",X)") K %(DA) K:$O(%(0)) X
Z K DIC("S"),DLAYGO I $D(X),X'=U D:$G(DE(DW,"INDEX")) SAVEVALS G:'$$KEYCHK UNIQFERR^DIE17 S DG(DW)=X S:DV["d" ^DISV(DUZ,"DIE",DLB)=X G A
X W:'$D(ZTQUEUED) $C(7),"??" I $D(DB(DQ)) G Z^DIE17
 S X="?BAD"
QS S DZ=X D D,QQ^DIEQ G B
D S D=DIFLD,DQ(DQ)=DLB_U_DV_U_DU_U_DW_U_$P($T(@("X"_DQ))," ",2,99) Q
Y I '$D(DE(DQ)) D O G RD:"@"'[X,A:DV'["R"&(X="@"),X:X="@" S X=Y G N
PR S DG=DV,Y=DE(DQ),X=DU I $D(DQ(DQ,2)) X DQ(DQ,2) G RP
R I DG["P",@("$D(^"_X_"0))") S X=+$P(^(0),U,2) G RP:'$D(^(Y,0)) S Y=$P(^(0),U),X=$P(^DD(X,.01,0),U,3),DG=$P(^(0),U,2) G R
 I DG["V",+Y,$P(Y,";",2)["(",$D(@(U_$P(Y,";",2)_"0)")) S X=+$P(^(0),U,2) G RP:'$D(^(+Y,0)) S Y=$P(^(0),U) I $D(^DD(+X,.01,0)) S DG=$P(^(0),U,2),X=$P(^(0),U,3) G R
 X:DG["D" ^DD("DD") I DG["S" S %=$P($P(";"_X,";"_Y_":",2),";") I %]"" S Y=$S($G(DUZ("LANG"))'>1:%,'DIFLD:%,1:$$SET^DIQ(DP,DIFLD,Y))
RP D O I X="" S X=DE(DQ) G A:'DV,A:DC<2,N^DIE17
I I DV'["I",DV'["#" G RD
 D E^DIE0 G RD:$D(X),PR
 Q
SAVEVALS S @DIEZTMP@("V",DP,DIIENS,DIFLD,"O")=$G(DE(DQ)) S:$D(^("F"))[0 ^("F")=$G(DE(DQ))
 I $D(DE(DW,"4/")) S @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")=""
 E  K @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")
 Q
NKEY W:'$D(ZTQUEUED) "??  Required key field" S X="?BAD" G QS
KEYCHK() Q:$G(DE(DW,"KEY"))="" 1 Q @DE(DW,"KEY")
BEGIN S DNM="SDBT",DQ=1
 N DIEZTMP,DIEZAR,DIEZRXR,DIIENS,DIXR K DIEFIRE,DIEBADK S DIEZTMP=$$GETTMP^DIKC1("DIEZ")
 M DIEZAR=^DIE(102,"AR") S DICRREC="TRIG^DIE17"
 S:$D(DTIME)[0 DTIME=300 S D0=DA,DIIENS=DA_",",DIEZ=102,U="^"
1 S DW="0;1",DV="RFa",DU="",DIFLD=.01,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C1^SDBT",DE(DW,"INDEX")=1
 G RE
C1 G C1S:$D(DE(1))[0 K DB
 S X=DE(1),DIC=DIE
 K ^SC("B",$E(X,1,30),DA)
 S X=DE(1),DIC=DIE
 ;
 S X=DE(1),DIC=DIE
 ;
 S X=DE(1),DIC=DIE
 ;
 S X=DE(1),DIC=DIE
 S RTPL=X,X="RTP6" X ^%ZOSF("TEST") S X=RTPL K RTPL I $T D ^RTP6
 S X=DE(1),DIC=DIE
 ;
 S X=DE(1),DIIX=2_U_DIFLD D AUDIT^DIET
C1S S X="" G:DG(DQ)=X C1F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^SC("B",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 X ^DD(44,.01,1,2,1.3) I X S X=DIV X ^DD(44,.01,1,2,89.2) S X=$P(Y(101),U,1),X=X S X=X S D0=I(0,0) S DIU=X K Y S X=DIV S X=DIV X ^DD(44,.01,1,2,1.4)
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 D N44S^SDEC03(DA,$E(X,1,30))
 S X=DG(DQ),DIC=DIE
 ;
 S X=DG(DQ),DIC=DIE
 X ^DD(44,.01,1,12,1.3) I X S X=DIV X ^DD(44,.01,1,12,89.2) S X=$P(Y(101),U,1) S D0=I(0,0) S DIU=X K Y S X=DIV S X=DIV X ^DD(44,.01,1,12,1.4)
 I $D(DE(1))'[0!($G(^DD(DP,DIFLD,"AUDIT"))["y") S X=DG(DQ),DIIX=3_U_DIFLD D AUDIT^DIET
C1F1 S DIEZRXR(44,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=1346,1548 S DIEZRXR(44,DIXR)=""
 Q
X1 K:$L(X)>30!($L(X)<2)!'(X'?1P.E)!(X'?.ANP) X
 I $D(X),X'?.ANP K X
 Q
 ;
2 D:$D(DG)>9 F^DIE17,DE S DQ=2,DW="0;2",DV="F",DU="",DIFLD=1,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C2^SDBT"
 G RE
C2 G C2S:$D(DE(2))[0 K DB
 S X=DE(2),DIC=DIE
 K ^SC("C",$E(X,1,30),DA)
 S X=DE(2),DIC=DIE
 ;
C2S S X="" G:DG(DQ)=X C2F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^SC("C",$E(X,1,30),DA)=""
 S X=DG(DQ),DIC=DIE
 D A44S^SDEC03(DA,$E(X,1,7))
C2F1 Q
X2 K:X[""""!($A(X)=45) X I $D(X) K:$L(X)>7!($L(X)<1) X
 I $D(X),X'?.ANP K X
 Q
 ;
3 D:$D(DG)>9 F^DIE17,DE S DQ=3,DW="PA;1",DV="F",DU="",DIFLD=60,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X3 K:$L(X)>80!($L(X)<3) X
 I $D(X),X'?.ANP K X
 Q
 ;
4 S DW="0;19",DV="RS",DU="",DIFLD=2504,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="Y:YES;N:NO;"
 S Y="Y"
 G Y
X4 Q
5 S DW="PA;2",DV="RSa",DU="",DIFLD=61,DLB="ALLOW DIRECT PATIENT SCHEDULING?"
 S DE(DW)="C5^SDBT"
 S DU="Y:YES;N:NO;"
 G RE
C5 G C5S:$D(DE(5))[0 K DB
 S X=DE(5),DIIX=2_U_DIFLD D AUDIT^DIET
C5S S X="" G:DG(DQ)=X C5F1 K DB
 I $D(DE(5))'[0!($G(^DD(DP,DIFLD,"AUDIT"))["y") S X=DG(DQ),DIIX=3_U_DIFLD D AUDIT^DIET
C5F1 Q
X5 Q
6 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=6 D X6 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X6 I (X["Y")!($P($G(^SC(DA,"PA")),"^",2)="Y")  S $P(^SC(DA,"PA"),"^",3)="Y",Y="@07"
 Q
7 D:$D(DG)>9 F^DIE17,DE S DQ=7,DW="PA;3",DV="RSa",DU="",DIFLD=62,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C7^SDBT"
 S DU="Y:YES;N:NO;"
 G RE
C7 G C7S:$D(DE(7))[0 K DB
 S X=DE(7),DIIX=2_U_DIFLD D AUDIT^DIET
C7S S X="" G:DG(DQ)=X C7F1 K DB
 I $D(DE(7))'[0!($G(^DD(DP,DIFLD,"AUDIT"))["y") S X=DG(DQ),DIIX=3_U_DIFLD D AUDIT^DIET
C7F1 Q
X7 Q
8 S DQ=9 ;@07
9 D:$D(DG)>9 F^DIE17,DE S DQ=9,DW="0;8",DV="RS",DU="",DIFLD=9,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C9^SDBT",DE(DW,"INDEX")=1
 S DU="M:MEDICINE;S:SURGERY;P:PSYCHIATRY;R:REHAB MEDICINE;N:NEUROLOGY;0:NONE;"
 G RE
C9 G C9S:$D(DE(9))[0 K DB
C9S S X="" G:DG(DQ)=X C9F1 K DB
C9F1 S DIEZRXR(44,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=1548 S DIEZRXR(44,DIXR)=""
 Q
X9 Q
10 D:$D(DG)>9 F^DIE17,DE S DQ=10,DW="0;17",DV="RSa",DU="",DIFLD=2502,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C10^SDBT"
 S DU="Y:YES;N:NO;"
 G RE
C10 G C10S:$D(DE(10))[0 K DB
 S X=DE(10),DIC=DIE
 ;
 S X=DE(10),DIIX=2_U_DIFLD D AUDIT^DIET
C10S S X="" G:DG(DQ)=X C10F1 K DB
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^SC(D0,0)):^(0),1:"") S X=$P(Y(1),U,21),X=X S DIU=X K Y S X="" X ^DD(44,2502,1,1,1.4)
 I $D(DE(10))'[0!($G(^DD(DP,DIFLD,"AUDIT"))["y") S X=DG(DQ),DIIX=3_U_DIFLD D AUDIT^DIET
C10F1 Q
X10 Q
11 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=11 D X11 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X11 S:X'["Y" Y="@05"
 Q
12 D:$D(DG)>9 F^DIE17,DE S DQ=12,DW="0;21",DV="S",DU="",DIFLD=2502.5,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="0:NO;1:YES;"
 G RE
X12 Q
13 S DQ=14 ;@05
14 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=14 D X14 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X14 S:$S('$D(^DG(43,1,"GL")):1,$D(^DG(43,1,"GL"))&('$P(^DG(43,1,"GL"),"^",2)):1,1:0) Y="@10"
 Q
15 S DW="0;15",DV="P40.8'a",DU="",DIFLD=3.5,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C15^SDBT"
 S DU="DG(40.8,"
 S X=+$O(^DG(40.8,0)),X=$S($D(^(X,0)):$P(^(0),"^"),1:"")
 S Y=X
 G Y
C15 G C15S:$D(DE(15))[0 K DB
 S X=DE(15),DIIX=2_U_DIFLD D AUDIT^DIET
C15S S X="" G:DG(DQ)=X C15F1 K DB
 I $D(DE(15))'[0!($G(^DD(DP,DIFLD,"AUDIT"))["y") S X=DG(DQ),DIIX=3_U_DIFLD D AUDIT^DIET
C15F1 Q
X15 Q
16 S DQ=17 ;@10
17 D:$D(DG)>9 F^DIE17,DE S DQ=17,DW="0;7",DV="R*P40.7'Xa",DU="",DIFLD=8,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C17^SDBT",DE(DW,"INDEX")=1
 S DU="DIC(40.7,"
 G RE
C17 G C17S:$D(DE(17))[0 K DB
 S X=DE(17),DIIX=2_U_DIFLD D AUDIT^DIET
C17S S X="" G:DG(DQ)=X C17F1 K DB
 I $D(DE(17))'[0!($G(^DD(DP,DIFLD,"AUDIT"))["y") S X=DG(DQ),DIIX=3_U_DIFLD D AUDIT^DIET
C17F1 N X,X1,X2 S DIXR=446 D C17X1(U) K X2 M X2=X D C17X1("O") K X1 M X1=X
 I $G(X(1))]"" D
 . K ^SC("AST",X,DA)
 K X M X=X2 I $G(X(1))]"" D
 . S ^SC("AST",X,DA)=""
 G C17F2
C17X1(DION) K X
 S X(1)=$G(@DIEZTMP@("V",44,DIIENS,8,DION),$P($G(^SC(DA,0)),U,7))
 S X=$G(X(1))
 Q
C17F2 S DIEZRXR(44,DIIENS)=$$OREF^DILF($NA(@$$CREF^DILF(DIE)))
 F DIXR=1548 S DIEZRXR(44,DIXR)=""
 Q
X17 S DIC("S")="I $P(^(0),U,2)'=900&$S('$P(^(0),U,3):1,$P(^(0),U,3)>DT:1,1:0),""PE""[$P(^(0),U,6),$S('$P(^(0),U,7):1,$P(^(0),U,7)'>DT:1,1:0)" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
18 D:$D(DG)>9 F^DIE17,DE S DQ=18,DW="AT;1",DV="*P409.1'",DU="",DIFLD=2507,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="SD(409.1,"
 S Y="REGULAR"
 G Y
X18 S DIC("S")="I '$P(^(0),U,3)" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
19 S DW="0;25",DV="S",DU="",DIFLD=2802,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C19^SDBT"
 S DU="1:YES;"
 G RE
C19 G C19S:$D(DE(19))[0 K DB
 S X=DE(19),DIC=DIE
 K ^SC("AE",$E(X,1,30),DA)
C19S S X="" G:DG(DQ)=X C19F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^SC("AE",$E(X,1,30),DA)=""
C19F1 Q
X19 Q
20 D:$D(DG)>9 F^DIE17,DE S DQ=20,DW="99;1",DV="F",DU="",DIFLD=99,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X20 K:$L(X)>13!($L(X)<3) X
 I $D(X),X'?.ANP K X
 Q
 ;
21 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=21 D X21 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X21 S:X="" $P(^SC(DA,99.1),"^",1)="",Y="@15"
 Q
22 S DW="99.1;1",DV="F",DU="",DIFLD=99.1,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X22 K:$L(X)>26!($L(X)<1) X
 I $D(X),X'?.ANP K X
 Q
 ;
23 S DQ=24 ;@15
24 S DW="RAD;1",DV="S",DU="",DIFLD=2000,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="Y:YES;"
 G RE
X24 Q
25 S DW="PS;1",DV="RS",DU="",DIFLD=2000.5,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="0:YES;1:NO;"
 S Y="YES"
 G Y
X25 Q
26 S DW="LTR;1",DV="*P407.5'",DU="",DIFLD=2508,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C26^SDBT"
 S DU="VA(407.5,"
 G RE
C26 G C26S:$D(DE(26))[0 K DB
 S X=DE(26),DIC=DIE
 K ^SC("ALTN",$E(X,1,30),DA)
C26S S X="" G:DG(DQ)=X C26F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^SC("ALTN",$E(X,1,30),DA)=""
C26F1 Q
X26 S DIC("S")="I $P(^(0),""^"",2)=""N""" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
27 D:$D(DG)>9 F^DIE17,DE S DQ=27,DW="LTR;2",DV="*P407.5'",DU="",DIFLD=2509,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C27^SDBT"
 S DU="VA(407.5,"
 G RE
C27 G C27S:$D(DE(27))[0 K DB
 S X=DE(27),DIC=DIE
 K ^SC("ALTP",$E(X,1,30),DA)
C27S S X="" G:DG(DQ)=X C27F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^SC("ALTP",$E(X,1,30),DA)=""
C27F1 Q
X27 S DIC("S")="I $P(^(0),""^"",2)=""P""" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
28 D:$D(DG)>9 F^DIE17,DE S DQ=28,DW="LTR;3",DV="*P407.5'",DU="",DIFLD=2510,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C28^SDBT"
 S DU="VA(407.5,"
 G RE
C28 G C28S:$D(DE(28))[0 K DB
 S X=DE(28),DIC=DIE
 K ^SC("ALTC",$E(X,1,30),DA)
C28S S X="" G:DG(DQ)=X C28F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^SC("ALTC",$E(X,1,30),DA)=""
C28F1 Q
X28 S DIC("S")="I $P(^(0),""^"",2)=""C""" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
29 D:$D(DG)>9 F^DIE17,DE S DQ=29,DW="LTR;4",DV="*P407.5'",DU="",DIFLD=2511,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DE(DW)="C29^SDBT"
 S DU="VA(407.5,"
 G RE
C29 G C29S:$D(DE(29))[0 K DB
 S X=DE(29),DIC=DIE
 K ^SC("ALTA",$E(X,1,30),DA)
C29S S X="" G:DG(DQ)=X C29F1 K DB
 S X=DG(DQ),DIC=DIE
 S ^SC("ALTA",$E(X,1,30),DA)=""
C29F1 Q
X29 S DIC("S")="I $P(^(0),""^"",2)=""A""" D ^DIC K DIC S DIC=DIE,X=+Y K:Y<0 X
 Q
 ;
30 D:$D(DG)>9 F^DIE17,DE S DQ=30,DW="0;24",DV="S",DU="",DIFLD=24,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="0:NO;1:YES;"
 G RE
X30 Q
31 S D=0 K DE(1) ;2600
 S DIFLD=2600,DGO="^SDBT1",DC="2^44.1P^PR^",DV="44.1M*P200'",DW="0;1",DOW=$$LABEL^DIALOGZ(DP,DIFLD),DLB=$P($$EZBLD^DIALOG(8042,DOW),": ") S:D DC=DC_D
 S DU="VA(200,"
 G RE:D I $D(DSC(44.1))#2,$P(DSC(44.1),"I $D(^UTILITY(",1)="" X DSC(44.1) S D=$O(^(0)) S:D="" D=-1 G M31
 S D=$S($D(^SC(DA,"PR",0)):$P(^(0),U,3,4),$O(^(0))'="":$O(^(0)),1:-1)
M31 I D>0 S DC=DC_D I $D(^SC(DA,"PR",+D,0)) S DE(31)=$P(^(0),U,1)
 G RE
R31 D DE
 S D=$S($D(^SC(DA,"PR",0)):$P(^(0),U,3,4),1:1) G 31+1
 ;
32 S DW="PC;1",DV="S",DU="",DIFLD=2801,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="1:YES;0:NO;"
 G RE
X32 Q
33 S D=0 K DE(1) ;2700
 S DIFLD=2700,DGO="^SDBT2",DC="2^44.11P^DX^",DV="44.11M*P80'X",DW="0;1",DOW=$$LABEL^DIALOGZ(DP,DIFLD),DLB=$P($$EZBLD^DIALOG(8042,DOW),": ") S:D DC=DC_D
 S DU="ICD9("
 G RE:D I $D(DSC(44.11))#2,$P(DSC(44.11),"I $D(^UTILITY(",1)="" X DSC(44.11) S D=$O(^(0)) S:D="" D=-1 G M33
 S D=$S($D(^SC(DA,"DX",0)):$P(^(0),U,3,4),$O(^(0))'="":$O(^(0)),1:-1)
M33 I D>0 S DC=DC_D I $D(^SC(DA,"DX",+D,0)) S DE(33)=$P(^(0),U,1)
 G RE
R33 D DE
 S D=$S($D(^SC(DA,"DX",0)):$P(^(0),U,3,4),1:1) G 33+1
 ;
34 S DW="0;30",DV="S",DU="",DIFLD=30,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="1:YES;0:NO;"
 G RE
X34 Q
35 S DW="SDP;1",DV="RNJ3,0",DU="",DIFLD=2001,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X35 K:+X'=X!(X>999)!(X<0)!(X?.E1"."1N.N) X
 Q
 ;
36 S DW="SDP;2",DV="RNJ3,0",DU="",DIFLD=2002,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X36 K:+X'=X!(X>999)!(X<11)!(X?.E1"."1N.N) X
 Q
 ;
37 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=37 D X37 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X37 S:+$O(^SC(DA,"ST",0))>0 Y="@25"
 Q
38 S DW="SL;3",DV="NJ2,0",DU="",DIFLD=1914,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X38 K:+X'=X!(X>16)!(X<0)!(X?.E1"."1N.N) X
 Q
 ;
39 S DQ=40 ;@25
40 S DW="SDP;3",DV="NJ2,0X",DU="",DIFLD=2003,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X40 K:+X'=X!(X>16)!(X<0)!(X?.E1"."1N.N) X I $D(X),$D(^SC(DA,"SL")) I X<$S('$P(^("SL"),"^",3):8,1:$P(^("SL"),"^",3)) W !,*7,"MUST NOT BE EARLIER THAN CLINIC START TIME" K X
 Q
 ;
41 S DW="SDP;4",DV="RNJ3,0",DU="",DIFLD=2005,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 G RE
X41 K:+X'=X!(X>365)!(X<1)!(X?.E1"."1N.N) X
 Q
 ;
42 S DW="SL;8",DV="S",DU="",DIFLD=1918.5,DLB=$$LABEL^DIALOGZ(DP,DIFLD)
 S DU="Y:YES;"
 G RE
X42 Q
43 D:$D(DG)>9 F^DIE17 G ^SDBT3
