ZAA02GFAXH7 ;PG&A,ZAA02G-FAX,1.36,TRANS ENCODING - 12 BIT;21MAY96 3:08P;;;06SEP2005  10:13
 ;Copyright (C) 1995, Patterson, Gray and Associates Inc.
 S LOV=OV D:OV>0 CVT2
CVT0 S LXC=$J("",$L(LXA)*1.3333+.9) F Z=Z:0 S Z=$O(@ZAA02GFAXD@(Z)) Q:Z=""  I $D(^(Z))#2 S TXT=^(Z) G:TXT["~P"!(TXT["~FAX") EOP D LINE
 D CVT1
 Q
 ;
CVT1 I $D(@OVR@(FXL+1+LOV)) F KK=FXL+1+LOV:1 Q:'$D(@OVR@(KK))  S D=^(KK) D:$P(D,";",3)'="" SET D LM2
 Q
CVT2 F LOV=1:1:OV Q:'$D(@OVR@(LOV))  S D=^(LOV) D:$P(D,";",3)'="" SET D LM2
 S LOV=1 Q
 ;
LINE I TXT'[XS S TXT=$TR(LXC_TXT,CA,CB),TXT=$E(TXT_"   ",1,$L(TXT)+3\4*4),TXL=$L(TXT),TXW=1728-(TXL*FC+LMG+CVR) G:TXW<0 LINEL F TXR=1:1:FR D LM H 0
 I TXT[XS D VIDEO S TXT=LXC_TXT,TXL=$L(TXT),TXW=1728-(TXL-$L(TXT,$C(0))+1*FC+LMG+CVR) G:TXW<0 LINEL F TXR=1:1:FR D LN H 0
 I HP S TXT="",TXL=0,TXW=1728-(LMG+CVR) F FXL=FXL:0:HP-TXR+FXL-1 D LN H 0
 I $D(OVRF),TY<2,$O(@OVR@(FXL+LOV))="" S OVRF=Z,Z=99999 Q
 Q
EOP I TXT["~FAX" D GR^ZAA02GFAXH1 D:'$D(^ZAA02GFAXF(FNT\10*10,.7)) FONT^ZAA02GFAXH G CVT0:FC=12,CVT0^ZAA02GFAXH6
 D CVT1 S PG=PG+1,TFXL=TFXL+FXL,PGL=SPGL,@ZAA02GFAXS@(PG-1)=FXL,FXL=0 Q:$D(OVRF)  G ZAA02GFAXH7
LINEL S TXT=$E(TXT,1,$L(TXT)-4) G LINE
 ;
LN ; CURRENTLY USING LM - NO ATTRIBUTES SUPPORTED
LM S TY=$D(@OVR@(FXL+LOV))>10*2+(TXT'?." ") I TY>1 S D=^(FXL+LOV) D:$P(D,";",3)'="" SET I TY>2 S LL1=LXB_^(FXL+LOV,1),LL2=LXB_^(2) S:$L(LL1)<(TXL*.75) TY=TY+1
 G @("LM"_TY)
LM0 S FXL=FXL+1,@ZAA02GFAXS@(PG,FXL)="" Q
LM1 G:$D(MF) LM1A S LX="",L=EOL,W=LMG,NT1=$TR(TXT,$E(AL,32,255),^ZAA02GFAXF(FNT,.1,TXR))
 F I=1:1:TXL S X=TR($A(NT1,I)),W=W+X I X["," S L=L_$S(W<32:wht(W),1:^ZAA02GFAXC(.1,W))_$P(X,",",2),W=$P(X,",",3) D:$L(L)>32 LSX
 S W=W+TXW G LM9
LM1A S LX="",L=EOL,W=LMG,NTX=$TR(TXT,$E(AL,32,255),^ZAA02GFAXF(FNT,.1,TXR)),NTY=$TR(TXT,$E(AL,32,255),^ZAA02GFAXF(FNT,.2,TXR))
 F I=1:1:TXL S X=^ZAA02GFAXF(MF,.3,$A(NTY,I)*256+$A(NTX,I)),W=W+X I X["," S L=L_$S(W<32:wht(W),1:^ZAA02GFAXC(.1,W))_$P(X,",",2),W=$P(X,",",3) D:$L(L)>32 LSX
 S W=W+TXW G LM9
LM2 S W=1728-OMG-D-CVR,LX=PEOL_$P(D,";",5,99),L=$P(D,";",4) G LM9
LM3 S TXL=$L(LL1),TXW=1728-LMG-(TXL*16)-CVR,TXT=TXT_$J("",TXL-($L(TXT)*.75))_"   " G LM5
LM4 S B="",$P(B,$C(0),TXL*.75-$L(LL1)+4)="",LL1=LL1_B,LL2=LL2_B
LM5 S (NT1,NT2,LX)="",L=EOL,W=LMG,OT1=$TR(TXT,$E(AL,32,255),^ZAA02GFAXF(FNT,.7,TXR)),OT2=$TR(TXT,$E(AL,32,255),^ZAA02GFAXF(FNT,.8,TXR))
 F I=1:4:$L(OT1)\4*4 S NT1=NT1_$E(OT1,I)_$C($A(OT1,I+1)\16+($A(OT2,I+1)*16))_$C($A(OT2,I+2)+($A(OT1,I+3)#16*16)),NT2=NT2_$C($A(OT2,I)+($A(OT1,I+1)#16*16))_$E(OT1,I+2)_$C($A(OT1,I+3)\16+($A(OT2,I+3)*16))
 ; S:$L(NT1)<$L(LL1) B="",$P(B,$C(0),$L(LL1)-$L(NT1)+1)="",NT1=NT1_B,NT2=$E(NT2_B_$C(0),1,$L(LL1))
 G @ORR
LM6 S NT1H=$TR(NT1,AL,HI),NT1L=$TR(NT1,AL,LO),NT2H=$TR(NT2,AL,HI),NT2L=$TR(NT2,AL,LO),LL1H=$TR(LL1,AL,HI),LL1L=$TR(LL1,AL,LO),LL2H=$TR(LL2,AL,HI),LL2L=$TR(LL2,AL,LO)
 F I=1:1:$L(NT1) D LM7
 S W=W+TXW G LM9
LM7 S X=^ZAA02GFAXC(.8,$A($TR($C($A(NT1H,I)*16+$A(LL1H,I)),AL,OR))*16+$A($TR($C($A(NT1L,I)*16+$A(LL1L,I)),AL,OR))),W=W+X I X["," S L=L_$S(W<32:wht(W),1:^ZAA02GFAXC(.1,W))_$P(X,",",2),W=$P(X,",",3) D:$L(L)>32 LSX
 S X=^ZAA02GFAXC(.8,$A($TR($C($A(NT2H,I)*16+$A(LL2H,I)),AL,OR))*16+$A($TR($C($A(NT2L,I)*16+$A(LL2L,I)),AL,OR))),W=W+X I X["," S L=L_$S(W<32:wht(W),1:^ZAA02GFAXC(.1,W))_$P(X,",",2),W=$P(X,",",3) D LSX:$L(L)>32
 Q
LM8 S NT1=$ZB(NT1,LL1,7),NT2=$ZB(NT2,LL2,7) F I=1:1:$L(NT1) D LMA
 G LM8B
LM8A S NT1=$ZBITOR($C($L(NT1))_NT1,$C($L(LL1))_LL1),NT2=$ZBITOR($C($L(NT2))_NT2,$C($L(LL2))_LL2) F I=2:1:$L(NT1)+1 D LMA
LM8B S W=W+TXW
LM9 S L=L_$S(W<32:wht(W),1:^ZAA02GFAXC(.1,W))_TRL,L=L_$E("00000000",1,-$L(L)#8) D LSX:$L(L)>32,LS,LE:LX[$C(16) S FXL=FXL+1,@ZAA02GFAXS@(PG,FXL)=LX Q
LMA S X=$A(NT1,I)+$A(NT2,I) I 'X!(X=510) S:X=510 L=L_$S(W<32:wht(W),1:^ZAA02GFAXC(.1,W))_"0000010111",W=0 S:'X W=W+16 D:$L(L)>32 LSX Q
 S X=^ZAA02GFAXC(.8,$A(NT1,I)),W=W+X I X["," S L=L_$S(W<32:wht(W),1:^ZAA02GFAXC(.1,W))_$P(X,",",2),W=$P(X,",",3) D:$L(L)>32 LSX
 S X=^ZAA02GFAXC(.8,$A(NT2,I)),W=W+X I X["," S L=L_$S(W<32:wht(W),1:^ZAA02GFAXC(.1,W))_$P(X,",",2),W=$P(X,",",3) D:$L(L)>32 LSX
 Q
 ;
SET S I=CVR X $P(D,";",3) S:$D(TXW) TXW=TXW-CVR+I Q
LS F i=1:8:$L(L)\8*8 S LX=LX_$C(B($E(L,i,i+3))+C($E(L,i+4,i+7)))
 S L=$E(L,$L(L)>7*(i+8),255) Q
LSX S LX=LX_$C(B($E(L,1,4))+C($E(L,5,8)))_$C(B($E(L,9,12))+C($E(L,13,16)))_$C(B($E(L,17,20))+C($E(L,21,24)))_$C(B($E(L,25,28))+C($E(L,29,32))),L=$E(L,33,255) Q
 ;
VIDEO S F=ZAA02G("gon"),C="",FNT(0)=FNT,(W,X)=0 F L=1:1:$L(TXT,F) S J=$P(TXT,F) D:J[XS V1 S C=C_$TR(J,CA,CB),J=$P($P(TXT,F,2,99),ZAA02G("gof")) D:J[XS V1 S TXT=$P(TXT,ZAA02G("gof"),2,99),C=C_$TR(J,CD,CE)
 S TXT=C Q
V1 I J[ZAA02G("fon") F T=2:1:$L(J,ZAA02G("fon")) S J=$P(J,ZAA02G("fon"))_" "_$P(J,ZAA02G("fof"),2,99)
 F T=1:1:$L(J,XS)-1 S I=$P(J,XS,2),E=$F(XL,$E(XS_I,1,XSL))\XSL S J=$P(J,XS)_$S(E:$C(0),1:"")_$E($P(J,XS,2,99),XSL,255) I E S X=$S(E=1:X>1*2+1,E=2:X>1*2,E=3:X#2+2,1:X#2),W=W+1,FNT(W)=FNT+X
 Q
LE F E=1:2:$L(LX,$C(16))-1*2 S $P(LX,$C(16),E)=$P(LX,$C(16),E)_$C(16)
 Q