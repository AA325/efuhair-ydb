%ZAA02GEDRS 
INIT X ZAA02G("EOF") D READ X ZAA02G("EON") Q
READ S Ton=$P(Y,"\"),Tof=$P(Y,"\",2),ZAA02Gt=$P(Y,"\",3),ZAA02Gb=$P(Y,"\",4),ZAA02GL=$P(Y,"\",5),ZAA02Gv=$P(Y,"\",6),ZAA02Gu=$P(Y,"\",10),Tns=+$P(Y,"\",12),Tov=+$P(Y,"\",13),ZAA02Gp="RD",ZAA02Gh=Ton'=Tof,ZAA02Gl=1 S:'Tns X=X_$J("",ZAA02GL-$L(X)) I ZAA02Gv?1"["1.E1"]" D EXP
        I $P(Y,"\",11)]"" W @ZAA02GP,tLO_$P(Y,"\",11) S %C=%C+$L($P(Y,"\",11))
        W @ZAA02GP,tHI_ZAA02G(Ton) W:ZAA02Gh X,@ZAA02GP G:'Tov RD S ZAA02Gp="OV"
OV R ZAA02Gc#1 G:'$L(ZAA02Gc) FN S:ZAA02Gu&(ZAA02Gc?1L) ZAA02Gc=$C($A(ZAA02Gc)-32) G BRK:ZAA02Gb[ZAA02Gc,ERR:ZAA02Gv]""&(ZAA02Gv'[ZAA02Gc) W ZAA02Gc,$J("",ZAA02GL-1),@ZAA02GP,ZAA02G("RT") S X=ZAA02Gc_$J("",ZAA02GL-1),ZAA02Gl=2,ZAA02Gp="RD"
RD F ZAA02Gi=1:1 R ZAA02Gc#1 Q:'$L(ZAA02Gc)  S:ZAA02Gu&(ZAA02Gc?1L) ZAA02Gc=$C($A(ZAA02Gc)-32) G BRK:ZAA02Gb[ZAA02Gc,ERR:ZAA02Gl>ZAA02GL,ERR:ZAA02Gv]""&(ZAA02Gv'[ZAA02Gc) W ZAA02Gc S X=$E(X,1,ZAA02Gl-1)_ZAA02Gc_$E(X,ZAA02Gl+1,511),ZAA02Gl=ZAA02Gl+1
FN X ZAA02G("T") S ZAA02GF=$P(ZAA02GY,"\",$A(ZAA02GX,$F(ZAA02GX,ZF))+2) G @ZAA02GF:"RK,LK,IC,DC,RU,EF,CR,GE,TB"[ZAA02GF,CR:$F(ZAA02Gt,ZAA02GF)
ERR W *7 G @ZAA02Gp
RK I 'Tns,ZAA02Gl<ZAA02GL W ZAA02G("RT") S ZAA02Gl=ZAA02Gl+1 G RD
        I Tns,$TR($E(X,ZAA02Gl,ZAA02GL)," ","")]"" W ZAA02G("RT") S ZAA02Gl=ZAA02Gl+1 G RD
        G CR:$F(ZAA02Gt,"RK"),RD
TB ;
GE F ZAA02Gi=0:0 S ZAA02Gi=$F(X," ",ZAA02Gi) Q:'ZAA02Gi  I $E(X,ZAA02Gi,511)?." " S ZAA02Gi=ZAA02Gi-2 Q
        G:'ZAA02Gi RD W $E(X,ZAA02Gl,ZAA02Gi-1) S ZAA02Gl=ZAA02Gi G RD
LK I ZAA02Gl>1 W ZAA02G("L") S ZAA02Gl=ZAA02Gl-1 G RD
        G CR:$F(ZAA02Gt,"LK"),RD
IC G:$E(X,ZAA02GL)]" " ERR W " ",$E(X,ZAA02Gl,ZAA02GL-1) S X=$E(X,1,ZAA02Gl-1)_" "_$E(X,ZAA02Gl,ZAA02GL-1) W @ZAA02GP,$E(X,1,ZAA02Gl-1) G RD
DC W $E(X,ZAA02Gl+1,256) W:Tns ZAA02G(Tof) W " " W:Tns ZAA02G(Ton) S X=$E(X,1,ZAA02Gl-1)_$E(X,ZAA02Gl+1,256) S:'Tns X=X_" " W @ZAA02GP,$E(X,1,ZAA02Gl-1) G RD
RU I ZAA02Gl>1 S X=$E(X,1,ZAA02Gl-2)_$S(Tns:"",1:" ")_$E(X,ZAA02Gl,256),ZAA02Gl=ZAA02Gl-1 W $C(8),$E(X,ZAA02Gl,256) W:Tns ZAA02G(Tof)_" "_ZAA02G(Ton) S ZAA02Gcx=%C,%C=%C+ZAA02Gl-1 W @ZAA02GP S %C=ZAA02Gcx K ZAA02Gcx
        G RD
EF S X=$E(X,0,ZAA02Gl-1),TLln=$L(X),ZAA02Gcx=%C,%C=%C+ZAA02Gl-1 S:'Tns X=X_$J("",ZAA02GL-$L(X)) W @ZAA02GP W:Tns ZAA02G(Tof) W $J("",ZAA02GL-ZAA02Gl+1) W:Tns ZAA02G(Ton) W @ZAA02GP S %C=ZAA02Gcx,ZAA02Gl=TLln+1 K ZAA02Gcx,TLln G RD
CR S ZAA02Gx=X I 'Tns,$E(X,$L(X))=" " F ZAA02Gi=0:0 S ZAA02Gi=$F(X," ",ZAA02Gi) Q:'ZAA02Gi  I $E(X,ZAA02Gi,511)?." " S X=$E(X,1,ZAA02Gi-2) Q
        G:X="" DONE
PAT I $L($P(Y,"\",7)) X "I "_$P(Y,"\",7) E  G INV
MAX I $L($P(Y,"\",8)),X>$P(Y,"\",8) G INV
MIN I $L($P(Y,"\",9)),X<$P(Y,"\",9) G INV
DONE W:ZAA02Gh @ZAA02GP,ZAA02G(Tof)_$S(ZAA02Gh:ZAA02Gx,1:X) K Tns,Ton,Tof,Tov,ZAA02Gb,ZAA02Gc,ZAA02Gh,ZAA02Gi,ZAA02Gl,ZAA02Gp,ZAA02Gt,ZAA02Gu,ZAA02Gv,ZAA02Gx,ZAA02GL Q
INV S X=ZAA02Gx,ZAA02Gl=1 W *7,@ZAA02GP G RD
BRK S ZAA02GF=ZAA02Gc G CR
EXP S eT=$E(ZAA02Gv,2,$L(ZAA02Gv)-1),eS=" !""#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~" F eI=128:8:255 S eS=eS_$C(eI,eI+1,eI+2,eI+3,eI+4,eI+5,eI+6,eI+7)
        S:eT="" ZAA02Gv=eS I eT]"" S ZAA02Gv="" S:$L(eT)#2 eT=eT_$C(511) F eI=1:2:$L(eT) S ZAA02Gv=ZAA02Gv_$E(eS,$A(eT,eI)-31,$A(eT,eI+1)-31)
        K eI,eS,eT Q
        ;