%ZAA02GEDUR1 ;;%AA UTILS;1.24;UTIL: RELEASE MANAGEMENT;24APR91  17:19
        ;;Copyright (C) 1990,91 Patterson, Gray & Associates, Inc. ;
        ;;All rights reserved. ;
        D LOAD,MASK
PKD S %R=4,%C=39,Y="RON\ROF\DK,EX\\40",X=PDE D ^ZAA02GEDRS Q:X=""!(ZAA02GF="EX")  S PDE=X,$P(PKR,"`",2)=X,@pgl@(PKG)=PKR
COPY S TR=9,FC=1,NT=4,LNG=80 D ^ZAA02GEDUR5 K @pgl@(PKG,PV,0)
        S (B,C)=0 F I=1:1:4 I TX(I)]"" S C=C+1,X=" ;"_TX(I),B=B+$L(X)+1,@pgl@(PKG,PV,0,C)=X
        S @pgl@(PKG,PV,0)=C_"`"_B G:ZAA02GF="UK" PKD Q
LOAD S PKR=$S($D(@pgl@(PKG))#2:^(PKG),1:""),PDE=$P(PKR,"`",2) I PV="" S (TX(1),TX(2),TX(3),TX(4))="" Q
        F I=1:1:4 S TX(I)=$S($D(@pgl@(PKG,PV,0,I))#2:$P(^(I),";",2,99),1:"")
        Q
MASK S T="P A C K A G E   I N F O R M A T I O N" D TITLE^ZAA02GEDHD S %R=7,%C=1 W @ZAA02GP,ZAA02G("CS") K T
MSK1 S %R=8,%C=1,Z="",$P(Z,ZAA02G("HL"),81)="" W @ZAA02GP,tLO_ZAA02G("G1")_$P(Z,ZAA02G("HL"),1,33)_ZAA02G("G0")_"Copyright lines",ZAA02G("G1")_$P(Z,ZAA02G("HL"),1,34)_ZAA02G("G0")
        S %C=1 F I=1:1:4 S %R=I+8 W:TX(I)]"" @ZAA02GP,tHI_TX(I)
        S %R=13 W @ZAA02GP,tLO_ZAA02G("G1")_Z_ZAA02G("G0")
        K Z Q
        ;