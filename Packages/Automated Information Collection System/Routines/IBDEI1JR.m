IBDEI1JR ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,27463,1,5,0)
 ;;=5^Hypertriglyceridemia, Pure
 ;;^UTILITY(U,$J,358.3,27463,2)
 ;;=Hypertriglyceridemia, Pure^101303
 ;;^UTILITY(U,$J,358.3,27464,0)
 ;;=272.2^^162^1782^24
 ;;^UTILITY(U,$J,358.3,27464,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27464,1,4,0)
 ;;=4^272.2
 ;;^UTILITY(U,$J,358.3,27464,1,5,0)
 ;;=5^Hyperlipidemia, Mixed
 ;;^UTILITY(U,$J,358.3,27464,2)
 ;;=^78424
 ;;^UTILITY(U,$J,358.3,27465,0)
 ;;=275.42^^162^1782^21
 ;;^UTILITY(U,$J,358.3,27465,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27465,1,4,0)
 ;;=4^275.42
 ;;^UTILITY(U,$J,358.3,27465,1,5,0)
 ;;=5^Hypercalcemia
 ;;^UTILITY(U,$J,358.3,27465,2)
 ;;=^59932
 ;;^UTILITY(U,$J,358.3,27466,0)
 ;;=275.41^^162^1782^28
 ;;^UTILITY(U,$J,358.3,27466,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27466,1,4,0)
 ;;=4^275.41
 ;;^UTILITY(U,$J,358.3,27466,1,5,0)
 ;;=5^Hypocalcemia
 ;;^UTILITY(U,$J,358.3,27466,2)
 ;;=^60542
 ;;^UTILITY(U,$J,358.3,27467,0)
 ;;=276.7^^162^1782^23
 ;;^UTILITY(U,$J,358.3,27467,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27467,1,4,0)
 ;;=4^276.7
 ;;^UTILITY(U,$J,358.3,27467,1,5,0)
 ;;=5^Hyperkalemia
 ;;^UTILITY(U,$J,358.3,27467,2)
 ;;=^60042
 ;;^UTILITY(U,$J,358.3,27468,0)
 ;;=275.2^^162^1782^19
 ;;^UTILITY(U,$J,358.3,27468,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27468,1,4,0)
 ;;=4^275.2
 ;;^UTILITY(U,$J,358.3,27468,1,5,0)
 ;;=5^Hyper or Hypomagnesemia
 ;;^UTILITY(U,$J,358.3,27468,2)
 ;;=^35626
 ;;^UTILITY(U,$J,358.3,27469,0)
 ;;=276.0^^162^1782^25
 ;;^UTILITY(U,$J,358.3,27469,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27469,1,4,0)
 ;;=4^276.0
 ;;^UTILITY(U,$J,358.3,27469,1,5,0)
 ;;=5^Hypernatremia
 ;;^UTILITY(U,$J,358.3,27469,2)
 ;;=^60144
 ;;^UTILITY(U,$J,358.3,27470,0)
 ;;=276.1^^162^1782^31
 ;;^UTILITY(U,$J,358.3,27470,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27470,1,4,0)
 ;;=4^276.1
 ;;^UTILITY(U,$J,358.3,27470,1,5,0)
 ;;=5^Hyponatremia
 ;;^UTILITY(U,$J,358.3,27470,2)
 ;;=Hyponatremia^60722
 ;;^UTILITY(U,$J,358.3,27471,0)
 ;;=275.3^^162^1782^20
 ;;^UTILITY(U,$J,358.3,27471,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27471,1,4,0)
 ;;=4^275.3
 ;;^UTILITY(U,$J,358.3,27471,1,5,0)
 ;;=5^Hyper or Hypophosphatemia
 ;;^UTILITY(U,$J,358.3,27471,2)
 ;;=^93796
 ;;^UTILITY(U,$J,358.3,27472,0)
 ;;=240.0^^162^1782^14
 ;;^UTILITY(U,$J,358.3,27472,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27472,1,4,0)
 ;;=4^240.0
 ;;^UTILITY(U,$J,358.3,27472,1,5,0)
 ;;=5^Goiter, Simple
 ;;^UTILITY(U,$J,358.3,27472,2)
 ;;=^259806
 ;;^UTILITY(U,$J,358.3,27473,0)
 ;;=241.1^^162^1782^13
 ;;^UTILITY(U,$J,358.3,27473,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27473,1,4,0)
 ;;=4^241.1
 ;;^UTILITY(U,$J,358.3,27473,1,5,0)
 ;;=5^Goiter, Nontox, Multinod
 ;;^UTILITY(U,$J,358.3,27473,2)
 ;;=^267790
 ;;^UTILITY(U,$J,358.3,27474,0)
 ;;=241.0^^162^1782^50
 ;;^UTILITY(U,$J,358.3,27474,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27474,1,4,0)
 ;;=4^241.0
 ;;^UTILITY(U,$J,358.3,27474,1,5,0)
 ;;=5^Thyroid Nodule, Nontoxic
 ;;^UTILITY(U,$J,358.3,27474,2)
 ;;=^83865
 ;;^UTILITY(U,$J,358.3,27475,0)
 ;;=242.00^^162^1782^15
 ;;^UTILITY(U,$J,358.3,27475,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27475,1,4,0)
 ;;=4^242.00
 ;;^UTILITY(U,$J,358.3,27475,1,5,0)
 ;;=5^Graves' Disease
 ;;^UTILITY(U,$J,358.3,27475,2)
 ;;=^267793
 ;;^UTILITY(U,$J,358.3,27476,0)
 ;;=242.01^^162^1782^12
 ;;^UTILITY(U,$J,358.3,27476,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,27476,1,4,0)
 ;;=4^242.01
 ;;^UTILITY(U,$J,358.3,27476,1,5,0)
 ;;=5^Goiter Diff Tox w/ Strm
 ;;^UTILITY(U,$J,358.3,27476,2)
 ;;=^267794
 ;;^UTILITY(U,$J,358.3,27477,0)
 ;;=252.1^^162^1782^32
 ;;
 ;;$END ROU IBDEI1JR