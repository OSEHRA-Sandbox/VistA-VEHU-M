IBDEI103 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,17613,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17613,1,2,0)
 ;;=2^G8991
 ;;^UTILITY(U,$J,358.3,17613,1,3,0)
 ;;=3^Other Phys/Occ Lmt,Proj,Otst,Intrv,D/E
 ;;^UTILITY(U,$J,358.3,17614,0)
 ;;=G8981^^92^1105^1^^^^1
 ;;^UTILITY(U,$J,358.3,17614,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17614,1,2,0)
 ;;=2^G8981
 ;;^UTILITY(U,$J,358.3,17614,1,3,0)
 ;;=3^Chng/Maint Bdy Pos Lmt,Curr,Outset,Intrv
 ;;^UTILITY(U,$J,358.3,17615,0)
 ;;=G8982^^92^1105^2^^^^1
 ;;^UTILITY(U,$J,358.3,17615,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17615,1,2,0)
 ;;=2^G8982
 ;;^UTILITY(U,$J,358.3,17615,1,3,0)
 ;;=3^Proj Status,Outset,Intrv,D/E
 ;;^UTILITY(U,$J,358.3,17616,0)
 ;;=G8983^^92^1105^3^^^^1
 ;;^UTILITY(U,$J,358.3,17616,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17616,1,2,0)
 ;;=2^G8983
 ;;^UTILITY(U,$J,358.3,17616,1,3,0)
 ;;=3^Disch Status,D/E
 ;;^UTILITY(U,$J,358.3,17617,0)
 ;;=98960^^92^1106^1^^^^1
 ;;^UTILITY(U,$J,358.3,17617,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17617,1,2,0)
 ;;=2^98960
 ;;^UTILITY(U,$J,358.3,17617,1,3,0)
 ;;=3^Non-Physician Ed,F2F w/ Pt,Ea 30Min
 ;;^UTILITY(U,$J,358.3,17618,0)
 ;;=98961^^92^1106^2^^^^1
 ;;^UTILITY(U,$J,358.3,17618,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17618,1,2,0)
 ;;=2^98961
 ;;^UTILITY(U,$J,358.3,17618,1,3,0)
 ;;=3^Non-Physician Ed,F2F 2-4 Pt,Ea 30min
 ;;^UTILITY(U,$J,358.3,17619,0)
 ;;=98962^^92^1106^3^^^^1
 ;;^UTILITY(U,$J,358.3,17619,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17619,1,2,0)
 ;;=2^98962
 ;;^UTILITY(U,$J,358.3,17619,1,3,0)
 ;;=3^Non-Physician Ed,F2F 5-8 Pt,Ea 30Min
 ;;^UTILITY(U,$J,358.3,17620,0)
 ;;=97762^^92^1107^1^^^^1
 ;;^UTILITY(U,$J,358.3,17620,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17620,1,2,0)
 ;;=2^97762
 ;;^UTILITY(U,$J,358.3,17620,1,3,0)
 ;;=3^Checkout Pros/Orth,Est Pt,Ea 15Min
 ;;^UTILITY(U,$J,358.3,17621,0)
 ;;=G9168^^92^1108^1^^^^1
 ;;^UTILITY(U,$J,358.3,17621,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17621,1,2,0)
 ;;=2^G9168
 ;;^UTILITY(U,$J,358.3,17621,1,3,0)
 ;;=3^Mem Fx Lmt,Curr,Outset,Intrv
 ;;^UTILITY(U,$J,358.3,17622,0)
 ;;=G9169^^92^1108^2^^^^1
 ;;^UTILITY(U,$J,358.3,17622,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17622,1,2,0)
 ;;=2^G9169
 ;;^UTILITY(U,$J,358.3,17622,1,3,0)
 ;;=3^Proj Status,Outset,Intrv,D/E
 ;;^UTILITY(U,$J,358.3,17623,0)
 ;;=G9170^^92^1108^3^^^^1
 ;;^UTILITY(U,$J,358.3,17623,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17623,1,2,0)
 ;;=2^G9170
 ;;^UTILITY(U,$J,358.3,17623,1,3,0)
 ;;=3^Disch Status,D/E
 ;;^UTILITY(U,$J,358.3,17624,0)
 ;;=G8978^^92^1109^1^^^^1
 ;;^UTILITY(U,$J,358.3,17624,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17624,1,2,0)
 ;;=2^G8978
 ;;^UTILITY(U,$J,358.3,17624,1,3,0)
 ;;=3^Wlking/Mvng Lmt,Curr,Outset,Intrv
 ;;^UTILITY(U,$J,358.3,17625,0)
 ;;=G8979^^92^1109^2^^^^1
 ;;^UTILITY(U,$J,358.3,17625,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17625,1,2,0)
 ;;=2^G8979
 ;;^UTILITY(U,$J,358.3,17625,1,3,0)
 ;;=3^Proj Status,Outset,Intrv,D/E
 ;;^UTILITY(U,$J,358.3,17626,0)
 ;;=G8980^^92^1109^3^^^^1
 ;;^UTILITY(U,$J,358.3,17626,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17626,1,2,0)
 ;;=2^G8980
 ;;^UTILITY(U,$J,358.3,17626,1,3,0)
 ;;=3^Disch Status,D/E
 ;;^UTILITY(U,$J,358.3,17627,0)
 ;;=G9174^^92^1110^1^^^^1
 ;;^UTILITY(U,$J,358.3,17627,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17627,1,2,0)
 ;;=2^G9174
 ;;^UTILITY(U,$J,358.3,17627,1,3,0)
 ;;=3^Speech/Lang Path Lmt,Curr,Outset,Intrv
 ;;^UTILITY(U,$J,358.3,17628,0)
 ;;=G9175^^92^1110^2^^^^1
 ;;^UTILITY(U,$J,358.3,17628,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,17628,1,2,0)
 ;;=2^G9175
 ;;
 ;;$END ROU IBDEI103