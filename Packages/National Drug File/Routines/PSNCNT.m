PSNCNT ; Birmingham ISC/WRT - reset pieces 3 & 4 on all multiple levels; 06/02/98 12:08;
 ;;3.18; NATIONAL DRUG FILE;**4**;12 Jan 98
 D BEGIN K I,J,COUNT,LAST,HH,KK,DD,EE,RR
 Q
BEGIN F I=0:0 S I=$O(^PSNDF(I)) Q:'I  D VAPN,DOSE
 Q
VAPN I $D(^PSNDF(I,5,0)) D LOOP
 Q
LOOP S COUNT=0,LAST=0 F J=0:0 S J=$O(^PSNDF(I,5,J)) Q:'J  S COUNT=COUNT+1 I LAST?1N.N S LAST=J D WRITE
 Q
WRITE S $P(^PSNDF(I,5,0),"^",3)=LAST,$P(^PSNDF(I,5,0),"^",4)=COUNT
 Q
DOSE I $D(^PSNDF(I,2,0)) D LOOP1,STRGTH
 Q
LOOP1 S COUNT=0,LAST=0 F HH=0:0 S HH=$O(^PSNDF(I,2,HH)) Q:'HH  S COUNT=COUNT+1 I LAST?1N.N S LAST=HH D WRITE1
 Q
WRITE1 S $P(^PSNDF(I,2,0),"^",3)=LAST,$P(^PSNDF(I,2,0),"^",4)=COUNT
 Q
STRGTH I $D(^PSNDF(I,2,HH,3,0)) D LOOP2,UNIT
 Q
LOOP2 S COUNT=0,LAST=0 F KK=0:0 S KK=$O(^PSNDF(I,2,HH,3,KK)) Q:'KK  S COUNT=COUNT+1 I LAST?1N.N S LAST=KK D WRITE2
 Q
WRITE2 S $P(^PSNDF(I,2,HH,3,0),"^",3)=LAST,$P(^PSNDF(I,2,HH,3,0),"^",4)=COUNT
 Q
UNIT I $D(^PSNDF(I,2,HH,3,KK,4,0)) D LOOP3,PSZE
 Q
LOOP3 S COUNT=0,LAST=0 F DD=0:0 S DD=$O(^PSNDF(I,2,HH,3,KK,4,DD)) Q:'DD  S COUNT=COUNT+1 I LAST?1N.N S LAST=DD D WRITE3
 Q
WRITE3 S $P(^PSNDF(I,2,HH,3,KK,4,0),"^",3)=LAST,$P(^PSNDF(I,2,HH,3,KK,4,0),"^",4)=COUNT
 Q
PSZE I $D(^PSNDF(I,2,HH,3,KK,4,DD,5,0)) D LOOP4,PTYP
 Q
LOOP4 S COUNT=0,LAST=0 F EE=0:0 S EE=$O(^PSNDF(I,2,HH,3,KK,4,DD,5,EE)) Q:'EE  S COUNT=COUNT+1 I LAST?1N.N S LAST=EE D WRITE4
 Q
WRITE4 S $P(^PSNDF(I,2,HH,3,KK,4,DD,5,0),"^",3)=LAST,$P(^PSNDF(I,2,HH,3,KK,4,DD,5,0),"^",4)=COUNT
 Q
PTYP I $D(^PSNDF(I,2,HH,3,KK,4,DD,5,EE,6,0)) D LOOP5,NDC
 Q
LOOP5 S COUNT=0,LAST=0 F RR=0:0 S RR=$O(^PSNDF(I,2,HH,3,KK,4,DD,5,EE,6,RR)) Q:'RR  S COUNT=COUNT+1 I LAST?1N.N S LAST=RR D WRITE5
 Q
WRITE5 S $P(^PSNDF(I,2,HH,3,KK,4,DD,5,EE,6,0),"^",3)=LAST,$P(^PSNDF(I,2,HH,3,KK,4,DD,5,EE,6,0),"^",4)=COUNT
 Q
NDC I $D(^PSNDF(I,2,HH,3,KK,4,DD,5,EE,6,RR,7,0)) D LOOP6
 Q
LOOP6 S COUNT=0,LAST=0 F WW=0:0 S WW=$O(^PSNDF(I,2,HH,3,KK,4,DD,5,EE,6,RR,7,WW)) Q:'WW  S COUNT=COUNT+1 I LAST?1N.N S LAST=WW D WRITE6
 Q
WRITE6 S $P(^PSNDF(I,2,HH,3,KK,4,DD,5,EE,6,RR,7,0),"^",3)=LAST,$P(^PSNDF(I,2,HH,3,KK,4,DD,5,EE,6,RR,7,0),"^",4)=COUNT
 Q