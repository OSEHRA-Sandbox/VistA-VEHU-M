IBDEI0W7 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,15648,1,5,0)
 ;;=5^Iron Defic Anemia d/t Acute Blood Loss
 ;;^UTILITY(U,$J,358.3,15648,2)
 ;;=^267986
 ;;^UTILITY(U,$J,358.3,15649,0)
 ;;=280.0^^81^946^85
 ;;^UTILITY(U,$J,358.3,15649,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15649,1,4,0)
 ;;=4^280.0
 ;;^UTILITY(U,$J,358.3,15649,1,5,0)
 ;;=5^Iron Defic Anemia d/t Chronic Blood Loss
 ;;^UTILITY(U,$J,358.3,15649,2)
 ;;=^267971
 ;;^UTILITY(U,$J,358.3,15650,0)
 ;;=281.9^^81^946^107
 ;;^UTILITY(U,$J,358.3,15650,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15650,1,4,0)
 ;;=4^281.9
 ;;^UTILITY(U,$J,358.3,15650,1,5,0)
 ;;=5^Nutritional Anemia
 ;;^UTILITY(U,$J,358.3,15650,2)
 ;;=^123801
 ;;^UTILITY(U,$J,358.3,15651,0)
 ;;=281.0^^81^946^123
 ;;^UTILITY(U,$J,358.3,15651,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15651,1,4,0)
 ;;=4^281.0
 ;;^UTILITY(U,$J,358.3,15651,1,5,0)
 ;;=5^Vit B12 Deficiency (Pernicious Anemia)
 ;;^UTILITY(U,$J,358.3,15651,2)
 ;;=^7161
 ;;^UTILITY(U,$J,358.3,15652,0)
 ;;=282.60^^81^946^111
 ;;^UTILITY(U,$J,358.3,15652,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15652,1,4,0)
 ;;=4^282.60
 ;;^UTILITY(U,$J,358.3,15652,1,5,0)
 ;;=5^Sickle-Cell Anemia
 ;;^UTILITY(U,$J,358.3,15652,2)
 ;;=^7188
 ;;^UTILITY(U,$J,358.3,15653,0)
 ;;=282.62^^81^946^112
 ;;^UTILITY(U,$J,358.3,15653,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15653,1,4,0)
 ;;=4^282.62
 ;;^UTILITY(U,$J,358.3,15653,1,5,0)
 ;;=5^Sickle-Cell With Crisis
 ;;^UTILITY(U,$J,358.3,15653,2)
 ;;=^267982
 ;;^UTILITY(U,$J,358.3,15654,0)
 ;;=281.1^^81^946^124
 ;;^UTILITY(U,$J,358.3,15654,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15654,1,4,0)
 ;;=4^281.1
 ;;^UTILITY(U,$J,358.3,15654,1,5,0)
 ;;=5^Vit B12 Deficiency(Dietary)
 ;;^UTILITY(U,$J,358.3,15654,2)
 ;;=^267974
 ;;^UTILITY(U,$J,358.3,15655,0)
 ;;=286.7^^81^946^54
 ;;^UTILITY(U,$J,358.3,15655,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15655,1,4,0)
 ;;=4^286.7
 ;;^UTILITY(U,$J,358.3,15655,1,5,0)
 ;;=5^Coagulation Defect(Any),Acquired
 ;;^UTILITY(U,$J,358.3,15655,2)
 ;;=^2235
 ;;^UTILITY(U,$J,358.3,15656,0)
 ;;=289.9^^81^946^120
 ;;^UTILITY(U,$J,358.3,15656,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15656,1,4,0)
 ;;=4^289.9
 ;;^UTILITY(U,$J,358.3,15656,1,5,0)
 ;;=5^Thrombocytosis, Essential
 ;;^UTILITY(U,$J,358.3,15656,2)
 ;;=^55344
 ;;^UTILITY(U,$J,358.3,15657,0)
 ;;=451.9^^81^946^121
 ;;^UTILITY(U,$J,358.3,15657,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15657,1,4,0)
 ;;=4^451.9
 ;;^UTILITY(U,$J,358.3,15657,1,5,0)
 ;;=5^Thrombophlebitis 
 ;;^UTILITY(U,$J,358.3,15657,2)
 ;;=^93357
 ;;^UTILITY(U,$J,358.3,15658,0)
 ;;=446.6^^81^946^122
 ;;^UTILITY(U,$J,358.3,15658,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15658,1,4,0)
 ;;=4^446.6
 ;;^UTILITY(U,$J,358.3,15658,1,5,0)
 ;;=5^Thrombotic Thrombocytopenic Purpura(Ttp)
 ;;^UTILITY(U,$J,358.3,15658,2)
 ;;=^119061
 ;;^UTILITY(U,$J,358.3,15659,0)
 ;;=286.4^^81^946^125
 ;;^UTILITY(U,$J,358.3,15659,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15659,1,4,0)
 ;;=4^286.4
 ;;^UTILITY(U,$J,358.3,15659,1,5,0)
 ;;=5^Von Willebrand's Disease
 ;;^UTILITY(U,$J,358.3,15659,2)
 ;;=^127267
 ;;^UTILITY(U,$J,358.3,15660,0)
 ;;=204.00^^81^946^1
 ;;^UTILITY(U,$J,358.3,15660,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15660,1,4,0)
 ;;=4^204.00
 ;;^UTILITY(U,$J,358.3,15660,1,5,0)
 ;;=5^ALL w/o Remission
 ;;^UTILITY(U,$J,358.3,15660,2)
 ;;=^267521
 ;;^UTILITY(U,$J,358.3,15661,0)
 ;;=204.01^^81^946^3
 ;;^UTILITY(U,$J,358.3,15661,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,15661,1,4,0)
 ;;=4^204.01
 ;;^UTILITY(U,$J,358.3,15661,1,5,0)
 ;;=5^ALL,In Remission
 ;;^UTILITY(U,$J,358.3,15661,2)
 ;;=^267522
 ;;
 ;;$END ROU IBDEI0W7