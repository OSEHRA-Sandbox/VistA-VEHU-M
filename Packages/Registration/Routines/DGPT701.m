DGPT701 ;ALB/MTC,HIOFO/FT - Process 701 Transaction ;11/5/14 1:27pm
 ;;5.3;Registration;**64,164,251,415,729,850,884**;Aug 13, 1993;Build 31
 ; 10/06/1999 ACS - Removed Place of Disposition codes M,Y,Z from the list of invalid codes.
 ;
 ;no external references
 ;
EN ;
 Q
SET ;
 S DGPTSTR=$G(^TMP("AEDIT",$J,"N701",DGPTAL7))
 ;S DGPTSTR=$G(^TMP("AEDIT",$J,"N701",SEQ))
 D PARSE^DGPT701P
DTE ;
 S (X,DGPTDDS)=$$FMDT^DGPT101($E(DGPTDDTD,1,6))_"."_$E(DGPTDDTD,7,10)
 S %DT="XT" D ^%DT I Y<0 S DGPTERC=705 D ERR G:DGPTEDFL EXIT
 I Y>0 D DD^%DT S DGPTDTD=$E(Y,5,6)_"-"_$E(Y,1,3)_"-"_$E(Y,9,12)_" "_$S($P(Y,"@",2)]"":$E($P(Y,"@",2),1,5),1:"00:00")
 S X1=DGPTNOW,X2=+DGPTDDS D ^%DTC I X<0 S DGPTERC=740 D ERR G:DGPTEDFL EXIT
 S X1=+DGPTDDS,X2=+DGPTDTS D ^%DTC S DGPTELP=X I X<0 S DGPTERC=737 D ERR G:DGPTEDFL EXIT
CHECK ;
TSPEC ; CHECK TREATING SPECIALTY CODE
 N DGPTDSP1
 I DGPTDSP'?2AN S DGPTERC=706 D ERR G:DGPTEDFL EXIT G DISPTY
 S DGPTSP1=$E(DGPTDSP,1),DGPTSP2=$E(DGPTDSP,2),DGPTERC=0
 D CHECK^DGPTAE02 I DGPTERC S DGPTERC=706 D ERR G:DGPTEDFL EXIT G DISPTY
 ;-- Active treating specialty edit check
 I $E(DGPTDSP,1)=0!($E(DGPTDSP,1)=" ") S DGPTDSP=$E(DGPTDSP,2)
 ; DGPTDSP  := ptf code (alpha-numeric) value (file:42.4,field:7)
 ; DGPTDSP1 := dinum value (ien, file:42.4,field:.001)
 S DGPTDSP1=+$O(^DIC(42.4,"C",DGPTDSP,0))
 ;-- If not active treat spec, set flag to print error msg during
 ;-- PTF Close-out Error display at WRER^DGPTAEE
 I '$$ACTIVE^DGACT(42.4,DGPTDSP1,DGPTDDS) S DGPTERC=706,DGPTSER(DGPTDDS_701)=1 D ERR G:DGPTEDFL EXIT
 ;
DISPTY ;type of disposition
 I (DGPTDTY<1)!(DGPTDTY>7) S DGPTERC=707 D ERR G:DGPTEDFL EXIT G OPCAR
 S DGPTERC=0 D DISPTY^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
OPCAR ;outpatient care status
 I "13 "'[DGPTDOP S DGPTERC=708 D ERR G:DGPTEDFL EXIT G VA
 I DGPTDOP'=" " S DGPTERC=0 D OP^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
VA ;under va auspices
 I "12 "'[DGPTDVA S DGPTERC=709 D ERR G:DGPTEDFL EXIT
 ;
VAOP ;check for inconsistencies between outpatient care and va auspices
 I DGPTDVA=2,DGPTDOP=1 D  G:DGPTEDFL EXIT
 . S DGPTERC=708 D ERR
 . S DGPTERC=709 D ERR
CDR ;physical location cdr code
 I DGPTDLR'?6" "&(DGPTDLR'?." "6N) S DGPTERC=775 D ERR G:DGPTEDFL EXIT
POD ;place of disposition
 I "68EINOQSVW"[DGPTDPD S DGPTERC=710 D ERR G:DGPTEDFL EXIT G RECF
 S DGPTERC=0 D POD^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
RECF ;receiving facility number & suffix
 I DGPTDVA'=1!(DGPTDRF="      ") G ASIH
 I DGPTDRF[" " S DGPTDRF=$P(DGPTDRF," ",1)
 I DGPTDRF="" S DGPTERC=711 D ERR G:DGPTEDFL EXIT
ASIH ;extended care days - absent sick in hospital
 I DGPTDAS'="   ",DGPTDAS'?2E1N S DGPTERC=712 D ERR G:DGPTEDFL EXIT
 ;
LEAVE ;check leave days+pass days with total length of stay
 S DGPTERC=0 D LEAVE^DGPTAE02 D:DGPTERC ERR G:DGPTEDFL EXIT
SC ;percentage of service connected
 G:DGPTFMT=3 CP ;not set or checked after icd10 turned on. ft 10/30/14
 I DGPTDSC'="   "&(DGPTDSC'?3N) S DGPTERC=730 D ERR G:DGPTEDFL EXIT G CP
 S DGPTDSC=+DGPTDSC
CP ;compensation & pension status
 S DGPTERC=0 D CANDP^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
DIAG ;check diagnostic code
 S DGPTERC=0 D ^DGPT70DX I DGPTERC D ERR G:DGPTEDFL EXIT
DXLSPOA ;check dxls poa value ;new field & check with 884 ft 11/3/14
 I DGPTFMT=3 S DGPTERC=0 D DXLSPOA^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
OVER ; Pass FY92 edits for earlier data
 I DGPTDDS'>2911001 G ONED
LEG ; LEGIONNAIRE'S DISEASE
 ;S DGPTERC=0 D LEG^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT //no longer used because of DG*5.3*683 (7/1/06). ft 11/5/14
 ;DGPT70LG is still set with ICD9 & ICD10, so check for space. ft 10/30/14
 ;I DGPT70LG'=" " S DGPTERC=7__ D ERR G:DGPTEDFL EXIT
SUI ; Suicide indicator
 ;no longer used because of dg*5.3*683 (71/06). ft 11/5/14
 ;S DGPTERC=0 D SUI^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
 ;I DGPT70SU'=" " S DGPTERC=7__ D ERR G:DGPTEDFL EXIT
DRUG ;drug/substance abuse
 ;no longer used as of DG*5.3*683 (7/1/06). ft 11/5/14
 ;S DGPTERC=0 D DRUG^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
 ;I DGPT70DR'?4" " S DGPTERC=7__ D ERR G:DGPTEDFL EXIT
AXES ; Psych axises
 ;no longer used when ICD10 is turned on, but still in the record so check for spaces. ft 11/5/14
 I DGPTFMT=3 D  G ONED
 .I DGPT70X4'=" " S DGPTERC=734 D ERR
 .I DGPTDXV2'?4" " S DGPTERC=735 D ERR
 I '$P($G(^DIC(42.4,+$G(DGPTDSP1),0)),U,4) S (DGPT70X4,DGPT7X51,DGPT7X52)=" " G ONED ;don't think DGPT7X51/52 are ever used, just set & killed. ft 11/5/14
 S DGPTERC=0 D AXIV^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
 S DGPTERC=0 D AXV1^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
 S DGPTERC=0 D AXV2^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
ONED ;check if one diagnostic code only
 I (DGPTDDXO=" ")&('$D(^TMP("AEDIT",$J,"N702"))&'$D(^TMP("AEDIT",$J,"N703"))) S DGPTERC=718 D ERR G:DGPTEDFL EXIT
 I (DGPTDDXO="X")&($D(^TMP("AEDIT",$J,"N702"))) S DGPTERC=719 D ERR G:DGPTEDFL EXIT
RACE ;race
 I DGPTFMT=3 S DGPTERC=0 D RACE^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
TSC ;treated for service condition
 I DGPTFMT=3 S DGPTERC=0 D TSC^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
AO ;agent orange condition
 I DGPTFMT=3 S DGPTERC=0 D AO^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
IR ;ionizing radiation condition
 I DGPTFMT=3 S DGPTERC=0 D IR^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
SWA ;sw asia condition
 I DGPTFMT=3 S DGPTERC=0 D SWA^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
MST ;military sexual trauma
 I DGPTFMT=3 S DGPTERC=0 D MST^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
HNC ;head & neck care
 I DGPTFMT=3 S DGPTERC=0 D HNC^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
ETHNIC ;ethnicity
 I DGPTFMT=3 S DGPTERC=0 D ETHNIC^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
RACE16 ;race 1-6
 I DGPTFMT=3 D
 .F DGLOOP=1:1:6 S DGPTRACE16=@("DGPT70RACE"_DGLOOP)
 .Q:DGPTRACE16="  "  ;two spaces
 .S DGPTERC=0 D RACE16^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
 K DGLOOP,DGPTRACE16
CV ;combat vet
 I DGPTFMT=3 S DGPTERC=0 D CV^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
SHAD ;shad
 I DGPTFMT=3 S DGPTERC=0 D SHAD^DGPTAE02 I DGPTERC D ERR G:DGPTEDFL EXIT
EXIT ;
 Q
ERR ;
 D WRTERR^DGPTAE(DGPTERC,"N701",DGPTAL7)
 ;D WRTERR^DGPTAE(DGPTERC,"N701",SEQ)
 S ERROR=1
 Q