RTXQ1 ; COMPILED XREF FOR FILE #190.1 ; 11/30/04
 ; 
 S DIKZK=2
 S DIKZ(0)=$G(^RTV(190.1,DA,0))
 S X=$P(DIKZ(0),U,2)
 I X'="" K ^RTV(190.1,"AD",$E(X,1,30),DA)
 S X=$P(DIKZ(0),U,4)
 I X'="" K ^RTV(190.1,"C",$E(X,1,30),DA)
 S X=$P(DIKZ(0),U,4)
 I X'="" K ^RTV(190.1,"AC",+^RTV(190.1,DA,0),$P(X,"."),DA)
 S X=$P(DIKZ(0),U,5)
 I X'="" K ^RTV(190.1,"ABOR",$E(X,1,30),DA)
 S X=$P(DIKZ(0),U,10)
 I X'="" K ^RTV(190.1,"AP",$E(X,1,30),DA)
 S X=$P(DIKZ(0),U,10)
 I X'="" K ^RTV(190.1,"AP1",X,+^RTV(190.1,DA,0),DA)
 S X=$P(DIKZ(0),U,11)
 I X'="" K ^RTV(190.1,"APAR",$E(X,1,30),DA)
 S X=$P(DIKZ(0),U,1)
 I X'="" K ^RTV(190.1,"B",$E(X,1,30),DA)
END Q