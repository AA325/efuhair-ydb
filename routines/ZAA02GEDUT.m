%ZAA02GEDUT 
INIT N (ZAA02G,ZAA02GP,ZAA02GX,ZAA02GY,TID) D FUNC^ZAA02GEDDI S (eHI,tHI)=ZAA02G("HI"),(eLO,tLO)=ZAA02G("LO"),tCL=ZAA02G("CL")
	S d=$C(1),ci="/",lm=2,rm=79,tl=3,bl=22,%R=bl+2,%C=lm-1,@("pBL="_ZAA02GP),sr=$S(ZAA02G("SR")="":0,1:1) X $S(rm>79:ZAA02G(132),1:ZAA02G(80)) D FILES^ZAA02GED,VERS^ZAA02GED
	I '$D(TID) D USER^ZAA02GED G:'$D(TID) EXIT
	S ct=$P(@ugl@(TID),"`",4),rt=$S($D(@gl)#2:$P(@gl,"`"),1:" ")
	I '$D(ZAA02G("M")) S ZAA02G("M")=1 I $D(@ugl@(TID,"MENU")) S ZAA02G("M")=^("MENU")
	X ZAA02G("TON"),ZAA02G("WOF") W ZAA02G("Z"),ZAA02G("F")
	S %R=22,%C=1 W @ZAA02GP,tLO_"AA UTILS "_$P(VERS," ",3)_" (C) 1990 PG&A"
	K UTL D UTIL^ZAA02GEDU0
	X ZAA02G("TOF"),ZAA02G("WON") X:rm>79 ZAA02G(80) W pBL
EXIT K ZAA02G(80),ZAA02G(132),ZAA02G("TON"),ZAA02G("TOF"),ZAA02G("WON"),ZAA02G("WOF"),ZAA02G("EON"),ZAA02G("EOF") Q
	;
	;