RMPC6N ;DDC/KAW-RMPF*1.1*6 - SIEMENS [ 06/24/93  1:45 PM ]
 ;;1.1;RMPF;**6**;June 24, 1993
 W !!,"SIEMENS"
 F IX=1:1:5 S MD=$P($T(MODEL+IX),";",3) D
 .S MP=$O(^RMPF(791811,"B",MD,0))
 .I 'MP W !!,MD," does not exist in file 791811.  Components not added." Q
 .F IY=1:1 S ST=$T(COMP+IY) Q:ST=""  D
 ..S CS=$P(ST,";",IX+4) Q:CS=""
 ..S CP=$E($P(ST,";",3),1,30),CD=$P(ST,";",4),(CA,CX)=""
 ..F  S CA=$O(^RMPF(791811.2,"B",CP,CA)) Q:'CA  I $P(^RMPF(791811.2,CA,0),"^",3)=CD S CX=CA Q
 ..I 'CX W !!,CP," component not added." Q
 ..D SET1^RMPC6 W "."
 .F IZ=1:1:3 S ST=$T(BAT+IZ) D
 ..S BT=$P(ST,";",3)
 ..S BP=$O(^RMPF(791811.3,"B",BT,0)) I 'BP W !!,BT," battery not added." Q
 ..D SET2^RMPC6 W "."
 G ^RMPC6O
END K W,V,ST,POP,MP,MD,IX,IY,IZ,B,BP,BT,BX,CA,CP,CD,CS,CX,DFL,DKP,DMRG,%H,%I Q
MODEL ;;Siemens Models
 ;;LS-ITE
 ;;007-LP
 ;;007-HS
 ;;LS-CA
 ;;LS-MC
BAT ;;Batteries
 ;;ZA10
 ;;ZA13
 ;;ZA312
COMP ;;Components
 ;;ACTIVE TONE CONTROL;ATC;46.02;;46.02;46.02
 ;;AUTO GAIN CTRL WITH RESONANT PEAK CTRL;AGC/RPC;58.5
 ;;AUTO GAIN CONTROL INPUT;AGCI;33.54;33.54;33.54;33.54
 ;;GAIN CONTROL;GAIN;12.48;12.48;12.48;12.48
 ;;HYPOALLERGENIC SHELL;HYPO;15.6;15.6;15.6;15.6;15.6
 ;;OUTPUT CONTROL;LP;12.48;12.48;12.48;12.48
 ;;PROBE VENT;PV;12.48;12.48;12.48;12.48
 ;;RESONANT PEAK CONTROL;RPC;25.74;25.74;25.74;25.74
 ;;SOFT CANAL;SOFT;14.43;14.43
 ;;TELEPHONE COIL W/PREAMP;TC/P;32.76;32.76
 ;;TONE N-H;HC;12.48;12.48;12.48;12.48
 ;;TONE N/L;LCTC;12,48
 ;;SCREW SET VOLUME CONTROL;SSVC;12.48;12.48;12.48;12.48;12.48