IBDEI0FT ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,7290,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7290,1,2,0)
 ;;=2^29126
 ;;^UTILITY(U,$J,358.3,7290,1,3,0)
 ;;=3^Apply Forearm Splint;Dynamic
 ;;^UTILITY(U,$J,358.3,7291,0)
 ;;=29130^^33^447^2^^^^1
 ;;^UTILITY(U,$J,358.3,7291,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7291,1,2,0)
 ;;=2^29130
 ;;^UTILITY(U,$J,358.3,7291,1,3,0)
 ;;=3^Apply Finger Splint;Static
 ;;^UTILITY(U,$J,358.3,7292,0)
 ;;=29131^^33^447^1^^^^1
 ;;^UTILITY(U,$J,358.3,7292,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7292,1,2,0)
 ;;=2^29131
 ;;^UTILITY(U,$J,358.3,7292,1,3,0)
 ;;=3^Apply Finger Splint;Dynamic
 ;;^UTILITY(U,$J,358.3,7293,0)
 ;;=29505^^33^447^6^^^^1
 ;;^UTILITY(U,$J,358.3,7293,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7293,1,2,0)
 ;;=2^29505
 ;;^UTILITY(U,$J,358.3,7293,1,3,0)
 ;;=3^Apply Long Leg Splint
 ;;^UTILITY(U,$J,358.3,7294,0)
 ;;=29515^^33^447^7^^^^1
 ;;^UTILITY(U,$J,358.3,7294,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7294,1,2,0)
 ;;=2^29515
 ;;^UTILITY(U,$J,358.3,7294,1,3,0)
 ;;=3^Apply Lower Leg Splint
 ;;^UTILITY(U,$J,358.3,7295,0)
 ;;=12001^^33^448^1^^^^1
 ;;^UTILITY(U,$J,358.3,7295,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7295,1,2,0)
 ;;=2^12001
 ;;^UTILITY(U,$J,358.3,7295,1,3,0)
 ;;=3^Simple repair; 2.5 cm or less
 ;;^UTILITY(U,$J,358.3,7296,0)
 ;;=12002^^33^448^2^^^^1
 ;;^UTILITY(U,$J,358.3,7296,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7296,1,2,0)
 ;;=2^12002
 ;;^UTILITY(U,$J,358.3,7296,1,3,0)
 ;;=3^Simple repair; 2.6 cm to 7.5 cm
 ;;^UTILITY(U,$J,358.3,7297,0)
 ;;=12004^^33^448^3^^^^1
 ;;^UTILITY(U,$J,358.3,7297,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7297,1,2,0)
 ;;=2^12004
 ;;^UTILITY(U,$J,358.3,7297,1,3,0)
 ;;=3^Simple repair; 7.6 cm to 12.5 cm
 ;;^UTILITY(U,$J,358.3,7298,0)
 ;;=12005^^33^448^4^^^^1
 ;;^UTILITY(U,$J,358.3,7298,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7298,1,2,0)
 ;;=2^12005
 ;;^UTILITY(U,$J,358.3,7298,1,3,0)
 ;;=3^Simple repair; 12.6 cm to 20 cm
 ;;^UTILITY(U,$J,358.3,7299,0)
 ;;=12006^^33^448^5^^^^1
 ;;^UTILITY(U,$J,358.3,7299,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7299,1,2,0)
 ;;=2^12006
 ;;^UTILITY(U,$J,358.3,7299,1,3,0)
 ;;=3^Simple repair; 20.1 cm to 30 cm
 ;;^UTILITY(U,$J,358.3,7300,0)
 ;;=12007^^33^448^6^^^^1
 ;;^UTILITY(U,$J,358.3,7300,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7300,1,2,0)
 ;;=2^12007
 ;;^UTILITY(U,$J,358.3,7300,1,3,0)
 ;;=3^Simple repair; over 30 cm
 ;;^UTILITY(U,$J,358.3,7301,0)
 ;;=12011^^33^449^2^^^^1
 ;;^UTILITY(U,$J,358.3,7301,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7301,1,2,0)
 ;;=2^12011
 ;;^UTILITY(U,$J,358.3,7301,1,3,0)
 ;;=3^Simple repair; 2.5 cm or less
 ;;^UTILITY(U,$J,358.3,7302,0)
 ;;=12013^^33^449^3^^^^1
 ;;^UTILITY(U,$J,358.3,7302,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7302,1,2,0)
 ;;=2^12013
 ;;^UTILITY(U,$J,358.3,7302,1,3,0)
 ;;=3^Simple repair; 2.6 cm to 5.0 cm
 ;;^UTILITY(U,$J,358.3,7303,0)
 ;;=12014^^33^449^5^^^^1
 ;;^UTILITY(U,$J,358.3,7303,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7303,1,2,0)
 ;;=2^12014
 ;;^UTILITY(U,$J,358.3,7303,1,3,0)
 ;;=3^Simple repair; 5.1 cm to 7.5 cm
 ;;^UTILITY(U,$J,358.3,7304,0)
 ;;=12015^^33^449^6^^^^1
 ;;^UTILITY(U,$J,358.3,7304,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7304,1,2,0)
 ;;=2^12015
 ;;^UTILITY(U,$J,358.3,7304,1,3,0)
 ;;=3^Simple repair; 7.6 cm to 12.5 cm
 ;;^UTILITY(U,$J,358.3,7305,0)
 ;;=12016^^33^449^1^^^^1
 ;;^UTILITY(U,$J,358.3,7305,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7305,1,2,0)
 ;;=2^12016
 ;;^UTILITY(U,$J,358.3,7305,1,3,0)
 ;;=3^Simple repair; 12.6 cm to 20 cm
 ;;^UTILITY(U,$J,358.3,7306,0)
 ;;=12017^^33^449^4^^^^1
 ;;
 ;;$END ROU IBDEI0FT