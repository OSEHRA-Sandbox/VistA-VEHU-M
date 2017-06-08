IBDENTE0 ;ISC/XTSUMBLD KERNEL - Package checksum checker ;2960528.111934
 ;;0.0;
 ;;7.3;2960528.111934
 S XT4="I 1",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
CONT F XT1=1:1 S XT2=$T(ROU+XT1) Q:XT2=""  S X=$P(XT2," ",1),XT3=$P(XT2,";",3) X XT4 I $T W !,X X ^%ZOSF("TEST") S:'$T XT3=0 X:XT3 ^%ZOSF("RSUM") W ?10,$S('XT3:"Routine not in UCI",XT3'=Y:"Calculated "_$C(7)_Y_", off by "_(Y-XT3),1:"ok")
 G CONT^IBDENTE1
 K %1,%2,%3,X,Y,XT1,XT2,XT3,XT4 Q
ONE S XT4="I $D(^UTILITY($J,X))",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
 W !,"Check a subset of routines:" K ^UTILITY($J) X ^%ZOSF("RSEL")
 W ! G CONT
ROU ;;
IBDEI048 ;;3677444
IBDEI049 ;;3635209
IBDEI04A ;;3645047
IBDEI04B ;;3748005
IBDEI04C ;;3666519
IBDEI04D ;;3842158
IBDEI04E ;;3773489
IBDEI04F ;;3774477
IBDEI04G ;;3697412
IBDEI04H ;;3950186
IBDEI04I ;;3718414
IBDEI04J ;;3662944
IBDEI04K ;;3678172
IBDEI04L ;;3720250
IBDEI04M ;;3700543
IBDEI04N ;;3652675
IBDEI04O ;;3832010
IBDEI04P ;;3656606
IBDEI04Q ;;3756430
IBDEI04R ;;3736334
IBDEI04S ;;3756194
IBDEI04T ;;3657180
IBDEI04U ;;3788659
IBDEI04V ;;4078240
IBDEI04W ;;3838236
IBDEI04X ;;3698982
IBDEI04Y ;;3693967
IBDEI04Z ;;3701221
IBDEI050 ;;3815157
IBDEI051 ;;3674673
IBDEI052 ;;3678080
IBDEI053 ;;3729923
IBDEI054 ;;3739110
IBDEI055 ;;3754508
IBDEI056 ;;3804613
IBDEI057 ;;3809911
IBDEI058 ;;3846867
IBDEI059 ;;3794557
IBDEI05A ;;3797672
IBDEI05B ;;3812323
IBDEI05C ;;3821540
IBDEI05D ;;3786429
IBDEI05E ;;3805608
IBDEI05F ;;3862670
IBDEI05G ;;3785997
IBDEI05H ;;3772050
IBDEI05I ;;3749098
IBDEI05J ;;3810800
IBDEI05K ;;3734878
IBDEI05L ;;3805419
IBDEI05M ;;3779168
IBDEI05N ;;3812312
IBDEI05O ;;3774875
IBDEI05P ;;3760702
IBDEI05Q ;;3826448
IBDEI05R ;;3784519
IBDEI05S ;;3917482
IBDEI05T ;;3699501
IBDEI05U ;;3626457
IBDEI05V ;;3596393
IBDEI05W ;;3596207
IBDEI05X ;;3668864
IBDEI05Y ;;3646152
IBDEI05Z ;;3737065
IBDEI060 ;;3682126
IBDEI061 ;;3635870
IBDEI062 ;;3601596
IBDEI063 ;;3584163
IBDEI064 ;;3677671
IBDEI065 ;;3626818
IBDEI066 ;;3808357
IBDEI067 ;;3674914
IBDEI068 ;;3674396
IBDEI069 ;;3773277
IBDEI06A ;;3612805
IBDEI06B ;;3629163
IBDEI06C ;;3772108
IBDEI06D ;;3667147
IBDEI06E ;;3703009
IBDEI06F ;;3636222
IBDEI06G ;;3655308
IBDEI06H ;;3620909
IBDEI06I ;;3746923
IBDEI06J ;;3804839
IBDEI06K ;;3662675
IBDEI06L ;;3714170
IBDEI06M ;;3655142
IBDEI06N ;;3706683
IBDEI06O ;;3650577
IBDEI06P ;;3608338
IBDEI06Q ;;3636047
IBDEI06R ;;3607980
IBDEI06S ;;3606866
IBDEI06T ;;3729572
IBDEI06U ;;3826677
IBDEI06V ;;3580503
IBDEI06W ;;3629030
IBDEI06X ;;3628157
IBDEI06Y ;;3607153
IBDEI06Z ;;3949886
IBDEI070 ;;3851436
IBDEI071 ;;3776871
IBDEI072 ;;3763212
IBDEI073 ;;4122182
IBDEI074 ;;3927787
IBDEI075 ;;3677417
IBDEI076 ;;3724276
IBDEI077 ;;3628928
IBDEI078 ;;3623282
IBDEI079 ;;3628223
IBDEI07A ;;3671336
IBDEI07B ;;3679450
IBDEI07C ;;3869246
IBDEI07D ;;3668610
IBDEI07E ;;3675807
IBDEI07F ;;3660004
IBDEI07G ;;3650161
IBDEI07H ;;3624623
IBDEI07I ;;3631227
IBDEI07J ;;3662911
IBDEI07K ;;3821512
IBDEI07L ;;3683612
IBDEI07M ;;3702219
IBDEI07N ;;3792438
IBDEI07O ;;3757811
IBDEI07P ;;3806606
IBDEI07Q ;;3593662
IBDEI07R ;;3717736
IBDEI07S ;;3729426
IBDEI07T ;;3659260
IBDEI07U ;;3710034
IBDEI07V ;;3682024
IBDEI07W ;;3733264
IBDEI07X ;;3657443
IBDEI07Y ;;3843654
IBDEI07Z ;;3713524
IBDEI080 ;;3659332
IBDEI081 ;;3587074
IBDEI082 ;;3564016
IBDEI083 ;;3674920
IBDEI084 ;;3876361
IBDEI085 ;;3675228
IBDEI086 ;;3703926
IBDEI087 ;;3635986
IBDEI088 ;;3683538
IBDEI089 ;;3640742
IBDEI08A ;;3624603
IBDEI08B ;;3639327
IBDEI08C ;;3691553
IBDEI08D ;;3675861
IBDEI08E ;;3823519
IBDEI08F ;;3633974