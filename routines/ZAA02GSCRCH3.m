ZAA02GSCRCH3 ; COLUMBIA - INTERFACE MODULE
 ;
PATIENT ;  ASSUMES "K" SET TO HISTORY NUMBER
 S INP("MR")=K D ZAA02GSET D MR^ZAA02GSCRVW Q
 ;
PHYS ;  PHYSICIAL INQUIRY - ASSUME "DUZ" = HMO #
 D ZAA02GSET,DUZLKP D PRV^ZAA02GSCRVW Q
 ;
AUT ;  AUTHENTICATION ENTRY POINT - ASSUMES "DUZ" = HMO #
 D ZAA02GSET,DUZLKP D AUT^ZAA02GSCRVW Q
 ;
GEN ;  GENERAL INTERFACE - STARTS WITH CLEAR SCREEN
 D ZAA02GSET S FDOC=0 D ^ZAA02GSCRVW Q
 ;
SITE ;  SITE (DEPARTMENT) INTERFACE - ASSUMES "SITE" = DEPARTMENT CODE
 ;  THIS SHOWS REPORTS EXCLUSIVELY FOR SITE - CAN'T VIEW OTHERS
 D ZAA02GSET D SITE^ZAA02GSCRVW Q
 ;
 ;
DUZLKP ; CONVERT DUZ TO HMO FOR NOW UNTIL CONVERSION FILE CREATED
 S DUZ=$S($D(^ZAA02GPROVC(DUZ)):^(DUZ),1:DUZ) Q
 ;
 ;
ZAA02GSET D:'$D(^ZAA02G(0,"VT220I")) INIT S ZAA02GUSER="INQ",ZAA02GDEVICE="VT220I" D INIT^ZAA02GDEV Q
 Q
 ;
INIT N (A,B,C,J) S A="VT220",B=A_"I",C="" F J=0,.1,.3 F  S C=$O(^ZAA02G(J,A,C)) Q:C=""  S ^ZAA02G(J,B,C)=^(C)
 F  S C=$O(^ZAA02GWP(95,A,C)) Q:C=""  S ^ZAA02GWP(95,B,C)=^(C)
 S A=^ZAA02GWP(95,B,4),C=$E($P(A,"23~",2)),^(4)=$P(A,"21~")_"21~"_C_$P(A,"21~",2,9)
 S A=^ZAA02G(.3,B,0),C=$E($P(A,"23~",2)),^(0)=$P(A,"21~")_"21~"_C_$P(A,"21~",2,9)
 Q