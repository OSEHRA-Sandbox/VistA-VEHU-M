ORY397 ;ISP/RFR - TEMP CODE FOR PATCH OR*3.0*397 ;Aug 29, 2019@12:18
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**397**;Dec 17, 1997;Build 22
 Q
SENDDLG(ANAME) ; Return true if the current order dialog should be sent
 I ANAME="GMRCOR CONSULT" Q 1
 I ANAME="GMRCOR REQUEST" Q 1
 Q 0
