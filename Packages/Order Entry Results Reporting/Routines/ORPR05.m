ORPR05 ; slc/dcm - When you are in the Service copies... ; 07 Dec 99  01:43PM
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**69**;Dec 17, 1997
SRV1 ;
 N ORTCNT,ORX,OR3,ORPK,ORTCNT,ORPKG,ORSNUM
 D GET^ORPR01(ORIFN)
 S ORPKG=$P(ORX,"^",14) I $D(OROPKG),(OROPKG'=ORPKG) S ORSNUM=1 D FOOT^ORPR01(ORFOOT) W @ORIOF
 D SRVSET
 I +ORFMT'>0,'+$G(OREND) W:$E(IOST)="C" $C(7),!!,"SERVICE COPY FORMAT is NOT defined for "_ORPKNM_".",!! H 1 Q
 Q:+$P(OR3,"^",9)>0
 D CPRINT^ORPR01(ORIFN)
 Q
SCSORT ; Sorts selected orders by package
 N ORPKG,ORI,ORJ,ORIFN,ORSORT
 F ORI=1:1:$L(ORNMBR,",") S ORJ=$P(ORNMBR,",",ORI) I ORJ S ORIFN=$G(^XTMP(ORXTMP,ORJ))  I ORIFN]"" D
 . S ORPKG=$P($G(^OR(100,+ORIFN,0)),U,14),ORSORT(ORPKG,ORJ)=""
 I $O(ORSORT(0)) D
 . S ORPKG=0,ORNMBR="" F  S ORPKG=$O(ORSORT(ORPKG)) Q:ORPKG'>0  D
 .. S ORI=0 F  S ORI=$O(ORSORT(ORPKG,ORI)) Q:ORI'>0  D
 ... S ORNMBR=ORNMBR_ORI_","
 Q
SRVSET ;Setup
 ;Input=PACKAGE
 ;Output=ORHEAD,ORFOOT
 I $S('$G(ORPKG):1,ORPKG=$G(OROPKG):1,1:0) Q
 S (OROFMT,ORFMT)=$$GET^XPAR("SYS","ORPF SERVICE COPY FORMAT",ORPKG,"I")
 S ORHEAD=$$GET^XPAR("SYS","ORPF SERVICE COPY HEADER",ORPKG,"I")
 S ORFOOT=$$GET^XPAR("SYS","ORPF SERVICE COPY FOOTER",ORPKG,"I")
 S ORPKNM=$P($G(^DIC(9.4,+ORPKG,0)),U),ORIOSL=IOSL
 I +ORFOOT,$D(^ORD(100.23,ORFOOT,0)) S ORBOT=$P(^(0),"^",2),ORIOSL=IOSL-ORBOT,OROPKG=ORPKG
 S ORIOF=IOF I +ORHEAD D PRINT^ORPR00(ORHEAD,1)
 S IOF="!" I +OROFMT S ORFMT=OROFMT
 Q
SRVCLN ;Cleanup
 G:+$G(OREND) SCCLEANX
 I $G(ORFOOT) S:IOF?1"!"."!" $P(IOF,"!",$S(ORIOSL>200:200,ORIOSL-$Y>1:ORIOSL-$Y,1:2))="" D PRINT^ORPR00(ORFOOT,1)
SCCLEANX S:$D(ORIOF) IOF=ORIOF K ORHEAD,ORFOOT,OROFMT,ORFMT,ORIOF,ORBOT,ORIOSL,ORPKG
 K OROPKG,ORPKNM,ORPKNO
 Q