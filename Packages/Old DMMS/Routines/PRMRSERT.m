PRMRSERT ;GLRISC/JES - NUMBER OF INCIDENTS BY TYPE WITHIN SERVICE 88/2/29  1:41 PM ; 1/29/89  08:34 ;
 ;VERSION 1.01
 D ^PRMRDATE G:PRMRSTOP QUIT S HIT=""
 S %ZIS="QM" D ^%ZIS K %ZIS K:POP IO("Q") G:POP QUIP
 I $D(IO("Q")) K IO("Q") S ZTIO=ION,ZTRTN="EN^PRMRSERT",ZTDESC="Number of Incidents by Type Within Service" D PLOOP,^%ZTLOAD K ZTSK,ZTIO G QUIP
 G EN
PLOOP ;
 F I="PRMR1HED","PRMR2HED","PRMRENGD","PRMRNBEG","PRMRNEND","PRMRSPOT","PRMRSTOP","HIT" S ZTSAVE(I)=""
 Q
EN ;
 S (GTSERV,N)=0,SKIP=0 F I=0:0 S N=$O(^PRMQ(513.72,N)) Q:N'?1.N  I $D(^PRMQ(513.72,N,"I")) D RANGE D:OK BUILD
 U IO D HEAD1
 W ! S (LSERV,SERV)="" F I=0:0 S SERV=$O(STARRAY(SERV)) Q:SERV=""!(HIT["^")  S TYPE="" F II=0:0 S TYPE=$O(STARRAY(SERV,TYPE)) Q:TYPE=""  D WRITE Q:HIT["^"
 G:HIT["^" QUIT D WRITOT W !!?12,"GRAND TOTAL:",?74,$J(GTSERV,3)
 I $E(IOST)="C" W !!?2,*7,"Press return to continue or ""^"" to escape " R HIT:DTIME
QUIP ;
 K:$D(ZTSK) ^%ZTSK(ZTSK) W @IOF X ^%ZIS("C")
QUIT ;
 K GTSERV,HIT,I,II,LSERV,N,NN,OK,POP,PRMR1HED,PRMR2HED,PRMRENGD,PRMRNBEG,PRMRNEND,PRMRSPOT,PRMRSTOP,RDATE,SERV,SKIP,STARRAY,TOSERV,TYPE,%DT
 Q
RANGE ;
 S OK=0,RDATE=$P(^PRMQ(513.72,N,0),"^",1) S:((RDATE=PRMRNBEG)!(RDATE>PRMRNBEG))&((RDATE=PRMRNEND)!(RDATE<PRMRNEND)) OK=1
 Q
BUILD ;
 Q:$P(^PRMQ(513.72,N,0),"^",9)=""  S SERV=$P(^DIC(42,$P(^PRMQ(513.72,N,0),"^",9),0),"^",2)
 S GTSERV=GTSERV+1,TYPE=^PRMQ(513.72,N,"I") I '$D(STARRAY(SERV,TYPE)) S STARRAY(SERV,TYPE)=SERV_"^"_$P(^PRMQ(513.941,TYPE,0),"^",2)
 I $P(STARRAY(SERV,TYPE),"^",3)="" S $P(STARRAY(SERV,TYPE),"^",3)=1 Q
 S $P(STARRAY(SERV,TYPE),"^",3)=$P(STARRAY(SERV,TYPE),"^",3)+1 Q
WRITE ;
 S:'$D(TOSERV(SERV)) TOSERV(SERV)=0 S TOSERV(SERV)=$P(STARRAY(SERV,TYPE),"^",3)+TOSERV(SERV)
 G:LSERV=SERV NOSERV D:SKIP&(SERV]LSERV) WRITOT S LSERV=SERV,SKIP=1 W !?1,$P(STARRAY(SERV,TYPE),"^",1),!
NOSERV W !?1,$P(STARRAY(SERV,TYPE),"^",2),?74,$J($P(STARRAY(SERV,TYPE),"^",3),3)
 D:IOSL<($Y+8) HEAD Q
WRITOT ;
 Q:GTSERV<1  W !!?12,"TOTAL FOR SERVICE:",?74,$J(TOSERV(LSERV),3),! Q
HEAD ;
 S HIT="" I $E(IOST)="C" W !!?2,*7,"Press return to continue or ""^"" to escape " R HIT:$S('$D(DTIME)#2:300,DTIME=0:300,1:DTIME) S:'$T HIT="^" Q:HIT["^"
HEAD1 W @IOF X PRMR1HED W !?19,"NUMBER OF INCIDENTS BY TYPE WITHIN SERVICE",!,@PRMRSPOT,PRMR2HED,!!?1,"SERVICE/TYPE OF INCIDENT",?74,"TOTAL",! F I=1:1:80 W "-"