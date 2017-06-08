IB20P539 ;ALB/CXW - IB*2*539 POST INIT: COST-BASED/INTERAGENCY RATE ; 11/18/2014
 ;;2.0;INTEGRATED BILLING;**539**;21-MAR-94;Build 17
 ;;Per VA Directive 6402, this routine should not be modified.
 ; 
 ;
 ; Add FY2015 Cost Based and Interagency Charges to the Charge Master
 Q
POST ;
 N IBEFFDT,IBA,U S U="^"
 D MSG("    IB*2.0*539 Post-Install .....")
 S IBEFFDT=3141104 ; effective date of 11/04/2014
 D ADDCI(IBEFFDT)  ; add Charge Items (363.2) with new 66 rates
 D MSG("    IB*2*539 Post-Install Complete")
 Q
 ;
ADDCI(IBEFFDT) ; Add Charge Items (363.2) needs Charge Sets, pass in the effective date of the new charges
 N IBCHG,IBCNT,IBCNT1,IBCI,IBCS,IBDFLTDT,IBDT,IBFN,IBI,IBLN,IBRVCD,IBX,IBXRF,IBZ,DD,DO,DLAYGO,DIC,DIE,DA,DR,X,Y
 ; 
 D MSG("")
 S (IBCNT,IBCNT1)=0,IBDFLTDT=+$G(IBEFFDT)
 I 'IBDFLTDT D MSG("** Error: No Effective Date, No Charges Added") G CIQ
 ;
 F IBI=1:1 S IBLN=$P($T(CIF+IBI),";;",2) Q:+IBLN!(IBLN="")  I $E(IBLN)?1A D SETCI
 ;
 I +IBCNT1 D MSG(IBCNT1_" Duplicate Charge Items already exist, not re-added")
 ;
CIQ D MSG("      >> "_IBCNT_" Cost Based/Interagency Charge Items added (363.2).")
 D MSG("")
 Q
 ;
SETCI ; set Charge Item (duplicates based on item, CS, eff dt, rev cd)
 ;
 S IBCS=$P(IBLN,U,2),IBCS=+$O(^IBE(363.1,"B",IBCS,0)) I 'IBCS D MSG("** Error: Charge Set "_$P(IBLN,U,2)_" undefined") Q
 S IBCI=+$$MCCRUTL($P(IBLN,U,1),5) I 'IBCI D MSG("** Error: Bed Section "_$P(IBLN,U,1)_" undefined") Q
 S IBDT=IBDFLTDT I +$P(IBLN,U,3) S IBDT=+$P(IBLN,U,3)
 S IBRVCD=$$RVCD($P(IBLN,U,4))
 S IBCHG=+$P(IBLN,U,5)
 S IBXRF="AIVDTS"_IBCS
 ;
 S IBX=0 F  S IBX=$O(^IBA(363.2,IBXRF,IBCI,-IBDT,IBX)) Q:'IBX  S IBZ=$G(^IBA(363.2,IBX,0)) I $P(IBZ,U,6)=IBRVCD D
 . S IBCI=0,IBCNT1=IBCNT1+1 I +$P(IBZ,U,5)'=IBCHG D MSG("** Error: Item exists, wrong charge: "_IBLN)
 Q:'IBCI
 ;
 K DD,DO S DLAYGO=363.2,DIC="^IBA(363.2,",DIC(0)="L",X=IBCI_";DGCR(399.1," D FILE^DICN K DIC
 I Y<1 D MSG("** Error: when adding the charge item "_IBCS_" with rate "_IBCHG_" to the file, Log a Remedy ticket!") K X,Y Q
 S IBFN=+Y,IBCNT=IBCNT+1
 ;
 S DR=".02///"_IBCS_";.03///"_IBDT_";.05///"_IBCHG I +IBRVCD S DR=DR_";.06///"_IBRVCD
 S DIE="^IBA(363.2,",DA=+IBFN D ^DIE K DIE,DA,DR,X,Y
 Q
 ;
 ;
MCCRUTL(X,P) ; returns IFN of item in 399.1 if Name is found and piece P is true
 N IBX,IBY S IBY=""
 I $G(X)'="" S IBX=0 F  S IBX=$O(^DGCR(399.1,"B",X,IBX)) Q:'IBX  I $P($G(^DGCR(399.1,IBX,0)),U,+$G(P)) S IBY=IBX
 Q IBY
 ;
RVCD(RVCD) ; returns IFN if revenue code is valid and active
 N IBX,IBY S IBY=""
 I +$G(RVCD) S IBX=$G(^DGCR(399.2,+RVCD,0)) I +$P(IBX,U,3) S IBY=+RVCD
 Q IBY
 ;
MSG(IBA) ;
 D MES^XPDUTL(IBA)
 Q
 ;
CIF ; 66 Charge Items (363.2): Bedsection ^ Charge Set ^Effective Date ^ Revenue Code ^ Charge
 ;;     
TORT ;; Tortiously Liable All Inclusive 
 ;;        
 ;;ALCOHOL AND DRUG TREATMENT^TL-INPT (INCLUSIVE)^^^1363
 ;;BLIND REHABILITATION^TL-INPT (INCLUSIVE)^^^1641
 ;;GENERAL MEDICAL CARE^TL-INPT (INCLUSIVE)^^^3313
 ;;INTERMEDIATE CARE^TL-INPT (INCLUSIVE)^^^2249
 ;;NEUROLOGY^TL-INPT (INCLUSIVE)^^^3152
 ;;NURSING HOME CARE^TL-INPT (INCLUSIVE)^^^1082
 ;;POLYTRAUMA INPATIENT^TL-INPT (INCLUSIVE)^^^3217
 ;;PRRTP^TL-INPT (INCLUSIVE)^^^650
 ;;PSYCHIATRIC CARE^TL-INPT (INCLUSIVE)^^^1611
 ;;REHABILITATION MEDICINE^TL-INPT (INCLUSIVE)^^^2480
 ;;SPINAL CORD INJURY CARE^TL-INPT (INCLUSIVE)^^^2201
 ;;SURGICAL CARE^TL-INPT (INCLUSIVE)^^^5165
 ;;             
 ;; Tortiously Liable Non-Professional
 ;;ALCOHOL AND DRUG TREATMENT^TL-INPT (NPF)^^101^918
 ;;ALCOHOL AND DRUG TREATMENT^TL-INPT (NPF)^^240^315
 ;;BLIND REHABILITATION^TL-INPT (NPF)^^101^694
 ;;BLIND REHABILITATION^TL-INPT (NPF)^^240^815
 ;;GENERAL MEDICAL CARE^TL-INPT (NPF)^^101^2053
 ;;GENERAL MEDICAL CARE^TL-INPT (NPF)^^240^863
 ;;INTERMEDIATE CARE^TL-INPT (NPF)^^101^1808
 ;;INTERMEDIATE CARE^TL-INPT (NPF)^^240^330
 ;;NEUROLOGY^TL-INPT (NPF)^^101^1859
 ;;NEUROLOGY^TL-INPT (NPF)^^240^832
 ;;NURSING HOME CARE^TL-INPT (NPF)^^101^902
 ;;NURSING HOME CARE^TL-INPT (NPF)^^240^146
 ;;POLYTRAUMA INPATIENT^TL-INPT (NPF)^^101^1869
 ;;POLYTRAUMA INPATIENT^TL-INPT (NPF)^^240^983
 ;;PRRTP^TL-INPT (NPF)^^101^541
 ;;PRRTP^TL-INPT (NPF)^^240^68
 ;;PSYCHIATRIC CARE^TL-INPT (NPF)^^101^1205
 ;;PSYCHIATRIC CARE^TL-INPT (NPF)^^240^254
 ;;REHABILITATION MEDICINE^TL-INPT (NPF)^^101^1440
 ;;REHABILITATION MEDICINE^TL-INPT (NPF)^^240^758
 ;;SPINAL CORD INJURY CARE^TL-INPT (NPF)^^101^1374
 ;;SPINAL CORD INJURY CARE^TL-INPT (NPF)^^240^554
 ;;SURGICAL CARE^TL-INPT (NPF)^^101^3029
 ;;SURGICAL CARE^TL-INPT (NPF)^^240^1567
 ;;              
 ;; Tortiously Liable Professional
 ;;ALCOHOL AND DRUG TREATMENT^TL-INPT (PF)^^^130
 ;;BLIND REHABILITATION^TL-INPT (PF)^^^132
 ;;GENERAL MEDICAL CARE^TL-INPT (PF)^^^397
 ;;INTERMEDIATE CARE^TL-INPT (PF)^^^111
 ;;NEUROLOGY^TL-INPT (PF)^^^461
 ;;NURSING HOME CARE^TL-INPT (PF)^^^34
 ;;POLYTRAUMA INPATIENT^TL-INPT (PF)^^^365
 ;;PRRTP^TL-INPT (PF)^^^41
 ;;PSYCHIATRIC CARE^TL-INPT (PF)^^^152
 ;;REHABILITATION MEDICINE^TL-INPT (PF)^^^282
 ;;SPINAL CORD INJURY CARE^TL-INPT (PF)^^^273
 ;;SURGICAL CARE^TL-INPT (PF)^^^569
 ;;                    
 ;; Tortiously Liable Other
 ;;OUTPATIENT VISIT^TL-OPT VST^^^236
 ;;PM&RS OUTPATIENT VISIT^TL-OPT VST PM&RS^^^443
 ;;POLYTRAUMA OUTPATIENT VISIT^TL-OPT VST POLYTRAUMA^^^586
 ;;          
 ;;         
IA ;; Interagency
 ;;            
 ;;ALCOHOL AND DRUG TREATMENT^IA-INPT^^^1294
 ;;BLIND REHABILITATION^IA-INPT^^^1557
 ;;GENERAL MEDICAL CARE^IA-INPT^^^3142
 ;;INTERMEDIATE CARE^IA-INPT^^^2135
 ;;NEUROLOGY^IA-INPT^^^2993
 ;;NURSING HOME CARE^IA-INPT^^^1025
 ;;POLYTRAUMA INPATIENT^IA-INPT^^^3058
 ;;PRRTP^IA-INPT^^^616
 ;;PSYCHIATRIC CARE^IA-INPT^^^1527
 ;;REHABILITATION MEDICINE^IA-INPT^^^2353
 ;;SPINAL CORD INJURY CARE^IA-INPT^^^2089
 ;;SURGICAL CARE^IA-INPT^^^4899
 ;;            
 ;;OUTPATIENT VISIT^IA-OPT VST^^^222
 ;;PM&RS OUTPATIENT VISIT^IA-OPT VST PM&RS^^^419
 ;;POLYTRAUMA OUTPATIENT VISIT^IA-OPT VST POLYTRAUMA^^^561
 ;;
 Q