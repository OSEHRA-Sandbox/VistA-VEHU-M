PSZMEDR ;FIND BAD MED ROUTES
 S DFN=0 F  S DFN=$O(^PS(55,DFN)) Q:'DFN  S A=0 F  S A=$O(^PS(55,DFN,5,A)) Q:'A  S ORD=^(A,0) I $P(ORD,"^",3)]"" W !,DFN
 Q