IBDEI0E7 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,6466,2)
 ;;=^67056
 ;;^UTILITY(U,$J,358.3,6467,0)
 ;;=403.91^^31^411^49
 ;;^UTILITY(U,$J,358.3,6467,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6467,1,4,0)
 ;;=4^403.91
 ;;^UTILITY(U,$J,358.3,6467,1,5,0)
 ;;=5^Renal Failure, Chronic Hypertensive
 ;;^UTILITY(U,$J,358.3,6467,2)
 ;;=^269610
 ;;^UTILITY(U,$J,358.3,6468,0)
 ;;=586.^^31^411^54
 ;;^UTILITY(U,$J,358.3,6468,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6468,1,4,0)
 ;;=4^586.
 ;;^UTILITY(U,$J,358.3,6468,1,5,0)
 ;;=5^Uremia
 ;;^UTILITY(U,$J,358.3,6468,2)
 ;;=Uremia^104733
 ;;^UTILITY(U,$J,358.3,6469,0)
 ;;=599.0^^31^411^66
 ;;^UTILITY(U,$J,358.3,6469,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6469,1,4,0)
 ;;=4^599.0
 ;;^UTILITY(U,$J,358.3,6469,1,5,0)
 ;;=5^Urinary Tract Infection
 ;;^UTILITY(U,$J,358.3,6469,2)
 ;;=Urinary Tract Infection^124436
 ;;^UTILITY(U,$J,358.3,6470,0)
 ;;=275.42^^31^411^25
 ;;^UTILITY(U,$J,358.3,6470,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6470,1,4,0)
 ;;=4^275.42
 ;;^UTILITY(U,$J,358.3,6470,1,5,0)
 ;;=5^Hypercalcemia
 ;;^UTILITY(U,$J,358.3,6470,2)
 ;;=Hypercalcemia^59932
 ;;^UTILITY(U,$J,358.3,6471,0)
 ;;=275.41^^31^411^28
 ;;^UTILITY(U,$J,358.3,6471,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6471,1,4,0)
 ;;=4^275.41
 ;;^UTILITY(U,$J,358.3,6471,1,5,0)
 ;;=5^Hypocalcemia
 ;;^UTILITY(U,$J,358.3,6471,2)
 ;;=Hypocalcemia^60542
 ;;^UTILITY(U,$J,358.3,6472,0)
 ;;=276.7^^31^411^26
 ;;^UTILITY(U,$J,358.3,6472,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6472,1,4,0)
 ;;=4^276.7
 ;;^UTILITY(U,$J,358.3,6472,1,5,0)
 ;;=5^Hyperkalemia/Hyperpotassemia
 ;;^UTILITY(U,$J,358.3,6472,2)
 ;;=Hyperkalemia/Hyperpotassemia^60042
 ;;^UTILITY(U,$J,358.3,6473,0)
 ;;=276.8^^31^411^29
 ;;^UTILITY(U,$J,358.3,6473,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6473,1,4,0)
 ;;=4^276.8
 ;;^UTILITY(U,$J,358.3,6473,1,5,0)
 ;;=5^Hypokalemia/Hypopotassemia
 ;;^UTILITY(U,$J,358.3,6473,2)
 ;;=Hypokalemia/Hypopotassemia^60611
 ;;^UTILITY(U,$J,358.3,6474,0)
 ;;=275.2^^31^411^23
 ;;^UTILITY(U,$J,358.3,6474,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6474,1,4,0)
 ;;=4^275.2
 ;;^UTILITY(U,$J,358.3,6474,1,5,0)
 ;;=5^Hyper Or Hypomagnesemia
 ;;^UTILITY(U,$J,358.3,6474,2)
 ;;=^35626
 ;;^UTILITY(U,$J,358.3,6475,0)
 ;;=276.0^^31^411^27
 ;;^UTILITY(U,$J,358.3,6475,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6475,1,4,0)
 ;;=4^276.0
 ;;^UTILITY(U,$J,358.3,6475,1,5,0)
 ;;=5^Hypernatremia
 ;;^UTILITY(U,$J,358.3,6475,2)
 ;;=^60144
 ;;^UTILITY(U,$J,358.3,6476,0)
 ;;=276.1^^31^411^30
 ;;^UTILITY(U,$J,358.3,6476,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6476,1,4,0)
 ;;=4^276.1
 ;;^UTILITY(U,$J,358.3,6476,1,5,0)
 ;;=5^Hyponatremia
 ;;^UTILITY(U,$J,358.3,6476,2)
 ;;=Hyponatremia^60722
 ;;^UTILITY(U,$J,358.3,6477,0)
 ;;=275.3^^31^411^24
 ;;^UTILITY(U,$J,358.3,6477,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6477,1,4,0)
 ;;=4^275.3
 ;;^UTILITY(U,$J,358.3,6477,1,5,0)
 ;;=5^Hyper Or Hypophosphatemia
 ;;^UTILITY(U,$J,358.3,6477,2)
 ;;=^93796
 ;;^UTILITY(U,$J,358.3,6478,0)
 ;;=250.40^^31^411^13
 ;;^UTILITY(U,$J,358.3,6478,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6478,1,4,0)
 ;;=4^250.40
 ;;^UTILITY(U,$J,358.3,6478,1,5,0)
 ;;=5^DM type II with Nephropathy
 ;;^UTILITY(U,$J,358.3,6478,2)
 ;;=DM type II with Nephropathy^267837^583.81
 ;;^UTILITY(U,$J,358.3,6479,0)
 ;;=790.93^^31^411^1
 ;;^UTILITY(U,$J,358.3,6479,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6479,1,4,0)
 ;;=4^790.93
 ;;^UTILITY(U,$J,358.3,6479,1,5,0)
 ;;=5^Abnormal PSA
 ;;^UTILITY(U,$J,358.3,6479,2)
 ;;=Abnormal PSA^295772
 ;;^UTILITY(U,$J,358.3,6480,0)
 ;;=627.3^^31^411^3
 ;;^UTILITY(U,$J,358.3,6480,1,0)
 ;;=^358.31IA^5^2
 ;;
 ;;$END ROU IBDEI0E7
