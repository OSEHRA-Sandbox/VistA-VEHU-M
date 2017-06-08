ADXTAS ;523/RES ; ADD TO FILE 165 FROM SCDFILE  ;SEP 17, 1993
 ;;1.1;;
 ;
 ; MRS SCDFILE          ; ONCOLOGY CONTACT FILE
 ;SPID(1,7)             ;SAVED AS "CONVERSION ID" IN CONTACT FILE
 ;SLNM(8,22)            ;SAVED AS PART OF "CONTACT" FIELD
 ;SFNM(23,36)           ;SAVED AS PART OF "CONTACT" FIELD
 ;SMI(37)               ;SAVED AS PART OF "CONTACT" FIELD
 ;SST(38,59)            ;SAVED AS "STREET ADDRESS 1"
 ;SCTY(60,74)           ;SAVED AS "MRS CITY" IN CONTACT FILE
 ;SSTT(75,76)           ;SAVED AS "MRS STATE' IN CONTACT FILE
 ;SZP1(77,81)           ;SAVED AS "ZIP CODE" OR "MRS ZIP CODE"
 ;STEL(86,99)           ;SAVED AS "PHONE" FIELD
 ;SREL(100)             ;SAVED AS "TYPE" FIELD
 ;
 N X,ADXTX1,ADXTREC,CONTACT
 S U="^"
 F ADXTX1=-1:0 S ADXTX1=$O(^TMP("ADXT","SCD",ADXTX1)) Q:ADXTX1=""  S ADXTREC=^TMP("ADXT","SCD",ADXTX1) D CONTACT
 W !,ADXTX3," records were added to the Oncology Contact file."
 G EXIT
CONTACT ;
 S ADXTRN=ADXTX1,ADXTERR=0,ADXTLBL="SCD" D SCD^ADXTCHK I ADXTERR>0 D VERERR^ADXTCERR Q
 S TEXT=$E(ADXTREC,8,22) D CLEAN^ADXTAP4 S SLNM=TEXT
 S TEXT=$E(ADXTREC,23,36) D CLEAN^ADXTAP4 S SFNM=TEXT
 S SMI=$E(ADXTREC,37) I SMI=" "!(SMI?1P) S CONTACT=SLNM_","_SFNM
 E  S CONTACT=SLNM_","_SFNM_" "_SMI
 S TEXT=$E(ADXTREC,1,7) D CLEAN^ADXTAP4 S SPID=TEXT,ADXTID=SPID
 S TEXT=$E(ADXTREC,60,74) D CLEAN^ADXTAP4 S SCTY=TEXT,CITY=SCTY
 S SSTT=$E(ADXTREC,75,76)
 S SZP1=$E(ADXTREC,77,81) S ZIP="",X=SZP1 D ZIP^ADXTAS1 S MZP1=X
 S X=CONTACT D LOOKC Q
LOOKC ;
 K DIC S DIC="^ONCO(165,",DIC(0)="CMX" D ^DIC I Y'>0 D CONADD Q
 S ADXTDA=$P(Y,U,1),ADXTG=$G(^ONCO(165,ADXTDA,523000)),ADXTCST="M"
 I ADXTG=""&(ZIP'="") S MZP1="",MCTY="",MSTT="" D PID^ADXTADR S ADXTX3=ADXTX3-1 Q
 I ADXTG=""&(ZIP="") S MCTY=SCTY,MSTT=SSTT D PID^ADXTADR S ADXTX3=ADXTX3-1 Q
 I $P(ADXTG,U,1)=ADXTID Q  S MZP1="",MCTY="",MSTT="" D PID^ADXTADR S ADXTX3=ADXTX3-1 Q
 I $P(ADXTG,U,1)'=ADXTID S CONTACT=CONTACT_"*",X=CONTACT G LOOKC
 S %=$$XREFDUP^ADXTUT2(165,ADXTDA,ADXTID) Q
 S ADXTFNUM="165",ADXTLBL="SCD",ADXTRN=ADXTX1,X=CONTACT,Y=".01" D TRAP^ADXTAS1 Q
CONADD ;
 S ADXTFNUM="165",ADXTLBL="SCD",ADXTRN=ADXTX1,ADXTCST="N"
 S TEXT=$E(ADXTREC,38,59) D CLEAN^ADXTAP4 S SST=TEXT
 S STEL=$E(ADXTREC,87,89)_"-"_$E(ADXTREC,92,94)_"-"_$E(ADXTREC,96,99) S ADXTEL=STEL D TEL^ADXTAS1
 S SREL=$E(ADXTREC,100) D SREL^ADXTAS1
 ;
 S MADL=SST,MCTY=SCTY,MSTT=SSTT,MST="" D STUFF^ADXTADR
 S CON=ADXTDA D ^ADXTAS1 Q
EXIT ;
 K ADXTREC,ADXTX2,ADXTX3,ADXTDA,ADXTID,ADXTCST,ADXTEL,ADXTDA,ADXTDD,ADXTFLD,ADXTFNUM,ADXTG,ADXTRN,ADXTLBL,ADXTX1,CITY,CON,CONTACT,DATE,MADL,MCTY,MST,MSTT,MTEL,MZP1,PID,SLNM,SFNM,SMI,SPID,SST,SCTY,SREL,SSTT,SZP1,STEL,TEXT,X,Y,ZIP
 Q