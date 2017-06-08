ZUNTEG ;ISC/XTSUMBLD KERNEL V6 - Package checksum checker ;JUN 09, 1989@16:04:12
 ;;6.0;JUN 09, 1989@16:04:12
C0 S C0="S XT=0 F I=1:1 S L=$T(+I) Q:$L(L)'>0  F J=1:1:$L(L) S XT=$A(L,J)*J+XT"
 W !!,"Checksum routine created on ",$P($T(+2),";",4)," by KERNEL V6",!
 F LI=1:1 S LV=$T(ROU+LI) Q:LV=""  S RN=$P(LV," ",1),RT=$P(LV,";",3) W !,RN X "ZL @RN X C0" W ?10,$S(XT'=RT:"Calculated "_XT_", off by "_(XT-RT),1:"ok")
 Q
ROU ;
ZINDEX ;;7478318
ZINDX1 ;;4916105
ZINDX10 ;;10396999
ZINDX11 ;;7108853
ZINDX2 ;;5805967
ZINDX3 ;;6561448
ZINDX4 ;;4066804
ZINDX5 ;;6225590
ZINDX51 ;;7897993
ZINDX52 ;;2581034
ZINDX53 ;;3954116
ZINDX6 ;;14735763
ZINDX8 ;;6132658
ZINDXH ;;1557403
ZIS ;;8012035
ZIS1 ;;3929951
ZIS2 ;;6358755
ZIS3 ;;7094079
ZIS4DSM ;;6524843
ZIS4M11 ;;6216665
ZIS4M11P ;;7210859
ZIS4MSM ;;9343705
ZIS4MVX ;;10227346
ZIS4VXD ;;8668893
ZIS5 ;;8772331
ZIS6 ;;5383719
ZIS7 ;;3388054
ZIS9 ;;2203710
ZISC ;;5258911
ZISETMSM ;;7193203
ZISETUPD ;;6702923
ZISETUPM ;;7883775
ZISETVXD ;;7515494
ZISHUNT ;;13937025
ZISHUNT1 ;;4516623
ZISMRG ;;5801206
ZISMRG1 ;;14978413
ZISMRG2 ;;12522494
ZISMRG3 ;;10105891
ZISMRG4 ;;12009891
ZISMRG5 ;;13212575
ZISMRG6 ;;12030906
ZISMRG7 ;;9843075
ZISMRG8 ;;6210208
ZISMRGA ;;16477760
ZISMRGD ;;14436209
ZISMRGD1 ;;13704052
ZISMRGD2 ;;10628610
ZISMRGL ;;8814968
ZISMRGT ;;6474631
ZISMRGT1 ;;15617313
ZISPL ;;10542855
ZISPL1 ;;7136987
ZISPL2 ;;2852573
ZISX ;;294923
ZOSFDSM ;;7005820
ZOSFM11 ;;11005012
ZOSFM11P ;;10806547
ZOSFMSM ;;6563934
ZOSFMVX ;;11159406
ZOSFVXD ;;8895395
ZOSVDSM ;;5618777
ZOSVM11 ;;2544841
ZOSVM11P ;;4481269
ZOSVMSM ;;4894382
ZOSVMVX ;;3504680
ZOSVVXD ;;6258746
ZRTHM ;;9300038
ZRTHT ;;6125255
ZTBKC ;;9295785
ZTBKCDSM ;;3361351
ZTBKCM11 ;;3210689
ZTBKCMP ;;3512415
ZTBKCMVX ;;2741985
ZTDT ;;5010230
ZTDTC ;;5647814
ZTEDIT ;;13117217
ZTEDIT1 ;;9916076
ZTEDIT2 ;;15139600
ZTEDIT3 ;;5358304
ZTEDIT4 ;;4926318
ZTGBL ;;926199
ZTLOAD ;;10430799
ZTLOAD1 ;;9284798
ZTLOAD2 ;;14048137
ZTM ;;12559435
ZTM0 ;;5590080
ZTM1 ;;11726486
ZTM2 ;;10038055
ZTMBDSM ;;2895535
ZTMBM11 ;;2833225
ZTMBM11P ;;2885696
ZTMBMSM ;;2920049
ZTMBMVX ;;2853696
ZTMBVXD ;;3314880
ZTMCHK ;;11829522
ZTMCHK1 ;;3084761
ZTMCVT ;;16187526
ZTMD ;;11186281
ZTMD1 ;;10708407
ZTMDQ ;;11424695
ZTMDQ1 ;;10112425
ZTMDQN ;;4405258
ZTMDQN1 ;;7590198
ZTMGRSET ;;9957411
ZTMK ;;4652564
ZTMKE ;;8365901
ZTMKU ;;7792481
ZTMMSM ;;8806501
ZTMON ;;9993097
ZTMOVE ;;5289905
ZTMQ ;;7923024
ZTMQ1 ;;12429483
ZTMQ2 ;;3582022
ZTMQ3 ;;13706178
ZTMQ4 ;;12829946
ZTMR ;;15360207
ZTMR1 ;;9212937
ZTMS ;;12659362
ZTMS1 ;;13933315
ZTMSH ;;2260664
ZTMZD ;;1364780
ZTMZT ;;2143840
ZTMZUNQ ;;2977938
ZTP1 ;;6040447
ZTPP ;;4572551
ZTRCR ;;1934937
ZTRDEL ;;1032976
ZUA ;;3463505
ZUDSM ;;1115353
ZUM11 ;;768886
ZUM11P ;;750832
ZUMSM ;;957891
ZUMVX ;;752436
ZUVXD ;;1629068