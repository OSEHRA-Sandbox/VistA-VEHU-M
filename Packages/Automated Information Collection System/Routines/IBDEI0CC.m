IBDEI0CC ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,5492,0)
 ;;=12056^^26^346^6^^^^1
 ;;^UTILITY(U,$J,358.3,5492,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5492,1,2,0)
 ;;=2^12056
 ;;^UTILITY(U,$J,358.3,5492,1,3,0)
 ;;=3^Interm Repair Face; 20.1 cm to 30 cm
 ;;^UTILITY(U,$J,358.3,5493,0)
 ;;=12057^^26^346^7^^^^1
 ;;^UTILITY(U,$J,358.3,5493,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5493,1,2,0)
 ;;=2^12057
 ;;^UTILITY(U,$J,358.3,5493,1,3,0)
 ;;=3^Interm Repair Face; over 30 cm
 ;;^UTILITY(U,$J,358.3,5494,0)
 ;;=97605^^26^347^3^^^^1
 ;;^UTILITY(U,$J,358.3,5494,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5494,1,2,0)
 ;;=2^97605
 ;;^UTILITY(U,$J,358.3,5494,1,3,0)
 ;;=3^Neg Press Wound Tx <= 50 cm,using wnd vac
 ;;^UTILITY(U,$J,358.3,5495,0)
 ;;=97606^^26^347^5^^^^1
 ;;^UTILITY(U,$J,358.3,5495,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5495,1,2,0)
 ;;=2^97606
 ;;^UTILITY(U,$J,358.3,5495,1,3,0)
 ;;=3^Neg Press Wound Tx > 50 cm,using wnd vac
 ;;^UTILITY(U,$J,358.3,5496,0)
 ;;=97598^^26^347^7^^^^1
 ;;^UTILITY(U,$J,358.3,5496,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5496,1,2,0)
 ;;=2^97598
 ;;^UTILITY(U,$J,358.3,5496,1,3,0)
 ;;=3^Rmvl Devital Tiiss,Addl 20 cm
 ;;^UTILITY(U,$J,358.3,5497,0)
 ;;=97597^^26^347^6^^^^1
 ;;^UTILITY(U,$J,358.3,5497,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5497,1,2,0)
 ;;=2^97597
 ;;^UTILITY(U,$J,358.3,5497,1,3,0)
 ;;=3^Rmvl Devital Tiss < 20 cm
 ;;^UTILITY(U,$J,358.3,5498,0)
 ;;=15271^^26^347^8^^^^1
 ;;^UTILITY(U,$J,358.3,5498,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5498,1,2,0)
 ;;=2^15271
 ;;^UTILITY(U,$J,358.3,5498,1,3,0)
 ;;=3^Skin Sub Graft Trnk/Arm/Leg
 ;;^UTILITY(U,$J,358.3,5499,0)
 ;;=15272^^26^347^9^^^^1
 ;;^UTILITY(U,$J,358.3,5499,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5499,1,2,0)
 ;;=2^15272
 ;;^UTILITY(U,$J,358.3,5499,1,3,0)
 ;;=3^Skin Sub Graft Trnk/Arm/Leg Add-On
 ;;^UTILITY(U,$J,358.3,5500,0)
 ;;=29580^^26^347^1^^^^1
 ;;^UTILITY(U,$J,358.3,5500,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5500,1,2,0)
 ;;=2^29580
 ;;^UTILITY(U,$J,358.3,5500,1,3,0)
 ;;=3^Application of UNNA Boot
 ;;^UTILITY(U,$J,358.3,5501,0)
 ;;=97607^^26^347^2^^^^1
 ;;^UTILITY(U,$J,358.3,5501,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5501,1,2,0)
 ;;=2^97607
 ;;^UTILITY(U,$J,358.3,5501,1,3,0)
 ;;=3^Neg Press Wound Tx <= 50 cm
 ;;^UTILITY(U,$J,358.3,5502,0)
 ;;=97608^^26^347^4^^^^1
 ;;^UTILITY(U,$J,358.3,5502,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5502,1,2,0)
 ;;=2^97608
 ;;^UTILITY(U,$J,358.3,5502,1,3,0)
 ;;=3^Neg Press Wound Tx > 50 cm
 ;;^UTILITY(U,$J,358.3,5503,0)
 ;;=95028^^26^348^1^^^^1
 ;;^UTILITY(U,$J,358.3,5503,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5503,1,2,0)
 ;;=2^95028
 ;;^UTILITY(U,$J,358.3,5503,1,3,0)
 ;;=3^ID Allergy Test-Delayed Type
 ;;^UTILITY(U,$J,358.3,5504,0)
 ;;=95044^^26^348^2^^^^1
 ;;^UTILITY(U,$J,358.3,5504,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5504,1,2,0)
 ;;=2^95044
 ;;^UTILITY(U,$J,358.3,5504,1,3,0)
 ;;=3^Patch/Applic Test
 ;;^UTILITY(U,$J,358.3,5505,0)
 ;;=88104^^26^349^2^^^^1
 ;;^UTILITY(U,$J,358.3,5505,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5505,1,2,0)
 ;;=2^88104
 ;;^UTILITY(U,$J,358.3,5505,1,3,0)
 ;;=3^Cytopath Fl Nongyn Smears
 ;;^UTILITY(U,$J,358.3,5506,0)
 ;;=88106^^26^349^1^^^^1
 ;;^UTILITY(U,$J,358.3,5506,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5506,1,2,0)
 ;;=2^88106
 ;;^UTILITY(U,$J,358.3,5506,1,3,0)
 ;;=3^Cytopath Fl Nongyn Filter
 ;;^UTILITY(U,$J,358.3,5507,0)
 ;;=Q0112^^26^349^3^^^^1
 ;;^UTILITY(U,$J,358.3,5507,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,5507,1,2,0)
 ;;=2^Q0112
 ;;^UTILITY(U,$J,358.3,5507,1,3,0)
 ;;=3^Potassium Hydroxide Preps
 ;;
 ;;$END ROU IBDEI0CC
