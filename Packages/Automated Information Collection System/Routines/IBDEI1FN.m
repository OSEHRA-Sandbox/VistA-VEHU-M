IBDEI1FN ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,25408,1,4,0)
 ;;=4^V17.0
 ;;^UTILITY(U,$J,358.3,25408,1,5,0)
 ;;=5^FAM HX-PSYCHIATRIC COND
 ;;^UTILITY(U,$J,358.3,25408,2)
 ;;=^295302
 ;;^UTILITY(U,$J,358.3,25409,0)
 ;;=V17.7^^147^1592^7
 ;;^UTILITY(U,$J,358.3,25409,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25409,1,4,0)
 ;;=4^V17.7
 ;;^UTILITY(U,$J,358.3,25409,1,5,0)
 ;;=5^FAMILY HX-ARTHRITIS
 ;;^UTILITY(U,$J,358.3,25409,2)
 ;;=^295309
 ;;^UTILITY(U,$J,358.3,25410,0)
 ;;=V17.5^^147^1592^8
 ;;^UTILITY(U,$J,358.3,25410,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25410,1,4,0)
 ;;=4^V17.5
 ;;^UTILITY(U,$J,358.3,25410,1,5,0)
 ;;=5^FAMILY HX-ASTHMA
 ;;^UTILITY(U,$J,358.3,25410,2)
 ;;=^295307
 ;;^UTILITY(U,$J,358.3,25411,0)
 ;;=V17.1^^147^1592^9
 ;;^UTILITY(U,$J,358.3,25411,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25411,1,4,0)
 ;;=4^V17.1
 ;;^UTILITY(U,$J,358.3,25411,1,5,0)
 ;;=5^FAMILY HX-STROKE
 ;;^UTILITY(U,$J,358.3,25411,2)
 ;;=^295303
 ;;^UTILITY(U,$J,358.3,25412,0)
 ;;=V15.1^^147^1593^6
 ;;^UTILITY(U,$J,358.3,25412,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25412,1,4,0)
 ;;=4^V15.1
 ;;^UTILITY(U,$J,358.3,25412,1,5,0)
 ;;=5^HX-MAJOR CARDIOVASC SURG
 ;;^UTILITY(U,$J,358.3,25412,2)
 ;;=^295283
 ;;^UTILITY(U,$J,358.3,25413,0)
 ;;=V15.3^^147^1593^2
 ;;^UTILITY(U,$J,358.3,25413,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25413,1,4,0)
 ;;=4^V15.3
 ;;^UTILITY(U,$J,358.3,25413,1,5,0)
 ;;=5^HX OF IRRADIATION
 ;;^UTILITY(U,$J,358.3,25413,2)
 ;;=^295285
 ;;^UTILITY(U,$J,358.3,25414,0)
 ;;=V15.41^^147^1593^4
 ;;^UTILITY(U,$J,358.3,25414,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25414,1,4,0)
 ;;=4^V15.41
 ;;^UTILITY(U,$J,358.3,25414,1,5,0)
 ;;=5^HX OF PHYSICAL ABUSE
 ;;^UTILITY(U,$J,358.3,25414,2)
 ;;=^304352
 ;;^UTILITY(U,$J,358.3,25415,0)
 ;;=V15.42^^147^1593^1
 ;;^UTILITY(U,$J,358.3,25415,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25415,1,4,0)
 ;;=4^V15.42
 ;;^UTILITY(U,$J,358.3,25415,1,5,0)
 ;;=5^HX OF EMOTIONAL ABUSE
 ;;^UTILITY(U,$J,358.3,25415,2)
 ;;=^304353
 ;;^UTILITY(U,$J,358.3,25416,0)
 ;;=V15.49^^147^1593^5
 ;;^UTILITY(U,$J,358.3,25416,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25416,1,4,0)
 ;;=4^V15.49
 ;;^UTILITY(U,$J,358.3,25416,1,5,0)
 ;;=5^HX OF PSYCHOLOGICAL TRAUMA, NEC
 ;;^UTILITY(U,$J,358.3,25416,2)
 ;;=^295286
 ;;^UTILITY(U,$J,358.3,25417,0)
 ;;=V15.81^^147^1593^3
 ;;^UTILITY(U,$J,358.3,25417,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25417,1,4,0)
 ;;=4^V15.81
 ;;^UTILITY(U,$J,358.3,25417,1,5,0)
 ;;=5^HX OF PAST NONCOMPLIANCE
 ;;^UTILITY(U,$J,358.3,25417,2)
 ;;=^295290
 ;;^UTILITY(U,$J,358.3,25418,0)
 ;;=V15.82^^147^1593^7
 ;;^UTILITY(U,$J,358.3,25418,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25418,1,4,0)
 ;;=4^V15.82
 ;;^UTILITY(U,$J,358.3,25418,1,5,0)
 ;;=5^HX-TOBACCO USE
 ;;^UTILITY(U,$J,358.3,25418,2)
 ;;=^303405
 ;;^UTILITY(U,$J,358.3,25419,0)
 ;;=V15.84^^147^1593^8
 ;;^UTILITY(U,$J,358.3,25419,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25419,1,4,0)
 ;;=4^V15.84
 ;;^UTILITY(U,$J,358.3,25419,1,5,0)
 ;;=5^PSNL HX - EXP TO ASBESTOS
 ;;^UTILITY(U,$J,358.3,25419,2)
 ;;=^338562
 ;;^UTILITY(U,$J,358.3,25420,0)
 ;;=V15.85^^147^1593^11
 ;;^UTILITY(U,$J,358.3,25420,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25420,1,4,0)
 ;;=4^V15.85
 ;;^UTILITY(U,$J,358.3,25420,1,5,0)
 ;;=5^PSNL HX-EXP TO HAZARD BODY FL
 ;;^UTILITY(U,$J,358.3,25420,2)
 ;;=^338563
 ;;^UTILITY(U,$J,358.3,25421,0)
 ;;=V15.86^^147^1593^9
 ;;^UTILITY(U,$J,358.3,25421,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25421,1,4,0)
 ;;=4^V15.86
 ;;^UTILITY(U,$J,358.3,25421,1,5,0)
 ;;=5^PSNL HX - EXP TO LEAD
 ;;^UTILITY(U,$J,358.3,25421,2)
 ;;=^338564
 ;;
 ;;$END ROU IBDEI1FN