ZZMSM ;ALB/ECF/2.17.93 [ 03/02/93  3:18 PM ]
 ;;V1.0
EN ;
 D SETUP^A1BFCHK1
 I $D(A1BFERR(0))>9 D ERRS Q
 Q
EXIT ;
 U IO(0) W !,"OUTTA HERE"
 Q