IBDEI1FG ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,25314,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25314,1,4,0)
 ;;=4^V10.11
 ;;^UTILITY(U,$J,358.3,25314,1,5,0)
 ;;=5^HX-BRONCHOGENIC MALIGNAN
 ;;^UTILITY(U,$J,358.3,25314,2)
 ;;=^295211
 ;;^UTILITY(U,$J,358.3,25315,0)
 ;;=V10.12^^147^1587^44
 ;;^UTILITY(U,$J,358.3,25315,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25315,1,4,0)
 ;;=4^V10.12
 ;;^UTILITY(U,$J,358.3,25315,1,5,0)
 ;;=5^HX-TRACHEAL MALIGNANCY
 ;;^UTILITY(U,$J,358.3,25315,2)
 ;;=^295212
 ;;^UTILITY(U,$J,358.3,25316,0)
 ;;=V10.20^^147^1587^41
 ;;^UTILITY(U,$J,358.3,25316,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25316,1,4,0)
 ;;=4^V10.20
 ;;^UTILITY(U,$J,358.3,25316,1,5,0)
 ;;=5^HX-RESP ORG MALIGNAN NOS
 ;;^UTILITY(U,$J,358.3,25316,2)
 ;;=^295213
 ;;^UTILITY(U,$J,358.3,25317,0)
 ;;=V10.21^^147^1587^30
 ;;^UTILITY(U,$J,358.3,25317,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25317,1,4,0)
 ;;=4^V10.21
 ;;^UTILITY(U,$J,358.3,25317,1,5,0)
 ;;=5^HX-LARYNGEAL MALIGNANCY
 ;;^UTILITY(U,$J,358.3,25317,2)
 ;;=^295214
 ;;^UTILITY(U,$J,358.3,25318,0)
 ;;=V10.22^^147^1587^37
 ;;^UTILITY(U,$J,358.3,25318,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25318,1,4,0)
 ;;=4^V10.22
 ;;^UTILITY(U,$J,358.3,25318,1,5,0)
 ;;=5^HX-NOSE/EAR/SINUS MALIG
 ;;^UTILITY(U,$J,358.3,25318,2)
 ;;=^295215
 ;;^UTILITY(U,$J,358.3,25319,0)
 ;;=V10.29^^147^1587^29
 ;;^UTILITY(U,$J,358.3,25319,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25319,1,4,0)
 ;;=4^V10.29
 ;;^UTILITY(U,$J,358.3,25319,1,5,0)
 ;;=5^HX-INTRATHORACIC MAL NEC
 ;;^UTILITY(U,$J,358.3,25319,2)
 ;;=^295216
 ;;^UTILITY(U,$J,358.3,25320,0)
 ;;=V10.3^^147^1587^4
 ;;^UTILITY(U,$J,358.3,25320,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25320,1,4,0)
 ;;=4^V10.3
 ;;^UTILITY(U,$J,358.3,25320,1,5,0)
 ;;=5^HX OF BREAST MALIGNANCY
 ;;^UTILITY(U,$J,358.3,25320,2)
 ;;=^295217
 ;;^UTILITY(U,$J,358.3,25321,0)
 ;;=V10.40^^147^1587^27
 ;;^UTILITY(U,$J,358.3,25321,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25321,1,4,0)
 ;;=4^V10.40
 ;;^UTILITY(U,$J,358.3,25321,1,5,0)
 ;;=5^HX-FEMALE GENIT MALG NOS
 ;;^UTILITY(U,$J,358.3,25321,2)
 ;;=^295218
 ;;^UTILITY(U,$J,358.3,25322,0)
 ;;=V10.41^^147^1587^23
 ;;^UTILITY(U,$J,358.3,25322,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25322,1,4,0)
 ;;=4^V10.41
 ;;^UTILITY(U,$J,358.3,25322,1,5,0)
 ;;=5^HX-CERVICAL MALIGNANCY
 ;;^UTILITY(U,$J,358.3,25322,2)
 ;;=^295219
 ;;^UTILITY(U,$J,358.3,25323,0)
 ;;=V10.42^^147^1587^47
 ;;^UTILITY(U,$J,358.3,25323,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25323,1,4,0)
 ;;=4^V10.42
 ;;^UTILITY(U,$J,358.3,25323,1,5,0)
 ;;=5^HX-UTERUS MALIGNANCY NEC
 ;;^UTILITY(U,$J,358.3,25323,2)
 ;;=^295220
 ;;^UTILITY(U,$J,358.3,25324,0)
 ;;=V10.43^^147^1587^19
 ;;^UTILITY(U,$J,358.3,25324,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25324,1,4,0)
 ;;=4^V10.43
 ;;^UTILITY(U,$J,358.3,25324,1,5,0)
 ;;=5^HX OF OVARIAN MALIGNANCY
 ;;^UTILITY(U,$J,358.3,25324,2)
 ;;=^295221
 ;;^UTILITY(U,$J,358.3,25325,0)
 ;;=V10.44^^147^1587^26
 ;;^UTILITY(U,$J,358.3,25325,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25325,1,4,0)
 ;;=4^V10.44
 ;;^UTILITY(U,$J,358.3,25325,1,5,0)
 ;;=5^HX-FEMALE GENIT MALG NEC
 ;;^UTILITY(U,$J,358.3,25325,2)
 ;;=^295222
 ;;^UTILITY(U,$J,358.3,25326,0)
 ;;=V10.45^^147^1587^34
 ;;^UTILITY(U,$J,358.3,25326,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25326,1,4,0)
 ;;=4^V10.45
 ;;^UTILITY(U,$J,358.3,25326,1,5,0)
 ;;=5^HX-MALE GENIT MALIG NOS
 ;;^UTILITY(U,$J,358.3,25326,2)
 ;;=^295223
 ;;^UTILITY(U,$J,358.3,25327,0)
 ;;=V10.46^^147^1587^39
 ;;^UTILITY(U,$J,358.3,25327,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,25327,1,4,0)
 ;;=4^V10.46
 ;;
 ;;$END ROU IBDEI1FG