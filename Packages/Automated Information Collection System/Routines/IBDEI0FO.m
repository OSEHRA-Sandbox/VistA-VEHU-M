IBDEI0FO ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,7209,0)
 ;;=451.9^^31^437^4
 ;;^UTILITY(U,$J,358.3,7209,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7209,1,4,0)
 ;;=4^451.9
 ;;^UTILITY(U,$J,358.3,7209,1,5,0)
 ;;=5^Thrombophlebitis NOS
 ;;^UTILITY(U,$J,358.3,7209,2)
 ;;=^93357
 ;;^UTILITY(U,$J,358.3,7210,0)
 ;;=454.9^^31^437^5
 ;;^UTILITY(U,$J,358.3,7210,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7210,1,4,0)
 ;;=4^454.9
 ;;^UTILITY(U,$J,358.3,7210,1,5,0)
 ;;=5^Varicose Vein,Leg
 ;;^UTILITY(U,$J,358.3,7210,2)
 ;;=^328758
 ;;^UTILITY(U,$J,358.3,7211,0)
 ;;=459.89^^31^437^6
 ;;^UTILITY(U,$J,358.3,7211,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7211,1,4,0)
 ;;=4^459.89
 ;;^UTILITY(U,$J,358.3,7211,1,5,0)
 ;;=5^Venous Insuff
 ;;^UTILITY(U,$J,358.3,7211,2)
 ;;=^87910
 ;;^UTILITY(U,$J,358.3,7212,0)
 ;;=V68.81^^31^438^1
 ;;^UTILITY(U,$J,358.3,7212,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,7212,1,4,0)
 ;;=4^V68.81
 ;;^UTILITY(U,$J,358.3,7212,1,5,0)
 ;;=5^Chart Review Non Face to Face
 ;;^UTILITY(U,$J,358.3,7212,2)
 ;;=^295587
 ;;^UTILITY(U,$J,358.3,7213,0)
 ;;=99605^^32^439^1^^^^1
 ;;^UTILITY(U,$J,358.3,7213,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7213,1,2,0)
 ;;=2^Chart Consult-New Pt,Init 15min
 ;;^UTILITY(U,$J,358.3,7213,1,3,0)
 ;;=3^99605
 ;;^UTILITY(U,$J,358.3,7214,0)
 ;;=99606^^32^439^2^^^^1
 ;;^UTILITY(U,$J,358.3,7214,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7214,1,2,0)
 ;;=2^Chart Consult-Est Pt,Init 15min
 ;;^UTILITY(U,$J,358.3,7214,1,3,0)
 ;;=3^99606
 ;;^UTILITY(U,$J,358.3,7215,0)
 ;;=99607^^32^439^3^^^^1
 ;;^UTILITY(U,$J,358.3,7215,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7215,1,2,0)
 ;;=2^Chart Consult-New/Est Pt,Ea Addl 15min
 ;;^UTILITY(U,$J,358.3,7215,1,3,0)
 ;;=3^99607
 ;;^UTILITY(U,$J,358.3,7216,0)
 ;;=97001^^32^440^1^^^^1
 ;;^UTILITY(U,$J,358.3,7216,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7216,1,2,0)
 ;;=2^Chart Consult-New Pt Eval
 ;;^UTILITY(U,$J,358.3,7216,1,3,0)
 ;;=3^97001
 ;;^UTILITY(U,$J,358.3,7217,0)
 ;;=97002^^32^440^2^^^^1
 ;;^UTILITY(U,$J,358.3,7217,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7217,1,2,0)
 ;;=2^Chart Consult-Pt Re-Eval
 ;;^UTILITY(U,$J,358.3,7217,1,3,0)
 ;;=3^97002
 ;;^UTILITY(U,$J,358.3,7218,0)
 ;;=76140^^32^441^1^^^^1
 ;;^UTILITY(U,$J,358.3,7218,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7218,1,2,0)
 ;;=2^X-Ray Chart Consultation
 ;;^UTILITY(U,$J,358.3,7218,1,3,0)
 ;;=3^76140
 ;;^UTILITY(U,$J,358.3,7219,0)
 ;;=90885^^32^442^1^^^^1
 ;;^UTILITY(U,$J,358.3,7219,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7219,1,2,0)
 ;;=2^Chart Consult
 ;;^UTILITY(U,$J,358.3,7219,1,3,0)
 ;;=3^90885
 ;;^UTILITY(U,$J,358.3,7220,0)
 ;;=90471^^33^443^1^^^^1
 ;;^UTILITY(U,$J,358.3,7220,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7220,1,2,0)
 ;;=2^90471
 ;;^UTILITY(U,$J,358.3,7220,1,3,0)
 ;;=3^Immunization Administration (use w/ Vacs below)
 ;;^UTILITY(U,$J,358.3,7221,0)
 ;;=90472^^33^443^1.5^^^^1
 ;;^UTILITY(U,$J,358.3,7221,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7221,1,2,0)
 ;;=2^90472
 ;;^UTILITY(U,$J,358.3,7221,1,3,0)
 ;;=3^2 or more Immunization Administration (use w/ Vacs below)
 ;;^UTILITY(U,$J,358.3,7222,0)
 ;;=90632^^33^443^5^^^^1
 ;;^UTILITY(U,$J,358.3,7222,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7222,1,2,0)
 ;;=2^90632
 ;;^UTILITY(U,$J,358.3,7222,1,3,0)
 ;;=3^Hepatitis A Vaccine
 ;;^UTILITY(U,$J,358.3,7223,0)
 ;;=90746^^33^443^7^^^^1
 ;;^UTILITY(U,$J,358.3,7223,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7223,1,2,0)
 ;;=2^90746
 ;;^UTILITY(U,$J,358.3,7223,1,3,0)
 ;;=3^Hepatitis B Vaccine
 ;;^UTILITY(U,$J,358.3,7224,0)
 ;;=90636^^33^443^6^^^^1
 ;;^UTILITY(U,$J,358.3,7224,1,0)
 ;;=^358.31IA^3^2
 ;;
 ;;$END ROU IBDEI0FO
