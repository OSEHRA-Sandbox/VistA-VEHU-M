GMRGPUT0 ;CISC/JH-TEXT GENERATOR DATA SORT FOR OUTPUT (cont.) ;2/28/89
 ;;3.0;Text Generator;;Jan 24, 1996
PRT1 ;
 S GMRGC=$O(GMRGUCCH(GMRGG,0)),GMRGPCL=GMRGPCL+1
 I '(GMRGPCL#(IOSL-3)) R !,"^ TO STOP: ",X:DTIME S:X="^"!(X="^^")!'$T GMRGOUT=$S(X="^":1,1:2) Q:GMRGOUT
 W !,$J(GMRGG,3),"   ",$S(GMRGC'>0:"",$D(^GMRD(124.25,GMRGC,0)):$P(^(0),"^"),1:"")
 Q
 ;
CHECLAS I GMRGB'?1N.N&(GMRGB'?1N.N1"-"1N.N) S GMRGBAD=1 Q
 S GMRGBEG=+GMRGB,GMRGEND=$S(GMRGB'["-":+GMRGB,1:+$P(GMRGB,"-",2)) I (GMRGBEG<1)!(GMRGBEG>GMRGUCCH)!(GMRGEND<1)!(GMRGEND>GMRGUCCH)!(GMRGEND<GMRGBEG) S GMRGBAD=1 Q
 F GMRGA=GMRGBEG:1:GMRGEND S ^TMP($J,"GMRGCPCH",GMRGA)=$O(GMRGUCCH(GMRGA,0))
 Q
PRT2 ;
 S GMRGC=$O(GMRGPCHC(GMRGA,0)),GMRGPCL=GMRGPCL+1
 I '(GMRGPCL#(IOSL-3)) R !,"^ TO STOP: ",X:DTIME S:X="^"!(X="^^")!'$T GMRGOUT=$S(X="^":1,1:2) Q:GMRGOUT
 S GMRGXPRT=$S(GMRGC'>0:"",$D(^GMRD(124.2,GMRGC,0)):$P(^(0),"^"),1:""),GMRGXPRT(0)=$S(GMRGC'>0:"",1:$O(^GMR(124.3,GMRGPDA,1,"B",GMRGC,0))),GMRGXPRT(0)=$S(GMRGXPRT(0)'>0:"",$D(^GMR(124.3,GMRGPDA,1,GMRGXPRT(0),0)):$P(^(0),"^",2),1:"")
 S GMRGXPRT(1)="6^"_IOM_"^1^0" W !,$J(GMRGA,3),".  " D EN1^GMRGRUT2
 Q
 ;
CHKREQ I GMRGB'?1N.N&(GMRGB'?1N.N1"-"1N.N) S GMRGBAD=1 Q
 S GMRGBEG=+GMRGB,GMRGEND=$S(GMRGB'["-":+GMRGB,1:+$P(GMRGB,"-",2)) I (GMRGBEG<1)!(GMRGBEG>GMRGG)!(GMRGEND<1)!(GMRGEND>GMRGG)!(GMRGEND<GMRGBEG) S GMRGBAD=1 Q
 F GMRGA=GMRGBEG:1:GMRGEND S ^TMP($J,"GMRGUPCH",GMRGA)=$O(GMRGPCHC(GMRGA,0))
 Q