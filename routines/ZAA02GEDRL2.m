%ZAA02GEDRL2 ;;%AA UTILS;1.24;SUBR: ROUTINE LOOKUP;24APR91  16:25
        ;;Copyright (C) 1990,91 Patterson, Gray & Associates, Inc. ;
        ;;All rights reserved. ;
LKUP N C,I,L,S,T,W,Y,BR,CN,NK,NO,PG,TR,US,UD,FR S W=rm-lm+1,SF=1
        S T=$P("/W O R K F I L E/A R C H I V E","/",TYP) D ^ZAA02GEDHD K T
        S %R=3,%C=1 W @ZAA02GP,tLO_"Routine    Bytes   Changed       Description"
        S PG=1,(NK,PG(1))=X,TR=5,BR=22,NO=0 D FETCH G:'$D(US) EXIT S NO=1 G SELECT
FETCH S NK=PG(PG),CN=0 K US,UD,LST I PG=1,NK]"",$D(@GFI@(NK)) G F2
F1 S NK=$O(@GFI@(NK)) I NK=""!($E(NK,1,$L(X))]X) D CLEAR Q
F2 S:CN=(BR-TR) LST=NK I CN=(BR-TR+1) S:LST]"" PG(PG+1)=LST Q
        S Y=^(NK),V=$P(Y,"`",2),SZ=$P(Y,"`",5)+CPL,DT=$P($P(Y,"`",6),"\",2),CN=CN+1,%R=TR+CN-1,%C=3,US(CN)=NK
        S UD(CN)=$S($D(@GS@(NK)):"*"_tHI,1:" ")_DL_NK_$J("",10-$L(NK))_$J(SZ,5)_"b  "_DT_$J("",18-$L(DT))_$E($P(Y,"`",3),1,W-39)
        W @ZAA02GP,tLO_UD(CN)_tCL G F1
SELECT S L="Functions: ["_tHI_"EXIT  SELECT" S:$D(PG(PG+1)) L=L_"  NEXT SCREEN" S:PG>1 L=L_"  PREV SCREEN" S L=L_"  RETURN"_tLO_"]" W pBL_tCL S %R=bl+2,%C=($L(tHI)*2+rm-lm-$L(L)\2) W @ZAA02GP,tLO_L
ASK S %R=TR+NO-1,%C=1,NK=US(NO) W @ZAA02GP,tLO_"=>"_tHI_UD(NO),@ZAA02GP,"=>"
AS R C#1 I C="" X ZAA02G("T") S ZAA02GF=$P(ZAA02GY,"\",$A(ZAA02GX,$F(ZAA02GX,ZF))+2) G:"UK,DK,PU,PD,SE,CR,EX"[ZAA02GF @ZAA02GF W *7 G AS
        G DK:C=" ",AS
UK W @ZAA02GP,tLO_"  "_UD(NO) S NO=NO-1 G:NO'<1 ASK S NO=CN G PU:PG>1,ASK
DK W @ZAA02GP,tLO_"  "_UD(NO) S NO=NO+1 G:NO'>CN ASK S NO=1 G:'$D(PG(PG+1)) ASK
PD G:'$D(PG(PG+1)) AS S PG=PG+1 D FETCH S:NO>CN NO=CN G SELECT
PU G:PG<2 AS S PG=PG-1 D FETCH G SELECT
SE I '$D(@GS@(NK)) S $P(UD(NO),DL)="*"_tHI D ADD G DK
        S $P(UD(NO),DL)=" "_tLO D DEL G DK
EX W @ZAA02GP,tLO_"  "_UD(NO) Q
CR Q  S:'$D(@GS) @GS@(US(NO))=@GFI@(US(NO)) Q
EXIT K P,X,Y Q
CLEAR S %C=1 F %R=CN+TR:1:BR W @ZAA02GP,tCL
        Q
ADD S Z=@GFI@(NK) I TYP=4 S V=$S(PX=PV:$P(Z,"`",2),1:$P(@agl@(0,X),"`",2)),Z="`"_V_"`"_@agl@(R,V)
        S @GS@(NK)=Z,CNT=CNT+1,SIZ=SIZ+$P(Z,"`",5),CHG=1 K Z Q
DEL S CNT=CNT-1,SIZ=SIZ-$P(@GS@(NK),"`",5),CHG=1 K ^(NK) Q
        ;