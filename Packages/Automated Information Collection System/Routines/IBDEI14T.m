IBDEI14T ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,19968,1,4,0)
 ;;=4^723.1
 ;;^UTILITY(U,$J,358.3,19968,1,5,0)
 ;;=5^Neck Pain
 ;;^UTILITY(U,$J,358.3,19968,2)
 ;;=Neck Pain^21917
 ;;^UTILITY(U,$J,358.3,19969,0)
 ;;=719.41^^105^1239^33
 ;;^UTILITY(U,$J,358.3,19969,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19969,1,4,0)
 ;;=4^719.41
 ;;^UTILITY(U,$J,358.3,19969,1,5,0)
 ;;=5^Shoulder Pain
 ;;^UTILITY(U,$J,358.3,19969,2)
 ;;=^272398
 ;;^UTILITY(U,$J,358.3,19970,0)
 ;;=719.45^^105^1239^19
 ;;^UTILITY(U,$J,358.3,19970,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19970,1,4,0)
 ;;=4^719.45
 ;;^UTILITY(U,$J,358.3,19970,1,5,0)
 ;;=5^Hip Pain
 ;;^UTILITY(U,$J,358.3,19970,2)
 ;;=Hip Pain^272402
 ;;^UTILITY(U,$J,358.3,19971,0)
 ;;=786.52^^105^1239^10
 ;;^UTILITY(U,$J,358.3,19971,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19971,1,4,0)
 ;;=4^786.52
 ;;^UTILITY(U,$J,358.3,19971,1,5,0)
 ;;=5^Chest Wall Pain
 ;;^UTILITY(U,$J,358.3,19971,2)
 ;;=^89126
 ;;^UTILITY(U,$J,358.3,19972,0)
 ;;=719.46^^105^1239^22
 ;;^UTILITY(U,$J,358.3,19972,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19972,1,4,0)
 ;;=4^719.46
 ;;^UTILITY(U,$J,358.3,19972,1,5,0)
 ;;=5^Knee Pain
 ;;^UTILITY(U,$J,358.3,19972,2)
 ;;=^272403
 ;;^UTILITY(U,$J,358.3,19973,0)
 ;;=346.90^^105^1239^23
 ;;^UTILITY(U,$J,358.3,19973,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19973,1,4,0)
 ;;=4^346.90
 ;;^UTILITY(U,$J,358.3,19973,1,5,0)
 ;;=5^Migraine
 ;;^UTILITY(U,$J,358.3,19973,2)
 ;;=^293880
 ;;^UTILITY(U,$J,358.3,19974,0)
 ;;=729.1^^105^1239^25
 ;;^UTILITY(U,$J,358.3,19974,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19974,1,4,0)
 ;;=4^729.1
 ;;^UTILITY(U,$J,358.3,19974,1,5,0)
 ;;=5^Neuropathic Pain
 ;;^UTILITY(U,$J,358.3,19974,2)
 ;;=Neuropathic Pain^80160
 ;;^UTILITY(U,$J,358.3,19975,0)
 ;;=625.9^^105^1239^29
 ;;^UTILITY(U,$J,358.3,19975,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19975,1,4,0)
 ;;=4^625.9
 ;;^UTILITY(U,$J,358.3,19975,1,5,0)
 ;;=5^Pelvic Pain (Female)
 ;;^UTILITY(U,$J,358.3,19975,2)
 ;;=^123993
 ;;^UTILITY(U,$J,358.3,19976,0)
 ;;=388.70^^105^1239^14
 ;;^UTILITY(U,$J,358.3,19976,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19976,1,4,0)
 ;;=4^388.70
 ;;^UTILITY(U,$J,358.3,19976,1,5,0)
 ;;=5^Ear Pain
 ;;^UTILITY(U,$J,358.3,19976,2)
 ;;=Ear Pain^37811
 ;;^UTILITY(U,$J,358.3,19977,0)
 ;;=526.9^^105^1239^20
 ;;^UTILITY(U,$J,358.3,19977,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19977,1,4,0)
 ;;=4^526.9
 ;;^UTILITY(U,$J,358.3,19977,1,5,0)
 ;;=5^Jaw Pain
 ;;^UTILITY(U,$J,358.3,19977,2)
 ;;=Jaw Pain^66177
 ;;^UTILITY(U,$J,358.3,19978,0)
 ;;=789.01^^105^1239^5
 ;;^UTILITY(U,$J,358.3,19978,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19978,1,4,0)
 ;;=4^789.01
 ;;^UTILITY(U,$J,358.3,19978,1,5,0)
 ;;=5^Abdominal Pain, RUQ
 ;;^UTILITY(U,$J,358.3,19978,2)
 ;;=Abdominal Pain, RUQ^303318
 ;;^UTILITY(U,$J,358.3,19979,0)
 ;;=789.02^^105^1239^3
 ;;^UTILITY(U,$J,358.3,19979,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19979,1,4,0)
 ;;=4^789.02
 ;;^UTILITY(U,$J,358.3,19979,1,5,0)
 ;;=5^Abdominal Pain, LUQ
 ;;^UTILITY(U,$J,358.3,19979,2)
 ;;=Abdominal Pain, LUQ^303319
 ;;^UTILITY(U,$J,358.3,19980,0)
 ;;=789.03^^105^1239^4
 ;;^UTILITY(U,$J,358.3,19980,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19980,1,4,0)
 ;;=4^789.03
 ;;^UTILITY(U,$J,358.3,19980,1,5,0)
 ;;=5^Abdominal Pain, RLQ
 ;;^UTILITY(U,$J,358.3,19980,2)
 ;;=Abdominal PainLLQ^303320
 ;;^UTILITY(U,$J,358.3,19981,0)
 ;;=789.04^^105^1239^2
 ;;^UTILITY(U,$J,358.3,19981,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,19981,1,4,0)
 ;;=4^789.04
 ;;^UTILITY(U,$J,358.3,19981,1,5,0)
 ;;=5^Abdominal Pain, LLQ
 ;;^UTILITY(U,$J,358.3,19981,2)
 ;;=^303321
 ;;
 ;;$END ROU IBDEI14T