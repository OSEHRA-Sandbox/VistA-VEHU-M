VAQON001 ; ; 10-AUG-1994
 ;;1.5;PATIENT DATA EXCHANGE;**7**;NOV 17, 1993
 F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,"PRO",140,0)
 ;;=VAQ PDX1 (MENU)^List Request Options^^M^^^^^^^^PATIENT DATA EXCHANGE
 ;;^UTILITY(U,$J,"PRO",140,1,0)
 ;;=^^1^1^2940202^^^^
 ;;^UTILITY(U,$J,"PRO",140,1,1,0)
 ;;=display custom options to user for status screen PDX1
 ;;^UTILITY(U,$J,"PRO",140,4)
 ;;=26^4^^CUSTOM ENTRIES FOR PDX1
 ;;^UTILITY(U,$J,"PRO",140,10,0)
 ;;=^101.01PA^2^23
 ;;^UTILITY(U,$J,"PRO",140,10,22,0)
 ;;=141^DP^21
 ;;^UTILITY(U,$J,"PRO",140,10,22,"^")
 ;;=VAQ DISPLAY PDX
 ;;^UTILITY(U,$J,"PRO",140,10,23,0)
 ;;=142^CR^11
 ;;^UTILITY(U,$J,"PRO",140,10,23,"^")
 ;;=VAQ CREATE REQUEST
 ;;^UTILITY(U,$J,"PRO",140,20)
 ;;=
 ;;^UTILITY(U,$J,"PRO",140,26)
 ;;=D SHOW^VALM
 ;;^UTILITY(U,$J,"PRO",140,28)
 ;;=Select Action: 
 ;;^UTILITY(U,$J,"PRO",140,99)
 ;;=55782,41815
 ;;^UTILITY(U,$J,"PRO",141,0)
 ;;=VAQ DISPLAY PDX^Display PDX^^A^^^^^^^^PATIENT DATA EXCHANGE
 ;;^UTILITY(U,$J,"PRO",141,4)
 ;;=^^^DISPLAYS PDX DATA
 ;;^UTILITY(U,$J,"PRO",141,10,0)
 ;;=^101.01PA^0^0
 ;;^UTILITY(U,$J,"PRO",141,20)
 ;;=D DIS^VAQREQ01
 ;;^UTILITY(U,$J,"PRO",141,99)
 ;;=55782,41814
 ;;^UTILITY(U,$J,"PRO",142,0)
 ;;=VAQ CREATE REQUEST^Create Request^^A^^^^^^^^PATIENT DATA EXCHANGE
 ;;^UTILITY(U,$J,"PRO",142,1,0)
 ;;=^^1^1^2930311^^^^
 ;;^UTILITY(U,$J,"PRO",142,1,1,0)
 ;;=CALLS REQUEST SCREEN (PDX2)
 ;;^UTILITY(U,$J,"PRO",142,4)
 ;;=^^^CREATE PDX REQUEST
 ;;^UTILITY(U,$J,"PRO",142,20)
 ;;=D EP^VAQREQ02
 ;;^UTILITY(U,$J,"PRO",142,99)
 ;;=55782,41814
 ;;^UTILITY(U,$J,"PRO",143,0)
 ;;=VAQ PDX2 (MENU)^List Request Options^^M^^^^^^^^PATIENT DATA EXCHANGE
 ;;^UTILITY(U,$J,"PRO",143,1,0)
 ;;=^^1^1^2930604^^^^
 ;;^UTILITY(U,$J,"PRO",143,1,1,0)
 ;;=display custom options to user for status screen PDX2
 ;;^UTILITY(U,$J,"PRO",143,4)
 ;;=26^4^^CUSTOM ENTRIES FOR PDX2
 ;;^UTILITY(U,$J,"PRO",143,10,0)
 ;;=^101.01PA^4^22
 ;;^UTILITY(U,$J,"PRO",143,10,14,0)
 ;;=144^CP^31
 ;;^UTILITY(U,$J,"PRO",143,10,14,"^")
 ;;=VAQ CHANGE PATIENT
 ;;^UTILITY(U,$J,"PRO",143,10,15,0)
 ;;=145^AE^11
 ;;^UTILITY(U,$J,"PRO",143,10,15,"^")
 ;;=VAQ ADD/EDIT REQUEST
 ;;^UTILITY(U,$J,"PRO",143,10,16,0)
 ;;=146^TR^12
 ;;^UTILITY(U,$J,"PRO",143,10,16,"^")
 ;;=VAQ TRANSMIT REQUEST
 ;;^UTILITY(U,$J,"PRO",143,10,20,0)
 ;;=148^CO^21
 ;;^UTILITY(U,$J,"PRO",143,10,20,"^")
 ;;=VAQ COPY REQUEST
 ;;^UTILITY(U,$J,"PRO",143,20)
 ;;=
 ;;^UTILITY(U,$J,"PRO",143,26)
 ;;=D SHOW^VALM
 ;;^UTILITY(U,$J,"PRO",143,28)
 ;;=Select Action: 
 ;;^UTILITY(U,$J,"PRO",143,99)
 ;;=55783,58662
 ;;^UTILITY(U,$J,"PRO",144,0)
 ;;=VAQ CHANGE PATIENT^Change Patient^^A^^^^^^^^PATIENT DATA EXCHANGE
 ;;^UTILITY(U,$J,"PRO",144,4)
 ;;=^^^VAQ CHANGE PATIENT
 ;;^UTILITY(U,$J,"PRO",144,15)
 ;;=D EXIT^VAQREQ02
 ;;^UTILITY(U,$J,"PRO",144,20)
 ;;=D PAT^VAQREQ02
 ;;^UTILITY(U,$J,"PRO",144,99)
 ;;=55782,41814
 ;;^UTILITY(U,$J,"PRO",145,0)
 ;;=VAQ ADD/EDIT REQUEST^Add/Edit Request^^A^^^^^^^^PATIENT DATA EXCHANGE
 ;;^UTILITY(U,$J,"PRO",145,1,0)
 ;;=^^1^1^2930528^^^^
 ;;^UTILITY(U,$J,"PRO",145,1,1,0)
 ;;=ADD/EDIT INFO TO CREATE A PDX REQUEST
 ;;^UTILITY(U,$J,"PRO",145,4)
 ;;=^^^ADD/EDIT PDX REQUEST
 ;;^UTILITY(U,$J,"PRO",145,20)
 ;;=D REQ^VAQREQ02
 ;;^UTILITY(U,$J,"PRO",145,99)
 ;;=55782,41814
 ;;^UTILITY(U,$J,"PRO",146,0)
 ;;=VAQ TRANSMIT REQUEST^Transmit Request^^A^^^^^^^^PATIENT DATA EXCHANGE
 ;;^UTILITY(U,$J,"PRO",146,1,0)
 ;;=^^1^1^2930318^^^^
 ;;^UTILITY(U,$J,"PRO",146,1,1,0)
 ;;=TRANSMIT PDX REQUEST, UPDATE TRANSACTION FILE
 ;;^UTILITY(U,$J,"PRO",146,4)
 ;;=^^^TRANSMIT PDX REQUEST
 ;;^UTILITY(U,$J,"PRO",146,20)
 ;;=D TRAN^VAQREQ02
 ;;^UTILITY(U,$J,"PRO",146,99)
 ;;=55782,41818
 ;;^UTILITY(U,$J,"PRO",148,0)
 ;;=VAQ COPY REQUEST^Copy Request^^A^^^^^^^^PATIENT DATA EXCHANGE