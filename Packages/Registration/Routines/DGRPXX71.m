DGRPXX71 ; ;05/09/00
 D DE G BEGIN
DE S DIE="^DPT(",DIC=DIE,DP=2,DL=1,DIEL=0,DU="" K DG,DE,DB Q:$O(^DPT(DA,""))=""
 I $D(^(.3)) S %Z=^(.3) S %=$P(%Z,U,11) S:%]"" DE(7)=%
 I $D(^(.31)) S %Z=^(.31) S %=$P(%Z,U,4) S:%]"" DE(1)=%
 I $D(^(.362)) S %Z=^(.362) S %=$P(%Z,U,12) S:%]"" DE(4)=% S %=$P(%Z,U,13) S:%]"" DE(5)=% S %=$P(%Z,U,14) S:%]"" DE(6)=% S %=$P(%Z,U,17) S:%]"" DE(10)=% S %=$P(%Z,U,20) S:%]"" DE(9)=%
 K %Z Q
 ;
W W !?DL+DL-2,DLB_": "
 Q
O D W W Y W:$X>45 !?9
 I $L(Y)>19,'DV,DV'["I",(DV["F"!(DV["K")) G RW^DIR2
 W:Y]"" "// " I 'DV,DV["I",$D(DE(DQ))#2 S X="" W "  (No Editing)" Q
TR R X:DTIME E  S (DTOUT,X)=U W $C(7)
 Q
A K DQ(DQ) S DQ=DQ+1
B G @DQ
RE G PR:$D(DE(DQ)) D W,TR
N I X="" G NKEY:$D(^DD("KEY","F",DP,DIFLD)),A:DV'["R",X:'DV,X:D'>0,A
RD G QS:X?."?" I X["^" D D G ^DIE17
 I X="@" D D G Z^DIE2
 I X=" ",DV["d",DV'["P",$D(^DISV(DUZ,"DIE",DLB)) S X=^(DLB) I DV'["D",DV'["S" W "  "_X
T G M^DIE17:DV,^DIE3:DV["V",P:DV'["S" X:$D(^DD(DP,DIFLD,12.1)) ^(12.1) I X?.ANP D SET I 'DDER X:$D(DIC("S")) DIC("S") I  W:'$D(DB(DQ)) "  "_% G V
 K DDER G X
P I DV["P" S DIC=U_DU,DIC(0)=$E("EN",$D(DB(DQ))+1)_"M"_$E("L",DV'["'") S:DIC(0)["L" DLAYGO=+$P(DV,"P",2) G:DV["*" AST^DIED D NOSCR^DIED S X=+Y,DIC=DIE G X:X<0
 G V:DV'["N" D D I $L($P(X,"."))>24 K X G Z
 I $P(DQ(DQ),U,5)'["$",X?.1"-".N.1".".N,$P(DQ(DQ),U,5,99)["+X'=X" S X=+X
V D @("X"_DQ) K YS
Z K DIC("S"),DLAYGO I $D(X),X'=U D:$G(DE(DW,"INDEX")) SAVEVALS G:'$$KEYCHK UNIQFERR^DIE17 S DG(DW)=X S:DV["d" ^DISV(DUZ,"DIE",DLB)=X G A
X W:'$D(ZTQUEUED) $C(7),"??" I $D(DB(DQ)) G Z^DIE17
 S X="?BAD"
QS S DZ=X D D,QQ^DIEQ G B
D S D=DIFLD,DQ(DQ)=DLB_U_DV_U_DU_U_DW_U_$P($T(@("X"_DQ))," ",2,99) Q
Y I '$D(DE(DQ)) D O G RD:"@"'[X,A:DV'["R"&(X="@"),X:X="@" S X=Y G N
PR S DG=DV,Y=DE(DQ),X=DU I $D(DQ(DQ,2)) X DQ(DQ,2) G RP
R I DG["P",@("$D(^"_X_"0))") S X=+$P(^(0),U,2) G RP:'$D(^(Y,0)) S Y=$P(^(0),U),X=$P(^DD(X,.01,0),U,3),DG=$P(^(0),U,2) G R
 I DG["V",+Y,$P(Y,";",2)["(",$D(@(U_$P(Y,";",2)_"0)")) S X=+$P(^(0),U,2) G RP:'$D(^(+Y,0)) S Y=$P(^(0),U) I $D(^DD(+X,.01,0)) S DG=$P(^(0),U,2),X=$P(^(0),U,3) G R
 X:DG["D" ^DD("DD") I DG["S" S %=$P($P(";"_X,";"_Y_":",2),";") S:%]"" Y=%
RP D O I X="" S X=DE(DQ) G A:'DV,A:DC<2,N^DIE17
I I DV'["I",DV'["#" G RD
 D E^DIE0 G RD:$D(X),PR
 Q
SET N DIR S DIR(0)="SV"_$E("o",$D(DB(DQ)))_U_DU,DIR("V")=1
 I $D(DB(DQ)),'$D(DIQUIET) N DIQUIET S DIQUIET=1
 D ^DIR I 'DDER S %=Y(0),X=Y
 Q
SAVEVALS S @DIEZTMP@("V",DP,DIIENS,DIFLD,"N")=X,^("O")=$G(DE(DQ)) S:$D(^("F"))[0 ^("F")=$G(DE(DQ))
 I $D(DE(DW,"4/")) S @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")=""
 E  K @DIEZTMP@("V",DP,DIIENS,DIFLD,"4/")
 Q
NKEY W:'$D(ZTQUEUED) "??  Required key field" S X="?BAD" G QS
KEYCHK() Q:$G(DE(DW,"KEY"))="" 1 Q @DE(DW,"KEY")
BEGIN S DNM="DGRPXX71",DQ=1
1 S DW=".31;4",DV="P4'",DU="",DLB="CLAIM FOLDER LOCATION",DIFLD=.314
 S DE(DW)="C1^DGRPXX71"
 S DU="DIC(4,"
 G RE
C1 G C1S:$D(DE(1))[0 K DB
 S X=DE(1),DIC=DIE
 N DGX D CFL4^DGREGDD D KILL^DGREGDD1(DA,.312,.31,2,DGX)
C1S S X="" Q:DG(DQ)=X  K DB
 S X=DG(DQ),DIC=DIE
 N DGX D CFL4^DGREGDD D SET^DGREGDD1(DA,.312,.31,2,DGX)
 Q
X1 Q
2 S DQ=3 ;@702
3 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=3 D X3 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X3 S:DGDR'["702" Y="@703"
 Q
4 D:$D(DG)>9 F^DIE17,DE S DQ=4,DW=".362;12",DV="SX",DU="",DLB="RECEIVING A&A BENEFITS?",DIFLD=.36205
 S DE(DW)="C4^DGRPXX71"
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C4 G C4S:$D(DE(4))[0 K DB
 S X=DE(4),DIC=DIE
 X ^DD(2,.36205,1,1,2.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,1),X=X S DIU=X K Y S X="" X ^DD(2,.36205,1,1,2.4)
 S X=DE(4),DIC=DIE
 S DFN=DA D EN^DGMTCOR K DGMTCOR
 S X=DE(4),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X='$$TOTCHK^DGLOCK2(DA) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,20),X=X S DIU=X K Y S X="" X ^DD(2,.36205,1,3,2.4)
 S X=DE(4),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C4S S X="" Q:DG(DQ)=X  K DB
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.36205,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,1),X=X S DIU=X K Y S X="" X ^DD(2,.36205,1,1,1.4)
 S X=DG(DQ),DIC=DIE
 S DFN=DA D EN^DGMTCOR K DGMTCOR
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X='$$TOTCHK^DGLOCK2(DA) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,20),X=X S DIU=X K Y S X="" X ^DD(2,.36205,1,3,1.4)
 S X=DG(DQ),DIC=DIE
 D AUTOUPD^DGENA2(DA)
 Q
X4 S DFN=DA D MV^DGLOCK I $D(X) S DFN=DA D EV^DGLOCK
 Q
 ;
5 D:$D(DG)>9 F^DIE17,DE S DQ=5,DW=".362;13",DV="SX",DU="",DLB="RECEIVING HOUSEBOUND BENEFITS?",DIFLD=.36215
 S DE(DW)="C5^DGRPXX71"
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C5 G C5S:$D(DE(5))[0 K DB
 S X=DE(5),DIC=DIE
 X ^DD(2,.36215,1,1,2.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,2),X=X S DIU=X K Y S X="" X ^DD(2,.36215,1,1,2.4)
 S X=DE(5),DIC=DIE
 S DFN=DA D EN^DGMTCOR K DGMTCOR
 S X=DE(5),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X='$$TOTCHK^DGLOCK2(DA) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,20),X=X S DIU=X K Y S X="" X ^DD(2,.36215,1,3,2.4)
 S X=DE(5),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C5S S X="" Q:DG(DQ)=X  K DB
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.36215,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,2),X=X S DIU=X K Y S X="" X ^DD(2,.36215,1,1,1.4)
 S X=DG(DQ),DIC=DIE
 S DFN=DA D EN^DGMTCOR K DGMTCOR
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X='$$TOTCHK^DGLOCK2(DA) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,20),X=X S DIU=X K Y S X="" X ^DD(2,.36215,1,3,1.4)
 S X=DG(DQ),DIC=DIE
 D AUTOUPD^DGENA2(DA)
 Q
X5 S DFN=DA D MV^DGLOCK I $D(X) S DFN=DA D EV^DGLOCK
 Q
 ;
6 D:$D(DG)>9 F^DIE17,DE S DQ=6,DW=".362;14",DV="SX",DU="",DLB="RECEIVING A VA PENSION?",DIFLD=.36235
 S DE(DW)="C6^DGRPXX71"
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C6 G C6S:$D(DE(6))[0 K DB
 S X=DE(6),DIC=DIE
 X ^DD(2,.36235,1,1,2.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,4),X=X S DIU=X K Y S X="" X ^DD(2,.36235,1,1,2.4)
 S X=DE(6),DIC=DIE
 S DFN=DA D EN^DGMTCOR K DGMTCOR
 S X=DE(6),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X='$$TOTCHK^DGLOCK2(DA) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,20),X=X S DIU=X K Y S X="" X ^DD(2,.36235,1,3,2.4)
 S X=DE(6),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C6S S X="" Q:DG(DQ)=X  K DB
 S X=DG(DQ),DIC=DIE
 X ^DD(2,.36235,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,4),X=X S DIU=X K Y S X="" X ^DD(2,.36235,1,1,1.4)
 S X=DG(DQ),DIC=DIE
 S DFN=DA D EN^DGMTCOR K DGMTCOR
 S X=DG(DQ),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X='$$TOTCHK^DGLOCK2(DA) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,20),X=X S DIU=X K Y S X="" X ^DD(2,.36235,1,3,1.4)
 S X=DG(DQ),DIC=DIE
 D AUTOUPD^DGENA2(DA)
 Q
X6 S DFN=DA D MV^DGLOCK
 Q
 ;
7 D:$D(DG)>9 F^DIE17,DE S DQ=7,DW=".3;11",DV="SX",DU="",DLB="RECEIVING VA DISABILITY?",DIFLD=.3025
 S DE(DW)="C7^DGRPXX71"
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C7 G C7S:$D(DE(7))[0 K DB
 S X=DE(7),DIC=DIE
 X ^DD(2,.3025,1,1,2.3) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.3)):^(.3),1:"") S X=$P(Y(1),U,3),X=X S DIU=X K Y S X="" X ^DD(2,.3025,1,1,2.4)
 S X=DE(7),DIC=DIE
 K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X='$$TOTCHK^DGLOCK2(DA) I X S X=DIV S Y(1)=$S($D(^DPT(D0,.362)):^(.362),1:"") S X=$P(Y(1),U,20),X=X S DIU=X K Y S X="" X ^DD(2,.3025,1,2,2.4)
C7S S X="" Q:DG(DQ)=X  K DB
 D ^DGRPXX72
 Q
X7 S DFN=DA D MV^DGLOCK I $D(X),X="Y" D EC^DGLOCK1
 Q
 ;
8 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=8 D X8 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X8 S:(X'="Y")&($P($G(^DPT(DA,.362)),U,12,14)'["Y") Y=.36265
 Q
9 D:$D(DG)>9 F^DIE17,DE S DQ=9,DW=".362;20",DV="NJ8,2X",DU="",DLB="TOTAL ANNUAL VA CHECK AMOUNT",DIFLD=.36295
 S DE(DW)="C9^DGRPXX71"
 G RE
C9 G C9S:$D(DE(9))[0 K DB
 S X=DE(9),DIC=DIE
 X "S DFN=DA D EN^DGMTR K DGREQF"
 S X=DE(9),DIC=DIE
 D AUTOUPD^DGENA2(DA)
C9S S X="" Q:DG(DQ)=X  K DB
 D ^DGRPXX73
 Q
X9 D DOL^DGLOCK2 K:+X'=X&(X'?.N1"."2N)!(X>99999)!(X<0) X I $D(X) S DFN=DA D MV^DGLOCK I $D(X),('$$TOTCHK^DGLOCK2(DFN)) D TOTCKMSG^DGLOCK2 K X
 Q
 ;
10 D:$D(DG)>9 F^DIE17,DE S DQ=10,DW=".362;17",DV="SX",DU="",DLB="GI INSURANCE POLICY?",DIFLD=.36265
 S DE(DW)="C10^DGRPXX71"
 S DU="Y:YES;N:NO;U:UNKNOWN;"
 G RE
C10 G C10S:$D(DE(10))[0 K DB
 D ^DGRPXX74
C10S S X="" Q:DG(DQ)=X  K DB
 D ^DGRPXX75
 Q
X10 S DFN=DA D MV^DGLOCK Q
 Q
 ;
11 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=11 D X11 D:$D(DIEFIRE)#2 FIREREC^DIE17 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X11 S:X'="Y" Y="@703"
 Q
12 D:$D(DG)>9 F^DIE17 G ^DGRPXX76