IBDEI1D5 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,24152,1,2,0)
 ;;=2^CHRONIC BRONCHITIS NOS
 ;;^UTILITY(U,$J,358.3,24152,2)
 ;;=^24359
 ;;^UTILITY(U,$J,358.3,24153,0)
 ;;=428.9^^133^1471^10
 ;;^UTILITY(U,$J,358.3,24153,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24153,1,1,0)
 ;;=1^428.9
 ;;^UTILITY(U,$J,358.3,24153,1,2,0)
 ;;=2^HEART FAILURE,UNSPEC
 ;;^UTILITY(U,$J,358.3,24153,2)
 ;;=^54754
 ;;^UTILITY(U,$J,358.3,24154,0)
 ;;=492.8^^133^1471^8
 ;;^UTILITY(U,$J,358.3,24154,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24154,1,1,0)
 ;;=1^492.8
 ;;^UTILITY(U,$J,358.3,24154,1,2,0)
 ;;=2^EMPHYSEMA NEC
 ;;^UTILITY(U,$J,358.3,24154,2)
 ;;=^87569
 ;;^UTILITY(U,$J,358.3,24155,0)
 ;;=421.9^^133^1471^9
 ;;^UTILITY(U,$J,358.3,24155,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24155,1,1,0)
 ;;=1^421.9
 ;;^UTILITY(U,$J,358.3,24155,1,2,0)
 ;;=2^ENDOCARDITIS,ACUTE,UNSPEC
 ;;^UTILITY(U,$J,358.3,24155,2)
 ;;=^269701
 ;;^UTILITY(U,$J,358.3,24156,0)
 ;;=422.90^^133^1471^12
 ;;^UTILITY(U,$J,358.3,24156,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24156,1,1,0)
 ;;=1^422.90
 ;;^UTILITY(U,$J,358.3,24156,1,2,0)
 ;;=2^MYOCARDITIS,ACUTE,UNSPEC
 ;;^UTILITY(U,$J,358.3,24156,2)
 ;;=^269702
 ;;^UTILITY(U,$J,358.3,24157,0)
 ;;=420.90^^133^1471^13
 ;;^UTILITY(U,$J,358.3,24157,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24157,1,1,0)
 ;;=1^420.90
 ;;^UTILITY(U,$J,358.3,24157,1,2,0)
 ;;=2^PERICARDITIS,ACUTE,UNSPEC
 ;;^UTILITY(U,$J,358.3,24157,2)
 ;;=^269692
 ;;^UTILITY(U,$J,358.3,24158,0)
 ;;=505.^^133^1471^14
 ;;^UTILITY(U,$J,358.3,24158,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24158,1,1,0)
 ;;=1^505.
 ;;^UTILITY(U,$J,358.3,24158,1,2,0)
 ;;=2^PNEUMOCONIOSIS NOS
 ;;^UTILITY(U,$J,358.3,24158,2)
 ;;=^95539
 ;;^UTILITY(U,$J,358.3,24159,0)
 ;;=481.^^133^1471^16
 ;;^UTILITY(U,$J,358.3,24159,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24159,1,1,0)
 ;;=1^481.
 ;;^UTILITY(U,$J,358.3,24159,1,2,0)
 ;;=2^PNEUMONIA,PNEUMOCOCCAL
 ;;^UTILITY(U,$J,358.3,24159,2)
 ;;=^95612
 ;;^UTILITY(U,$J,358.3,24160,0)
 ;;=486.^^133^1471^15
 ;;^UTILITY(U,$J,358.3,24160,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24160,1,1,0)
 ;;=1^486.
 ;;^UTILITY(U,$J,358.3,24160,1,2,0)
 ;;=2^PNEUMONIA,ORGANISM NOS
 ;;^UTILITY(U,$J,358.3,24160,2)
 ;;=^95632
 ;;^UTILITY(U,$J,358.3,24161,0)
 ;;=506.9^^133^1471^21
 ;;^UTILITY(U,$J,358.3,24161,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24161,1,1,0)
 ;;=1^506.9
 ;;^UTILITY(U,$J,358.3,24161,1,2,0)
 ;;=2^RESP CONDITION D/T FUMES/VAPORS,UNSPEC
 ;;^UTILITY(U,$J,358.3,24161,2)
 ;;=^123983
 ;;^UTILITY(U,$J,358.3,24162,0)
 ;;=416.0^^133^1471^18
 ;;^UTILITY(U,$J,358.3,24162,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24162,1,1,0)
 ;;=1^416.0
 ;;^UTILITY(U,$J,358.3,24162,1,2,0)
 ;;=2^PRIM PULM HYPERTENSION
 ;;^UTILITY(U,$J,358.3,24162,2)
 ;;=^265310
 ;;^UTILITY(U,$J,358.3,24163,0)
 ;;=415.19^^133^1471^19
 ;;^UTILITY(U,$J,358.3,24163,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24163,1,1,0)
 ;;=1^415.19
 ;;^UTILITY(U,$J,358.3,24163,1,2,0)
 ;;=2^PULM EMBOLISM & INFARCTION,ACUTE
 ;;^UTILITY(U,$J,358.3,24163,2)
 ;;=^303285
 ;;^UTILITY(U,$J,358.3,24164,0)
 ;;=515.^^133^1471^20
 ;;^UTILITY(U,$J,358.3,24164,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24164,1,1,0)
 ;;=1^515.
 ;;^UTILITY(U,$J,358.3,24164,1,2,0)
 ;;=2^PULMONARY FIBROSIS
 ;;^UTILITY(U,$J,358.3,24164,2)
 ;;=^101072
 ;;^UTILITY(U,$J,358.3,24165,0)
 ;;=502.^^133^1471^23
 ;;^UTILITY(U,$J,358.3,24165,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,24165,1,1,0)
 ;;=1^502.
 ;;^UTILITY(U,$J,358.3,24165,1,2,0)
 ;;=2^SILICOSIS
 ;;^UTILITY(U,$J,358.3,24165,2)
 ;;=^110600
 ;;^UTILITY(U,$J,358.3,24166,0)
 ;;=519.9^^133^1471^22
 ;;
 ;;$END ROU IBDEI1D5