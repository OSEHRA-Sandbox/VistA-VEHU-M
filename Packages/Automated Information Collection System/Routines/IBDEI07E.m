IBDEI07E ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,2961,1,3,0)
 ;;=3^Mycobacterium,Tuberculosis Active Disease
 ;;^UTILITY(U,$J,358.3,2961,1,4,0)
 ;;=4^A15.9
 ;;^UTILITY(U,$J,358.3,2961,2)
 ;;=^5000066
 ;;^UTILITY(U,$J,358.3,2962,0)
 ;;=R11.2^^7^84^71
 ;;^UTILITY(U,$J,358.3,2962,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2962,1,3,0)
 ;;=3^Nausea/Vomiting
 ;;^UTILITY(U,$J,358.3,2962,1,4,0)
 ;;=4^R11.2
 ;;^UTILITY(U,$J,358.3,2962,2)
 ;;=^5019237
 ;;^UTILITY(U,$J,358.3,2963,0)
 ;;=D70.3^^7^84^73
 ;;^UTILITY(U,$J,358.3,2963,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2963,1,3,0)
 ;;=3^Neutropenia d/t Infection
 ;;^UTILITY(U,$J,358.3,2963,1,4,0)
 ;;=4^D70.3
 ;;^UTILITY(U,$J,358.3,2963,2)
 ;;=^334041
 ;;^UTILITY(U,$J,358.3,2964,0)
 ;;=D70.9^^7^84^72
 ;;^UTILITY(U,$J,358.3,2964,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2964,1,3,0)
 ;;=3^Neutropenia NOS
 ;;^UTILITY(U,$J,358.3,2964,1,4,0)
 ;;=4^D70.9
 ;;^UTILITY(U,$J,358.3,2964,2)
 ;;=^334186
 ;;^UTILITY(U,$J,358.3,2965,0)
 ;;=M85.80^^7^84^74
 ;;^UTILITY(U,$J,358.3,2965,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2965,1,3,0)
 ;;=3^Osteopenia
 ;;^UTILITY(U,$J,358.3,2965,1,4,0)
 ;;=4^M85.80
 ;;^UTILITY(U,$J,358.3,2965,2)
 ;;=^5014473
 ;;^UTILITY(U,$J,358.3,2966,0)
 ;;=M81.0^^7^84^75
 ;;^UTILITY(U,$J,358.3,2966,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2966,1,3,0)
 ;;=3^Osteoporosis,Age-Related w/o Fx
 ;;^UTILITY(U,$J,358.3,2966,1,4,0)
 ;;=4^M81.0
 ;;^UTILITY(U,$J,358.3,2966,2)
 ;;=^5013555
 ;;^UTILITY(U,$J,358.3,2967,0)
 ;;=G62.9^^7^84^76
 ;;^UTILITY(U,$J,358.3,2967,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2967,1,3,0)
 ;;=3^Peripheral Neuropathy
 ;;^UTILITY(U,$J,358.3,2967,1,4,0)
 ;;=4^G62.9
 ;;^UTILITY(U,$J,358.3,2967,2)
 ;;=^5004079
 ;;^UTILITY(U,$J,358.3,2968,0)
 ;;=B59.^^7^84^77
 ;;^UTILITY(U,$J,358.3,2968,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2968,1,3,0)
 ;;=3^Pneumocystosis
 ;;^UTILITY(U,$J,358.3,2968,1,4,0)
 ;;=4^B59.
 ;;^UTILITY(U,$J,358.3,2968,2)
 ;;=^5000734
 ;;^UTILITY(U,$J,358.3,2969,0)
 ;;=J15.8^^7^84^78
 ;;^UTILITY(U,$J,358.3,2969,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2969,1,3,0)
 ;;=3^Pneumonia,Oth Spec Bacteria
 ;;^UTILITY(U,$J,358.3,2969,1,4,0)
 ;;=4^J15.8
 ;;^UTILITY(U,$J,358.3,2969,2)
 ;;=^95571
 ;;^UTILITY(U,$J,358.3,2970,0)
 ;;=J13.^^7^84^79
 ;;^UTILITY(U,$J,358.3,2970,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2970,1,3,0)
 ;;=3^Pneumonia,Pneumococcal
 ;;^UTILITY(U,$J,358.3,2970,1,4,0)
 ;;=4^J13.
 ;;^UTILITY(U,$J,358.3,2970,2)
 ;;=^5008170
 ;;^UTILITY(U,$J,358.3,2971,0)
 ;;=J18.9^^7^84^80
 ;;^UTILITY(U,$J,358.3,2971,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2971,1,3,0)
 ;;=3^Pneumonia,Unspec
 ;;^UTILITY(U,$J,358.3,2971,1,4,0)
 ;;=4^J18.9
 ;;^UTILITY(U,$J,358.3,2971,2)
 ;;=^95632
 ;;^UTILITY(U,$J,358.3,2972,0)
 ;;=A81.2^^7^84^81
 ;;^UTILITY(U,$J,358.3,2972,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2972,1,3,0)
 ;;=3^Progressive Multifocal Leukoencephalopathy
 ;;^UTILITY(U,$J,358.3,2972,1,4,0)
 ;;=4^A81.2
 ;;^UTILITY(U,$J,358.3,2972,2)
 ;;=^5000411
 ;;^UTILITY(U,$J,358.3,2973,0)
 ;;=B86.^^7^84^82
 ;;^UTILITY(U,$J,358.3,2973,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2973,1,3,0)
 ;;=3^Scabies
 ;;^UTILITY(U,$J,358.3,2973,1,4,0)
 ;;=4^B86.
 ;;^UTILITY(U,$J,358.3,2973,2)
 ;;=^108096
 ;;^UTILITY(U,$J,358.3,2974,0)
 ;;=T50.905A^^7^84^83
 ;;^UTILITY(U,$J,358.3,2974,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,2974,1,3,0)
 ;;=3^Side Effect of Medication,Init Encntr
 ;;^UTILITY(U,$J,358.3,2974,1,4,0)
 ;;=4^T50.905A
 ;;^UTILITY(U,$J,358.3,2974,2)
 ;;=^5052160
 ;;^UTILITY(U,$J,358.3,2975,0)
 ;;=J01.90^^7^84^84
 ;;^UTILITY(U,$J,358.3,2975,1,0)
 ;;=^358.31IA^4^2
 ;;
 ;;$END ROU IBDEI07E