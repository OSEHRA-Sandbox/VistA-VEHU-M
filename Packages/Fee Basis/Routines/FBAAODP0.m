FBAAODP0 ;AISC/GRR - DELETE PAYMENT ;6/5/2009
 ;;3.5;FEE BASIS;**108**;JAN 30, 1995;Build 115
 ;;Per VHA Directive 2004-038, this routine should not be modified.
 D DT^DICRW
BT S DIC="^FBAA(161.7,",DIC("S")=$S($D(^XUSEC("FBAASUPERVISOR",DUZ)):"I $G(^(""ST""))=""O"",$P(^(0),U,3)=""B3""",1:"I $P(^(0),U,5)=DUZ,$P(^(0),U,3)=""B3"",$G(^(""ST""))=""O""")
 S DIC(0)="AEQM",DIC("W")="W ""  Obligation #: "",$P(^(0),U,2)" W !! D ^DIC K DIC("W"),DIC("S")
 G Q:X["^"!(X="") I Y>0 S (DA,FBAABE)=+Y
 S FBAABO=$P(^FBAA(161.7,DA,0),"^",2)
1 I '$D(FBPROG) D SITEP^FBAAUTL S FBPROG=$S($P(FBSITE(1),"^",6)="":"I 1",1:"I $P(^(0),U,3)=2")
 D GETVET^FBAAUTL1 G BT:'DFN
 D GETAUTH^FBAAUTL1 G 1:FTP']""
 D ^FBAAODP G 1
Q K DIC,CNT,Y,X,X1,I,DIC,D0,DFN,A1,A2,B1,B2,DA,DR,F,FBI,FBPROG,FBRR,FBXX,PTYPE,FBAABDT,FBAABE,FBAABO,FBAACPT,FBAAEDT,FBAAPD,FBAATA,FBDX,FBGOT,FBIN,FBPOV,FBPT,FBTT,FBTYPE,FY,H,HDA,HOLDDA,MAJN,PI,Q,SUB,SUBN,UL,Z,ZS,ZZ
 K A,TA,FBAAOUT,FBAUT,L,K,V,FBVEN,FTP,FBSITE,FBLOC,FBASSOC,FB7078,FBPSA,FBAADT,FBAAOBN,FBAAODUZ,FBAAOPA,FBPOP,FBST,FBV,FBAOT,FBVCHDT,FB583
 D GETAUTHK^FBAAUTL1
 Q