ECX3P8P2 ;ALB/JAP - National Service update ;July 14, 1998
 ;;3.0;DSS EXTRACTS;**8**;Dec 22, 1997
 ;
ADD730 ;** Add entries to file #730
 ;ECXX is in format: IEN;NAME^^^DSS CODE^COST CENTER^SYNONYM
 N ECX,ECXX,ECXDA,ECXDX,IEN,DIC,DA,DIE,DR,DIK,X,Y,DIR,DIRUT,JJ,SS,DUOUT,A1,A4,A5,A6
 D MES^XPDUTL(" ")
 D MES^XPDUTL(" ")
 D MES^XPDUTL(" Adding entries to NATIONAL SERVICE File (#730)...")
 D MES^XPDUTL(" ")
 F ECX=1:1 S ECXX=$P($T(NEW730+ECX),";;",2) Q:ECXX="QUIT"  D
 .S ECXDA=$P(ECXX,";",1),ECXX=$P(ECXX,";",2)
 .S A4=$P(ECXX,"^",4)
 .;prefer new entry be made at specified ien
 .I '$D(^ECC(730,ECXDA)) D  Q
 ..S A1=$P(ECXX,"^",1),A4=$P(ECXX,"^",4),A5=$P(ECXX,"^",5),A6=$P(ECXX,"^",6)
 ..S X=A1,DINUM=ECXDA,DIC="^ECC(730,",DLAYGO=730,DIC(0)="LX",DIC("DR")="3///^S X=A4;4///^S X=A5;5///^S X=A6"
 ..K DD,DO D FILE^DICN K DLAYGO
 ..I Y D MESS
 .;if specified ien is already in use and the new record hasn't been added yet 
 .;then add at next available record number below 100
 .I $D(^ECC(730,ECXDA)),'$D(^ECC(730,"C",A4)) D  Q
 ..S ECXDX=0
 ..F IEN=ECXDA+1:1:100 I '$D(^ECC(730,IEN)) S ECXDX=IEN Q
 ..;then try for record number below 1000
 ..I ECXDX=0 F IEN=101:1:999 I '$D(^ECC(730,IEN)) S ECXDX=IEN Q
 ..I ECXDX=0 D  Q
 ...D MES^XPDUTL(" ")
 ...D MES^XPDUTL(" Problem in NATIONAL SERVICE File (#730)...")
 ...D MES^XPDUTL("   ...can't add entry for "_$P(ECXX,"^",1)_".")
 ...D MES^XPDUTL(" ")
 ..S A1=$P(ECXX,"^",1),A4=$P(ECXX,"^",4),A5=$P(ECXX,"^",5),A6=$P(ECXX,"^",6)
 ..S X=A1,DINUM=ECXDX,DIC="^ECC(730,",DLAYGO=730,DIC(0)="LX",DIC("DR")="3///^S X=A4;4///^S X=A5;5///^S X=A6"
 ..K DD,DO D FILE^DICN K DLAYGO
 ..I Y S ECXDA=+Y D MESS
 Q
 ;
MESS ;** Add message
 N ECXADMSG
 S ECXADMSG=" "_$P(ECXX,U,1)_" ("_$P(ECXX,U,4)_")"
 D MES^XPDUTL(ECXADMSG)
 S ECXADMSG="     added as record #"_ECXDA_"."
 D MES^XPDUTL(ECXADMSG)
 D MES^XPDUTL(" ")
 Q
 ;
MOD730 ;modify entries in file #730
 ;ECXX is in format: IEN;NAME^^^DSS CODE^COST CENTER^SYNONYM
 N ECX,ECXX,ECXF,A1,A4,A5,A6,DA,DIK
 D MES^XPDUTL(" ")
 D MES^XPDUTL(" ")
 D MES^XPDUTL(" Modifying entries in NATIONAL SERVICE File (#730)...")
 D MES^XPDUTL(" ")
 F ECX=1:1 S ECXX=$P($T(UPDATE+ECX),";;",2) Q:ECXX="QUIT"  D
 .S ECXDA=$P(ECXX,";",1),ECXX=$P(ECXX,";",2)
 .;if specified ien exists then update record  
 .I $D(^ECC(730,ECXDA)) D  Q
 ..S A1=$P(ECXX,U,1),A4=$P(ECXX,U,4),A5=$P(ECXX,U,5),A6=$P(ECXX,U,6)
 ..S ECXDAX=ECXDA_","
 ..S ECXF(730,ECXDAX,.01)=A1,ECXF(730,ECXDAX,3)=A4,ECXF(730,ECXDAX,4)=A5,ECXF(730,ECXDAX,5)=A6
 ..K ^TMP("DIERR",$J)
 ..D FILE^DIE("","ECXF")
 ..I '$D(^TMP("DIERR",$J)) D MESSM
 .I '$D(^ECC(730,ECXDA)) D  Q
 ..D MES^XPDUTL(" ")
 ..D MES^XPDUTL(" Missing record #"_ECXDA_" in NATIONAL SERVICE File (#730).")
 ..S A1=$P(ECXX,U,1),A4=$P(ECXX,U,4),A5=$P(ECXX,U,5),A6=$P(ECXX,U,6)
 ..S X=A1,DINUM=ECXDA,DIC="^ECC(730,",DLAYGO=730,DIC(0)="LX",DIC("DR")="3///^S X=A4;4///^S X=A5;5///^S X=A6"
 ..K DD,DO D FILE^DICN K DLAYGO
 ..I Y S ECXDA=+Y D MESS
 Q
 ;
MESSM ;** Modify message
 N ECXADMSG
 S ECXADMSG=" "_A1_" ("_A4_")"
 D MES^XPDUTL(ECXADMSG)
 S ECXADMSG="     record #"_ECXDA_" modified."
 D MES^XPDUTL(ECXADMSG)
 D MES^XPDUTL(" ")
 Q
UPDATE ;update records in file #730
 ;;2;AMBULATORY CARE^^^A^204^
 ;;3;ANESTHESIA^^^G^212^
 ;;4;AUDIOLOGY & SPEECH PATHOLOGY^^^E^228^A&SP
 ;;5;BLIND REHABILITATION^^^B^245^
 ;;8;CHAPLAIN^^^1^244^
 ;;10;DENTAL^^^T^248^
 ;;11;DERMATOLOGY^^^K^236^
 ;;12;NUTRITION AND FOOD SERVICE^^^F^243^DIETETICS
 ;;14;DOMICILIARY^^^4^205^
 ;;20;PATHOLOGY & LABORATORY MEDICINE^^^L^223^LABORATORY
 ;;22;HEALTH ADMINISTRATION^^^2^285^MAS
 ;;24;MEDICINE^^^M^201^
 ;;25;NEUROLOGY^^^N^235^
 ;;26;NUCLEAR MEDICINE^^^H^229^
 ;;27;NURSING^^^U^241^
 ;;30;PHARMACY^^^D^224^
 ;;31;PROSTHETICS^^^Q^272^ORTHOTICS
 ;;32;PSYCHIATRY^^^P^203^PSI
 ;;33;PSYCHOLOGY^^^O^227^
 ;;34;RADIATION THERAPY^^^Z^237^
 ;;35;RADIOLOGY^^^X^222^
 ;;36;RECREATION^^^J^246^
 ;;39;PHYSICAL MEDICINE & REHABILITATION^^^R^242^REHAB MEDICINE
 ;;42;SOCIAL WORK^^^W^221^
 ;;43;SPINAL CORD INJURY^^^C^233^SCI
 ;;44;SURGERY^^^S^202^
 ;;47;GERIATRICS & EXTENDED CARE^^^3^234^GRECC
 ;;QUIT
 ;
NEW730 ;new records for file #730
 ;;48;DIALYSIS^^^I^211
 ;;49;OPTOMETRY/OPHTHALMOLOGY^^^V^232
 ;;50;PODIATRY^^^Y^231
 ;;QUIT