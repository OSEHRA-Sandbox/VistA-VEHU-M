IBDEI0PI ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,12200,0)
 ;;=17003^^60^721^46^^^^1
 ;;^UTILITY(U,$J,358.3,12200,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12200,1,2,0)
 ;;=2^17003
 ;;^UTILITY(U,$J,358.3,12200,1,3,0)
 ;;=3^LIQUID N2,2-14 LESIONS
 ;;^UTILITY(U,$J,358.3,12201,0)
 ;;=51784^^60^721^1^^^^1
 ;;^UTILITY(U,$J,358.3,12201,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12201,1,2,0)
 ;;=2^51784
 ;;^UTILITY(U,$J,358.3,12201,1,3,0)
 ;;=3^ANAL/URINARY MUSCLE STUDY
 ;;^UTILITY(U,$J,358.3,12202,0)
 ;;=74740^^60^721^36^^^^1
 ;;^UTILITY(U,$J,358.3,12202,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12202,1,2,0)
 ;;=2^74740
 ;;^UTILITY(U,$J,358.3,12202,1,3,0)
 ;;=3^HYSTEROSALPINGOGRAM
 ;;^UTILITY(U,$J,358.3,12203,0)
 ;;=58340^^60^721^13^^^^1
 ;;^UTILITY(U,$J,358.3,12203,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12203,1,2,0)
 ;;=2^58340
 ;;^UTILITY(U,$J,358.3,12203,1,3,0)
 ;;=3^CATH FOR SIS OR HYSTEROSALPINGOGRAPHY
 ;;^UTILITY(U,$J,358.3,12204,0)
 ;;=58345^^60^721^55^^^^1
 ;;^UTILITY(U,$J,358.3,12204,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12204,1,2,0)
 ;;=2^58345
 ;;^UTILITY(U,$J,358.3,12204,1,3,0)
 ;;=3^TRANSCERVICAL INTRO OF FALLOPIAN TUBE CATH
 ;;^UTILITY(U,$J,358.3,12205,0)
 ;;=57511^^60^721^16^^^^1
 ;;^UTILITY(U,$J,358.3,12205,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12205,1,2,0)
 ;;=2^57511
 ;;^UTILITY(U,$J,358.3,12205,1,3,0)
 ;;=3^CRYOCAUTERY OF CERVIX
 ;;^UTILITY(U,$J,358.3,12206,0)
 ;;=17110^^60^721^22^^^^1
 ;;^UTILITY(U,$J,358.3,12206,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12206,1,2,0)
 ;;=2^17110
 ;;^UTILITY(U,$J,358.3,12206,1,3,0)
 ;;=3^DESTRUCT B9 LESION,1-14-14
 ;;^UTILITY(U,$J,358.3,12207,0)
 ;;=56420^^60^721^24^^^^1
 ;;^UTILITY(U,$J,358.3,12207,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12207,1,2,0)
 ;;=2^56420
 ;;^UTILITY(U,$J,358.3,12207,1,3,0)
 ;;=3^DRAINAGE OF GLAND ABSCESS
 ;;^UTILITY(U,$J,358.3,12208,0)
 ;;=56405^^60^721^37^^^^1
 ;;^UTILITY(U,$J,358.3,12208,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12208,1,2,0)
 ;;=2^56405
 ;;^UTILITY(U,$J,358.3,12208,1,3,0)
 ;;=3^I&D OF VULVA/PERINEUM
 ;;^UTILITY(U,$J,358.3,12209,0)
 ;;=11980^^60^721^38^^^^1
 ;;^UTILITY(U,$J,358.3,12209,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12209,1,2,0)
 ;;=2^11980
 ;;^UTILITY(U,$J,358.3,12209,1,3,0)
 ;;=3^IMPLANT HORMONE PELLET(S)
 ;;^UTILITY(U,$J,358.3,12210,0)
 ;;=55920^^60^721^47^^^^1
 ;;^UTILITY(U,$J,358.3,12210,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12210,1,2,0)
 ;;=2^55920
 ;;^UTILITY(U,$J,358.3,12210,1,3,0)
 ;;=3^NEEDLE PLACEMENT FOR RT,PELVIC
 ;;^UTILITY(U,$J,358.3,12211,0)
 ;;=J3420^^60^722^1^^^^1
 ;;^UTILITY(U,$J,358.3,12211,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12211,1,2,0)
 ;;=2^J3420
 ;;^UTILITY(U,$J,358.3,12211,1,3,0)
 ;;=3^B12 INJ UP TO 1,000MCG
 ;;^UTILITY(U,$J,358.3,12212,0)
 ;;=J0800^^60^722^3^^^^1
 ;;^UTILITY(U,$J,358.3,12212,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12212,1,2,0)
 ;;=2^J0800
 ;;^UTILITY(U,$J,358.3,12212,1,3,0)
 ;;=3^CORTISONE INJ UP TO 40U
 ;;^UTILITY(U,$J,358.3,12213,0)
 ;;=J9202^^60^722^20^^^^1
 ;;^UTILITY(U,$J,358.3,12213,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12213,1,2,0)
 ;;=2^J9202
 ;;^UTILITY(U,$J,358.3,12213,1,3,0)
 ;;=3^ZOLADEX 3.6MG
 ;;^UTILITY(U,$J,358.3,12214,0)
 ;;=J1642^^60^722^8^^^^1
 ;;^UTILITY(U,$J,358.3,12214,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12214,1,2,0)
 ;;=2^J1642
 ;;^UTILITY(U,$J,358.3,12214,1,3,0)
 ;;=3^HEP LOCK FLUSH PER 10U
 ;;^UTILITY(U,$J,358.3,12215,0)
 ;;=J7307^^60^722^4^^^^1
 ;;^UTILITY(U,$J,358.3,12215,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,12215,1,2,0)
 ;;=2^J7307
 ;;^UTILITY(U,$J,358.3,12215,1,3,0)
 ;;=3^ETONOGESTREL IMPLANT W/ SUPPLIES
 ;;
 ;;$END ROU IBDEI0PI