IBDEI0FY ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,7368,1,2,0)
 ;;=2^20552
 ;;^UTILITY(U,$J,358.3,7368,1,3,0)
 ;;=3^INJ,TRIGGER POINT,1 OR 2 MUSCLE
 ;;^UTILITY(U,$J,358.3,7369,0)
 ;;=20604^^33^452^3^^^^1
 ;;^UTILITY(U,$J,358.3,7369,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7369,1,2,0)
 ;;=2^20604
 ;;^UTILITY(U,$J,358.3,7369,1,3,0)
 ;;=3^ARTHOCENTESIS,FINGERS/TOES w/ US GUIDANCE
 ;;^UTILITY(U,$J,358.3,7370,0)
 ;;=20611^^33^452^5^^^^1
 ;;^UTILITY(U,$J,358.3,7370,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7370,1,2,0)
 ;;=2^20611
 ;;^UTILITY(U,$J,358.3,7370,1,3,0)
 ;;=3^ARTHOCENTESIS,KNEE/SHLDR/HIP w/ US GUIDANCE
 ;;^UTILITY(U,$J,358.3,7371,0)
 ;;=20606^^33^452^7^^^^1
 ;;^UTILITY(U,$J,358.3,7371,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7371,1,2,0)
 ;;=2^20606
 ;;^UTILITY(U,$J,358.3,7371,1,3,0)
 ;;=3^ARTHROCENTESIS,WRIST/ANKLE/AC JT w/ US GUIDANCE
 ;;^UTILITY(U,$J,358.3,7372,0)
 ;;=20553^^33^452^24^^^^1
 ;;^UTILITY(U,$J,358.3,7372,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7372,1,2,0)
 ;;=2^20553
 ;;^UTILITY(U,$J,358.3,7372,1,3,0)
 ;;=3^INJ,TRIGGER POINT,>2 MUSCLES
 ;;^UTILITY(U,$J,358.3,7373,0)
 ;;=29580^^33^453^8^^^^1
 ;;^UTILITY(U,$J,358.3,7373,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7373,1,2,0)
 ;;=2^29580
 ;;^UTILITY(U,$J,358.3,7373,1,3,0)
 ;;=3^UNNA BOOT
 ;;^UTILITY(U,$J,358.3,7374,0)
 ;;=29700^^33^453^2^^^^1
 ;;^UTILITY(U,$J,358.3,7374,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7374,1,2,0)
 ;;=2^29700
 ;;^UTILITY(U,$J,358.3,7374,1,3,0)
 ;;=3^CAST REMOVAL (SHORT)
 ;;^UTILITY(U,$J,358.3,7375,0)
 ;;=29705^^33^453^1^^^^1
 ;;^UTILITY(U,$J,358.3,7375,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7375,1,2,0)
 ;;=2^29705
 ;;^UTILITY(U,$J,358.3,7375,1,3,0)
 ;;=3^CAST REMOVAL (LONG)
 ;;^UTILITY(U,$J,358.3,7376,0)
 ;;=29540^^33^453^3^^^^1
 ;;^UTILITY(U,$J,358.3,7376,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7376,1,2,0)
 ;;=2^29540
 ;;^UTILITY(U,$J,358.3,7376,1,3,0)
 ;;=3^STRAPPING;ANKLE/FOOT
 ;;^UTILITY(U,$J,358.3,7377,0)
 ;;=29260^^33^453^4^^^^1
 ;;^UTILITY(U,$J,358.3,7377,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7377,1,2,0)
 ;;=2^29260
 ;;^UTILITY(U,$J,358.3,7377,1,3,0)
 ;;=3^STRAPPING;ELBOW/WRIST
 ;;^UTILITY(U,$J,358.3,7378,0)
 ;;=29280^^33^453^5^^^^1
 ;;^UTILITY(U,$J,358.3,7378,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7378,1,2,0)
 ;;=2^29280
 ;;^UTILITY(U,$J,358.3,7378,1,3,0)
 ;;=3^STRAPPING;FINGER/HAND
 ;;^UTILITY(U,$J,358.3,7379,0)
 ;;=29530^^33^453^6^^^^1
 ;;^UTILITY(U,$J,358.3,7379,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7379,1,2,0)
 ;;=2^29530
 ;;^UTILITY(U,$J,358.3,7379,1,3,0)
 ;;=3^STRAPPING;KNEE
 ;;^UTILITY(U,$J,358.3,7380,0)
 ;;=29550^^33^453^7^^^^1
 ;;^UTILITY(U,$J,358.3,7380,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7380,1,2,0)
 ;;=2^29550
 ;;^UTILITY(U,$J,358.3,7380,1,3,0)
 ;;=3^STRAPPING;TOES
 ;;^UTILITY(U,$J,358.3,7381,0)
 ;;=30300^^33^454^16^^^^1
 ;;^UTILITY(U,$J,358.3,7381,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7381,1,2,0)
 ;;=2^30300
 ;;^UTILITY(U,$J,358.3,7381,1,3,0)
 ;;=3^REMOVE NASAL FOREIGN BODY
 ;;^UTILITY(U,$J,358.3,7382,0)
 ;;=30901^^33^454^7^^^^1
 ;;^UTILITY(U,$J,358.3,7382,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7382,1,2,0)
 ;;=2^30901
 ;;^UTILITY(U,$J,358.3,7382,1,3,0)
 ;;=3^CONTROL NOSEBLEED,ANT SIMPLE (PACKING)
 ;;^UTILITY(U,$J,358.3,7383,0)
 ;;=30903^^33^454^6^^^^1
 ;;^UTILITY(U,$J,358.3,7383,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,7383,1,2,0)
 ;;=2^30903
 ;;^UTILITY(U,$J,358.3,7383,1,3,0)
 ;;=3^CONTROL NOSEBLEED,ANT COMPLEX (PACKING)
 ;;^UTILITY(U,$J,358.3,7384,0)
 ;;=30905^^33^454^9^^^^1
 ;;^UTILITY(U,$J,358.3,7384,1,0)
 ;;=^358.31IA^3^2
 ;;
 ;;$END ROU IBDEI0FY