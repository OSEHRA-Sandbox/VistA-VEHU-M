IBDEI11O ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,18416,1,2,0)
 ;;=2^REPAIR OF HEART WOUND
 ;;^UTILITY(U,$J,358.3,18416,1,4,0)
 ;;=4^33300
 ;;^UTILITY(U,$J,358.3,18417,0)
 ;;=33310^^101^1180^3^^^^1
 ;;^UTILITY(U,$J,358.3,18417,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,18417,1,2,0)
 ;;=2^EXPLORATORY HEART SURGERY
 ;;^UTILITY(U,$J,358.3,18417,1,4,0)
 ;;=4^33310
 ;;^UTILITY(U,$J,358.3,18418,0)
 ;;=33320^^101^1180^7^^^^1
 ;;^UTILITY(U,$J,358.3,18418,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,18418,1,2,0)
 ;;=2^REPAIR MAJOR BLOOD VESSEL(S)
 ;;^UTILITY(U,$J,358.3,18418,1,4,0)
 ;;=4^33320
 ;;^UTILITY(U,$J,358.3,18419,0)
 ;;=33400^^101^1180^8^^^^1
 ;;^UTILITY(U,$J,358.3,18419,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,18419,1,2,0)
 ;;=2^REPAIR OF AORTIC VALVE
 ;;^UTILITY(U,$J,358.3,18419,1,4,0)
 ;;=4^33400
 ;;^UTILITY(U,$J,358.3,18420,0)
 ;;=33463^^101^1180^10^^^^1
 ;;^UTILITY(U,$J,358.3,18420,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,18420,1,2,0)
 ;;=2^VALVULOPLASTY TRICUSPID w/o RING INSERT
 ;;^UTILITY(U,$J,358.3,18420,1,4,0)
 ;;=4^33463
 ;;^UTILITY(U,$J,358.3,18421,0)
 ;;=33464^^101^1180^11^^^^1
 ;;^UTILITY(U,$J,358.3,18421,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,18421,1,2,0)
 ;;=2^VALVULOPLASTY TRICUSPID w/ RING INSERT
 ;;^UTILITY(U,$J,358.3,18421,1,4,0)
 ;;=4^33464
 ;;^UTILITY(U,$J,358.3,18422,0)
 ;;=33510^^101^1180^2^^^^1
 ;;^UTILITY(U,$J,358.3,18422,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,18422,1,2,0)
 ;;=2^CABG VEIN SINGLE
 ;;^UTILITY(U,$J,358.3,18422,1,4,0)
 ;;=4^33510
 ;;^UTILITY(U,$J,358.3,18423,0)
 ;;=33641^^101^1180^6^^^^1
 ;;^UTILITY(U,$J,358.3,18423,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,18423,1,2,0)
 ;;=2^REPAIR HEART SEPTUM DEFECT
 ;;^UTILITY(U,$J,358.3,18423,1,4,0)
 ;;=4^33641
 ;;^UTILITY(U,$J,358.3,18424,0)
 ;;=35216^^101^1180^4^^^^1
 ;;^UTILITY(U,$J,358.3,18424,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,18424,1,2,0)
 ;;=2^RPR BLD VESSEL,DIRECT,INTRATHOR W/O BYPASS
 ;;^UTILITY(U,$J,358.3,18424,1,4,0)
 ;;=4^35216
 ;;^UTILITY(U,$J,358.3,18425,0)
 ;;=35276^^101^1180^5^^^^1
 ;;^UTILITY(U,$J,358.3,18425,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,18425,1,2,0)
 ;;=2^RPR BLD VESSEL,W/ GRAFT OTH THAN VEIN
 ;;^UTILITY(U,$J,358.3,18425,1,4,0)
 ;;=4^35276
 ;;^UTILITY(U,$J,358.3,18426,0)
 ;;=35685^^101^1180^1^^^^1
 ;;^UTILITY(U,$J,358.3,18426,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,18426,1,2,0)
 ;;=2^BYPASS GRAFT PATENCY/PATCH
 ;;^UTILITY(U,$J,358.3,18426,1,4,0)
 ;;=4^35685
 ;;^UTILITY(U,$J,358.3,18427,0)
 ;;=425.5^^102^1181^1
 ;;^UTILITY(U,$J,358.3,18427,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,18427,1,4,0)
 ;;=4^CMP ALCOHOLIC
 ;;^UTILITY(U,$J,358.3,18427,1,5,0)
 ;;=5^425.5
 ;;^UTILITY(U,$J,358.3,18427,2)
 ;;=^19623
 ;;^UTILITY(U,$J,358.3,18428,0)
 ;;=425.8^^102^1181^4
 ;;^UTILITY(U,$J,358.3,18428,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,18428,1,4,0)
 ;;=4^CMP OTH DISEASES NEC
 ;;^UTILITY(U,$J,358.3,18428,1,5,0)
 ;;=5^425.8
 ;;^UTILITY(U,$J,358.3,18428,2)
 ;;=^269718
 ;;^UTILITY(U,$J,358.3,18429,0)
 ;;=425.7^^102^1181^2
 ;;^UTILITY(U,$J,358.3,18429,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,18429,1,4,0)
 ;;=4^CMP NUTRITIONAL/METABOLIC
 ;;^UTILITY(U,$J,358.3,18429,1,5,0)
 ;;=5^425.7
 ;;^UTILITY(U,$J,358.3,18429,2)
 ;;=^269717
 ;;^UTILITY(U,$J,358.3,18430,0)
 ;;=425.2^^102^1181^3
 ;;^UTILITY(U,$J,358.3,18430,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,18430,1,4,0)
 ;;=4^CMP OBSCURE OF AFRICA
 ;;^UTILITY(U,$J,358.3,18430,1,5,0)
 ;;=5^425.2
 ;;^UTILITY(U,$J,358.3,18430,2)
 ;;=^265125
 ;;^UTILITY(U,$J,358.3,18431,0)
 ;;=425.18^^102^1181^5
 ;;^UTILITY(U,$J,358.3,18431,1,0)
 ;;=^358.31IA^5^2
 ;;
 ;;$END ROU IBDEI11O