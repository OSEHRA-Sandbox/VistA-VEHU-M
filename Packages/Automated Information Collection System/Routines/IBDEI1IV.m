IBDEI1IV ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,27027,1,3,0)
 ;;=3^Foot Amputat Stat
 ;;^UTILITY(U,$J,358.3,27027,1,4,0)
 ;;=4^V49.73
 ;;^UTILITY(U,$J,358.3,27027,2)
 ;;=^303441
 ;;^UTILITY(U,$J,358.3,27028,0)
 ;;=V49.70^^160^1754^14
 ;;^UTILITY(U,$J,358.3,27028,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27028,1,3,0)
 ;;=3^Unsp L Limb Amput Stat
 ;;^UTILITY(U,$J,358.3,27028,1,4,0)
 ;;=4^V49.70
 ;;^UTILITY(U,$J,358.3,27028,2)
 ;;=^303438
 ;;^UTILITY(U,$J,358.3,27029,0)
 ;;=V49.71^^160^1754^7
 ;;^UTILITY(U,$J,358.3,27029,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27029,1,3,0)
 ;;=3^Great Toe Amputat Stat
 ;;^UTILITY(U,$J,358.3,27029,1,4,0)
 ;;=4^V49.71
 ;;^UTILITY(U,$J,358.3,27029,2)
 ;;=^303439
 ;;^UTILITY(U,$J,358.3,27030,0)
 ;;=V49.72^^160^1754^11
 ;;^UTILITY(U,$J,358.3,27030,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27030,1,3,0)
 ;;=3^Oth Toe(S) Amputat Stat
 ;;^UTILITY(U,$J,358.3,27030,1,4,0)
 ;;=4^V49.72
 ;;^UTILITY(U,$J,358.3,27030,2)
 ;;=^303440
 ;;^UTILITY(U,$J,358.3,27031,0)
 ;;=V49.60^^160^1754^15
 ;;^UTILITY(U,$J,358.3,27031,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27031,1,3,0)
 ;;=3^Unsp Lev U Limb Amput
 ;;^UTILITY(U,$J,358.3,27031,1,4,0)
 ;;=4^V49.60
 ;;^UTILITY(U,$J,358.3,27031,2)
 ;;=^303427
 ;;^UTILITY(U,$J,358.3,27032,0)
 ;;=V49.61^^160^1754^13
 ;;^UTILITY(U,$J,358.3,27032,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27032,1,3,0)
 ;;=3^Thumb Amput Status
 ;;^UTILITY(U,$J,358.3,27032,1,4,0)
 ;;=4^V49.61
 ;;^UTILITY(U,$J,358.3,27032,2)
 ;;=^303428
 ;;^UTILITY(U,$J,358.3,27033,0)
 ;;=V49.62^^160^1754^10
 ;;^UTILITY(U,$J,358.3,27033,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27033,1,3,0)
 ;;=3^Oth Finger(s) Amput Status
 ;;^UTILITY(U,$J,358.3,27033,1,4,0)
 ;;=4^V49.62
 ;;^UTILITY(U,$J,358.3,27033,2)
 ;;=^303429
 ;;^UTILITY(U,$J,358.3,27034,0)
 ;;=V49.63^^160^1754^8
 ;;^UTILITY(U,$J,358.3,27034,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27034,1,3,0)
 ;;=3^Hand Amput Status
 ;;^UTILITY(U,$J,358.3,27034,1,4,0)
 ;;=4^V49.63
 ;;^UTILITY(U,$J,358.3,27034,2)
 ;;=^303430
 ;;^UTILITY(U,$J,358.3,27035,0)
 ;;=V49.64^^160^1754^16
 ;;^UTILITY(U,$J,358.3,27035,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27035,1,3,0)
 ;;=3^Wrist Amput Status
 ;;^UTILITY(U,$J,358.3,27035,1,4,0)
 ;;=4^V49.64
 ;;^UTILITY(U,$J,358.3,27035,2)
 ;;=^303431
 ;;^UTILITY(U,$J,358.3,27036,0)
 ;;=V49.65^^160^1754^4
 ;;^UTILITY(U,$J,358.3,27036,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27036,1,3,0)
 ;;=3^Below Elbow Amput Status
 ;;^UTILITY(U,$J,358.3,27036,1,4,0)
 ;;=4^V49.65
 ;;^UTILITY(U,$J,358.3,27036,2)
 ;;=^303432
 ;;^UTILITY(U,$J,358.3,27037,0)
 ;;=V49.66^^160^1754^1
 ;;^UTILITY(U,$J,358.3,27037,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27037,1,3,0)
 ;;=3^Above Elbow Amput Status
 ;;^UTILITY(U,$J,358.3,27037,1,4,0)
 ;;=4^V49.66
 ;;^UTILITY(U,$J,358.3,27037,2)
 ;;=^303433
 ;;^UTILITY(U,$J,358.3,27038,0)
 ;;=V49.67^^160^1754^12
 ;;^UTILITY(U,$J,358.3,27038,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27038,1,3,0)
 ;;=3^Shoulder Amput Status
 ;;^UTILITY(U,$J,358.3,27038,1,4,0)
 ;;=4^V49.67
 ;;^UTILITY(U,$J,358.3,27038,2)
 ;;=^303434
 ;;^UTILITY(U,$J,358.3,27039,0)
 ;;=V49.77^^160^1754^9
 ;;^UTILITY(U,$J,358.3,27039,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27039,1,3,0)
 ;;=3^Hip Amput Status
 ;;^UTILITY(U,$J,358.3,27039,1,4,0)
 ;;=4^V49.77
 ;;^UTILITY(U,$J,358.3,27039,2)
 ;;=^303445
 ;;^UTILITY(U,$J,358.3,27040,0)
 ;;=784.3^^160^1755^1
 ;;^UTILITY(U,$J,358.3,27040,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,27040,1,3,0)
 ;;=3^Aphasia
 ;;^UTILITY(U,$J,358.3,27040,1,4,0)
 ;;=4^784.3
 ;;^UTILITY(U,$J,358.3,27040,2)
 ;;=^9453
 ;;
 ;;$END ROU IBDEI1IV