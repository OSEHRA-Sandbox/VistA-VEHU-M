IBDEI11D ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,18247,1,5,0)
 ;;=5^Late Effect of Motor Vehicle Accident
 ;;^UTILITY(U,$J,358.3,18247,2)
 ;;=^294763
 ;;^UTILITY(U,$J,358.3,18248,0)
 ;;=E969.^^96^1158^1
 ;;^UTILITY(U,$J,358.3,18248,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,18248,1,4,0)
 ;;=4^E969.
 ;;^UTILITY(U,$J,358.3,18248,1,5,0)
 ;;=5^Late Effect Homicide Attempt
 ;;^UTILITY(U,$J,358.3,18248,2)
 ;;=^295085
 ;;^UTILITY(U,$J,358.3,18249,0)
 ;;=E959.^^96^1158^4
 ;;^UTILITY(U,$J,358.3,18249,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,18249,1,4,0)
 ;;=4^E959.
 ;;^UTILITY(U,$J,358.3,18249,1,5,0)
 ;;=5^Late Effect of Suicide Attempt
 ;;^UTILITY(U,$J,358.3,18249,2)
 ;;=^295058
 ;;^UTILITY(U,$J,358.3,18250,0)
 ;;=90632^^97^1159^4^^^^1
 ;;^UTILITY(U,$J,358.3,18250,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18250,1,2,0)
 ;;=2^90632
 ;;^UTILITY(U,$J,358.3,18250,1,3,0)
 ;;=3^Hepatitis A Vaccine
 ;;^UTILITY(U,$J,358.3,18251,0)
 ;;=90746^^97^1159^6^^^^1
 ;;^UTILITY(U,$J,358.3,18251,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18251,1,2,0)
 ;;=2^90746
 ;;^UTILITY(U,$J,358.3,18251,1,3,0)
 ;;=3^Hepatitis B Vaccine (3 dose)
 ;;^UTILITY(U,$J,358.3,18252,0)
 ;;=90636^^97^1159^5^^^^1
 ;;^UTILITY(U,$J,358.3,18252,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18252,1,2,0)
 ;;=2^90636
 ;;^UTILITY(U,$J,358.3,18252,1,3,0)
 ;;=3^Hepatitis A&B Vaccine
 ;;^UTILITY(U,$J,358.3,18253,0)
 ;;=90707^^97^1159^7^^^^1
 ;;^UTILITY(U,$J,358.3,18253,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18253,1,2,0)
 ;;=2^90707
 ;;^UTILITY(U,$J,358.3,18253,1,3,0)
 ;;=3^MMR Vaccine
 ;;^UTILITY(U,$J,358.3,18254,0)
 ;;=90658^^97^1159^2^^^^1
 ;;^UTILITY(U,$J,358.3,18254,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18254,1,2,0)
 ;;=2^90658
 ;;^UTILITY(U,$J,358.3,18254,1,3,0)
 ;;=3^Flu Vaccine,IM
 ;;^UTILITY(U,$J,358.3,18255,0)
 ;;=90732^^97^1159^9^^^^1
 ;;^UTILITY(U,$J,358.3,18255,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18255,1,2,0)
 ;;=2^90732
 ;;^UTILITY(U,$J,358.3,18255,1,3,0)
 ;;=3^Pneumococcal Vaccine
 ;;^UTILITY(U,$J,358.3,18256,0)
 ;;=90715^^97^1159^11^^^^1
 ;;^UTILITY(U,$J,358.3,18256,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18256,1,2,0)
 ;;=2^90715
 ;;^UTILITY(U,$J,358.3,18256,1,3,0)
 ;;=3^Tdap Vaccine
 ;;^UTILITY(U,$J,358.3,18257,0)
 ;;=90736^^97^1159^13^^^^1
 ;;^UTILITY(U,$J,358.3,18257,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18257,1,2,0)
 ;;=2^90736
 ;;^UTILITY(U,$J,358.3,18257,1,3,0)
 ;;=3^Zoster (Shingles) Vaccine
 ;;^UTILITY(U,$J,358.3,18258,0)
 ;;=86580^^97^1159^8^^^^1
 ;;^UTILITY(U,$J,358.3,18258,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18258,1,2,0)
 ;;=2^86580
 ;;^UTILITY(U,$J,358.3,18258,1,3,0)
 ;;=3^PPD Skin Test
 ;;^UTILITY(U,$J,358.3,18259,0)
 ;;=96372^^97^1159^12^^^^1
 ;;^UTILITY(U,$J,358.3,18259,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18259,1,2,0)
 ;;=2^96372
 ;;^UTILITY(U,$J,358.3,18259,1,3,0)
 ;;=3^Ther/Proph/Diag Inj SC/IM
 ;;^UTILITY(U,$J,358.3,18260,0)
 ;;=90714^^97^1159^10^^^^1
 ;;^UTILITY(U,$J,358.3,18260,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18260,1,2,0)
 ;;=2^90714
 ;;^UTILITY(U,$J,358.3,18260,1,3,0)
 ;;=3^TD Vaccine
 ;;^UTILITY(U,$J,358.3,18261,0)
 ;;=90656^^97^1159^3^^^^1
 ;;^UTILITY(U,$J,358.3,18261,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18261,1,2,0)
 ;;=2^90656
 ;;^UTILITY(U,$J,358.3,18261,1,3,0)
 ;;=3^Flu Vaccine,Preservative Free,IM
 ;;^UTILITY(U,$J,358.3,18262,0)
 ;;=90662^^97^1159^1^^^^1
 ;;^UTILITY(U,$J,358.3,18262,1,0)
 ;;=^358.31IA^3^2
 ;;^UTILITY(U,$J,358.3,18262,1,2,0)
 ;;=2^90662
 ;;^UTILITY(U,$J,358.3,18262,1,3,0)
 ;;=3^Flu Vaccine,High Dose,IM
 ;;^UTILITY(U,$J,358.3,18263,0)
 ;;=90887^^97^1160^1^^^^1
 ;;
 ;;$END ROU IBDEI11D