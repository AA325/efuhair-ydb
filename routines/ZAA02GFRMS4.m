ZAA02GFRMS4 ;PG&A,ZAA02G-FORM,2.62,SAMPLER, PART 5;26JUL90 11:58A
 ;Copyright (C) 1986, Patterson, Gray & Associates, Inc.
 ;
BEG F I=0:1 S A=$P($T(A+I),";",2,255) Q:A=""  F J=1:3 S B=$P(A,",",J) Q:B=""  S ^ZAA02GFORMS(3,B,$P(A,",",J+1))=$P(A,",",J+2)
 F A=98:1:100 S X=$P($T(@A),";",2,999) F I=1:1 S Y=$P(X,"\",I) Q:Y=""  S ^ZAA02GFORMS(A,$P(Y,";"))=$P(Y,";",2)
 F A="NAME","RNAME" K ^ZAA02GFORMS("H",A) F I=0:1 S X=$T(@A+I) Q:X'[";"  S ^ZAA02GFORMS("H",A,I)=$P(X,";",2,99)
 Q
 ;
A ;6,BC,BLUE CROSS,6,CH,CHARITY,6,CO,COMMERCIAL,6,EM,EMPLOYEE,6,HF,HOSPITAL FAMILY,6,IG,INTERGROUP,6,MC,MEDICARE,6,OT,OTHER,6,PA,PUBLIC AID,6,SP,SELF PAY,6,ST,STAFF,6,TP,THIRD PARTY,6,UN,UNKNOWN,6,WC,WORKMANS COMP,
 ;7,ER,EMERGENCY ROOM,7,NH,EXTENDED CARE FACILITY,7,OT,OTHER,7,OTH,OTHER,7,SC,SCHEDULED,7,TR,TRANSFERRED,
 ;9,D,DIVORCED,9,M,MARRIED,9,S,SINGLE,9,SEP,SEPARATED,9,W,WIDOWED,
 ;11,BA,BAPTIST,11,BR,BRETHREN,11,BU,BUDDHIST,11,C,CATHOLIC,11,EP,EPISCOPAL,11,H,HINDU,11,J,JEWISH,11,JW,JEHOVAH'S WITNESS,11,L,LUTHERAN,11,MO,MOHAMMEDAN,11,N,NOT STATED,11,O,OTHER,11,OR,ORTHODOX,11,P,PROTESTANT,
 ;11,PB,PRESBYTERIAN,11,SD,SEVENTH-DAY ADVENT.,
 ;12,A,AUNT,12,B,BROTHER,12,BL,BROTHER-IN-LAW,12,C,COUSIN,12,D,DAUGHTER,12,DL,DAUGHTER-IN-LAW,12,F,FATHER,12,FL,FATHER-IN-LAW,12,FR,FRIEND,12,FS,FORMER SPOUSE,12,G,GUARDIAN,12,GD,GRANDDAUGHTER,12,GF,GRANDFATHER,
 ;12,GM,GRANDMOTHER,12,GS,GRANDSON,12,H,HUSBAND,12,M,MOTHER,12,ML,MOTHER-IN-LAW,12,NE,NEPHEW,12,NI,NIECE,12,O,OTHER,12,S,SISTER,12,SE,SELF,12,SI,SISTER,12,SIL,SISTER-IN-LAW,12,SO,SON,12,SOL,SON-IN-LAW,
 ;12,TR,TRUSTEE,12,U,UNCLE,12,W,WIFE,
 ;13,A,ASIAN,13,AI,AMER INDIAN,13,B,BLACK,13,C,CAUCASIAN,13,O,OTHER,13,OR,ORIENTAL,13,S,SPANISH ORIGIN,13,SP,SPANISH,13,W,WHITE,
 ;
B ;
98 ;45.1;ENTEROTOMY\46.1;COLOSTOMY\47.1;APPENDECTOMY\50.1;HEPATOMY\51.7;REPAIR OF BILE DUCTS\52.1;PANCREATOTOMY\54.1;LAPEROTOMY\55.5;COMPLETE NEPHRECTOMY
99 ;100.1;TOO MUCH TV\101.34;RADIO TALK SHOWS\001;CHOLERA\002.0;TYPHOID FEVER\003.0;SALMONELLA ENTERITIS\005.1;BOTULISM\006.5;AMEBIC BRAIN ABSCESS\008.1;ARIZONA ENTERITIS\010;PRIMARY TB INFECTION\
100 ;123;SPOCK,B\134;WELBY,M\234;KILDAIRE,J\321;SMITH,L\345;SALK,J\456;MASTERS,W\567;FREUD,S\789;HIPPOCRATES,FRED\901;SALMONELLA,D\
 ;
NAME ;3
 ;Enter the first name of the individual.
 ;It should be in the format of Upper case followed by lower case.
 ;For example, "John" or "Mary Beth" are valid first names.
 ;
RNAME ;4
 ;Enter the name of the person or organization
 ;who should be contacted in the event of an
 ;an emergency.  The name format should be in the format
 ;Last,First.   For example: Doe,John
 ;