NURCCG9R ;HISC/RM-DATA ROUTINE FOR DATA TRANSFER UTILITY ;12/12/91
 ;;3.0;Nursing Clinical;;Jan 24, 1996
 ;;
 F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO I  S @X=Y
Q Q
 ;;^UTILITY("^GMRD(124.2,",$J,5124,7)
 ;;=D EN4^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5125,0)
 ;;=[Extra Goal]^3^NURSC^9^303^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5125,9)
 ;;=D EN5^NURCCPU0
 ;;^UTILITY("^GMRD(124.2,",$J,5125,10)
 ;;=D EN2^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5126,0)
 ;;=[Extra Goal]^3^NURSC^9^304^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5126,9)
 ;;=D EN5^NURCCPU0
 ;;^UTILITY("^GMRD(124.2,",$J,5126,10)
 ;;=D EN2^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5127,0)
 ;;=[etiology]^3^NURSC^^32^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5128,0)
 ;;=Nursing Intervention/Orders^2^NURSC^6^256^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5128,1,0)
 ;;=^124.21PI^3^3
 ;;^UTILITY("^GMRD(124.2,",$J,5128,1,1,0)
 ;;=5130^[Extra Order]^3^NURSC^306
 ;;^UTILITY("^GMRD(124.2,",$J,5128,1,2,0)
 ;;=5135^[Extra Order]^3^NURSC^307
 ;;^UTILITY("^GMRD(124.2,",$J,5128,1,3,0)
 ;;=5137^[Extra Order]^3^NURSC^308
 ;;^UTILITY("^GMRD(124.2,",$J,5128,7)
 ;;=D EN4^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5128,9)
 ;;=D EN1^NURCCPU2
 ;;^UTILITY("^GMRD(124.2,",$J,5129,0)
 ;;=[etiology]^3^NURSC^^33^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5130,0)
 ;;=[Extra Order]^3^NURSC^11^306^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5130,9)
 ;;=D EN2^NURCCPU2
 ;;^UTILITY("^GMRD(124.2,",$J,5130,10)
 ;;=D EN1^NURCCPU3
 ;;^UTILITY("^GMRD(124.2,",$J,5131,0)
 ;;=[etiology]^3^NURSC^^34^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5134,0)
 ;;=Goals/Expected Outcomes^2^NURSC^5^256^1^^T^0
 ;;^UTILITY("^GMRD(124.2,",$J,5134,1,0)
 ;;=^124.21PI^3^3
 ;;^UTILITY("^GMRD(124.2,",$J,5134,1,1,0)
 ;;=5138^[Extra Goal]^3^NURSC^305
 ;;^UTILITY("^GMRD(124.2,",$J,5134,1,2,0)
 ;;=5140^[Extra Goal]^3^NURSC^306
 ;;^UTILITY("^GMRD(124.2,",$J,5134,1,3,0)
 ;;=5143^[Extra Goal]^3^NURSC^307
 ;;^UTILITY("^GMRD(124.2,",$J,5134,7)
 ;;=D EN4^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5135,0)
 ;;=[Extra Order]^3^NURSC^11^307^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5135,9)
 ;;=D EN2^NURCCPU2
 ;;^UTILITY("^GMRD(124.2,",$J,5135,10)
 ;;=D EN1^NURCCPU3
 ;;^UTILITY("^GMRD(124.2,",$J,5137,0)
 ;;=[Extra Order]^3^NURSC^11^308^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5137,9)
 ;;=D EN2^NURCCPU2
 ;;^UTILITY("^GMRD(124.2,",$J,5137,10)
 ;;=D EN1^NURCCPU3
 ;;^UTILITY("^GMRD(124.2,",$J,5138,0)
 ;;=[Extra Goal]^3^NURSC^9^305^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5138,9)
 ;;=D EN5^NURCCPU0
 ;;^UTILITY("^GMRD(124.2,",$J,5138,10)
 ;;=D EN2^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5140,0)
 ;;=[Extra Goal]^3^NURSC^9^306^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5140,9)
 ;;=D EN5^NURCCPU0
 ;;^UTILITY("^GMRD(124.2,",$J,5140,10)
 ;;=D EN2^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5143,0)
 ;;=[Extra Goal]^3^NURSC^9^307^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5143,9)
 ;;=D EN5^NURCCPU0
 ;;^UTILITY("^GMRD(124.2,",$J,5143,10)
 ;;=D EN2^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5145,0)
 ;;=Nursing Intervention/Orders^2^NURSC^6^258^1^^T^0
 ;;^UTILITY("^GMRD(124.2,",$J,5145,1,0)
 ;;=^124.21PI^3^3
 ;;^UTILITY("^GMRD(124.2,",$J,5145,1,1,0)
 ;;=5147^[Extra Order]^3^NURSC^309
 ;;^UTILITY("^GMRD(124.2,",$J,5145,1,2,0)
 ;;=5150^[Extra Order]^3^NURSC^310
 ;;^UTILITY("^GMRD(124.2,",$J,5145,1,3,0)
 ;;=5151^[Extra Order]^3^NURSC^311
 ;;^UTILITY("^GMRD(124.2,",$J,5145,7)
 ;;=D EN4^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5145,9)
 ;;=D EN1^NURCCPU2
 ;;^UTILITY("^GMRD(124.2,",$J,5147,0)
 ;;=[Extra Order]^3^NURSC^11^309^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5147,9)
 ;;=D EN2^NURCCPU2
 ;;^UTILITY("^GMRD(124.2,",$J,5147,10)
 ;;=D EN1^NURCCPU3
 ;;^UTILITY("^GMRD(124.2,",$J,5149,0)
 ;;=Sleep Apnea^2^NURSC^8^2^1^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5149,1,0)
 ;;=^124.21PI^3^3
 ;;^UTILITY("^GMRD(124.2,",$J,5149,1,1,0)
 ;;=5155^Gas Exchange, Impaired^2^NURSC^15