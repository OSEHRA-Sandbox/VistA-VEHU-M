PRCHT112 ; ;11/25/98
 D DE G BEGIN
DE S DIE="^PRC(442,D0,2,",DIC=DIE,DP=442.01,DL=2,DIEL=1,DU="" K DG,DE,DB Q:$O(^PRC(442,D0,2,DA,""))=""
 I $D(^(0)) S %Z=^(0) S %=$P(%Z,U,2) S:%]"" DE(1)=% S %=$P(%Z,U,3) S:%]"" DE(8)=% S %=$P(%Z,U,9) S:%]"" DE(9)=%
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
N I X="" G A:DV'["R",X:'DV,X:D'>0,A
RD G QS:X?."?" I X["^" D D G ^DIE17
 I X="@" D D G Z^DIE2
 I X=" ",DV["d",DV'["P",$D(^DISV(DUZ,"DIE",DLB)) S X=^(DLB) I DV'["D",DV'["S" W "  "_X
T G M^DIE17:DV,^DIE3:DV["V",P:DV'["S" X:$D(^DD(DP,DIFLD,12.1)) ^(12.1) I X?.ANP D SET I 'DDER X:$D(DIC("S")) DIC("S") I  W:'$D(DB(DQ)) "  "_% G V
 K DDER G X
P I DV["P" S DIC=U_DU,DIC(0)=$E("EN",$D(DB(DQ))+1)_"M"_$E("L",DV'["'") S:DIC(0)["L" DLAYGO=+$P(DV,"P",2) I DV'["*" D ^DIC S X=+Y,DIC=DIE G X:X<0
 G V:DV'["N" D D I $L($P(X,"."))>24 K X G Z
 I $P(DQ(DQ),U,5)'["$",X?.1"-".N.1".".N,$P(DQ(DQ),U,5,99)["+X'=X" S X=+X
V D @("X"_DQ) K YS
Z K DIC("S"),DLAYGO I $D(X),X'=U S DG(DW)=X S:DV["d" ^DISV(DUZ,"DIE",DLB)=X G A
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
BEGIN S DNM="PRCHT112",DQ=1
1 S DW="0;2",DV="RNJ9,2",DU="",DLB="QUANTITY",DIFLD=2
 S DE(DW)="C1^PRCHT112"
 S X=$S($P(PRCHQUAN,U,12)'="":$P(PRCHQUAN,U,12),$P(PRCHQUAN,U,11)'="":$P(PRCHQUAN,U,11),1:"")
 S Y=X
 G Y
C1 G C1S:$D(DE(1))[0 K DB S X=DE(1),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^PRC(442,D0,2,D1,2)):^(2),1:"") S X=$P(Y(1),U,1) S DIU=X K Y S X=DIV S X="" X ^DD(442.01,2,1,1,2.4)
C1S S X="" Q:DG(DQ)=X  K DB S X=DG(DQ),DIC=DIE
 X ^DD(442.01,2,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^PRC(442,D0,2,D1,2)):^(2),1:"") S X=$P(Y(1),U,1) S DIU=X K Y X ^DD(442.01,2,1,1,1.1) X ^DD(442.01,2,1,1,1.4)
 Q
X1 K:+X'=X!(X>999999)!(X<.01)!(X?.E1"."3N.N) X
 Q
 ;
2 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=2 D X2 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X2 I X<PRCHOLD N I F I=0:0 S I=$O(^PRC(442.8,"AC",PRCHPONO,PRCHINUM,I)) Q:'I  S PRCHTOT=PRCHTOT+$P($G(^PRC(442.8,I,0)),U,5)
 Q
3 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=3 D X3 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X3 I $G(PRCHTOT)>X W !!!!!,$C(7),"****Delivery schedule total for this item (",PRCHTOT,") EXCEEDS order quantity (",X,").",!,"Edit delivery schedule(s).",!! S PRCHFLG=1,PRCHQTY=X S Y="@16"
 Q
4 S DQ=5 ;@44
5 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=5 D X5 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X5 I $P(PRCHQUAN,U,12)'="" I X<$P(PRCHQUAN,U,12) W !,"QUANTITY is less than the Minimum Order Quantity of ",$P(PRCHQUAN,U,12),$C(7) S Y=2
 Q
6 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=6 D X6 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X6 I $P(PRCHQUAN,U,9)'="" I X>$P(PRCHQUAN,U,9) W !,"QUANTITY is more than the Maximum Order Quantity of ",$P(PRCHQUAN,U,9),$C(7) S Y=2
 Q
7 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=7 D X7 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X7 I $P(PRCHQUAN,U,11)'="" I X#$P(PRCHQUAN,U,11)'=0 W !,"QUANTITY is not a Required Order Multiple value of ",$P(PRCHQUAN,U,11),$C(7) S Y=2
 Q
8 D:$D(DG)>9 F^DIE17,DE S DQ=8,DW="0;3",DV="RP420.5'X",DU="",DLB="UNIT OF PURCHASE",DIFLD=3
 S DU="PRCD(420.5,"
 G RE
X8 D EN6^PRCHNPO5
 Q
 ;
9 S DW="0;9",DV="RNJ12,4XO",DU="",DLB="ACTUAL UNIT COST",DIFLD=5
 S DQ(9,2)="S Y(0)=Y S Y=$S(Y=""N/C"":""N/C"",1:""$""_$J(Y,0,4))"
 S DE(DW)="C9^PRCHT112"
 G RE
C9 G C9S:$D(DE(9))[0 K DB S X=DE(9),DIC=DIE
 K DIV S DIV=X,D0=DA(1),DIV(0)=D0,D1=DA,DIV(1)=D1 S Y(1)=$S($D(^PRC(442,D0,2,D1,2)):^(2),1:"") S X=$P(Y(1),U,1) S DIU=X K Y S X=DIV S X="" X ^DD(442.01,5,1,1,2.4)
C9S S X="" Q:DG(DQ)=X  K DB S X=DG(DQ),DIC=DIE
 X ^DD(442.01,5,1,1,1.3) I X S X=DIV S Y(1)=$S($D(^PRC(442,D0,2,D1,2)):^(2),1:"") S X=$P(Y(1),U,1) S DIU=X K Y X ^DD(442.01,5,1,1,1.1) X ^DD(442.01,5,1,1,1.4)
 Q
X9 S:X["$" X=$P(X,"$",2) S X=$TR(X,"nc","NC") K:(X'?1.N)&(X'?.N1".".4N)&(X'?1"N/C")!(X?.E1"."5N.N)!(X>9999999.9999)!(X<0) X D EN9^PRCHNPO5 I $D(X) W $S(X="N/C":"     N/C",1:"     $"_$J(X,0,4))
 Q
 ;
10 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=10 D X10 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X10 I $D(^PRC(442,DA(1),1)),$P(^(1),U,20)="Y" S Y="@6"
 Q
11 D:$D(DG)>9 F^DIE17,DE S Y=U,DQ=11 D X11 G A:$D(Y)[0,A:Y=U S X=Y,DIC(0)="F",DW=DQ G OUT^DIE17
X11 D TSTREQ1^PRCHNPO9
 Q
12 D:$D(DG)>9 F^DIE17 G ^PRCHT113