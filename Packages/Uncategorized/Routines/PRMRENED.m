PRMRENED ;GLRISC/JES,DAD - ENTER/EDIT AN INCIDENT ; 1/24/89  14:31 ;
 ;VERSION: 1.0
ENTER ;
 S NEXT=0,WHAT="ENTER" W !!," ENTER A NEW INCIDENT, STARTING WITH THE DATE AND TIME (REQUIRED):",!
ENTER2 ;
 D:NEXT AGAIN S NEXT=1
 S %DT="XATE",%DT("A")="EVENT DATE AND TIME: " D ^%DT S %DT("A")="DATE: "
 W ! I +Y=-1 K %DT,BY,DA,DFN,DIC,DIE,DIK,DR,FLDS,FR,INP,L,NEXT,TO,X,WHAT,WHY,Y,LOC,TIM,PAT,TYP,S0 Q
 K DD,DO S DIC("DR")="1;15",DIC="^PRMQ(513.72,",DIC(0)="AELQMNZ",DIE=DIC,X=Y D FILE^DICN
 G:+Y=-1 ENTER2 S DA=+Y
 W !!!,"SEARCHING FOR DUPLICATE ENTRY..."
 S LOC=^PRMQ(513.72,DA,0),TIM=$P(LOC,"^",1),PAT=$P(LOC,"^",2),TYP=$P(^PRMQ(513.72,DA,"I"),"^",1),S0=""
 S S0=$O(^PRMQ(513.72,"INC",TIM,PAT,TYP,S0)),S0=$O(^PRMQ(513.72,"INC",TIM,PAT,TYP,S0))
 W:($D(^PRMQ(513.72,"I",TIM,PAT))=10)!($D(^PRMQ(513.72,"M",TIM,PAT))=10) !!,"*** SCREEN/MONITOR EXISTS FOR THIS PATIENT ***"
 I S0="" W !!,"*** DUPLICATE INCIDENT RECORD NOT FOUND ***",*7 G CONT
 E  W !!,"*** INCIDENT RECORD ALREADY EXISTS ***",*7
 S DIK="^PRMQ(513.72," D ^DIK G ENTER2
CONT ;
 W !! K DIC("DR") S DR=INP,DFN=$P(^PRMQ(513.72,DA,0),"^",2) D ^DIE,PRINT:INP'["FLUP" G ENTER2
EDIT ;
 S HOW=" (YOU MAY SELECT BY EITHER NAME OR DATE)",WHAT="EDIT"
 S NEXT=0 I INP'["FLUP" W !!," EDIT AN EXISTING INCIDENT",HOW,":",! G EDIT2
 W !!," EDIT INCIDENT FOR FOLLOW-UP AND/OR DISPOSITION",!,HOW,":",!
EDIT2 ;
 D:NEXT AGAIN S NEXT=1
 S DIC("S")="I $D(^PRMQ(513.72,+Y,""I""))#2,+^PRMQ(513.72,+Y,""I"")",DIE="^PRMQ(513.72,",DIC=DIE,DIC(0)="AEQMNZ" D ^DIC K DIC("S") G:X="?" EDIT
 W ! I +Y=-1 K BY,DA,DFN,DIC,DIE,DR,FLDS,FR,HOW,INP,L,NEXT,TO,X,WHAT,WHY,Y Q
 S DA=+Y,DR=".01" D ^DIE G:$D(Y)!($D(DA)=0) EDIT2
 S DR=INP,DFN=$P(^PRMQ(513.72,DA,0),"^",2) D ^DIE,PRINT:INP'["FLUP" G EDIT2
PRINT ;
 W !!!,*7,*7,*7,*7,!!?6,"A PRINT OF THE JUST-COMPLETED FORM 10-2633-X WILL FOLLOW",!?9,"(ALONG WITH ALL OTHER INCIDENTS FOR THIS PATIENT)"
 W !!?16,"YOU WILL BE ASKED TO SUPPLY A DEVICE",!?15,"PRESS RETURN TO DIRECT PRINT TO SCREEN",!?21,"ENTER ""^"" TO BYPASS PRINT",!
 S L=0,DIC="^PRMQ(513.72,",DIC(0)="EZMQ",FLDS="[PRMR INC PRINT 2633]",BY="1:NUMBER",TO=DFN,FR=DFN D EN1^DIP H 3 W !! Q
AGAIN ;
 W !!!,"     ***** YOU MAY ",WHAT," ANOTHER RECORD, OR PRESS RETURN TO EXIT *****",!! Q
ENDATE ;
 S HOLDY=Y,EVDATE=+^PRMQ(513.72,D0,0)\1
 I X<EVDATE S Y=EVDATE X ^DD("DD") W !!,"THIS DATE CANNOT BE PRIOR TO THE EVENT DATE OF ",Y,! S Y=HOLDY K X
 K EVDATE,HOLDY Q