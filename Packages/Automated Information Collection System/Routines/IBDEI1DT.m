IBDEI1DT ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,24486,0)
 ;;=S9445^^139^1503^1^^^^1
 ;;^UTILITY(U,$J,358.3,24486,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24486,1,2,0)
 ;;=2^S9445
 ;;^UTILITY(U,$J,358.3,24486,1,3,0)
 ;;=3^PT EDUCATION NOC INDIVID
 ;;^UTILITY(U,$J,358.3,24487,0)
 ;;=99091^^139^1504^1^^^^1
 ;;^UTILITY(U,$J,358.3,24487,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24487,1,2,0)
 ;;=2^99091
 ;;^UTILITY(U,$J,358.3,24487,1,3,0)
 ;;=3^COLLECT/REVIEW DATA FROM PT
 ;;^UTILITY(U,$J,358.3,24488,0)
 ;;=99347^^139^1505^1^^^^1
 ;;^UTILITY(U,$J,358.3,24488,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24488,1,2,0)
 ;;=2^99347
 ;;^UTILITY(U,$J,358.3,24488,1,3,0)
 ;;=3^PROBLEM FOCUSED
 ;;^UTILITY(U,$J,358.3,24489,0)
 ;;=99348^^139^1505^2^^^^1
 ;;^UTILITY(U,$J,358.3,24489,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24489,1,2,0)
 ;;=2^99348
 ;;^UTILITY(U,$J,358.3,24489,1,3,0)
 ;;=3^EXP PROBLEM FOCUSED
 ;;^UTILITY(U,$J,358.3,24490,0)
 ;;=99349^^139^1505^3^^^^1
 ;;^UTILITY(U,$J,358.3,24490,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24490,1,2,0)
 ;;=2^99349
 ;;^UTILITY(U,$J,358.3,24490,1,3,0)
 ;;=3^DETAILED
 ;;^UTILITY(U,$J,358.3,24491,0)
 ;;=99350^^139^1505^4^^^^1
 ;;^UTILITY(U,$J,358.3,24491,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24491,1,2,0)
 ;;=2^99350
 ;;^UTILITY(U,$J,358.3,24491,1,3,0)
 ;;=3^COMPREHENSIVE
 ;;^UTILITY(U,$J,358.3,24492,0)
 ;;=90847^^139^1506^1^^^^1
 ;;^UTILITY(U,$J,358.3,24492,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24492,1,2,0)
 ;;=2^90847
 ;;^UTILITY(U,$J,358.3,24492,1,3,0)
 ;;=3^FAMILY PSYTX W/PATIENT
 ;;^UTILITY(U,$J,358.3,24493,0)
 ;;=90849^^139^1506^3^^^^1
 ;;^UTILITY(U,$J,358.3,24493,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24493,1,2,0)
 ;;=2^90849
 ;;^UTILITY(U,$J,358.3,24493,1,3,0)
 ;;=3^MULTIPLE FAMILY GROUP PSYTX
 ;;^UTILITY(U,$J,358.3,24494,0)
 ;;=90853^^139^1506^2^^^^1
 ;;^UTILITY(U,$J,358.3,24494,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24494,1,2,0)
 ;;=2^90853
 ;;^UTILITY(U,$J,358.3,24494,1,3,0)
 ;;=3^GROUP PSYCHOTHERAPY
 ;;^UTILITY(U,$J,358.3,24495,0)
 ;;=90832^^139^1506^5^^^^1
 ;;^UTILITY(U,$J,358.3,24495,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24495,1,2,0)
 ;;=2^90832
 ;;^UTILITY(U,$J,358.3,24495,1,3,0)
 ;;=3^PSYTX PT OR FAMILY 16-37 MIN
 ;;^UTILITY(U,$J,358.3,24496,0)
 ;;=90834^^139^1506^6^^^^1
 ;;^UTILITY(U,$J,358.3,24496,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24496,1,2,0)
 ;;=2^90834
 ;;^UTILITY(U,$J,358.3,24496,1,3,0)
 ;;=3^PSYTX PT OR FAMILY 38-52 MIN
 ;;^UTILITY(U,$J,358.3,24497,0)
 ;;=90837^^139^1506^7^^^^1
 ;;^UTILITY(U,$J,358.3,24497,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24497,1,2,0)
 ;;=2^90837
 ;;^UTILITY(U,$J,358.3,24497,1,3,0)
 ;;=3^PSYTX PT OR FAMILY 53+ MIN
 ;;^UTILITY(U,$J,358.3,24498,0)
 ;;=90791^^139^1506^4^^^^1
 ;;^UTILITY(U,$J,358.3,24498,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24498,1,2,0)
 ;;=2^90791
 ;;^UTILITY(U,$J,358.3,24498,1,3,0)
 ;;=3^PSYCH DIAGNOSTIC EVALUATION
 ;;^UTILITY(U,$J,358.3,24499,0)
 ;;=99341^^139^1507^1^^^^1
 ;;^UTILITY(U,$J,358.3,24499,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24499,1,2,0)
 ;;=2^99341
 ;;^UTILITY(U,$J,358.3,24499,1,3,0)
 ;;=3^PROBLEM FOCUSED
 ;;^UTILITY(U,$J,358.3,24500,0)
 ;;=99342^^139^1507^2^^^^1
 ;;^UTILITY(U,$J,358.3,24500,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24500,1,2,0)
 ;;=2^99342
 ;;^UTILITY(U,$J,358.3,24500,1,3,0)
 ;;=3^EXP PROBLEM FOCUSED
 ;;^UTILITY(U,$J,358.3,24501,0)
 ;;=99343^^139^1507^3^^^^1
 ;;^UTILITY(U,$J,358.3,24501,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,24501,1,2,0)
 ;;=2^99343
 ;;^UTILITY(U,$J,358.3,24501,1,3,0)
 ;;=3^DETAILED
 ;;^UTILITY(U,$J,358.3,24502,0)
 ;;=99344^^139^1507^4^^^^1
 ;;
 ;;$END ROU IBDEI1DT