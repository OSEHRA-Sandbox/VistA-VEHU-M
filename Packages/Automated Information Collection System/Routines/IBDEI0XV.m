IBDEI0XV ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,16489,1,3,0)
 ;;=3^V65.3
 ;;^UTILITY(U,$J,358.3,16489,1,4,0)
 ;;=4^Dietary Counseling
 ;;^UTILITY(U,$J,358.3,16489,2)
 ;;=^295563
 ;;^UTILITY(U,$J,358.3,16490,0)
 ;;=V65.41^^84^985^6
 ;;^UTILITY(U,$J,358.3,16490,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16490,1,3,0)
 ;;=3^V65.41
 ;;^UTILITY(U,$J,358.3,16490,1,4,0)
 ;;=4^Exercise Counseling
 ;;^UTILITY(U,$J,358.3,16490,2)
 ;;=^303466
 ;;^UTILITY(U,$J,358.3,16491,0)
 ;;=V65.49^^84^985^3
 ;;^UTILITY(U,$J,358.3,16491,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16491,1,3,0)
 ;;=3^V65.49
 ;;^UTILITY(U,$J,358.3,16491,1,4,0)
 ;;=4^Counseling,Other Specified
 ;;^UTILITY(U,$J,358.3,16491,2)
 ;;=^303471
 ;;^UTILITY(U,$J,358.3,16492,0)
 ;;=V70.5^^84^985^7
 ;;^UTILITY(U,$J,358.3,16492,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16492,1,3,0)
 ;;=3^V70.5
 ;;^UTILITY(U,$J,358.3,16492,1,4,0)
 ;;=4^Health Exam,Group Survey
 ;;^UTILITY(U,$J,358.3,16492,2)
 ;;=^295595
 ;;^UTILITY(U,$J,358.3,16493,0)
 ;;=V81.4^^84^985^14
 ;;^UTILITY(U,$J,358.3,16493,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16493,1,3,0)
 ;;=3^V81.4
 ;;^UTILITY(U,$J,358.3,16493,1,4,0)
 ;;=4^Screen for Respiratory Conditions
 ;;^UTILITY(U,$J,358.3,16493,2)
 ;;=^295691
 ;;^UTILITY(U,$J,358.3,16494,0)
 ;;=V46.11^^84^985^17
 ;;^UTILITY(U,$J,358.3,16494,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16494,1,3,0)
 ;;=3^V46.11
 ;;^UTILITY(U,$J,358.3,16494,1,4,0)
 ;;=4^Vent Dependence
 ;;^UTILITY(U,$J,358.3,16494,2)
 ;;=^331580
 ;;^UTILITY(U,$J,358.3,16495,0)
 ;;=V44.0^^84^985^16
 ;;^UTILITY(U,$J,358.3,16495,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16495,1,3,0)
 ;;=3^V44.0
 ;;^UTILITY(U,$J,358.3,16495,1,4,0)
 ;;=4^Tracheostomy Status
 ;;^UTILITY(U,$J,358.3,16495,2)
 ;;=^295446
 ;;^UTILITY(U,$J,358.3,16496,0)
 ;;=V60.0^^84^985^8
 ;;^UTILITY(U,$J,358.3,16496,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16496,1,3,0)
 ;;=3^V60.0
 ;;^UTILITY(U,$J,358.3,16496,1,4,0)
 ;;=4^Homelessness
 ;;^UTILITY(U,$J,358.3,16496,2)
 ;;=^295539
 ;;^UTILITY(U,$J,358.3,16497,0)
 ;;=511.0^^84^986^7
 ;;^UTILITY(U,$J,358.3,16497,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16497,1,3,0)
 ;;=3^511.0
 ;;^UTILITY(U,$J,358.3,16497,1,4,0)
 ;;=4^Pleurisy
 ;;^UTILITY(U,$J,358.3,16498,0)
 ;;=501.^^84^986^1
 ;;^UTILITY(U,$J,358.3,16498,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16498,1,3,0)
 ;;=3^501.
 ;;^UTILITY(U,$J,358.3,16498,1,4,0)
 ;;=4^Asbestos Plaques/Pleural Thickening
 ;;^UTILITY(U,$J,358.3,16498,2)
 ;;=Asbestos Plaques^10704
 ;;^UTILITY(U,$J,358.3,16499,0)
 ;;=510.9^^84^986^3
 ;;^UTILITY(U,$J,358.3,16499,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16499,1,3,0)
 ;;=3^510.9
 ;;^UTILITY(U,$J,358.3,16499,1,4,0)
 ;;=4^Empyema
 ;;^UTILITY(U,$J,358.3,16499,2)
 ;;=^39810
 ;;^UTILITY(U,$J,358.3,16500,0)
 ;;=511.9^^84^986^6
 ;;^UTILITY(U,$J,358.3,16500,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16500,1,3,0)
 ;;=3^511.9
 ;;^UTILITY(U,$J,358.3,16500,1,4,0)
 ;;=4^Pleural Effusion
 ;;^UTILITY(U,$J,358.3,16500,2)
 ;;=Pleural Effusion^123973
 ;;^UTILITY(U,$J,358.3,16501,0)
 ;;=510.0^^84^986^4
 ;;^UTILITY(U,$J,358.3,16501,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16501,1,3,0)
 ;;=3^510.0
 ;;^UTILITY(U,$J,358.3,16501,1,4,0)
 ;;=4^Empyema w/ Fistula
 ;;^UTILITY(U,$J,358.3,16501,2)
 ;;=^39807
 ;;^UTILITY(U,$J,358.3,16502,0)
 ;;=511.81^^84^986^5
 ;;^UTILITY(U,$J,358.3,16502,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,16502,1,3,0)
 ;;=3^511.81
 ;;^UTILITY(U,$J,358.3,16502,1,4,0)
 ;;=4^Malignant Pleural Effusion
 ;;^UTILITY(U,$J,358.3,16502,2)
 ;;=^336603
 ;;^UTILITY(U,$J,358.3,16503,0)
 ;;=511.89^^84^986^2
 ;;^UTILITY(U,$J,358.3,16503,1,0)
 ;;=^358.31IA^4^2
 ;;
 ;;$END ROU IBDEI0XV