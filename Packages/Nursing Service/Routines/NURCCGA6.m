NURCCGA6 ;HISC/RM-DATA ROUTINE FOR DATA TRANSFER UTILITY ;12/12/91
 ;;3.0;Nursing Clinical;;Jan 24, 1996
 ;;
 F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO I  S @X=Y
Q Q
 ;;^UTILITY("^GMRD(124.2,",$J,5825,1,5,0)
 ;;=5880^Defining Characteristics^2^NURSC^75
 ;;^UTILITY("^GMRD(124.2,",$J,5825,1,7,0)
 ;;=12442^Goals/Expected Outcomes^2^NURSC^165
 ;;^UTILITY("^GMRD(124.2,",$J,5825,7)
 ;;=D EN3^NURCCPU0
 ;;^UTILITY("^GMRD(124.2,",$J,5825,9)
 ;;=D EN2^NURCCPU3
 ;;^UTILITY("^GMRD(124.2,",$J,5825,10)
 ;;=D EN3^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5825,"TD",0)
 ;;=^^2^2^2890301^
 ;;^UTILITY("^GMRD(124.2,",$J,5825,"TD",1,0)
 ;;=A state in which the individual experiences a limitation of ability
 ;;^UTILITY("^GMRD(124.2,",$J,5825,"TD",2,0)
 ;;=for independent physical movement.
 ;;^UTILITY("^GMRD(124.2,",$J,5826,0)
 ;;=Etiology/Related and/or Risk Factors^2^NURSC^4^81^1^^T^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,0)
 ;;=^124.21PI^19^19
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,1,0)
 ;;=803^intolerance to activity; decreased strength and endurance^3^NURSC^2
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,2,0)
 ;;=209^musculoskeletal impairment^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,3,0)
 ;;=210^neuromuscular impairment^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,4,0)
 ;;=795^pain and discomfort^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,5,0)
 ;;=796^perceptual or cognitive^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,6,0)
 ;;=1038^reduced consciousness^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,7,0)
 ;;=1039^perceptual impairment^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,8,0)
 ;;=1040^psychological impairment^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,9,0)
 ;;=1041^visual impairment^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,10,0)
 ;;=1042^paralysis/plegia, loss of limb, quadri, para, hemi, mono^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,11,0)
 ;;=1043^injury^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,12,0)
 ;;=1044^restrictive devices^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,13,0)
 ;;=1045^pain^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,14,0)
 ;;=1046^decrease strength and endurance^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,15,0)
 ;;=1047^age^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,16,0)
 ;;=1048^nutritionally deprived^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,17,0)
 ;;=798^medical protocols^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,18,0)
 ;;=207^depression, severe anxiety^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,1,19,0)
 ;;=159^cognitive limitation^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5826,7)
 ;;=D EN4^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5850,0)
 ;;=[Extra Goal]^3^NURSC^9^120^^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5850,9)
 ;;=D EN5^NURCCPU0
 ;;^UTILITY("^GMRD(124.2,",$J,5850,10)
 ;;=D EN2^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5851,0)
 ;;=Nursing Intervention/Orders^2^NURSC^6^74^1^^T
 ;;^UTILITY("^GMRD(124.2,",$J,5851,1,0)
 ;;=^124.21PI^21^9
 ;;^UTILITY("^GMRD(124.2,",$J,5851,1,1,0)
 ;;=809^assess mobility, limitations q[frequency]^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5851,1,14,0)
 ;;=5873^[Extra Order]^3^NURSC^121
 ;;^UTILITY("^GMRD(124.2,",$J,5851,1,15,0)
 ;;=15698^assess function, ROM, and strength in extremeties^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5851,1,16,0)
 ;;=15713^implement measures to increase mobility [specify]^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5851,1,17,0)
 ;;=15702^instruct and assist in use of mobility aids [specify]^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5851,1,18,0)
 ;;=15714^encourage support of significant others^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5851,1,19,0)
 ;;=15715^provide safe environment^3^NURSC^1
 ;;^UTILITY("^GMRD(124.2,",$J,5851,1,20,0)
 ;;=11608^instruct/assist with ROM [specify]^3^NURSC^56
 ;;^UTILITY("^GMRD(124.2,",$J,5851,1,21,0)
 ;;=13270^teach techniques to prevent complications^3^NURSC^3
 ;;^UTILITY("^GMRD(124.2,",$J,5851,7)
 ;;=D EN4^NURCCPU1
 ;;^UTILITY("^GMRD(124.2,",$J,5851,9)
 ;;=D EN1^NURCCPU2