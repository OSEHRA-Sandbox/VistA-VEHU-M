IBDEI1CF ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,23791,2)
 ;;=^268112
 ;;^UTILITY(U,$J,358.3,23792,0)
 ;;=296.24^^127^1434^4
 ;;^UTILITY(U,$J,358.3,23792,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23792,1,2,0)
 ;;=2^296.24
 ;;^UTILITY(U,$J,358.3,23792,1,5,0)
 ;;=5^MDD Sing, Sev w/Psychosis
 ;;^UTILITY(U,$J,358.3,23792,2)
 ;;=^268113
 ;;^UTILITY(U,$J,358.3,23793,0)
 ;;=296.25^^127^1434^15
 ;;^UTILITY(U,$J,358.3,23793,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23793,1,2,0)
 ;;=2^296.25
 ;;^UTILITY(U,$J,358.3,23793,1,5,0)
 ;;=5^MDD, Single, Part Remiss
 ;;^UTILITY(U,$J,358.3,23793,2)
 ;;=^268114
 ;;^UTILITY(U,$J,358.3,23794,0)
 ;;=296.30^^127^1434^9
 ;;^UTILITY(U,$J,358.3,23794,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23794,1,2,0)
 ;;=2^296.30
 ;;^UTILITY(U,$J,358.3,23794,1,5,0)
 ;;=5^MDD, Recur, NOS
 ;;^UTILITY(U,$J,358.3,23794,2)
 ;;=^268116
 ;;^UTILITY(U,$J,358.3,23795,0)
 ;;=296.31^^127^1434^7
 ;;^UTILITY(U,$J,358.3,23795,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23795,1,2,0)
 ;;=2^296.31
 ;;^UTILITY(U,$J,358.3,23795,1,5,0)
 ;;=5^MDD, Recur, Mild
 ;;^UTILITY(U,$J,358.3,23795,2)
 ;;=^268117
 ;;^UTILITY(U,$J,358.3,23796,0)
 ;;=296.32^^127^1434^8
 ;;^UTILITY(U,$J,358.3,23796,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23796,1,2,0)
 ;;=2^296.32
 ;;^UTILITY(U,$J,358.3,23796,1,5,0)
 ;;=5^MDD, Recur, Moderate
 ;;^UTILITY(U,$J,358.3,23796,2)
 ;;=^268118
 ;;^UTILITY(U,$J,358.3,23797,0)
 ;;=296.33^^127^1434^3
 ;;^UTILITY(U,$J,358.3,23797,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23797,1,2,0)
 ;;=2^296.33
 ;;^UTILITY(U,$J,358.3,23797,1,5,0)
 ;;=5^MDD Recur, Sev w/o Psychosis
 ;;^UTILITY(U,$J,358.3,23797,2)
 ;;=^268119
 ;;^UTILITY(U,$J,358.3,23798,0)
 ;;=296.34^^127^1434^2
 ;;^UTILITY(U,$J,358.3,23798,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23798,1,2,0)
 ;;=2^296.34
 ;;^UTILITY(U,$J,358.3,23798,1,5,0)
 ;;=5^MDD Recur, Sev w/Psychosis
 ;;^UTILITY(U,$J,358.3,23798,2)
 ;;=^268120
 ;;^UTILITY(U,$J,358.3,23799,0)
 ;;=296.35^^127^1434^10
 ;;^UTILITY(U,$J,358.3,23799,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23799,1,2,0)
 ;;=2^296.35
 ;;^UTILITY(U,$J,358.3,23799,1,5,0)
 ;;=5^MDD, Recur, Part Remiss
 ;;^UTILITY(U,$J,358.3,23799,2)
 ;;=^268121
 ;;^UTILITY(U,$J,358.3,23800,0)
 ;;=296.36^^127^1434^6
 ;;^UTILITY(U,$J,358.3,23800,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23800,1,2,0)
 ;;=2^296.36
 ;;^UTILITY(U,$J,358.3,23800,1,5,0)
 ;;=5^MDD, Recur, Full Remiss
 ;;^UTILITY(U,$J,358.3,23800,2)
 ;;=^268122
 ;;^UTILITY(U,$J,358.3,23801,0)
 ;;=311.^^127^1434^1
 ;;^UTILITY(U,$J,358.3,23801,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23801,1,2,0)
 ;;=2^311.
 ;;^UTILITY(U,$J,358.3,23801,1,5,0)
 ;;=5^Depression, NOS
 ;;^UTILITY(U,$J,358.3,23801,2)
 ;;=^35603
 ;;^UTILITY(U,$J,358.3,23802,0)
 ;;=296.26^^127^1434^11
 ;;^UTILITY(U,$J,358.3,23802,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23802,1,2,0)
 ;;=2^296.26
 ;;^UTILITY(U,$J,358.3,23802,1,5,0)
 ;;=5^MDD, Single, Full Remiss
 ;;^UTILITY(U,$J,358.3,23802,2)
 ;;=^268115
 ;;^UTILITY(U,$J,358.3,23803,0)
 ;;=301.13^^127^1435^1
 ;;^UTILITY(U,$J,358.3,23803,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23803,1,2,0)
 ;;=2^301.13
 ;;^UTILITY(U,$J,358.3,23803,1,5,0)
 ;;=5^Cyclothymic Disorder
 ;;^UTILITY(U,$J,358.3,23803,2)
 ;;=^30028
 ;;^UTILITY(U,$J,358.3,23804,0)
 ;;=300.4^^127^1435^2
 ;;^UTILITY(U,$J,358.3,23804,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,23804,1,2,0)
 ;;=2^300.4
 ;;^UTILITY(U,$J,358.3,23804,1,5,0)
 ;;=5^Dysthymia
 ;;^UTILITY(U,$J,358.3,23804,2)
 ;;=^303478
 ;;^UTILITY(U,$J,358.3,23805,0)
 ;;=293.82^^127^1435^4
 ;;^UTILITY(U,$J,358.3,23805,1,0)
 ;;=^358.31IA^5^2
 ;;
 ;;$END ROU IBDEI1CF