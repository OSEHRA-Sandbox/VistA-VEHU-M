RJPTFNUM ;RJ WILM DE -LIST SELECTED PATIENTS NUMBER; 12-12-85
 ;;4.0
 S (DIC,DIE)="^DGPT(",U="^",DIC(0)="QEALM" S:'$D(DTIME) DTIME=300 D ^DIC K:Y=-1 DIC,DIE G:Y<1 X W !,?18,"***  PATIENT NUMBER = ",+Y,?47,"***",! G:$D(A) RJPTFNUM
X K A,DIC,DIE Q