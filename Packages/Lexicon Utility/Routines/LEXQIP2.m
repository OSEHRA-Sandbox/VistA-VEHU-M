LEXQIP2 ;ISL/KER - Query - ICD Procedure - Extract ;12/19/2014
 ;;2.0;LEXICON UTILITY;**62,80,86**;Sep 23, 1996;Build 1
 ;               
 ; Global Variables
 ;    None
 ;               
 ; External References
 ;    $$MOR^ICDEX         ICR   5747
 ;    MD^ICDEX            ICR   5747
 ;    $$DT^XLFDT          ICR  10103
 ;    $$UP^XLFSTR         ICR  10104
 ;               
 ; Documented Integration Agreements
 ;               
 ; Local Variables NEWed or KILLed in LEXQIP
 ;     LEXINT
 ;               
 Q
LX(X,LEXVDT,LEX,LEXLEN,LEXSTA) ; Lexicon Expression
 ; 
 ; LEX=# of Lines
 ; LEX(0)=External Date of Expression
 ; LEX(#)=Expression
 ; 
 N LEXEF,LEXEVDT,LEXLEX,LEXEE,LEXFA,LEXI,LEXIA,LEXIEN,LEXLEF,LEXLHS,LEXLST,LEXM,LEXN0
 N LEXPF,LEXSAB,LEXSIEN,LEXSO,LEXT,LEXVTMP S LEXIEN=$G(X) Q:+LEXIEN'>0
 S LEXVDT=+($G(LEXVDT)) S:LEXVDT'?7N LEXVDT=$$DT^XLFDT S LEXSTA=+($G(LEXSTA))
 S LEXEVDT=$$SD^LEXQM(LEXVDT),LEXLEN=+($G(LEXLEN)) S:+LEXLEN'>0 LEXLEN=62
 Q:'$L(LEXEVDT)  S LEXSO=$$CODEC^ICDEX(80.1,+LEXIEN)
 Q:'$L(LEXSO)  S LEXFA=$$FA(+LEXIEN),LEXM="",LEXIA=$$IA(LEXVDT) S LEXSIEN=0
 F  S LEXSIEN=$O(^LEX(757.02,"CODE",(LEXSO_" "),LEXSIEN)) Q:+LEXSIEN'>0  D
 . N LEXN0 S LEXN0=$G(^LEX(757.02,+LEXSIEN,0)),LEXSAB=$P(LEXN0,"^",3)
 . Q:"^2^31^"'[("^"_LEXSAB_"^")  S LEXPF=+($P(LEXN0,"^",5)) S LEXLEF=$O(^LEX(757.02,+LEXSIEN,4,"B",(LEXVDT+.99999)),-1)
 . I LEXLEF?7N D
 . . S LEXLHS=$O(^LEX(757.02,+LEXSIEN,4,"B",+LEXLEF," "),-1) I +LEXLHS>0 D
 . . . S LEXLST=$G(^LEX(757.02,+LEXSIEN,4,+LEXLHS,0)),LEXLST=$P(LEXLST,"^",2)
 . . . S:LEXLST>0 LEXVTMP(+LEXPF,LEXSIEN)=+LEXN0_"^"_LEXLEF
 S (LEXLEX,LEXEF)="",LEXSIEN=$O(LEXVTMP(1,0)),LEXLEX=+($G(LEXVTMP(1,+LEXSIEN))),LEXEF=$P($G(LEXVTMP(1,+LEXSIEN)),"^",2)
 S:+LEXSIEN'>0!(+LEXLEX'>0) LEXSIEN=$O(LEXVTMP(0,0)),LEXLEX=+($G(LEXVTMP(0,+LEXSIEN))),LEXEF=$P($G(LEXVTMP(0,+LEXSIEN)),"^",2)
 K LEX I +LEXLEX>0,$L($G(^LEX(757.01,+LEXLEX,0))),$L(LEXEF),LEXEF?7N  D  Q
 . K LEX N LEXT,LEXM,LEXI S LEXT(1)=$G(^LEX(757.01,+LEXLEX,0)) D PR^LEXQM(.LEXT,(LEXLEN-7))
 . S LEXI=0 F  S LEXI=$O(LEXT(LEXI)) Q:+LEXI'>0  S:$L($G(LEXT(LEXI))) LEX(+LEXI)=$G(LEXT(LEXI))
 . S LEX=+($O(LEX(" "),-1)) S LEXEE=$$SD^LEXQM(LEXEF) S LEX(0)=LEXEE
 Q
FA(X) ;   First Activation
 N LEXFA,LEXH,LEXI,LEXIEN,LEXSO,LEXSY
 S LEXIEN=+($G(X)) S X="",LEXSO=$$CODEC^ICDEX(80,+LEXIEN),LEXSY=$$CSI^ICDEX(80,+LEXIEN)
 K LEXH S X=$$HIST^ICDEX(LEXSO,.LEXH,LEXSY) S LEXFA="",LEXI=0
 F  S LEXI=$O(LEXH(LEXI)) Q:+LEXI'>0!($L(LEXFA))  S:+($G(LEXH(LEXI)))>0&(LEXI?7N) LEXFA=LEXI Q:$L(LEXFA)
 S X=LEXFA
 Q X
IA(X,Y) ;   Inaccurate
 N LEXBRD,LEXVDT,LEXIEN,LEXSYS S LEXVDT=+($G(X)),LEXIEN=+($G(Y)) Q:+LEXIEN'>0 0
 S LEXSYS=$$CSI^ICDEX(80,+LEXIEN) Q:+LEXSYS'>0 0  S:'$L(LEXVDT) LEXVDT=$$DT^XLFDT
 S:LEXVDT#10000=0 LEXVDT=LEXVDT+101 S:LEXVDT#100=0 LEXVDT=LEXVDT+1
 S LEXBRD=$$DTBR^ICDEX(LEXVDT,0,LEXSYS) S X=$S(LEXVDT<LEXBRD:1,1:0)
 Q X
MDCDRG(X,LEXCDT,LEX,LEXLEN) ; Major Diagnostic Category/DRG
 N LEXAI,LEXC,LEXDA,LEXDI,LEXEF,LEXFY,LEXI,LEXIEN,LEXL,LEXLC,LEXMDCC,LEXMDCS,LEXME,LEXMI,LEXN,LEXT
 N LEXT1,LEXT2,LEXUD,LEXUM,LEXVDT S LEXVDT=+($G(LEXCDT)) S:LEXVDT'?7N LEXVDT=$$DT^XLFDT K LEXUM,LEXUD,LEX
 S LEXLC=0,LEXIEN=+($G(X)),LEXCDT=$G(LEXCDT),LEXLEN=+($G(LEXLEN)) S:+LEXLEN'>0 LEXLEN=62 Q:LEXCDT'?7N
 D MD^ICDEX(80.1,+LEXIEN,$G(LEXCDT),.LEXMDCS,"IE")
 S LEXMDCC=0,LEXMI=0,(LEXEF,LEXFY)=$O(LEXMDCS(0)) Q:LEXFY'>0
 S LEXMI=0 F  S LEXMI=$O(LEXMDCS(LEXFY,"E",LEXMI)) Q:+LEXMI'>0  D
 . S LEXME=$G(LEXMDCS(LEXFY,"E",LEXMI)) Q:'$L(LEXME)
 . S LEXI=$O(LEX(" "),-1)+1,LEX(LEXI)=LEXME
 . S LEXDI=0 F  S LEXDI=$O(LEXMDCS(LEXFY,"E",LEXMI,LEXDI)) Q:+LEXDI'>0  D
 . . K LEXDA S LEXDA(1)=$G(LEXMDCS(LEXFY,"E",LEXMI,LEXDI))
 . . D PR^LEXQM(.LEXDA,(LEXLEN-14)) S LEXT1="    DRG "_LEXDI
 . . S LEXT1=LEXT1_$J(" ",(14-$L(LEXT1))),LEXT2=$J(" ",14)
 . . S (LEXC,LEXI)=0 F  S LEXI=$O(LEXDA(LEXI)) Q:+LEXI'>0  D
 . . . N LEXT,LEXL,LEXN,LEXAI S LEXT=$$TM^LEXQM($G(LEXDA(LEXI)))
 . . . Q:'$L(LEXT)  S LEXC=LEXC+1 S:LEXC=1 LEXL=LEXT1_LEXT S:LEXC>1 LEXL=LEXT2_LEXT
 . . . S LEXAI=$O(LEX(" "),-1)+1,LEX(LEXAI)=LEXL
 S:LEXEF?7N&($L(LEX(1))) LEX(0)=$$SD^LEXQM(LEXEF) S LEX=+($O(LEX(" "),-1))
 Q
MAJ(X,LEX) ; Major O.R. Procedures
 N LEXC,LEXCHR,LEXHDR,LEXI,LEXI1,LEXI2,LEXIDI,LEXIEN,LEXPC,LEXSTR,LEXT S LEXIEN=+($G(X)) Q:+LEXIEN'>0
 S LEXSTR=$$MOR^ICDEX(+LEXIEN) Q:'$L(LEXSTR)  D OR(LEXSTR,.LEX)
 Q
OR(X,LEX) ; O.R. Procedures
 K LEX N LEXC,LEXCHR,LEXHDR,LEXI,LEXI1,LEXI2,LEXIDI,LEXPC,LEXSTR,LEXT S LEXSTR=$G(X) Q:'$L(LEXSTR)
 S LEXHDR="Major O.R. ID",LEXPC=0,LEXCHR="" F LEXC=1:1  Q:'$L($E(LEXSTR,LEXC))  D
 . S LEXCHR=$E(LEXSTR,LEXC) Q:LEXCHR=""  F LEXI=1:1 S LEXIDI=$T(MID+LEXI),LEXIDI=$P(LEXIDI,";;",2) Q:LEXIDI="EXIT"  D
 . . S LEXI1=$$TM^LEXQM($P(LEXIDI,"=")),LEXI2=$$TM^LEXQM($P(LEXIDI,"=",2)) Q:$L(LEXI1)'=1  Q:LEXI1'=LEXCHR  Q:'$L(LEXI2)
 . . S LEXT=LEXI2 S:$D(LEXINT) LEXT=LEXT_$J(" ",(22-$L(LEXT)))_"("_LEXI1_")" S LEXPC=LEXPC+1,LEX(1,LEXPC)=$$UP^XLFSTR(LEXT)
 S:+($O(LEX(1," "),-1))>0 LEX(0)=$$UP^XLFSTR(LEXHDR),LEX(1)=$$UP^XLFSTR(LEXSTR),LEX=+($O(LEX(1," "),-1))
 Q
MID ; Major O.R. Procedures Text
 ;;1=Bowel
 ;;2=Chest
 ;;3=Lymphoma/Leukemia
 ;;4=Joint
 ;;5=Pancreas/Liver
 ;;6=Pelvic
 ;;7=Shoulder/Elbow
 ;;8=Thumb/Joint
 ;;9=Head/Neck
 ;;A=Cardio
 ;;M=Musculoskeletal
 ;;EXIT
 Q