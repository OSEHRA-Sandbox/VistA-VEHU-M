YSONI001 ; ; 18-JUN-1993
 ;;5.01;MENTAL HEALTH;;Dec 30, 1994
 F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,"PRO",1650,0)
 ;;=YS PATIENT MOVEMENT^MHS PATIENT MOVEMENT^^A^^^^^^^^MENTAL HEALTH SYSTEM
 ;;^UTILITY(U,$J,"PRO",1650,20)
 ;;=W !,"MAS Patient Movement - Activating Mental Health Update" D BEGIN^YSCUP
 ;;^UTILITY(U,$J,"PRO",1650,99)
 ;;=55664,61027
 ;;^UTILITY(U,$J,"PRO",1650,"MEN","DGPM MOVEMENT EVENTS")
 ;;=1650