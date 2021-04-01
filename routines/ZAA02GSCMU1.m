ZAA02GSCMU1 ;PG&A,ZAA02G-MTS,1.20,UTILITY OPS;30DEC94 4:14P;;;05MAY99  17:45
C ;Copyright (C) 1995, Patterson, Gray & Associates, Inc.
 ;
INPUT D HEAD^ZAA02GSCM,DATE^ZAA02GSCRER S %C=20
 W @ZAA02GP,ZAA02G("HI"),$J("",42-$L(DOC)\2),DOC,$J("",44-$L(DOC)\2),!!,ZAA02G("CS")
MAMMO S SRC="@ZAA02GSCR@(""DIR"",12,TSU)"
 S OF=-1,OF1=10000000,EP="zzzzz" D BEG^ZAA02GSCRTR
 Q:DOC=""  K EDIT,STMC D FETCH^ZAA02GSCRER,M1^ZAA02GSCMR Q
 ;
INCOMP S E="I '$D(@ZAA02GSCM@(""EXAM"",10000000-II))",DOC="INCOMPLETE MAMMOGRAM RECORDS"
 S XE="S:E'["",12,"" E=E_""I $D(@ZAA02GSCR@(""""DIR"""",12,""""M"""",II)),'$D(@ZAA02GSCM@(""""EXAM"""",10000000-II))"""
 D INPUT Q:DOC=""  G INCOMP
COMP S E="I $D(@ZAA02GSCM@(""EXAM"",10000000-II))",DOC="M A M M O G R A P H Y  R E C O R D S"
 S XE="S:E'["",12,"" E=E_""I $D(@ZAA02GSCR@(""""DIR"""",12,""""M"""",II)),$D(@ZAA02GSCM@(""""EXAM"""",10000000-II))"""
 D INPUT Q:DOC=""  G COMP
 ;
 ;  MINI - CREATE/EDIT
 ;  THIS SECTION USED WHEN ZAA02G-SCRIPT IS NOT USED BY CLIENT
CR D EDCR G INIT
ED D EDCR K INP D DATE^ZAA02GSCRER D MAMMO^ZAA02GSCRTR G:DOC="" END D FETCH^ZAA02GSCRER G I1
EDCR D HEAD^ZAA02GSCM S E="I 1",DOC="M A M M O G R A P H Y  R E C O R D S"
 S %R=1,%C=20 W @ZAA02GP,ZAA02G("HI"),$J("",42-$L(DOC)\2),DOC,$J("",44-$L(DOC)\2),!!,ZAA02G("CS") Q
 ;
INIT D DATE^ZAA02GSCRER,TMPL^ZAA02GSCRER
 K INP
 S INP("TR")=TRANS,(OSET,OCOUNT,OT)="",(INP("DD"),INP("DT"))=DT,INP("TM")=TM,INP("WORK")=WORKT,$P(INP("DD"),"/",2)="*"
 I $D(INPS) S I="" F J=1:1 S I=$O(INPS(I)) Q:I=""  S INP(I)=INPS(I)
I1 S SCR="ZAA02GSCRIPT",SNL=$S($D(@ZAA02GSCR@("PARAM","SCR")):^("SCR"),1:15),REFRESH="3:24",ZAA02Gform="0;;;N",UP="ABCDEFGHIJKLMNOPQRSTUVWXYZ",LC="abcdefghijklmnopqrstuvwxyz",%R=3,TIME=$P($H,",",2),STMC=0 W @ZAA02GP,ZAA02G("CS")
 ; I OSET]"" G:$TR(ZAA02GSCRP,"is","??")["?" NOMOD^ZAA02GSCRER3
 S:TRTYPE<1 ZAA02Gform="1;N;;",INQ="INQ"
I3 S formHELP="SHELP^ZAA02GSCRHP;D" D ^ZAA02GFORM I ZAA02Gform["TIME" G END
I2 S ZAA02GWPD="@ZAA02GSCR@(DIR,DOC)",DIR="TRANS",REP=INP("TEMPLATE")
I4 K EDIT S NOCLR=1 D NEW^ZAA02GSCRER1 G I4:$G(EDIT)=4 I $D(EDIT) K EDIT G END
 S STMC=STMC_",A" D MAMMO^ZAA02GSCMR K TYPS,EDIT
MNU S %R=24,%C=1 W @ZAA02GP,ZAA02G("CS") S Y="30,24\QHP1U\*\\\Save,Delete"
 D ^ZAA02GPOP W *13 S P=$S(X["EX":1,1:X)
 I P=2 G DELETE
 S P=1 D FILE^ZAA02GSCRER
END D HEAD^ZAA02GSCM K OCOUNT,DV,DT,DCOUNT,ZAA02GWPD,ED,DIR,YM,TM,AST,HLPR,UP,LC,L,S,B,C,W,TY,TIME,P,OT,NOCLR Q
DELETE D DELETE^ZAA02GSCRER2 G END
 G MNU