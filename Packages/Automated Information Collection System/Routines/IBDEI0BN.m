IBDEI0BN ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,5129,1,5,0)
 ;;=5^Pruritus Vulvae
 ;;^UTILITY(U,$J,358.3,5129,2)
 ;;=^100071
 ;;^UTILITY(U,$J,358.3,5130,0)
 ;;=698.9^^25^287^1
 ;;^UTILITY(U,$J,358.3,5130,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5130,1,2,0)
 ;;=2^698.9
 ;;^UTILITY(U,$J,358.3,5130,1,5,0)
 ;;=5^Pruritic Disorder Unspecified
 ;;^UTILITY(U,$J,358.3,5130,2)
 ;;=^123977
 ;;^UTILITY(U,$J,358.3,5131,0)
 ;;=696.1^^25^288^1
 ;;^UTILITY(U,$J,358.3,5131,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5131,1,2,0)
 ;;=2^696.1
 ;;^UTILITY(U,$J,358.3,5131,1,5,0)
 ;;=5^Psoriasis
 ;;^UTILITY(U,$J,358.3,5131,2)
 ;;=^87816
 ;;^UTILITY(U,$J,358.3,5132,0)
 ;;=696.2^^25^288^2
 ;;^UTILITY(U,$J,358.3,5132,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5132,1,2,0)
 ;;=2^696.2
 ;;^UTILITY(U,$J,358.3,5132,1,5,0)
 ;;=5^Parapsoriasis
 ;;^UTILITY(U,$J,358.3,5132,2)
 ;;=^90056
 ;;^UTILITY(U,$J,358.3,5133,0)
 ;;=454.1^^25^289^1
 ;;^UTILITY(U,$J,358.3,5133,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5133,1,2,0)
 ;;=2^454.1
 ;;^UTILITY(U,$J,358.3,5133,1,5,0)
 ;;=5^Statis Dermatitis
 ;;^UTILITY(U,$J,358.3,5133,2)
 ;;=^125435
 ;;^UTILITY(U,$J,358.3,5134,0)
 ;;=459.81^^25^289^8
 ;;^UTILITY(U,$J,358.3,5134,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5134,1,2,0)
 ;;=2^459.81
 ;;^UTILITY(U,$J,358.3,5134,1,5,0)
 ;;=5^Venous Stasis
 ;;^UTILITY(U,$J,358.3,5134,2)
 ;;=^125826
 ;;^UTILITY(U,$J,358.3,5135,0)
 ;;=707.9^^25^290^1
 ;;^UTILITY(U,$J,358.3,5135,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5135,1,2,0)
 ;;=2^707.9
 ;;^UTILITY(U,$J,358.3,5135,1,5,0)
 ;;=5^Chronic Skin Ulcer 
 ;;^UTILITY(U,$J,358.3,5135,2)
 ;;=^24439
 ;;^UTILITY(U,$J,358.3,5136,0)
 ;;=707.00^^25^290^2
 ;;^UTILITY(U,$J,358.3,5136,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5136,1,2,0)
 ;;=2^707.00
 ;;^UTILITY(U,$J,358.3,5136,1,5,0)
 ;;=5^Decubitus Ulcer
 ;;^UTILITY(U,$J,358.3,5136,2)
 ;;=Decubitus Ulcer^331556
 ;;^UTILITY(U,$J,358.3,5137,0)
 ;;=707.13^^25^291^1
 ;;^UTILITY(U,$J,358.3,5137,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5137,1,2,0)
 ;;=2^707.13
 ;;^UTILITY(U,$J,358.3,5137,1,5,0)
 ;;=5^Ulcer Of Ankle
 ;;^UTILITY(U,$J,358.3,5137,2)
 ;;=^322145
 ;;^UTILITY(U,$J,358.3,5138,0)
 ;;=707.12^^25^291^2
 ;;^UTILITY(U,$J,358.3,5138,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5138,1,2,0)
 ;;=2^707.12
 ;;^UTILITY(U,$J,358.3,5138,1,5,0)
 ;;=5^Ulcer Of Calf
 ;;^UTILITY(U,$J,358.3,5138,2)
 ;;=^322144
 ;;^UTILITY(U,$J,358.3,5139,0)
 ;;=707.15^^25^291^6
 ;;^UTILITY(U,$J,358.3,5139,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5139,1,2,0)
 ;;=2^707.15
 ;;^UTILITY(U,$J,358.3,5139,1,5,0)
 ;;=5^Ulcer Of Toes
 ;;^UTILITY(U,$J,358.3,5139,2)
 ;;=^322148
 ;;^UTILITY(U,$J,358.3,5140,0)
 ;;=707.14^^25^291^3
 ;;^UTILITY(U,$J,358.3,5140,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5140,1,2,0)
 ;;=2^707.14
 ;;^UTILITY(U,$J,358.3,5140,1,5,0)
 ;;=5^Ulcer of Heal/Midfoot
 ;;^UTILITY(U,$J,358.3,5140,2)
 ;;=^322146
 ;;^UTILITY(U,$J,358.3,5141,0)
 ;;=707.19^^25^291^4
 ;;^UTILITY(U,$J,358.3,5141,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5141,1,2,0)
 ;;=2^707.19
 ;;^UTILITY(U,$J,358.3,5141,1,5,0)
 ;;=5^Ulcer Of Knee
 ;;^UTILITY(U,$J,358.3,5141,2)
 ;;=^322150
 ;;^UTILITY(U,$J,358.3,5142,0)
 ;;=707.11^^25^291^5
 ;;^UTILITY(U,$J,358.3,5142,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5142,1,2,0)
 ;;=2^707.11
 ;;^UTILITY(U,$J,358.3,5142,1,5,0)
 ;;=5^Ulcer Of Thigh
 ;;^UTILITY(U,$J,358.3,5142,2)
 ;;=^322143
 ;;^UTILITY(U,$J,358.3,5143,0)
 ;;=995.1^^25^292^1
 ;;^UTILITY(U,$J,358.3,5143,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,5143,1,2,0)
 ;;=2^995.1
 ;;^UTILITY(U,$J,358.3,5143,1,5,0)
 ;;=5^Angioedema
 ;;^UTILITY(U,$J,358.3,5143,2)
 ;;=^7527
 ;;
 ;;$END ROU IBDEI0BN