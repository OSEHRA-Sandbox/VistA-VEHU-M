IBDEI1WE ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,33377,2)
 ;;=^5008320
 ;;^UTILITY(U,$J,358.3,33378,0)
 ;;=R06.2^^182^2002^56
 ;;^UTILITY(U,$J,358.3,33378,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33378,1,3,0)
 ;;=3^Wheezing
 ;;^UTILITY(U,$J,358.3,33378,1,4,0)
 ;;=4^R06.2
 ;;^UTILITY(U,$J,358.3,33378,2)
 ;;=^5019184
 ;;^UTILITY(U,$J,358.3,33379,0)
 ;;=T74.21XA^^182^2003^1
 ;;^UTILITY(U,$J,358.3,33379,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33379,1,3,0)
 ;;=3^Adult Sexual Abuse,Confirmed,Init
 ;;^UTILITY(U,$J,358.3,33379,1,4,0)
 ;;=4^T74.21XA
 ;;^UTILITY(U,$J,358.3,33379,2)
 ;;=^5054152
 ;;^UTILITY(U,$J,358.3,33380,0)
 ;;=T76.21XA^^182^2003^2
 ;;^UTILITY(U,$J,358.3,33380,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33380,1,3,0)
 ;;=3^Adult Sexual Abuse,Suspected,Init
 ;;^UTILITY(U,$J,358.3,33380,1,4,0)
 ;;=4^T76.21XA
 ;;^UTILITY(U,$J,358.3,33380,2)
 ;;=^5054227
 ;;^UTILITY(U,$J,358.3,33381,0)
 ;;=Y07.9^^182^2003^3
 ;;^UTILITY(U,$J,358.3,33381,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33381,1,3,0)
 ;;=3^Perpetrator of Maltreatment/Neglect,Unspec
 ;;^UTILITY(U,$J,358.3,33381,1,4,0)
 ;;=4^Y07.9
 ;;^UTILITY(U,$J,358.3,33381,2)
 ;;=^5061209
 ;;^UTILITY(U,$J,358.3,33382,0)
 ;;=E66.01^^182^2004^114
 ;;^UTILITY(U,$J,358.3,33382,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33382,1,3,0)
 ;;=3^Morbid Obesity
 ;;^UTILITY(U,$J,358.3,33382,1,4,0)
 ;;=4^E66.01
 ;;^UTILITY(U,$J,358.3,33382,2)
 ;;=^5002826
 ;;^UTILITY(U,$J,358.3,33383,0)
 ;;=F18.10^^182^2004^89
 ;;^UTILITY(U,$J,358.3,33383,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33383,1,3,0)
 ;;=3^Inhalant Abuse,Uncomplicated
 ;;^UTILITY(U,$J,358.3,33383,1,4,0)
 ;;=4^F18.10
 ;;^UTILITY(U,$J,358.3,33383,2)
 ;;=^5003380
 ;;^UTILITY(U,$J,358.3,33384,0)
 ;;=F55.0^^182^2004^36
 ;;^UTILITY(U,$J,358.3,33384,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33384,1,3,0)
 ;;=3^Antacid Abuse
 ;;^UTILITY(U,$J,358.3,33384,1,4,0)
 ;;=4^F55.0
 ;;^UTILITY(U,$J,358.3,33384,2)
 ;;=^5003628
 ;;^UTILITY(U,$J,358.3,33385,0)
 ;;=F18.90^^182^2004^90
 ;;^UTILITY(U,$J,358.3,33385,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33385,1,3,0)
 ;;=3^Inhalant Use Uncomplicated,Unspec
 ;;^UTILITY(U,$J,358.3,33385,1,4,0)
 ;;=4^F18.90
 ;;^UTILITY(U,$J,358.3,33385,2)
 ;;=^5003405
 ;;^UTILITY(U,$J,358.3,33386,0)
 ;;=F55.2^^182^2004^96
 ;;^UTILITY(U,$J,358.3,33386,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33386,1,3,0)
 ;;=3^Laxative Abuse
 ;;^UTILITY(U,$J,358.3,33386,1,4,0)
 ;;=4^F55.2
 ;;^UTILITY(U,$J,358.3,33386,2)
 ;;=^5003630
 ;;^UTILITY(U,$J,358.3,33387,0)
 ;;=F55.1^^182^2004^77
 ;;^UTILITY(U,$J,358.3,33387,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33387,1,3,0)
 ;;=3^Herbal/Folk Remedy Abuse
 ;;^UTILITY(U,$J,358.3,33387,1,4,0)
 ;;=4^F55.1
 ;;^UTILITY(U,$J,358.3,33387,2)
 ;;=^5003629
 ;;^UTILITY(U,$J,358.3,33388,0)
 ;;=F55.8^^182^2004^118
 ;;^UTILITY(U,$J,358.3,33388,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33388,1,3,0)
 ;;=3^Non-Psychoactive Substance Abuse
 ;;^UTILITY(U,$J,358.3,33388,1,4,0)
 ;;=4^F55.8
 ;;^UTILITY(U,$J,358.3,33388,2)
 ;;=^5003633
 ;;^UTILITY(U,$J,358.3,33389,0)
 ;;=F55.4^^182^2004^155
 ;;^UTILITY(U,$J,358.3,33389,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33389,1,3,0)
 ;;=3^Vitamin Abuse
 ;;^UTILITY(U,$J,358.3,33389,1,4,0)
 ;;=4^F55.4
 ;;^UTILITY(U,$J,358.3,33389,2)
 ;;=^5003632
 ;;^UTILITY(U,$J,358.3,33390,0)
 ;;=F55.3^^182^2004^145
 ;;^UTILITY(U,$J,358.3,33390,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,33390,1,3,0)
 ;;=3^Steroid/Hormone Abuse
 ;;^UTILITY(U,$J,358.3,33390,1,4,0)
 ;;=4^F55.3
 ;;^UTILITY(U,$J,358.3,33390,2)
 ;;=^5003631
 ;;^UTILITY(U,$J,358.3,33391,0)
 ;;=F51.09^^182^2004^91
 ;;
 ;;$END ROU IBDEI1WE