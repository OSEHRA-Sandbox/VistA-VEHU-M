RTXB5 ; COMPILED XREF FOR FILE #195.9 ; 11/30/04
 ; 
 S DIKZK=1
 S DIKZ(0)=$G(^RTV(195.9,DA,0))
 S X=$P(DIKZ(0),U,1)
 I X'="" S ^RTV(195.9,"B",$E(X,1,30),DA)=""
 S X=$P(DIKZ(0),U,1)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(0)=X S X=Y(0),X=X S X=X[";SC(" I X S X=DIV S Y(1)=$S($D(^RTV(195.9,D0,0)):^(0),1:"") S X=$P(Y(1),U,2),X=X S DIU=X K Y S X=DIV S X=+X X ^DD(195.9,.01,1,2,1.4)
 S DIKZ(0)=$G(^RTV(195.9,DA,0))
 S X=$P(DIKZ(0),U,2)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^RTV(195.9,D0,0)):^(0),1:"") S X=$P(Y(1),U,8),X=X S DIU=X K Y X ^DD(195.9,2,1,1,1.1) X ^DD(195.9,2,1,1,1.4)
 S X=$P(DIKZ(0),U,2)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^RTV(195.9,D0,0)):^(0),1:"") S X=$P(Y(1),U,13),X=X S DIU=X K Y X ^DD(195.9,2,1,2,1.1) X ^DD(195.9,2,1,2,1.4)
 S X=$P(DIKZ(0),U,2)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^RTV(195.9,D0,0)):^(0),1:"") S X=$P(Y(1),U,9),X=X S DIU=X K Y X ^DD(195.9,2,1,3,1.1) X ^DD(195.9,2,1,3,1.4)
 S DIKZ(0)=$G(^RTV(195.9,DA,0))
 S X=$P(DIKZ(0),U,3)
 I X'="" S ^RTV(195.9,"ABOR",$P(^RTV(195.9,DA,0),U),X,DA)=""
 S X=$P(DIKZ(0),U,4)
 I X'="" S ^RTV(195.9,"AC",$E(X,1,30),DA)=""
 S X=$P(DIKZ(0),U,8)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^RTV(195.9,D0,0)):^(0),1:"") S X=$P(Y(1),U,7),X=X S DIU=X K Y X ^DD(195.9,8,1,1,1.1) X ^DD(195.9,8,1,1,1.4)
 S DIKZ(0)=$G(^RTV(195.9,DA,0))
 S X=$P(DIKZ(0),U,9)
 I X'="" D
 .N DIK,DIV,DIU,DIN
 .K DIV S DIV=X,D0=DA,DIV(0)=D0 S Y(1)=$S($D(^RTV(195.9,D0,0)):^(0),1:"") S X=$P(Y(1),U,7),X=X S DIU=X K Y X ^DD(195.9,9,1,1,1.1) X ^DD(195.9,9,1,1,1.4)
 S DIKZ(1)=$G(^RTV(195.9,DA,1))
 S X=$P(DIKZ(1),U,1)
 I X'="" S ^RTV(195.9,"AE",$E(X,1,30),DA)=""
 S DIKZ("ADM")=$G(^RTV(195.9,DA,"ADM"))
 S X=$P(DIKZ("ADM"),U,1)
 I X'="" S ^RTV(195.9,"AD",$E(X,1,30),DA)=""
END G ^RTXB6