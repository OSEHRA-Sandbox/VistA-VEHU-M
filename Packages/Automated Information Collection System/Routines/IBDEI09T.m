IBDEI09T ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,4171,1,3,0)
 ;;=3^SCREEN-MALNUTRITION
 ;;^UTILITY(U,$J,358.3,4171,1,4,0)
 ;;=4^V77.2
 ;;^UTILITY(U,$J,358.3,4171,2)
 ;;=^295663
 ;;^UTILITY(U,$J,358.3,4172,0)
 ;;=V77.3^^17^196^49
 ;;^UTILITY(U,$J,358.3,4172,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4172,1,3,0)
 ;;=3^SCREEN-PHENYLKETONURIA
 ;;^UTILITY(U,$J,358.3,4172,1,4,0)
 ;;=4^V77.3
 ;;^UTILITY(U,$J,358.3,4172,2)
 ;;=^295664
 ;;^UTILITY(U,$J,358.3,4173,0)
 ;;=V77.4^^17^196^23
 ;;^UTILITY(U,$J,358.3,4173,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4173,1,3,0)
 ;;=3^SCREEN-GALACTOSEMIA
 ;;^UTILITY(U,$J,358.3,4173,1,4,0)
 ;;=4^V77.4
 ;;^UTILITY(U,$J,358.3,4173,2)
 ;;=^295665
 ;;^UTILITY(U,$J,358.3,4174,0)
 ;;=V77.5^^17^196^27
 ;;^UTILITY(U,$J,358.3,4174,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4174,1,3,0)
 ;;=3^SCREEN-GOUT
 ;;^UTILITY(U,$J,358.3,4174,1,4,0)
 ;;=4^V77.5
 ;;^UTILITY(U,$J,358.3,4174,2)
 ;;=^295666
 ;;^UTILITY(U,$J,358.3,4175,0)
 ;;=V77.6^^17^196^15
 ;;^UTILITY(U,$J,358.3,4175,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4175,1,3,0)
 ;;=3^SCREEN-CYSTIC FIBROSIS
 ;;^UTILITY(U,$J,358.3,4175,1,4,0)
 ;;=4^V77.6
 ;;^UTILITY(U,$J,358.3,4175,2)
 ;;=^295667
 ;;^UTILITY(U,$J,358.3,4176,0)
 ;;=V77.7^^17^196^33
 ;;^UTILITY(U,$J,358.3,4176,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4176,1,3,0)
 ;;=3^SCREEN-INBORN ERR METAB
 ;;^UTILITY(U,$J,358.3,4176,1,4,0)
 ;;=4^V77.7
 ;;^UTILITY(U,$J,358.3,4176,2)
 ;;=^295668
 ;;^UTILITY(U,$J,358.3,4177,0)
 ;;=V77.8^^17^196^46
 ;;^UTILITY(U,$J,358.3,4177,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4177,1,3,0)
 ;;=3^SCREEN-OBESITY
 ;;^UTILITY(U,$J,358.3,4177,1,4,0)
 ;;=4^V77.8
 ;;^UTILITY(U,$J,358.3,4177,2)
 ;;=^295669
 ;;^UTILITY(U,$J,358.3,4178,0)
 ;;=V77.91^^17^196^38
 ;;^UTILITY(U,$J,358.3,4178,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4178,1,3,0)
 ;;=3^SCREEN-LIPOID DISORDERS
 ;;^UTILITY(U,$J,358.3,4178,1,4,0)
 ;;=4^V77.91
 ;;^UTILITY(U,$J,358.3,4178,2)
 ;;=^322093
 ;;^UTILITY(U,$J,358.3,4179,0)
 ;;=V78.0^^17^196^34
 ;;^UTILITY(U,$J,358.3,4179,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4179,1,3,0)
 ;;=3^SCREEN-IRON DEFIC ANEMIA
 ;;^UTILITY(U,$J,358.3,4179,1,4,0)
 ;;=4^V78.0
 ;;^UTILITY(U,$J,358.3,4179,2)
 ;;=^295671
 ;;^UTILITY(U,$J,358.3,4180,0)
 ;;=V78.1^^17^196^16
 ;;^UTILITY(U,$J,358.3,4180,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4180,1,3,0)
 ;;=3^SCREEN-DEFIC ANEMIA NEC
 ;;^UTILITY(U,$J,358.3,4180,1,4,0)
 ;;=4^V78.1
 ;;^UTILITY(U,$J,358.3,4180,2)
 ;;=^295672
 ;;^UTILITY(U,$J,358.3,4181,0)
 ;;=V78.2^^17^196^57
 ;;^UTILITY(U,$J,358.3,4181,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4181,1,3,0)
 ;;=3^SCREEN-SICKLE CELL DIS
 ;;^UTILITY(U,$J,358.3,4181,1,4,0)
 ;;=4^V78.2
 ;;^UTILITY(U,$J,358.3,4181,2)
 ;;=^295673
 ;;^UTILITY(U,$J,358.3,4182,0)
 ;;=V78.3^^17^196^30
 ;;^UTILITY(U,$J,358.3,4182,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4182,1,3,0)
 ;;=3^SCREEN-HEMOGLOBINOPATH NEC
 ;;^UTILITY(U,$J,358.3,4182,1,4,0)
 ;;=4^V78.3
 ;;^UTILITY(U,$J,358.3,4182,2)
 ;;=^295674
 ;;^UTILITY(U,$J,358.3,4183,0)
 ;;=V79.0^^17^196^17
 ;;^UTILITY(U,$J,358.3,4183,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4183,1,3,0)
 ;;=3^SCREEN-DEPRESSION
 ;;^UTILITY(U,$J,358.3,4183,1,4,0)
 ;;=4^V79.0
 ;;^UTILITY(U,$J,358.3,4183,2)
 ;;=^295677
 ;;^UTILITY(U,$J,358.3,4184,0)
 ;;=V79.1^^17^196^4
 ;;^UTILITY(U,$J,358.3,4184,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4184,1,3,0)
 ;;=3^SCREEN-ALCOHOLISM
 ;;^UTILITY(U,$J,358.3,4184,1,4,0)
 ;;=4^V79.1
 ;;^UTILITY(U,$J,358.3,4184,2)
 ;;=^295678
 ;;^UTILITY(U,$J,358.3,4185,0)
 ;;=V79.8^^17^196^41
 ;;^UTILITY(U,$J,358.3,4185,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,4185,1,3,0)
 ;;=3^SCREEN-MENTAL DIS NEC
 ;;
 ;;$END ROU IBDEI09T