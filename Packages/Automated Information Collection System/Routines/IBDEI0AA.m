IBDEI0AA ; ; 06-AUG-2015
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JUN 29, 2015
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,4422,2)
 ;;=^295810
 ;;^UTILITY(U,$J,358.3,4423,0)
 ;;=716.10^^23^228^46
 ;;^UTILITY(U,$J,358.3,4423,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4423,1,4,0)
 ;;=4^716.10
 ;;^UTILITY(U,$J,358.3,4423,1,5,0)
 ;;=5^Traumatic Arthritis
 ;;^UTILITY(U,$J,358.3,4423,2)
 ;;=^265063
 ;;^UTILITY(U,$J,358.3,4424,0)
 ;;=781.0^^23^229^16
 ;;^UTILITY(U,$J,358.3,4424,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4424,1,4,0)
 ;;=4^781.0
 ;;^UTILITY(U,$J,358.3,4424,1,5,0)
 ;;=5^Tremor
 ;;^UTILITY(U,$J,358.3,4424,2)
 ;;=^23827
 ;;^UTILITY(U,$J,358.3,4425,0)
 ;;=333.1^^23^229^17
 ;;^UTILITY(U,$J,358.3,4425,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4425,1,4,0)
 ;;=4^333.1
 ;;^UTILITY(U,$J,358.3,4425,1,5,0)
 ;;=5^Tremor
 ;;^UTILITY(U,$J,358.3,4425,2)
 ;;=^42610
 ;;^UTILITY(U,$J,358.3,4426,0)
 ;;=780.31^^23^229^2
 ;;^UTILITY(U,$J,358.3,4426,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4426,1,4,0)
 ;;=4^780.31
 ;;^UTILITY(U,$J,358.3,4426,1,5,0)
 ;;=5^Convulsions, Febrile
 ;;^UTILITY(U,$J,358.3,4426,2)
 ;;=^28172
 ;;^UTILITY(U,$J,358.3,4427,0)
 ;;=780.4^^23^229^18
 ;;^UTILITY(U,$J,358.3,4427,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4427,1,4,0)
 ;;=4^780.4
 ;;^UTILITY(U,$J,358.3,4427,1,5,0)
 ;;=5^Vertigo
 ;;^UTILITY(U,$J,358.3,4427,2)
 ;;=^35946
 ;;^UTILITY(U,$J,358.3,4428,0)
 ;;=345.90^^23^229^10
 ;;^UTILITY(U,$J,358.3,4428,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4428,1,4,0)
 ;;=4^345.90
 ;;^UTILITY(U,$J,358.3,4428,1,5,0)
 ;;=5^Seizure Disorder NOS w/o Intr Epil
 ;;^UTILITY(U,$J,358.3,4428,2)
 ;;=^268477
 ;;^UTILITY(U,$J,358.3,4429,0)
 ;;=729.2^^23^229^4
 ;;^UTILITY(U,$J,358.3,4429,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4429,1,4,0)
 ;;=4^729.2
 ;;^UTILITY(U,$J,358.3,4429,1,5,0)
 ;;=5^Neuropathic Pain
 ;;^UTILITY(U,$J,358.3,4429,2)
 ;;=Neuropathic Pain^82605
 ;;^UTILITY(U,$J,358.3,4430,0)
 ;;=356.9^^23^229^6
 ;;^UTILITY(U,$J,358.3,4430,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4430,1,4,0)
 ;;=4^356.9
 ;;^UTILITY(U,$J,358.3,4430,1,5,0)
 ;;=5^Peripheral Neuropathy, Unsp
 ;;^UTILITY(U,$J,358.3,4430,2)
 ;;=^123931
 ;;^UTILITY(U,$J,358.3,4431,0)
 ;;=780.2^^23^229^14
 ;;^UTILITY(U,$J,358.3,4431,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4431,1,4,0)
 ;;=4^780.2
 ;;^UTILITY(U,$J,358.3,4431,1,5,0)
 ;;=5^Syncope Or Presyncope
 ;;^UTILITY(U,$J,358.3,4431,2)
 ;;=^116707
 ;;^UTILITY(U,$J,358.3,4432,0)
 ;;=724.3^^23^229^8
 ;;^UTILITY(U,$J,358.3,4432,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4432,1,4,0)
 ;;=4^724.3
 ;;^UTILITY(U,$J,358.3,4432,1,5,0)
 ;;=5^Sciatica
 ;;^UTILITY(U,$J,358.3,4432,2)
 ;;=^108484
 ;;^UTILITY(U,$J,358.3,4433,0)
 ;;=780.39^^23^229^13
 ;;^UTILITY(U,$J,358.3,4433,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4433,1,4,0)
 ;;=4^780.39
 ;;^UTILITY(U,$J,358.3,4433,1,5,0)
 ;;=5^Seizures
 ;;^UTILITY(U,$J,358.3,4433,2)
 ;;=^28162
 ;;^UTILITY(U,$J,358.3,4434,0)
 ;;=782.0^^23^229^5
 ;;^UTILITY(U,$J,358.3,4434,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4434,1,4,0)
 ;;=4^782.0
 ;;^UTILITY(U,$J,358.3,4434,1,5,0)
 ;;=5^Parasthesia
 ;;^UTILITY(U,$J,358.3,4434,2)
 ;;=Parasthesia^35757
 ;;^UTILITY(U,$J,358.3,4435,0)
 ;;=435.9^^23^229^15
 ;;^UTILITY(U,$J,358.3,4435,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4435,1,4,0)
 ;;=4^435.9
 ;;^UTILITY(U,$J,358.3,4435,1,5,0)
 ;;=5^Transient Ischemic Attack
 ;;^UTILITY(U,$J,358.3,4435,2)
 ;;=^21635
 ;;^UTILITY(U,$J,358.3,4436,0)
 ;;=729.1^^23^229^3
 ;;^UTILITY(U,$J,358.3,4436,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,4436,1,4,0)
 ;;=4^729.1
 ;;^UTILITY(U,$J,358.3,4436,1,5,0)
 ;;=5^Fibromyalgia
 ;;^UTILITY(U,$J,358.3,4436,2)
 ;;=Fibromyalgia^80160
 ;;
 ;;$END ROU IBDEI0AA