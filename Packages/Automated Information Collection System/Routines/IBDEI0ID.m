IBDEI0ID ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,8593,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8593,1,4,0)
 ;;=4^789.30
 ;;^UTILITY(U,$J,358.3,8593,1,5,0)
 ;;=5^Abdominal Mass/Lump
 ;;^UTILITY(U,$J,358.3,8593,2)
 ;;=Abdominal Mass/Lump^917
 ;;^UTILITY(U,$J,358.3,8594,0)
 ;;=789.2^^35^487^140
 ;;^UTILITY(U,$J,358.3,8594,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8594,1,4,0)
 ;;=4^789.2
 ;;^UTILITY(U,$J,358.3,8594,1,5,0)
 ;;=5^Splenomegaly
 ;;^UTILITY(U,$J,358.3,8594,2)
 ;;=Splenomegaly^113452
 ;;^UTILITY(U,$J,358.3,8595,0)
 ;;=785.2^^35^487^34
 ;;^UTILITY(U,$J,358.3,8595,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8595,1,4,0)
 ;;=4^785.2
 ;;^UTILITY(U,$J,358.3,8595,1,5,0)
 ;;=5^Cardiac murmurs, undiagnosed
 ;;^UTILITY(U,$J,358.3,8595,2)
 ;;=^295854
 ;;^UTILITY(U,$J,358.3,8596,0)
 ;;=786.50^^35^487^37
 ;;^UTILITY(U,$J,358.3,8596,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8596,1,4,0)
 ;;=4^786.50
 ;;^UTILITY(U,$J,358.3,8596,1,5,0)
 ;;=5^Chest pain/Discomfort (nonsp) chest pain diff from discomfort
 ;;^UTILITY(U,$J,358.3,8596,2)
 ;;=^22485
 ;;^UTILITY(U,$J,358.3,8597,0)
 ;;=786.51^^35^487^131
 ;;^UTILITY(U,$J,358.3,8597,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8597,1,4,0)
 ;;=4^786.51
 ;;^UTILITY(U,$J,358.3,8597,1,5,0)
 ;;=5^Precordial Pain
 ;;^UTILITY(U,$J,358.3,8597,2)
 ;;=Precordial Pain^276877
 ;;^UTILITY(U,$J,358.3,8598,0)
 ;;=786.2^^35^487^45
 ;;^UTILITY(U,$J,358.3,8598,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8598,1,4,0)
 ;;=4^786.2
 ;;^UTILITY(U,$J,358.3,8598,1,5,0)
 ;;=5^Cough
 ;;^UTILITY(U,$J,358.3,8598,2)
 ;;=Cough^28905
 ;;^UTILITY(U,$J,358.3,8599,0)
 ;;=396.0^^35^487^42
 ;;^UTILITY(U,$J,358.3,8599,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8599,1,4,0)
 ;;=4^396.0
 ;;^UTILITY(U,$J,358.3,8599,1,5,0)
 ;;=5^Combined Aortic&Mitral Valve stenosis
 ;;^UTILITY(U,$J,358.3,8599,2)
 ;;=^269580
 ;;^UTILITY(U,$J,358.3,8600,0)
 ;;=786.09^^35^487^60
 ;;^UTILITY(U,$J,358.3,8600,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8600,1,4,0)
 ;;=4^786.09
 ;;^UTILITY(U,$J,358.3,8600,1,5,0)
 ;;=5^Dyspnea
 ;;^UTILITY(U,$J,358.3,8600,2)
 ;;=Dyspnea^87547
 ;;^UTILITY(U,$J,358.3,8601,0)
 ;;=786.8^^35^487^84
 ;;^UTILITY(U,$J,358.3,8601,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8601,1,4,0)
 ;;=4^786.8
 ;;^UTILITY(U,$J,358.3,8601,1,5,0)
 ;;=5^Hiccough
 ;;^UTILITY(U,$J,358.3,8601,2)
 ;;=Hiccough^57197
 ;;^UTILITY(U,$J,358.3,8602,0)
 ;;=786.01^^35^487^88
 ;;^UTILITY(U,$J,358.3,8602,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8602,1,4,0)
 ;;=4^786.01
 ;;^UTILITY(U,$J,358.3,8602,1,5,0)
 ;;=5^Hyperventilation
 ;;^UTILITY(U,$J,358.3,8602,2)
 ;;=Hyperventilation^60480
 ;;^UTILITY(U,$J,358.3,8603,0)
 ;;=786.6^^35^487^109
 ;;^UTILITY(U,$J,358.3,8603,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8603,1,4,0)
 ;;=4^786.6
 ;;^UTILITY(U,$J,358.3,8603,1,5,0)
 ;;=5^Mass, Lump of chest
 ;;^UTILITY(U,$J,358.3,8603,2)
 ;;=^273380
 ;;^UTILITY(U,$J,358.3,8604,0)
 ;;=786.02^^35^487^123
 ;;^UTILITY(U,$J,358.3,8604,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8604,1,4,0)
 ;;=4^786.02
 ;;^UTILITY(U,$J,358.3,8604,1,5,0)
 ;;=5^Orthopnea
 ;;^UTILITY(U,$J,358.3,8604,2)
 ;;=Orthopnea^186737
 ;;^UTILITY(U,$J,358.3,8605,0)
 ;;=786.52^^35^487^124
 ;;^UTILITY(U,$J,358.3,8605,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8605,1,4,0)
 ;;=4^786.52
 ;;^UTILITY(U,$J,358.3,8605,1,5,0)
 ;;=5^Painful Respiration
 ;;^UTILITY(U,$J,358.3,8605,2)
 ;;=^89126
 ;;^UTILITY(U,$J,358.3,8606,0)
 ;;=785.1^^35^487^126
 ;;^UTILITY(U,$J,358.3,8606,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,8606,1,4,0)
 ;;=4^785.1
 ;;^UTILITY(U,$J,358.3,8606,1,5,0)
 ;;=5^Palpitations
 ;;^UTILITY(U,$J,358.3,8606,2)
 ;;=Palpitations^89281
 ;;
 ;;$END ROU IBDEI0ID
