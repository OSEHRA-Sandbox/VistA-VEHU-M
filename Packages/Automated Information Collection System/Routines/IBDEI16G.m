IBDEI16G ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,20789,1,3,0)
 ;;=3^724.2
 ;;^UTILITY(U,$J,358.3,20789,1,4,0)
 ;;=4^Low Back Pain, Lumbago
 ;;^UTILITY(U,$J,358.3,20789,2)
 ;;=^71885
 ;;^UTILITY(U,$J,358.3,20790,0)
 ;;=715.90^^112^1288^4
 ;;^UTILITY(U,$J,358.3,20790,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20790,1,3,0)
 ;;=3^715.90
 ;;^UTILITY(U,$J,358.3,20790,1,4,0)
 ;;=4^Osteoarthro Unspec
 ;;^UTILITY(U,$J,358.3,20790,2)
 ;;=^272161
 ;;^UTILITY(U,$J,358.3,20791,0)
 ;;=848.9^^112^1288^8
 ;;^UTILITY(U,$J,358.3,20791,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20791,1,3,0)
 ;;=3^848.9
 ;;^UTILITY(U,$J,358.3,20791,1,4,0)
 ;;=4^Sprain Nos
 ;;^UTILITY(U,$J,358.3,20791,2)
 ;;=^123990
 ;;^UTILITY(U,$J,358.3,20792,0)
 ;;=727.3^^112^1288^1
 ;;^UTILITY(U,$J,358.3,20792,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20792,1,3,0)
 ;;=3^727.3
 ;;^UTILITY(U,$J,358.3,20792,1,4,0)
 ;;=4^Bursitis
 ;;^UTILITY(U,$J,358.3,20792,2)
 ;;=^87364
 ;;^UTILITY(U,$J,358.3,20793,0)
 ;;=714.0^^112^1288^7
 ;;^UTILITY(U,$J,358.3,20793,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20793,1,3,0)
 ;;=3^714.0
 ;;^UTILITY(U,$J,358.3,20793,1,4,0)
 ;;=4^Rheumatoid Arthritis
 ;;^UTILITY(U,$J,358.3,20793,2)
 ;;=^10473
 ;;^UTILITY(U,$J,358.3,20794,0)
 ;;=733.90^^112^1288^5
 ;;^UTILITY(U,$J,358.3,20794,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20794,1,3,0)
 ;;=3^733.90
 ;;^UTILITY(U,$J,358.3,20794,1,4,0)
 ;;=4^Osteopenia
 ;;^UTILITY(U,$J,358.3,20794,2)
 ;;=^35593
 ;;^UTILITY(U,$J,358.3,20795,0)
 ;;=733.00^^112^1288^6
 ;;^UTILITY(U,$J,358.3,20795,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20795,1,3,0)
 ;;=3^733.00
 ;;^UTILITY(U,$J,358.3,20795,1,4,0)
 ;;=4^Osteoporosis Nos
 ;;^UTILITY(U,$J,358.3,20795,2)
 ;;=^87159
 ;;^UTILITY(U,$J,358.3,20796,0)
 ;;=331.0^^112^1289^1
 ;;^UTILITY(U,$J,358.3,20796,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20796,1,3,0)
 ;;=3^331.0
 ;;^UTILITY(U,$J,358.3,20796,1,4,0)
 ;;=4^Alzheimer's Disease
 ;;^UTILITY(U,$J,358.3,20796,2)
 ;;=^5679
 ;;^UTILITY(U,$J,358.3,20797,0)
 ;;=438.9^^112^1289^2
 ;;^UTILITY(U,$J,358.3,20797,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20797,1,3,0)
 ;;=3^438.9
 ;;^UTILITY(U,$J,358.3,20797,1,4,0)
 ;;=4^CVA, Late Effects
 ;;^UTILITY(U,$J,358.3,20797,2)
 ;;=^269757
 ;;^UTILITY(U,$J,358.3,20798,0)
 ;;=340.^^112^1289^10
 ;;^UTILITY(U,$J,358.3,20798,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20798,1,3,0)
 ;;=3^340.
 ;;^UTILITY(U,$J,358.3,20798,1,4,0)
 ;;=4^Multiple Sclerosis
 ;;^UTILITY(U,$J,358.3,20798,2)
 ;;=^79761
 ;;^UTILITY(U,$J,358.3,20799,0)
 ;;=332.0^^112^1289^12
 ;;^UTILITY(U,$J,358.3,20799,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20799,1,3,0)
 ;;=3^332.0
 ;;^UTILITY(U,$J,358.3,20799,1,4,0)
 ;;=4^Parkinson's Disease
 ;;^UTILITY(U,$J,358.3,20799,2)
 ;;=^304847
 ;;^UTILITY(U,$J,358.3,20800,0)
 ;;=356.9^^112^1289^13
 ;;^UTILITY(U,$J,358.3,20800,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20800,1,3,0)
 ;;=3^356.9
 ;;^UTILITY(U,$J,358.3,20800,1,4,0)
 ;;=4^Periph Neurpthy, Idiopathic
 ;;^UTILITY(U,$J,358.3,20800,2)
 ;;=^123931
 ;;^UTILITY(U,$J,358.3,20801,0)
 ;;=780.39^^112^1289^15
 ;;^UTILITY(U,$J,358.3,20801,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20801,1,3,0)
 ;;=3^780.39
 ;;^UTILITY(U,$J,358.3,20801,1,4,0)
 ;;=4^Seizures/Convulsions
 ;;^UTILITY(U,$J,358.3,20801,2)
 ;;=^28162
 ;;^UTILITY(U,$J,358.3,20802,0)
 ;;=907.2^^112^1289^16
 ;;^UTILITY(U,$J,358.3,20802,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,20802,1,3,0)
 ;;=3^907.2
 ;;^UTILITY(U,$J,358.3,20802,1,4,0)
 ;;=4^Spinal Cord Inj, Late Effects
 ;;^UTILITY(U,$J,358.3,20802,2)
 ;;=^275240
 ;;^UTILITY(U,$J,358.3,20803,0)
 ;;=290.40^^112^1289^5
 ;;
 ;;$END ROU IBDEI16G