RMPJ ;DDC/KAW-POST INIT FOR ROES PATCH RMPF*1.1*9 [ 09/27/94  8:01 AM ]
 ;;1.1;RMPF;**9**;SEP 27, 1994
 W !!,"Adding components and batteries to models."
 G ^RMPJ1
SET1 I '$D(^RMPF(791811,MP,101,0)) S ^RMPF(791811,MP,101,0)="^791811.0101PA"
 Q:$D(^RMPF(791811,MP,101,"B",CX))
 S DIC="^RMPF(791811,"_MP_",101,",X=CX,DIC(0)="L",DLAYGO=791811
 S DIC("DR")=".02////"_CS,DA(1)=MP K DD,DO D FILE^DICN
 I Y=-1 W !!,MD," not added."
 Q
SET2 I '$D(^RMPF(791811,MP,102,0)) S ^RMPF(791811,MP,102,0)="^791811.0102PA"
 Q:$D(^RMPF(791811,MP,102,"B",BP))
 S DIC="^RMPF(791811,"_MP_",102,",X=BP,DIC(0)="L",DLAYGO=791811
 S DA(1)=MP K DD,DO D FILE^DICN
 I Y=-1 W !!,BP," not added."
 Q