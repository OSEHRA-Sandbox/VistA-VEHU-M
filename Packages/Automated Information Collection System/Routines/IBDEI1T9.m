IBDEI1T9 ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,31919,2)
 ;;=^5008206
 ;;^UTILITY(U,$J,358.3,31920,0)
 ;;=J40.^^182^1976^8
 ;;^UTILITY(U,$J,358.3,31920,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31920,1,3,0)
 ;;=3^Bronchitis,Unspec
 ;;^UTILITY(U,$J,358.3,31920,1,4,0)
 ;;=4^J40.
 ;;^UTILITY(U,$J,358.3,31920,2)
 ;;=^17164
 ;;^UTILITY(U,$J,358.3,31921,0)
 ;;=J45.909^^182^1976^4
 ;;^UTILITY(U,$J,358.3,31921,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31921,1,3,0)
 ;;=3^Asthma,Unspec
 ;;^UTILITY(U,$J,358.3,31921,1,4,0)
 ;;=4^J45.909
 ;;^UTILITY(U,$J,358.3,31921,2)
 ;;=^5008256
 ;;^UTILITY(U,$J,358.3,31922,0)
 ;;=J44.9^^182^1976^9
 ;;^UTILITY(U,$J,358.3,31922,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31922,1,3,0)
 ;;=3^COPD,Unspec
 ;;^UTILITY(U,$J,358.3,31922,1,4,0)
 ;;=4^J44.9
 ;;^UTILITY(U,$J,358.3,31922,2)
 ;;=^5008241
 ;;^UTILITY(U,$J,358.3,31923,0)
 ;;=K21.9^^182^1976^21
 ;;^UTILITY(U,$J,358.3,31923,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31923,1,3,0)
 ;;=3^GERD w/o Esophagitis
 ;;^UTILITY(U,$J,358.3,31923,1,4,0)
 ;;=4^K21.9
 ;;^UTILITY(U,$J,358.3,31923,2)
 ;;=^5008505
 ;;^UTILITY(U,$J,358.3,31924,0)
 ;;=N40.0^^182^1976^20
 ;;^UTILITY(U,$J,358.3,31924,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31924,1,3,0)
 ;;=3^Enlarged Prostate w/o LUTS
 ;;^UTILITY(U,$J,358.3,31924,1,4,0)
 ;;=4^N40.0
 ;;^UTILITY(U,$J,358.3,31924,2)
 ;;=^5015689
 ;;^UTILITY(U,$J,358.3,31925,0)
 ;;=N40.1^^182^1976^19
 ;;^UTILITY(U,$J,358.3,31925,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31925,1,3,0)
 ;;=3^Enlarged Prostate w/ LUTS
 ;;^UTILITY(U,$J,358.3,31925,1,4,0)
 ;;=4^N40.1
 ;;^UTILITY(U,$J,358.3,31925,2)
 ;;=^5015690
 ;;^UTILITY(U,$J,358.3,31926,0)
 ;;=L03.811^^182^1976^10
 ;;^UTILITY(U,$J,358.3,31926,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31926,1,3,0)
 ;;=3^Cellulitis,Head (Except Face)
 ;;^UTILITY(U,$J,358.3,31926,1,4,0)
 ;;=4^L03.811
 ;;^UTILITY(U,$J,358.3,31926,2)
 ;;=^5009063
 ;;^UTILITY(U,$J,358.3,31927,0)
 ;;=L03.818^^182^1976^11
 ;;^UTILITY(U,$J,358.3,31927,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31927,1,3,0)
 ;;=3^Cellulitis,Oth Sites
 ;;^UTILITY(U,$J,358.3,31927,1,4,0)
 ;;=4^L03.818
 ;;^UTILITY(U,$J,358.3,31927,2)
 ;;=^5009064
 ;;^UTILITY(U,$J,358.3,31928,0)
 ;;=L03.891^^182^1976^35
 ;;^UTILITY(U,$J,358.3,31928,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31928,1,3,0)
 ;;=3^Lymphangitis,Head (Except Face),Acute
 ;;^UTILITY(U,$J,358.3,31928,1,4,0)
 ;;=4^L03.891
 ;;^UTILITY(U,$J,358.3,31928,2)
 ;;=^5009065
 ;;^UTILITY(U,$J,358.3,31929,0)
 ;;=L03.898^^182^1976^36
 ;;^UTILITY(U,$J,358.3,31929,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31929,1,3,0)
 ;;=3^Lymphangitis,Oth Sites,Acute
 ;;^UTILITY(U,$J,358.3,31929,1,4,0)
 ;;=4^L03.898
 ;;^UTILITY(U,$J,358.3,31929,2)
 ;;=^5009066
 ;;^UTILITY(U,$J,358.3,31930,0)
 ;;=L03.90^^182^1976^12
 ;;^UTILITY(U,$J,358.3,31930,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31930,1,3,0)
 ;;=3^Cellulitis,Unspec
 ;;^UTILITY(U,$J,358.3,31930,1,4,0)
 ;;=4^L03.90
 ;;^UTILITY(U,$J,358.3,31930,2)
 ;;=^5009067
 ;;^UTILITY(U,$J,358.3,31931,0)
 ;;=L03.91^^182^1976^34
 ;;^UTILITY(U,$J,358.3,31931,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31931,1,3,0)
 ;;=3^Lymphangitis,Acute,Unspec
 ;;^UTILITY(U,$J,358.3,31931,1,4,0)
 ;;=4^L03.91
 ;;^UTILITY(U,$J,358.3,31931,2)
 ;;=^5009068
 ;;^UTILITY(U,$J,358.3,31932,0)
 ;;=M51.26^^182^1976^32
 ;;^UTILITY(U,$J,358.3,31932,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,31932,1,3,0)
 ;;=3^Intervertebral Disc Displacement,Lumbar Region
 ;;^UTILITY(U,$J,358.3,31932,1,4,0)
 ;;=4^M51.26
 ;;^UTILITY(U,$J,358.3,31932,2)
 ;;=^5012249
 ;;^UTILITY(U,$J,358.3,31933,0)
 ;;=M51.27^^182^1976^33
 ;;
 ;;$END ROU IBDEI1T9