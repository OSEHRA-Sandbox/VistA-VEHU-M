IBDENTE3 ;ISC/XTSUMBLD KERNEL - Package checksum checker ;2960528.111934
 ;;0.0;
 ;;7.3;2960528.111934
 S XT4="I 1",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
CONT F XT1=1:1 S XT2=$T(ROU+XT1) Q:XT2=""  S X=$P(XT2," ",1),XT3=$P(XT2,";",3) X XT4 I $T W !,X X ^%ZOSF("TEST") S:'$T XT3=0 X:XT3 ^%ZOSF("RSUM") W ?10,$S('XT3:"Routine not in UCI",XT3'=Y:"Calculated "_$C(7)_Y_", off by "_(Y-XT3),1:"ok")
 ;
 K %1,%2,%3,X,Y,XT1,XT2,XT3,XT4 Q
ONE S XT4="I $D(^UTILITY($J,X))",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
 W !,"Check a subset of routines:" K ^UTILITY($J) X ^%ZOSF("RSEL")
 W ! G CONT
ROU ;;
IBDEI0GW ;;3933630
IBDEI0GX ;;3920961
IBDEI0GY ;;3882015
IBDEI0GZ ;;4046665
IBDEI0H0 ;;3893608
IBDEI0H1 ;;3937490
IBDEI0H2 ;;3893606
IBDEI0H3 ;;3899141
IBDEI0H4 ;;3928899
IBDEI0H5 ;;3931972
IBDEI0H6 ;;3890486
IBDEI0H7 ;;3930732
IBDEI0H8 ;;4373232
IBDEI0H9 ;;3928331
IBDEI0HA ;;3912887
IBDEI0HB ;;3921290
IBDEI0HC ;;3907399
IBDEI0HD ;;3921952
IBDEI0HE ;;3899185
IBDEI0HF ;;3925504
IBDEI0HG ;;3916496
IBDEI0HH ;;2294271
IBDEI0HI ;;9806572
IBDEI0HJ ;;1397829
IBDEI0HK ;;5276732
IBDEI0HL ;;6135166
IBDEI0HM ;;6008683
IBDEI0HN ;;7383846
IBDEI0HO ;;5409918
IBDEI0HP ;;6527686
IBDEI0HQ ;;6096284
IBDEI0HR ;;5622915
IBDEI0HS ;;2862884
IBDEI0HT ;;1585971
IBDEI0HU ;;2187758
IBDEI0HV ;;6007072
IBDEI0HW ;;10613656
IBDEI0HX ;;8466355
IBDEI0HY ;;8982317
IBDEI0HZ ;;6564111
IBDEI0I0 ;;5801048
IBDEI0I1 ;;5630545
IBDEI0I2 ;;5651666
IBDEI0I3 ;;6468764
IBDEI0I4 ;;6133986
IBDEI0I5 ;;5355260
IBDEI0I6 ;;4952334
IBDEI0I7 ;;7152901
IBDEI0I8 ;;4782453
IBDEI0I9 ;;6218033
IBDEI0IA ;;5581081
IBDEI0IB ;;5636527
IBDEI0IC ;;6537763
IBDEI0ID ;;6130933
IBDEI0IE ;;6520298
IBDEI0IF ;;5804860
IBDEI0IG ;;5389128
IBDEI0IH ;;5374551
IBDEI0II ;;6506125
IBDEI0IJ ;;5260056
IBDEI0IK ;;6542406
IBDEI0IL ;;6195757
IBDEI0IM ;;2809136
IBDEI0IN ;;2245253
IBDEI0IO ;;1095972
IBDEI0IP ;;2166680
IBDEI0IQ ;;965951
IBDEI0IR ;;1847809
IBDEI0IS ;;951963
IBDEI0IT ;;1997545
IBDEI0IU ;;1412163
IBDEI0IV ;;2380652
IBDEI0IW ;;1669447
IBDEI0IX ;;4248989
IBDEI0IY ;;2375774
IBDEINI1 ;;4885104
IBDEINI2 ;;5232516
IBDEINI3 ;;16805482
IBDEINI4 ;;3357688
IBDEINI5 ;;2331499
IBDEINIS ;;2205388
IBDEINIT ;;10575302