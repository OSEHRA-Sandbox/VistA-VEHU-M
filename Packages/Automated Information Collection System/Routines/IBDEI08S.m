IBDEI08S ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,3643,2)
 ;;=^74110
 ;;^UTILITY(U,$J,358.3,3644,0)
 ;;=V61.20^^11^158^41
 ;;^UTILITY(U,$J,358.3,3644,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3644,1,2,0)
 ;;=2^V61.20
 ;;^UTILITY(U,$J,358.3,3644,1,5,0)
 ;;=5^Parent-Child Problem NOS
 ;;^UTILITY(U,$J,358.3,3644,2)
 ;;=^304300
 ;;^UTILITY(U,$J,358.3,3645,0)
 ;;=V61.12^^11^158^5
 ;;^UTILITY(U,$J,358.3,3645,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3645,1,2,0)
 ;;=2^V61.12
 ;;^UTILITY(U,$J,358.3,3645,1,5,0)
 ;;=5^Domestic Violence/Perpet
 ;;^UTILITY(U,$J,358.3,3645,2)
 ;;=^304356
 ;;^UTILITY(U,$J,358.3,3646,0)
 ;;=V61.11^^11^158^6
 ;;^UTILITY(U,$J,358.3,3646,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3646,1,2,0)
 ;;=2^V61.11
 ;;^UTILITY(U,$J,358.3,3646,1,5,0)
 ;;=5^Domestic Violence/Victim
 ;;^UTILITY(U,$J,358.3,3646,2)
 ;;=^304357
 ;;^UTILITY(U,$J,358.3,3647,0)
 ;;=V62.0^^11^158^51
 ;;^UTILITY(U,$J,358.3,3647,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3647,1,2,0)
 ;;=2^V62.0
 ;;^UTILITY(U,$J,358.3,3647,1,5,0)
 ;;=5^Unemployment
 ;;^UTILITY(U,$J,358.3,3647,2)
 ;;=^123545
 ;;^UTILITY(U,$J,358.3,3648,0)
 ;;=V69.2^^11^158^17
 ;;^UTILITY(U,$J,358.3,3648,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3648,1,2,0)
 ;;=2^V69.2
 ;;^UTILITY(U,$J,358.3,3648,1,5,0)
 ;;=5^Hi-Risk Sexual Behavior
 ;;^UTILITY(U,$J,358.3,3648,2)
 ;;=^303474
 ;;^UTILITY(U,$J,358.3,3649,0)
 ;;=V62.82^^11^158^2
 ;;^UTILITY(U,$J,358.3,3649,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3649,1,2,0)
 ;;=2^V62.82
 ;;^UTILITY(U,$J,358.3,3649,1,5,0)
 ;;=5^Bereavement/Uncomplicated
 ;;^UTILITY(U,$J,358.3,3649,2)
 ;;=^123500
 ;;^UTILITY(U,$J,358.3,3650,0)
 ;;=V70.1^^11^158^46
 ;;^UTILITY(U,$J,358.3,3650,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3650,1,2,0)
 ;;=2^V70.1
 ;;^UTILITY(U,$J,358.3,3650,1,5,0)
 ;;=5^Psych Exam, Mandated
 ;;^UTILITY(U,$J,358.3,3650,2)
 ;;=^295591
 ;;^UTILITY(U,$J,358.3,3651,0)
 ;;=V60.2^^11^158^7
 ;;^UTILITY(U,$J,358.3,3651,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3651,1,2,0)
 ;;=2^V60.2
 ;;^UTILITY(U,$J,358.3,3651,1,5,0)
 ;;=5^Economic Problem
 ;;^UTILITY(U,$J,358.3,3651,2)
 ;;=^62174
 ;;^UTILITY(U,$J,358.3,3652,0)
 ;;=V62.89^^11^158^47
 ;;^UTILITY(U,$J,358.3,3652,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3652,1,2,0)
 ;;=2^V62.89
 ;;^UTILITY(U,$J,358.3,3652,1,5,0)
 ;;=5^Psychological Stress NEC
 ;;^UTILITY(U,$J,358.3,3652,2)
 ;;=^87822
 ;;^UTILITY(U,$J,358.3,3653,0)
 ;;=V62.9^^11^158^48
 ;;^UTILITY(U,$J,358.3,3653,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3653,1,2,0)
 ;;=2^V62.9
 ;;^UTILITY(U,$J,358.3,3653,1,5,0)
 ;;=5^Psychosocial Circum NOS
 ;;^UTILITY(U,$J,358.3,3653,2)
 ;;=^295551
 ;;^UTILITY(U,$J,358.3,3654,0)
 ;;=V60.0^^11^158^33
 ;;^UTILITY(U,$J,358.3,3654,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3654,1,2,0)
 ;;=2^V60.0
 ;;^UTILITY(U,$J,358.3,3654,1,5,0)
 ;;=5^Lack Of Housing
 ;;^UTILITY(U,$J,358.3,3654,2)
 ;;=^295539
 ;;^UTILITY(U,$J,358.3,3655,0)
 ;;=V62.81^^11^158^23
 ;;^UTILITY(U,$J,358.3,3655,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3655,1,2,0)
 ;;=2^V62.81
 ;;^UTILITY(U,$J,358.3,3655,1,5,0)
 ;;=5^Interpersonal Problem
 ;;^UTILITY(U,$J,358.3,3655,2)
 ;;=^276358
 ;;^UTILITY(U,$J,358.3,3656,0)
 ;;=V71.01^^11^158^36
 ;;^UTILITY(U,$J,358.3,3656,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3656,1,2,0)
 ;;=2^V71.01
 ;;^UTILITY(U,$J,358.3,3656,1,5,0)
 ;;=5^Observ-Antisocial Behav
 ;;^UTILITY(U,$J,358.3,3656,2)
 ;;=^295603
 ;;^UTILITY(U,$J,358.3,3657,0)
 ;;=V71.09^^11^158^37
 ;;^UTILITY(U,$J,358.3,3657,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,3657,1,2,0)
 ;;=2^V71.09
 ;;^UTILITY(U,$J,358.3,3657,1,5,0)
 ;;=5^Observ-Mental Condition
 ;;
 ;;$END ROU IBDEI08S