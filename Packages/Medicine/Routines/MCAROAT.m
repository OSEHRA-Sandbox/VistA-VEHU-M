MCAROAT ; GENERATED FROM 'MCAREP2' PRINT TEMPLATE (#2109) ; 07/22/97 ; (FILE 691.9, MARGIN=80)
 G BEGIN
N W !
T W:$X ! I '$D(DIOT(2)),DN,$D(IOSL),$S('$D(DIWF):1,$P(DIWF,"B",2):$P(DIWF,"B",2),1:1)+$Y'<IOSL,$D(^UTILITY($J,1))#2,^(1)?1U1P1E.E X ^(1)
 S DISTP=DISTP+1,DILCT=DILCT+1 D:'(DISTP#100) CSTP^DIO2
 Q
DT I $G(DUZ("LANG"))>1,Y W $$OUT^DIALOGU(Y,"DD") Q
 I Y W $P("JAN^FEB^MAR^APR^MAY^JUN^JUL^AUG^SEP^OCT^NOV^DEC",U,$E(Y,4,5))_" " W:Y#100 $J(Y#100\1,2)_"," W Y\10000+1700 W:Y#1 "  "_$E(Y_0,9,10)_":"_$E(Y_"000",11,12) Q
 W Y Q
M D @DIXX
 Q
BEGIN ;
 S:'$D(DN) DN=1 S DISTP=$G(DISTP),DILCT=$G(DILCT)
 I $D(DXS)<9 F X=0:0 S X=$O(^DIPT(2109,"DXS",X)) Q:'X  S Y=$O(^(X,"")) F X=X:0 Q:Y=""  S DXS(X,Y)=^(Y),Y=$O(^(Y))
 D T Q:'DN  D N W ?0 W "----------------------------------ATRIAL STUDY----------------------------------"
 D T Q:'DN  D N W ?0 X DXS(1,9.2) S X=X_Y K DIP K:DN Y W X
 D T Q:'DN  D N D N:$X>7 Q:'DN  W ?7 W "PREMEDICATION:"
 S X=$G(^MCAR(691.9,D0,0)) D N:$X>22 Q:'DN  S DIWL=23,DIWR=52 S Y=$P(X,U,4) S X=Y D ^DIWP
 D A^DIWW
 D N:$X>7 Q:'DN  W ?7 S DIP(1)=$S($D(^MCAR(691.9,D0,0)):^(0),1:"") S X="ENTRY SITE: "_$S('$D(^MCAR(697,+$P(DIP(1),U,6),0)):"",1:$P(^(0),U,1)) K DIP K:DN Y W X
 D N:$X>42 Q:'DN  W ?42 X DXS(2,9) K DIP K:DN Y W X
 D N:$X>7 Q:'DN  W ?7 S DIP(1)=$S($D(^MCAR(691.9,D0,0)):^(0),1:"") S X="RECORDING SITE: "_$S('$D(^MCAR(693.5,+$P(DIP(1),U,7),0)):"",1:$P(^(0),U,1)) K DIP K:DN Y W X
 D N:$X>7 Q:'DN  W ?7 S DIP(1)=$S($D(^MCAR(691.9,D0,0)):^(0),1:"") S X="ATRIAL THRESHOLD (mA): "_$P(DIP(1),U,9) K DIP K:DN Y W X
 D T Q:'DN  D N D N:$X>7 Q:'DN  W ?7 W "CONDUCTION TIMES"
 D N:$X>43 Q:'DN  W ?43 W "SINUS NODE FUNCTION STUDIES"
 D N:$X>9 Q:'DN  W ?9 S DIP(1)=$S($D(^MCAR(691.9,D0,0)):^(0),1:"") S X="PA (NL 20-40 MSEC): "_$P(DIP(1),U,10) K DIP K:DN Y W X
 D N:$X>45 Q:'DN  W ?45 S DIP(1)=$S($D(^MCAR(691.9,D0,2)):^(2),1:"") S X="SACT (NL 80 +/- 40 MSEC): "_$P(DIP(1),U,8) K DIP K:DN Y W X
 D N:$X>9 Q:'DN  W ?9 S DIP(1)=$S($D(^MCAR(691.9,D0,0)):^(0),1:"") S X="AH (NL 60-120 MSEC): "_$P(DIP(1),U,11) K DIP K:DN Y W X
 D N:$X>45 Q:'DN  W ?45 S DIP(1)=$S($D(^MCAR(691.9,D0,2)):^(2),1:"") S X="CSART (NL 260+/- 95 MSEC): "_$P(DIP(1),U,9) K DIP K:DN Y W X
 D N:$X>9 Q:'DN  W ?9 S DIP(1)=$S($D(^MCAR(691.9,D0,0)):^(0),1:"") S X="HV (NL 35-55 MSEC): "_$P(DIP(1),U,12) K DIP K:DN Y W X
 D T Q:'DN  D N D N:$X>7 Q:'DN  W ?7 W "ATRIAL EXTRA STIMULUS TECHNIQUE    (VALUES BELOW IN MSEC)"
 S I(1)=1,J(1)=691.911 F D1=0:0 Q:$O(^MCAR(691.9,D0,1,D1))'>0  X:$D(DSC(691.911)) DSC(691.911) S D1=$O(^(D1)) Q:D1'>0  D:$X>66 T Q:'DN  D A1
 G A1R
A1 ;
 D N:$X>9 Q:'DN  W ?9 S DIP(1)=$S($D(^MCAR(691.9,D0,1,D1,0)):^(0),1:"") S X="DRIVE CYCLE LENGTH: "_$P(DIP(1),U,1) K DIP K:DN Y W X
 D N:$X>11 Q:'DN  W ?11 S DIP(1)=$S($D(^MCAR(691.9,D0,1,D1,0)):^(0),1:"") S X="AERP: "_$P(DIP(1),U,2) K DIP K:DN Y W X
 D N:$X>31 Q:'DN  W ?31 S DIP(1)=$S($D(^MCAR(691.9,D0,1,D1,0)):^(0),1:"") S X="AVERP: "_$P(DIP(1),U,5) K DIP K:DN Y W X
 D N:$X>51 Q:'DN  W ?51 S DIP(1)=$S($D(^MCAR(691.9,D0,1,D1,0)):^(0),1:"") S X="HPERP: "_$P(DIP(1),U,8) K DIP K:DN Y W X
 D N:$X>11 Q:'DN  W ?11 S DIP(1)=$S($D(^MCAR(691.9,D0,1,D1,0)):^(0),1:"") S X="AFRP: "_$P(DIP(1),U,3) K DIP K:DN Y W X
 D N:$X>31 Q:'DN  W ?31 S DIP(1)=$S($D(^MCAR(691.9,D0,1,D1,0)):^(0),1:"") S X="AVFRP: "_$P(DIP(1),U,6) K DIP K:DN Y W X
 D N:$X>51 Q:'DN  W ?51 S DIP(1)=$S($D(^MCAR(691.9,D0,1,D1,0)):^(0),1:"") S X="HPFRP: "_$P(DIP(1),U,9) K DIP K:DN Y W X
 D N:$X>11 Q:'DN  W ?11 S DIP(1)=$S($D(^MCAR(691.9,D0,1,D1,0)):^(0),1:"") S X="ARRP: "_$P(DIP(1),U,4) K DIP K:DN Y W X
 D N:$X>31 Q:'DN  W ?31 S DIP(1)=$S($D(^MCAR(691.9,D0,1,D1,0)):^(0),1:"") S X="AVRRP: "_$P(DIP(1),U,7) K DIP K:DN Y W X
 D N:$X>51 Q:'DN  W ?51 S DIP(1)=$S($D(^MCAR(691.9,D0,1,D1,0)):^(0),1:"") S X="HPRRP: "_$P(DIP(1),U,10) K DIP K:DN Y W X
 Q
A1R ;
 D T Q:'DN  D N D N:$X>7 Q:'DN  W ?7 W "INCREMENTAL ATRIAL PACING"
 D N:$X>9 Q:'DN  W ?9 S DIP(1)=$S($D(^MCAR(691.9,D0,2)):^(2),1:"") S X="MAXIMUM 1:1 CONDUCTION: "_$P(DIP(1),U,1) K DIP K:DN Y W X
 D N:$X>9 Q:'DN  W ?9 S DIP(1)=$S($D(^MCAR(691.9,D0,2)):^(2),1:"") S X="WENCKE CYCLE LENGTH: "_$P(DIP(1),U,2) K DIP K:DN Y W X
 D N:$X>9 Q:'DN  W ?9 X DXS(3,9) K DIP K:DN Y W X
 D T Q:'DN  D N D N:$X>7 Q:'DN  W ?7 W "TACHYCARDIA WINDOW: "
 S X=$G(^MCAR(691.9,D0,2)) S DIWL=1,DIWR=48 S Y=$P(X,U,4) S X=Y D ^DIWP
 D A^DIWW
 G ^MCAROAT1