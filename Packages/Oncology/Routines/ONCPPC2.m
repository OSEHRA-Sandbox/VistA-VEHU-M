ONCPPC2 ;HIRMFO/GWB - PCE Studies of Prostate Cancer - Table II;7/22/96
 ;;2.2;ONCOLOGY;**1**;Jul 31, 2013;Build 8
 K TABLE,HTABLE
 S TABLE("METHOD OF DIAGNOSIS")="MOD"
 S TABLE("DATE OF INITIAL DIAGNOSIS")="DATEDX"
 S TABLE("DIAGNOSITC INFORMATION")="DI"
 S TABLE("HISTOLOGY (ICD-O)")="HIST"
 S TABLE("DIFFERENTIATION/GRADE")="GRADE"
 S TABLE("GLEASON'S SCORE")="GS"
 S HTABLE(1)="METHOD OF DIAGNOSIS"
 S HTABLE(2)="DATE OF INITIAL DIAGNOSIS"
 S HTABLE(3)="DIAGNOSTIC INFORMATION"
 S HTABLE(4)="HISTOLOGY (ICD-O)"
 S HTABLE(5)="DIFFERENTIATION/GRADE"
 S HTABLE(6)="GLEASON'S SCORE"
 S CHOICES=6
 S DIE="^ONCO(165.5,",DA=ONCONUM
 W @IOF D HEAD^ONCPPC0 W !?26,"TABLE II - INITIAL DIAGNOSIS",!
MOD W !,"METHOD OF DIAGNOSIS:",!
 S DR="600  CLINICAL DX WITH BONE LESION" D ^DIE G:$D(Y) JUMP
 S DR="601  CLINICAL DX BY RECTAL EXAM.." D ^DIE G:$D(Y) JUMP
 S DR="602  CYTOLOGY...................." D ^DIE G:$D(Y) JUMP
 S DR="603  INCIDENTAL FINDING IN TURP.." D ^DIE G:$D(Y) JUMP
 S DR="604  NEEDLE ASPIRATION BIOPSY...." D ^DIE G:$D(Y) JUMP
 S DR="605  NEEDLE BIOPSY, NOS.........." D ^DIE G:$D(Y) JUMP
 S DR="606  PERINEAL BIOPSY............." D ^DIE G:$D(Y) JUMP
 S DR="607  TRANSRECTAL BIOPSY.........." D ^DIE G:$D(Y) JUMP
 S DR="608  TRUS GUIDED BIOPSY.........." D ^DIE G:$D(Y) JUMP
 S DR="609  TRANSURETHRAL RESECTION, NOS" D ^DIE G:$D(Y) JUMP
 S DR="610  OTHER......................." D ^DIE G:$D(Y) JUMP
DATEDX S DOID=$E(DATEDX,4,5)_"/"_$E(DATEDX,6,7)_"/"_(1700+$E(DATEDX,1,3))
 W !!,"DATE OF INITIAL DIAGNOSIS.....: ",DOID
DI W !!,"DIAGNOSTIC INFORMATION:",!
 S DR="611  BONE MARROW ASPIRATION......" D ^DIE G:$D(Y) JUMP
 S DR="612  BONE SCAN..................." D ^DIE G:$D(Y) JUMP
 S DR="613  BONE X-RAY.................." D ^DIE G:$D(Y) JUMP
 S DR="614  CHEST X-RAY................." D ^DIE G:$D(Y) JUMP
 S DR="615  CT SCAN OF PRIMARY SITE....." D ^DIE G:$D(Y) JUMP
 S DR="616  IVP........................." D ^DIE G:$D(Y) JUMP
 S DR="617  LIVER SCAN.................." D ^DIE G:$D(Y) JUMP
 S DR="618  MRI........................." D ^DIE G:$D(Y) JUMP
 S DR="619  PELVIC LYMPH NODE DISSECTION" D ^DIE G:$D(Y) JUMP
 S DR="620  PAP........................." D ^DIE G:$D(Y) JUMP
 S DR="621  PSA........................." D ^DIE G:$D(Y) JUMP
 S DR="622  OTHER......................." D ^DIE G:$D(Y) JUMP
 W !
HIST S DR="22HISTOLOGY (ICD-O)............." D ^DIE G:$D(Y) JUMP
GRADE S DR="24DIFFERENTIATION/GRADE........." D ^DIE G:$D(Y) JUMP
GS S DR="623GLEASON'S SCORE..............." D ^DIE G:$D(Y) JUMP
 W ! K DIR S DIR(0)="E" D ^DIR
 G EXIT
JUMP ;Jump to prompts
 S XX="" R !!,"GO TO: ",X:DTIME I (X="")!(X[U) S OUT="Y" G EXIT
 I X["?" D  G JUMP
 .W !,"CHOOSE FROM:" F I=1:1:CHOICES W !,?5,HTABLE(I)
 I '$D(TABLE(X)) S XX=X,X=$O(TABLE(X)) I ($P(X,XX,1)'="")!(X="") W *7,"??" D  G JUMP
 .W !,"CHOOSE FROM:" F I=1:1:CHOICES W !,?5,HTABLE(I)
 S X=TABLE(X)
 G @X
EXIT K CHOICES,HTABLE,TABLE
 K DOID
 K DA,DIE,DIR,DIROUT,DIRUT,DR,DTOUT,DUOUT,X,XX,Y
 Q