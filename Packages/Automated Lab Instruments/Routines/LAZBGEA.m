LAZBGEA ;SLC/RWF-PTLD/JIT IL BGE BLOOD GAS INSTRUMENT ; 12-4-92  
 ;;V~5.1V~
 ; JOHN THOMAS, PORTLAND VAMC, 8-424-7430
 ;CROSS LINK BY ID OR IDE
LA1 S LANM=$T(+0),TSK=$N(^LAB(62.4,"C",LANM,0)) Q:TSK<1
 Q:'$D(^LA(TSK,"I",0))
 K LATOP D ^LASET Q:'TSK
 S X="TRAP"_LANM,@^%ZOSF("TRAP")
LA2 S TOUT=0 D IN G QUIT:TOUT,LA2:$P(IN,",")'="05" ; 5=RESULTS MESSAGE
LA2A K TV,TEST ; S ID=+$P(IN,",",2) ; INSTRUMENT SEQUENCE #
 S IDE=$P(IN,",",4),IDE=+IDE,TRAY=1,CUP=IDE ; ACCESSION #
 S (ID,IDX)=+$P(IN,",",5) ; PATIENT ID
 S LOOP=+$P(IN,",",12) ; # TEST RESULTS IN MESSAGE
LA2B F I=1:1:LOOP S V=$P(IN,",",9+(I*4),12+(I*4)) I V]"" S CODE=+$P(V,","),V=$P(V,",",3) D NUM S TEST(CODE)=V
 S TOUT=0 D IN G LA2C:TOUT I $P(IN,",")="05",$P(IN,",",5)=IDX G LA2B ; CHECK FOR ADDITIONAL TESTS ON SAME PATIENT
LA2C F I=0:0 S I=$O(TC(I)) Q:I<1  S II=0 F III=0:0 S II=$O(TEST(II)) Q:II<1  I II=TC(I,4) S @TC(I,1)=TEST(II)
LA3 X LAGEN G LA2:'ISQN ;Can be changed by the cross-link code
 S Z=TSK_">" F I=0:0 S I=$O(TV(I)) Q:I<1  S:TV(I,1)]"" ^LAH(LWL,1,ISQN,I)=TV(I,1),Z=Z_TV(I,1)_" "
 D WRITE G LA2
NUM S X="" F JJ=1:1:$L(V) S:$A(V,JJ)>32 X=X_$E(V,JJ)
 S V=X Q
IN S CNT=^LA(TSK,"I",0)+1 IF '$D(^(CNT)) S TOUT=TOUT+1 Q:TOUT>9  H 5 G IN
 S ^(0)=CNT,IN=^(CNT),TOUT=0 I ECHOALL S Z=IN D WRITE
 Q
WRITE I IO]"" O IO::1 IF $T U IO W:'ECHOALL *7 W !,Z C IO
 Q
QUIT LOCK ^LA(TSK) H 1 K ^LA(TSK),^LA("LOCK",TSK) I $D(ZTSK) K ^%ZTSK(ZTSK)
 Q
TRAP ; ERROR TRAP
 D ^LABERR S T=TSK D SET^LAB G @("LA2^"_LANM)