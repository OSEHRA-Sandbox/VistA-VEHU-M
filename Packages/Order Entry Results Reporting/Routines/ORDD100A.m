ORDD100A ;SLC/DCM - DD ENTRIES FOR FILE 100 ;11/03/2014  13:28
 ;;3.0;ORDER ENTRY/RESULTS REPORTING;**24,138,157,350**;Dec 17, 1997;Build 77
ACT1(ORIFN,ORDA,ORADT,ORVP,ORDG) ; -- set "ACT" x-ref
 Q:'$G(ORIFN)  Q:'$G(ORDA)  N OR0
 S OR0=$G(^OR(100,ORIFN,0)) S:'$G(ORADT) ORADT=$P($G(^(8,ORDA,0)),U)
 S:'$G(ORVP) ORVP=$P(OR0,U,2) S:'$G(ORDG) ORDG=$P(OR0,U,11)
 I ORVP,ORADT,ORDG S ^OR(100,"ACT",ORVP,9999999-ORADT,ORDG,ORIFN,ORDA)=""
 Q
 ;
ACT2(ORIFN,ORDA,ORADT,ORVP,ORDG) ; -- kill "ACT" x-ref
 Q:'$G(ORIFN)  Q:'$G(ORDA)  N OR0
 S OR0=$G(^OR(100,ORIFN,0)) S:'$G(ORADT) ORADT=$P($G(^(8,ORDA,0)),U)
 S:'$G(ORVP) ORVP=$P(OR0,U,2) S:'$G(ORDG) ORDG=$P(OR0,U,11)
 I ORVP,ORADT,ORDG K ^OR(100,"ACT",ORVP,9999999-ORADT,ORDG,ORIFN,ORDA)
 Q
 ;
ES ; -- set "AE" x-ref
 N DAES,OI,ORO,ORSTOP,X,X1
 S ORO=$G(^OR(100,DA,0))
 S ORSTOP=+$P(ORO,U,9) ;138
 I ORSTOP,ORSTOP'<DT S ^OR(100,"AE",ORSTOP,DA)="" ;138
 ;If there is no start date try to get the release date.
 S X(3)=$P(ORO,U,8)
 I X(3)="" S X(3)=$$RDATE^ORPXRM(DA)
 I X(3)="" Q
 S DAES(1)=DA,X(1)=$P(ORO,U,2),X(4)=ORSTOP
 S X1(1)=X(1),X1(3)=X(3),X1(4)=""
 S OI=0 F  S OI=$O(^OR(100,DA,.1,OI)) Q:OI'>0  D
 . S (X(2),X1(2))=+$G(^(OI,0)),DAES=OI
 .;If there is an entry without a stop date kill it before creating
 .;the new one.
 . D KOR^ORPXRM(.X1,.DAES)
 . D SOR^ORPXRM(.X,.DAES)
 Q
EK ; -- kill "AE" x-ref
 N ORX
 S ORX=$G(X)
 N DAEK,OI,ORSTOP,X
 S ORO=$G(^OR(100,DA,0))
 S ORSTOP=$P(ORO,U,9)
 I ORSTOP K ^OR(100,"AE",ORSTOP,DA)
 I ORX K ^OR(100,"AE",ORX,DA)
 ;If there is no start date try to get the release date.
 S X(3)=$P(ORO,U,8)
 I X(3)="" S X(3)=$$RDATE^ORPXRM(DA)
 I X(3)="" Q
 S DAEK(1)=DA,X(1)=$P(ORO,U,2),X(4)=ORSTOP
 S OI=0 F  S OI=$O(^OR(100,DA,.1,OI)) Q:OI'>0  D
 . S X(2)=+$G(^(OI,0)),DAEK=OI
 . D KOR^ORPXRM(.X,.DAEK)
 Q
 ;
OI1(ORIFN) ; -- set "AOI" x-ref
 N DA,OI,OR0,ORVP,ORSTRT,ORSTOP,ORIT,X,X1
 Q:'$D(^OR(100,ORIFN,.1))  S OR0=$G(^(0))
 S ORVP=$P(OR0,U,2) Q:'ORVP
 S ORSTRT=$P(OR0,U,8) Q:'ORSTRT
 S ORSTOP=$P(OR0,U,9)
 S DA(1)=ORIFN
 S (X(1),X1(1))=ORVP
 S X(3)=ORSTRT,X1(3)=$$RDATE^ORPXRM(ORIFN)
 S (X(4),X1(4))=ORSTOP
 S OI=0 F  S OI=$O(^OR(100,ORIFN,.1,OI)) Q:OI'>0  D
 . S ORIT=+$G(^(OI,0)) S:ORIT ^OR(100,"AOI",ORIT,ORVP,9999999-ORSTRT,ORIFN)=""
 . S (X(2),X1(2))=ORIT,DA=OI
 . D KOR^ORPXRM(.X1,.DA)
 . D SOR^ORPXRM(.X,.DA)
 Q
 ;
OI2(ORIFN) ; -- kill "AOI" x-ref
 N DA,OI,OR0,ORVP,ORSTRT,ORSTOP,ORIT,X
 Q:'$D(^OR(100,ORIFN,.1))  S OR0=$G(^(0))
 S ORVP=$P(OR0,U,2) Q:'ORVP
 S ORSTRT=$P(OR0,U,8) Q:'ORSTRT
 S ORSTOP=$P(OR0,U,9)
 S DA(1)=ORIFN,X(1)=ORVP,X(3)=ORSTRT,X(4)=ORSTOP
 S OI=0 F  S OI=$O(^OR(100,ORIFN,.1,OI)) Q:OI'>0  D
 . S ORIT=+$G(^(OI,0)) K:ORIT ^OR(100,"AOI",ORIT,ORVP,9999999-ORSTRT,ORIFN)
 . S X(2)=ORIT,DA=OI
 . D KOR^ORPXRM(.X,.DA)
 Q