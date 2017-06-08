MBAAMRP1 ;OIT-PD/CKU - APPOINTMENT RPC;08/27/2014
 ;;1.0;Scheduling Calendar View;;Aug 27, 2014;Build 52
 ;Associated ICRs
 ;  ICR#
 ;  6063 MBAA RPC REGISTRATION
 ;
 Q
 ;code below is not being used in the initial release of MBAA. It will be released at a later date in a future release of MBAA
 ;GETCLN(RV,CLINIC) ; SD GET CLINIC DETAILS
 ; N STATUS,RESULT S STATUS=$$GETCLN^MBAAMAP1(.RESULT,CLINIC)
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; I 'STATUS S RV=-1
 ; Q
 ;LSTCLNS(RV,SEARCH,START,NUMBER) ; SD GET CLINICS BY NAME
 ; N STATUS,RESULT S STATUS=$$LSTCLNS^MBAAMAP1(.RESULT,SEARCH,.START,NUMBER)
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; I 'STATUS S RV=-1
 ; Q
 ;FRSTAVBL(RV,SC) ; SD GET FIRST AVAILABLE APPT
 ; N STATUS,RESULT S STATUS=$$FRSTAVBL^MBAAMAP1(.RESULT,SC)
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; I 'STATUS S RV=-1
 ; Q
 ;CLNCK(RV,CLN) ; SD VALID CLINIC STOP CODE 
 ; N STATUS,RESULT S STATUS=$$CLNCK^MBAAMAP1(.RESULT,CLN)
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; Q
CLNRGHT(RV,CLN) ; MBAA RPC: MBAA VERIFY CLINIC ACCESS
 N STATUS,RESULT S STATUS=$$CLNRGHT^MBAAMAP1(.RESULT,CLN)
 ;D MERGE^MBAAMRPC(.RV,.RESULT)
 S RV(0)=0
 I $G(STATUS)=1 S RV(0)=1
 Q
 ;code below is not being used in the initial release of MBAA. It will be released at a later date in a future release of MBAA
 ;CLNVSC(RV,SC) ; SD VALID STOP CODE
 ; N STATUS,RESULT S STATUS=$$CLNVSC^MBAAMAP1(.RESULT,SC)
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; Q
SLOTS(RV,SC) ; MBAA RPC: MBAA GET CLINIC AVAILABILITY
 N STATUS,RESULT S STATUS=$$SLOTS^MBAAMAP1(.RESULT,SC)
 I 'STATUS S RV=-1
 D MERGE^MBAAMRPC(.RV,.RESULT)
 ;code below is not being used in the initial release of MBAA. It will be released at a later date in a future release of MBAA
 ;GETPEND(RV,PAT,DT) ; SD GET PATIENT PENDING APPTS
 ; N STATUS,RESULT S STATUS=$$GETPEND^MBAAMAP1(.RESULT,PAT,DT)
 ; I 'STATUS S RV=-1
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; Q
 ;GETAPTS(RV,DFN,SD) ; SD GET PATIENT APPOINTMENTS
 ; N STATUS,RESULT S STATUS=$$GETAPTS^MBAAMAP1(.RESULT,DFN,.SD)
 ; I 'STATUS S RV=-1
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; Q
 ;HASPEND(RV,PAT,DT) ; SD HAS PATIENT PENDING APPTS
 ; N STATUS,RESULT S STATUS=$$HASPEND^MBAAMAP1(.RESULT,PAT,DT)
 ; I 'STATUS S RV=-1
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; Q
LSTCRSNS(RV,SEARCH,START,NUMBER) ;  MBAA RPC: MBAA LIST CANCELLATION REASONS
 N STATUS,RESULT S STATUS=$$LSTCRSNS^MBAAMAP1(.RESULT,SEARCH,START,NUMBER)
 I 'STATUS S RV=-1
 D MERGE^MBAAMRPC(.RV,.RESULT)
 Q
 ;code below is not being used in the initial release of MBAA. It will be released at a later date in a future release of MBAA
 ;LISTEWL(RV,DFN,STATUS,BEGIN,END) ; SD EWL LIST
 ; N STATUS,RESULT S STATUS=$$LIST^MBAAWLAP(.RESULT,DFN,STATUS,BEGIN,END)
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; Q
 ;DETALEWL(RV,IEN) ; SD EWL DETAIL
 ; N STATUS,RESULT S STATUS=$$DETAIL^MBAAWLAP(.RESULT,IEN)
 ; I 'STATUS S RV=-1
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; Q
NEWEWL(RV,SDWLD) ; MBAA RPC: MBAA EWL NEW
 N STATUS,RESULT S STATUS=$$NEW^MBAAWLAP(.RESULT,SDWLD)
 I 'STATUS S RV=-1
 D MERGE^MBAAMRPC(.RV,.RESULT)
 Q
 ;code below is not being used in the initial release of MBAA. It will be released at a later date in a future release of MBAA
 ;UPDTEWL(RV,SDWLIEN,SDWLD) ; SD EWL UPDATE
 ; N STATUS,RESULT S STATUS=$$UPDATE^MBAAWLAP(.RESULT,SDWLIEN,.SDWLD)
 ; I 'STATUS S RV=-1
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; Q
 ;DISPEWL(RV,SDWLDFN,SDWLIEN,SDWLDISP,SDWLAPPT) ; SD EWL DISPOSITION
 ; N STATUS,RESULT S STATUS=$$DISP^MBAAWLAP(.RESULT,SDWLDFN,SDWLIEN,SDWLDISP,.SDWLAPPT)
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; Q
 ;DELEWL(RV,SDWLIEN) ; SD EWL DELETE 
 ; N STATUS,RESULT S STATUS=$$DELETE^MBAAWLAP(.RESULT,SDWLIEN)
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; Q
 ;ISEWL(RV,DFN) ; SD EWL IS PATIENT ON LIST
 ; N STATUS,RESULT S STATUS=$$HASENTRY^MBAAWLAP(.RESULT,DFN)
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; Q
 ;LSTSRT(RV) ; SD GET REQUEST TYPES
 ; N STATUS,RESULT S STATUS=$$LSTSRT^MBAAMAP1(.RESULT)
 ; I 'STATUS S RV=-1
 ; D MERGE^MBAAMRPC(.RV,.RESULT)
 ; Q