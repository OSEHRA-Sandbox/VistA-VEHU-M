ENXYIPR ;WCIOFO/SAB-Pre Init to correct EIL descriptions ;8/5/97
 ;;7.0;ENGINEERING;**44**;Aug 17,1993
EN ; entry point - correct spelling of several descriptions
 N ENDA,ENFDA
 S ENDA=$$FIND1^DIC(6914.9,"","X","CHAPLIAN","D")
 I ENDA S ENFDA(6914.9,ENDA_",",1)="CHAPLAIN"
 S ENDA=$$FIND1^DIC(6914.9,"","X","CLINICAL PSYCOLOGY","D")
 I ENDA S ENFDA(6914.9,ENDA_",",1)="CLINICAL PSYCHOLOGY"
 S ENDA=$$FIND1^DIC(6914.9,"","X","PSYCHIATRY/NEURLOLGY","D")
 I ENDA S ENFDA(6914.9,ENDA_",",1)="PSYCHIATRY/NEUROLOGY"
 I $D(ENFDA) D FILE^DIE("E","ENFDA") D MSG^DIALOG()
 Q
 ;ENXYIPR