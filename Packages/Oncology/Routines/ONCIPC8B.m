ONCIPC8B ;Hines OIFO/GWB - Primary Intracranial/CNS Tumors PCE Study ;05/01/00
 ;;2.2;ONCOLOGY;**1**;Jul 31, 2013;Build 8
 ;Print (continued)
III S TABLE="FIRST COURSE OF TREATMENT"
 I IOST'?1"C".E W ! I ($Y'<(LIN-4)) D HEAD^ONCIPC0
 K LINE S $P(LINE,"-",25)="-"
 W !?4,TABLE,!?4,LINE
 D P Q:EX=U
 S D0=ONCONUM D DFC^ONCOCOM S DOFCT=Y
 W !,"36. PROTOCOL PARTICIPATION........: ",$$GET1^DIQ(165.5,IE,1312)
 D P Q:EX=U
 W !,"37. PROTOCOL PHASE................: ",$$GET1^DIQ(165.5,IE,1313)
 D P Q:EX=U
 W !,"38. DATE OF FIRST COURSE TREATMENT: ",DOFCT
 D P Q:EX=U
 W !,"39. DATE OF INPATIENT ADMISSION...: ",$$GET1^DIQ(165.5,IE,1)
 D P Q:EX=U
 W !,"40. DATE OF INPATIENT DISCHARGE...: ",$$GET1^DIQ(165.5,IE,1.1)
 D P Q:EX=U
 I IOST?1"C".E W ! K DIR S DIR(0)="E" D ^DIR Q:'Y  D HEAD^ONCIPC0 G S
 W !
 D P Q:EX=U
S W !?4,"SURGERY",!?4,"-------"
 D P Q:EX=U
 W !?4,"NON CANCER-DIRECTED SURGERY"
 D P Q:EX=U
 W !?4,"---------------------------"
 D P Q:EX=U
 W !,"41. DATE OF NON CANCER-DIRECTED"
 D P Q:EX=U
 W !,"     SURGERY......................: ",$$GET1^DIQ(165.5,IE,58.3)
 D P Q:EX=U
 W !
 D P Q:EX=U
 W !,"42. DIAGNOSTIC/EVALUATIVE/PALLIATIVE (NON CANCER-DIRECTED) SURGERY:"
 D P Q:EX=U
 W !,"     NONE, NO NON CA-DIRECTED"
 D P Q:EX=U
 W !,"      SURGICAL PROCEDURE..........: ",$$GET1^DIQ(165.5,IE,1314)
 D P Q:EX=U
 W !,"     VENTRICULOSTOMY, OR EXTERNAL"
 D P Q:EX=U
 W !,"      VENTRICULAR DRAIN...........: ",$$GET1^DIQ(165.5,IE,1315)
 D P Q:EX=U
 W !,"     CSF SHUNT,"
 D P Q:EX=U
 W !,"      VENTRICULOPERITONEAL........: ",$$GET1^DIQ(165.5,IE,1316)
 D P Q:EX=U
 W !,"     CSF SHUNT,"
 D P Q:EX=U
 W !,"      THIRD VENTRICULOSTOMY.......: ",$$GET1^DIQ(165.5,IE,1317)
 D P Q:EX=U
 W !,"     CSF SHUNT,"
 D P Q:EX=U
 W !,"      OTHER.......................: ",$$GET1^DIQ(165.5,IE,1318)
 D P Q:EX=U
 W !,"     STEREOTACTIC BIOPSY..........: ",$$GET1^DIQ(165.5,IE,1319)
 D P Q:EX=U
 W !,"     OPEN BRAIN BIOPSY............: ",$$GET1^DIQ(165.5,IE,1320)
 D P Q:EX=U
 W !,"     OPEN BIOPSY OF SPINAL CORD"
 D P Q:EX=U
 W !,"      TUMOR.......................: ",$$GET1^DIQ(165.5,IE,1321)
 D P Q:EX=U
 W !,"     LAMINECTOMY FOR SPINAL CORD"
 D P Q:EX=U
 W !,"      TUMOR, W/O TUMOR RESECTION,"
 D P Q:EX=U
 W !,"       W/O OPENING DURA...........: ",$$GET1^DIQ(165.5,IE,1322)
 D P Q:EX=U
 W !,"     LAMINECTOMY FOR SPINAL CORD"
 D P Q:EX=U
 W !,"      TUMOR, W/O TUMOR RESECTION,"
 D P Q:EX=U
 W !,"       W OPENING DURA.............: ",$$GET1^DIQ(165.5,IE,1323)
 D P Q:EX=U
 W !,"     SURGERY, NOS.................: ",$$GET1^DIQ(165.5,IE,1324)
 D P Q:EX=U
 W !,"     UNKNOWN IF SURGERY DONE......: ",$$GET1^DIQ(165.5,IE,1325)
 D P Q:EX=U
 I IOST?1"C".E W ! K DIR S DIR(0)="E" D ^DIR Q:'Y  D HEAD^ONCIPC0 G CDS
 W !
 D P Q:EX=U
CDS W !?4,"CANCER-DIRECTED SURGERY"
 D P Q:EX=U
 W !?4,"-----------------------"
 D P Q:EX=U
 W !,"43. DATE OF CA-DIRECTED SURGERY...: ",$$GET1^DIQ(165.5,IE,50)
 D P Q:EX=U
 W !,"44. SURGICAL APPROACH.............: ",$$GET1^DIQ(165.5,IE,1326)
 D P Q:EX=U
 W !,"45. EXTENT OF SURGICAL RESECTION..: ",$$GET1^DIQ(165.5,IE,1327)
 D P Q:EX=U
 W !,"46. SIZE OF RESIDUAL PRIMARY TUMOR"
 D P Q:EX=U
 W !,"     AFTER CA-DIR SURGERY.........: ",$$GET1^DIQ(165.5,IE,1328)
 D P Q:EX=U
 W !,"47. SIZE OF RESIDUAL PRIMARY TUMOR"
 D P Q:EX=U
 W !,"     AFTER CA-DIR SURGERY (SOURCE): ",$$GET1^DIQ(165.5,IE,1329)
 D P Q:EX=U
 W !
 D P Q:EX=U
 W !,"48. SURGICAL COMPLICATIONS/POST SURGICAL EVENTS:"
 D P Q:EX=U
 W !,"     ANESTHETIC PROBLEM...........: ",$$GET1^DIQ(165.5,IE,1330)
 D P Q:EX=U
 W !,"     HEMORRHAGE AT OPERATIVE SITE.: ",$$GET1^DIQ(165.5,IE,1331)
 D P Q:EX=U
 W !,"     SEIZURE......................: ",$$GET1^DIQ(165.5,IE,1332)
 D P Q:EX=U
 W !,"     INFECTION(S).................: ",$$GET1^DIQ(165.5,IE,1333)
 D P Q:EX=U
 W !,"     DVT (DEEP VENOUS THROMBOSIS).: ",$$GET1^DIQ(165.5,IE,1334)
 D P Q:EX=U
 W !,"     PERSISTENT NEUROLOGICAL"
 D P Q:EX=U
 W !,"      WORSENING > 4 DAYS POST-OP..: ",$$GET1^DIQ(165.5,IE,1335)
 D P Q:EX=U
 W !,"     OTHER........................: ",$$GET1^DIQ(165.5,IE,360)
 D P Q:EX=U
 W !
 D P Q:EX=U
 W !,"49. REASON FOR NO SURGERY.........: ",$$GET1^DIQ(165.5,IE,58)
 D P Q:EX=U
 I IOST?1"C".E W ! K DIR S DIR(0)="E" D ^DIR Q:'Y  D HEAD^ONCIPC0 G R
 W !
 D P Q:EX=U
R W !?4,"RADIATION THERAPY",!?4,"-----------------"
 D P Q:EX=U
 W !,"50. RADIATION THERAPY.............: ",$$GET1^DIQ(165.5,IE,1345)
 D P Q:EX=U
 W !,"51. DATE RADIATION STARTED........: ",$$GET1^DIQ(165.5,IE,51)
 D P Q:EX=U
 W !,"52. DATE RADIATION ENDED..........: ",$$GET1^DIQ(165.5,IE,361)
 D P Q:EX=U
 W !,"53. TOTAL RADIATION DOSE (cGy)....: ",$$GET1^DIQ(165.5,IE,1336)
 D P Q:EX=U
 W !,"54. NUMBER OF TREATMENTS TO THIS"
 D P Q:EX=U
 W !,"     VOLUME.......................: ",$$GET1^DIQ(165.5,IE,56)
 D P Q:EX=U
 W !,"55. TYPE OF EXT BEAM RADIATION....: ",$$GET1^DIQ(165.5,IE,1337)
 D P Q:EX=U
 W !,"56. INTERSTITIAL RAD/BRACHYTHERAPY: ",$$GET1^DIQ(165.5,IE,1338)
 D P Q:EX=U
 W !,"57. STEREOTACTIC RADIOSURGERY.....: ",$$GET1^DIQ(165.5,IE,1339)
 D P Q:EX=U
 W !,"58. RADIATION/SURGERY SEQUENCE....: ",$$GET1^DIQ(165.5,IE,51.3)
 D P Q:EX=U
 W !
 D P Q:EX=U
 W !,"59. RADIATION COMPLICATIONS:"
 D P Q:EX=U
 W !,"     SKIN REACTIONS...............: ",$$GET1^DIQ(165.5,IE,1340)
 D P Q:EX=U
 W !,"     ANOREXIA.....................: ",$$GET1^DIQ(165.5,IE,1341)
 D P Q:EX=U
 W !,"     NAUSEA OR VOMITING...........: ",$$GET1^DIQ(165.5,IE,1342)
 D P Q:EX=U
 W !,"     FATIGUE......................: ",$$GET1^DIQ(165.5,IE,1343)
 D P Q:EX=U
 W !,"     NEUROLOGIC WORSENING.........: ",$$GET1^DIQ(165.5,IE,1344)
 D P Q:EX=U
 W !
 D P Q:EX=U
 W !,"60. REASON FOR NO RADIATION.......: ",$$GET1^DIQ(165.5,IE,75)
 D P Q:EX=U
 I IOST?1"C".E W ! K DIR S DIR(0)="E" D ^DIR Q:'Y  D HEAD^ONCIPC0 G C
 W !
 D P Q:EX=U
C D ^ONCIPC8C
 Q
P ;Print
 I ($Y'<(LIN-1)) D  Q:EX=U
 .I IOST?1"C".E W ! K DIR S DIR(0)="E" D ^DIR I 'Y S EX=U Q
 .D HEAD^ONCIPC0 Q
 Q