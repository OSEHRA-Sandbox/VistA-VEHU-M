IBDEI1EB ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,24741,1,5,0)
 ;;=5^BIPOLAR I D/O MANIC NOS
 ;;^UTILITY(U,$J,358.3,24741,2)
 ;;=^331870
 ;;^UTILITY(U,$J,358.3,24742,0)
 ;;=296.80^^140^1527^1
 ;;^UTILITY(U,$J,358.3,24742,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24742,1,2,0)
 ;;=2^296.80
 ;;^UTILITY(U,$J,358.3,24742,1,5,0)
 ;;=5^BIPOLAR DISORDER NOS
 ;;^UTILITY(U,$J,358.3,24742,2)
 ;;=^331892
 ;;^UTILITY(U,$J,358.3,24743,0)
 ;;=331.0^^140^1528^1
 ;;^UTILITY(U,$J,358.3,24743,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24743,1,2,0)
 ;;=2^331.0
 ;;^UTILITY(U,$J,358.3,24743,1,5,0)
 ;;=5^DEMENTIA,ALZHEIMER'S DISEASE
 ;;^UTILITY(U,$J,358.3,24743,2)
 ;;=^5679^294.11
 ;;^UTILITY(U,$J,358.3,24744,0)
 ;;=290.10^^140^1528^2
 ;;^UTILITY(U,$J,358.3,24744,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24744,1,2,0)
 ;;=2^290.10
 ;;^UTILITY(U,$J,358.3,24744,1,5,0)
 ;;=5^DEMENTIA,PRESENILE
 ;;^UTILITY(U,$J,358.3,24744,2)
 ;;=^31674
 ;;^UTILITY(U,$J,358.3,24745,0)
 ;;=290.0^^140^1528^3
 ;;^UTILITY(U,$J,358.3,24745,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24745,1,2,0)
 ;;=2^290.0
 ;;^UTILITY(U,$J,358.3,24745,1,5,0)
 ;;=5^DEMENTIA,SENILE UNCOMP
 ;;^UTILITY(U,$J,358.3,24745,2)
 ;;=^31703
 ;;^UTILITY(U,$J,358.3,24746,0)
 ;;=290.3^^140^1528^4
 ;;^UTILITY(U,$J,358.3,24746,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24746,1,2,0)
 ;;=2^290.3
 ;;^UTILITY(U,$J,358.3,24746,1,5,0)
 ;;=5^DEMENTIA,SENILE W/ DELIRIUM
 ;;^UTILITY(U,$J,358.3,24746,2)
 ;;=^303485
 ;;^UTILITY(U,$J,358.3,24747,0)
 ;;=294.11^^140^1528^5
 ;;^UTILITY(U,$J,358.3,24747,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24747,1,2,0)
 ;;=2^294.11
 ;;^UTILITY(U,$J,358.3,24747,1,5,0)
 ;;=5^DEMENTIA W/BEHAV DISTURB
 ;;^UTILITY(U,$J,358.3,24747,2)
 ;;=^321982
 ;;^UTILITY(U,$J,358.3,24748,0)
 ;;=294.10^^140^1528^6
 ;;^UTILITY(U,$J,358.3,24748,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24748,1,2,0)
 ;;=2^294.10
 ;;^UTILITY(U,$J,358.3,24748,1,5,0)
 ;;=5^DEMENTIA W/O BEHAV DISTURB
 ;;^UTILITY(U,$J,358.3,24748,2)
 ;;=^321980
 ;;^UTILITY(U,$J,358.3,24749,0)
 ;;=311.^^140^1529^1
 ;;^UTILITY(U,$J,358.3,24749,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24749,1,2,0)
 ;;=2^311.
 ;;^UTILITY(U,$J,358.3,24749,1,5,0)
 ;;=5^DEPRESSION
 ;;^UTILITY(U,$J,358.3,24749,2)
 ;;=^35603
 ;;^UTILITY(U,$J,358.3,24750,0)
 ;;=300.4^^140^1529^2
 ;;^UTILITY(U,$J,358.3,24750,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24750,1,2,0)
 ;;=2^300.4
 ;;^UTILITY(U,$J,358.3,24750,1,5,0)
 ;;=5^DYSTHYMIC DISORDER
 ;;^UTILITY(U,$J,358.3,24750,2)
 ;;=^331913
 ;;^UTILITY(U,$J,358.3,24751,0)
 ;;=296.30^^140^1529^3
 ;;^UTILITY(U,$J,358.3,24751,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24751,1,2,0)
 ;;=2^296.30
 ;;^UTILITY(U,$J,358.3,24751,1,5,0)
 ;;=5^MAJOR DEPRESSION,RECURRENT
 ;;^UTILITY(U,$J,358.3,24751,2)
 ;;=^303614
 ;;^UTILITY(U,$J,358.3,24752,0)
 ;;=296.20^^140^1529^4
 ;;^UTILITY(U,$J,358.3,24752,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24752,1,2,0)
 ;;=2^296.20
 ;;^UTILITY(U,$J,358.3,24752,1,5,0)
 ;;=5^MAJOR DEPRESSION,SINGLE EPISODE
 ;;^UTILITY(U,$J,358.3,24752,2)
 ;;=^303598
 ;;^UTILITY(U,$J,358.3,24753,0)
 ;;=789.00^^140^1530^1
 ;;^UTILITY(U,$J,358.3,24753,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24753,1,2,0)
 ;;=2^789.00
 ;;^UTILITY(U,$J,358.3,24753,1,5,0)
 ;;=5^ABDOM PAIN, UNSP SITE
 ;;^UTILITY(U,$J,358.3,24753,2)
 ;;=^303317
 ;;^UTILITY(U,$J,358.3,24754,0)
 ;;=719.47^^140^1530^2
 ;;^UTILITY(U,$J,358.3,24754,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,24754,1,2,0)
 ;;=2^719.47
 ;;^UTILITY(U,$J,358.3,24754,1,5,0)
 ;;=5^ANKLE PAIN
 ;;^UTILITY(U,$J,358.3,24754,2)
 ;;=^272404
 ;;^UTILITY(U,$J,358.3,24755,0)
 ;;=724.5^^140^1530^3
 ;;
 ;;$END ROU IBDEI1EB