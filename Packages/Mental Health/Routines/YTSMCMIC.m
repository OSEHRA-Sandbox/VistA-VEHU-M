YTSMCMIC ;BAL/KTL- MCMI4 ANSWERS SPECIAL HANDLING - INI ; 9/14/18 3:19pm
 ;;5.01;MENTAL HEALTH;**151**;Dec 30, 1994;Build 92
 ;
 ; MCMI4 Scoring
 ;
 ; Initialize arrays for scoring MCMI4
 ; Base Rate Score value (INIBRS)
 ; 
INIBRS ;
 ;Initialize arrays and variables to calculate Base Rate Scores
 ;
 N SCALCOD,STR
 S SCALCOD="X Disclosure"
 S YBRS(SCALCOD,"STR")="^^^^^^^0^2^5^7^10^12^15^17^19^21^23^25^28^30^33^35^37^39^41^43^45^46^47^48^49^50^52^54^56^58^60^61^62^63^64^65^66^67^68"
 S YBRS(SCALCOD,"STR")=YBRS(SCALCOD,"STR")_"^68^69^70^71^72^73^74^75^76^77^78^79^79^80^80^81^81^82^83^84^85^86^86^86^87^87^87^88^88"
 S YBRS(SCALCOD,"STR")=YBRS(SCALCOD,"STR")_"^88^89^89^89^90^90^90^91^91^91^92^92^93^93^94^94^95^95^96^96^96^97^97^98^98^99^99^100"
 S YBRS(SCALCOD,"STR")=YBRS(SCALCOD,"STR")_"^100^100^100^100^100^100^100^100^100^100^100^100"
 S SCALCOD="Y Desirability"
 S YBRS(SCALCOD,"STR")="0^5^10^15^20^25^30^35^40^45^50^55^60^63^66^69^72^75^78^81^85^89^93^97^100"
 S SCALCOD="Z Debasement"
 S YBRS(SCALCOD,"STR")="0^35^38^41^44^47^50^53^56^60^62^64^66^68^70^72^74^75^77^79^80^81^83^85^88^91^93^95^97^100^100"
 S SCALCOD="1 Schizoid"
 S YBRS(SCALCOD,"STR")="0^9^17^25^34^43^52^60^62^64^66^69^71^73^75^76^78^79^81^82^84^85^100^115"
 S SCALCOD="2A Avoidant"
 S YBRS(SCALCOD,"STR")="0^9^17^25^34^43^52^60^65^70^75^76^77^78^79^81^82^83^84^85^91^97^103^109^115"
 S SCALCOD="2B Melancholic"
 S YBRS(SCALCOD,"STR")="0^8^15^22^29^37^45^53^60^65^70^75^76^77^78^79^79^80^80^81^82^83^84^85^91^97^103^109^115"
 S SCALCOD="3 Dependent"
 S YBRS(SCALCOD,"STR")="0^10^20^30^40^50^60^64^68^72^75^76^78^79^81^82^84^85^90^95^100^105^110^115"
 S SCALCOD="4A Histrionic"
 S YBRS(SCALCOD,"STR")="0^6^11^16^21^26^31^37^43^49^54^60^62^65^67^69^72^75^77^80^83^85^90^95^100"
 S SCALCOD="4B Turbulent"
 S YBRS(SCALCOD,"STR")="0^6^12^18^24^30^36^42^48^54^60^61^63^65^67^68^69^71^73^74^75^78^82^85^93^100"
 S SCALCOD="5 Narcissistic"
 S YBRS(SCALCOD,"STR")="0^12^24^36^48^60^62^65^67^69^72^75^77^79^81^83^85^88^92^95^99^102^106^109^111^113^115"
 S SCALCOD="6A Antisocial"
 S YBRS(SCALCOD,"STR")="0^20^40^60^62^64^66^69^71^73^75^77^79^81^83^85^90^95^100^105^110^115"
 S SCALCOD="6B Sadistic"
 S YBRS(SCALCOD,"STR")="0^15^30^45^60^61^63^65^67^69^71^73^74^75^77^79^81^83^85^92^99^106^115"
 S SCALCOD="7 Compulsive"
 S YBRS(SCALCOD,"STR")="0^4^8^13^17^21^26^30^34^39^43^47^52^56^60^62^65^67^69^72^75^80^85^100"
 S SCALCOD="8A Negativistic"
 S YBRS(SCALCOD,"STR")="0^10^20^30^40^50^60^62^65^67^69^72^75^76^77^78^79^80^81^82^83^84^85^92^99^106^115"
 S SCALCOD="8B Masochistic"
 S YBRS(SCALCOD,"STR")="0^12^24^36^48^60^62^65^67^69^72^75^76^77^78^79^80^80^81^82^83^84^85^95^105^115"
 S SCALCOD="S Schizotypal"
 S YBRS(SCALCOD,"STR")="0^12^24^36^48^60^61^63^65^66^67^68^69^71^73^74^75^76^77^78^79^81^82^83^84^85^92^99^106^115"
 S SCALCOD="C Borderline"
 S YBRS(SCALCOD,"STR")="0^10^20^30^40^50^60^63^66^69^72^75^76^77^78^79^81^82^83^84^85^89^94^98^102^106^111^115"
 S SCALCOD="P Paranoid"
 S YBRS(SCALCOD,"STR")="0^15^30^45^60^62^64^66^69^71^73^75^76^78^79^80^81^82^84^85^91^97^103^109^115"
 S SCALCOD="A Generalized Anxiety"
 S YBRS(SCALCOD,"STR")="0^15^30^45^60^75^77^80^83^85^88^91^94^97^100^103^106^109^112^115"
 S SCALCOD="H Somatic Symptom"
 S YBRS(SCALCOD,"STR")="0^10^20^30^40^50^60^64^68^72^75^78^82^85^100^115"
 S SCALCOD="N Bipolar Spectrum"
 S YBRS(SCALCOD,"STR")="0^12^24^36^48^60^63^66^69^72^75^78^82^85^90^95^100^105^110^115"
 S SCALCOD="D Persistent Depression"
 S YBRS(SCALCOD,"STR")="0^7^14^20^26^33^40^47^54^60^61^63^65^67^69^71^73^74^75^77^80^83^85^91^97^103^109^115"
 S SCALCOD="B Alcohol Use"
 S YBRS(SCALCOD,"STR")="0^60^68^75^78^82^85^89^94^98^102^106^111^115"
 S SCALCOD="T Drug Use"
 S YBRS(SCALCOD,"STR")="0^60^62^65^67^69^72^75^77^80^83^85^89^94^98^102^106^111^115"
 S SCALCOD="R Post-Traumatic Stress"
 S YBRS(SCALCOD,"STR")="0^20^40^60^62^64^66^69^71^73^75^78^82^85^90^95^100^105^110^115"
 S SCALCOD="SS Schizophrenic Spectrum"
 S YBRS(SCALCOD,"STR")="0^9^17^25^34^43^52^60^61^63^64^65^66^67^68^69^71^73^74^75^77^80^83^85^92^99^106^115"
 S SCALCOD="CC Major Depression"
 S YBRS(SCALCOD,"STR")="0^12^24^36^48^60^64^68^72^75^77^79^80^81^83^85^88^92^95^99^102^106^109^112^115"
 S SCALCOD="PP Delusional"
 S YBRS(SCALCOD,"STR")="0^60^62^64^66^68^70^72^74^75^76^78^79^81^82^84^85^95^105^115"
 S SCALCOD="1.1 Interpersonally Unengaged"
 S YBRS(SCALCOD,"STR")="0^30^60^64^68^72^75^80^85^100"
 S SCALCOD="1.2 Meager Content"
 S YBRS(SCALCOD,"STR")="0^20^40^60^64^68^72^75^85^100"
 S SCALCOD="1.3 Temperamentally Apathetic"
 S YBRS(SCALCOD,"STR")="0^30^60^64^68^72^75^80^85^100"
 S SCALCOD="2A.1 Interpersonally Aversive"
 S YBRS(SCALCOD,"STR")="0^20^40^60^68^75^78^82^85"
 S SCALCOD="2A.2 Alienated Self-Image"
 S YBRS(SCALCOD,"STR")="0^30^60^65^70^75^78^82^85^100"
 S SCALCOD="2A.3 Vexatious Content"
 S YBRS(SCALCOD,"STR")="0^30^60^68^75^77^80^83^85^100"
 S SCALCOD="2B.1 Cognitively Fatalistic"
 S YBRS(SCALCOD,"STR")="0^20^40^60^65^70^75^80^85^100"
 S SCALCOD="2B.2 Worthless Self-Image"
 S YBRS(SCALCOD,"STR")="0^60^65^70^75^78^82^85^92^100"
 S SCALCOD="2B.3 Temperamentally Woeful"
 S YBRS(SCALCOD,"STR")="0^30^60^65^70^75^78^82^85^100"
 S SCALCOD="3.1 Expressively Puerile"
 S YBRS(SCALCOD,"STR")="0^20^40^60^65^70^75^80^85^100"
 S SCALCOD="3.2 Interpersonally Submissive"
 S YBRS(SCALCOD,"STR")="0^60^65^70^75^80^85^100"
 S SCALCOD="3.3 Inept Self-Image"
 S YBRS(SCALCOD,"STR")="0^30^60^65^70^75^78^82^85^100"
 S SCALCOD="4A.1 Expressively Dramatic"
 S YBRS(SCALCOD,"STR")="0^60^65^70^75^80^85^100"
 S SCALCOD="4A.2 Interpersonally Attention-Seeking"
 S YBRS(SCALCOD,"STR")="0^12^24^36^48^60^65^70^75^80^85"
 S SCALCOD="4A.3 Temperamentally Fickle"
 S YBRS(SCALCOD,"STR")="0^12^24^36^48^60^64^68^72^75^78^82^85"
 S SCALCOD="4B.1 Expressively Impetuous"
 S YBRS(SCALCOD,"STR")="0^20^40^60^65^70^75^85^100"
 S SCALCOD="4B.2 Interpersonally High-Spirited"
 S YBRS(SCALCOD,"STR")="0^15^30^45^60^65^70^75^85^100"
 S SCALCOD="4B.3 Exalted Self-Image"
 S YBRS(SCALCOD,"STR")="0^15^30^45^60^65^70^75^85"
 S SCALCOD="5.1 Interpersonally Exploitive"
 S YBRS(SCALCOD,"STR")="0^30^60^65^70^75^80^85^92^100"
 S SCALCOD="5.2 Cognitively Expansive"
 S YBRS(SCALCOD,"STR")="0^12^24^36^48^60^65^70^75^85^100"
 S SCALCOD="5.3 Admirable Self-Image"
 S YBRS(SCALCOD,"STR")="0^60^68^75^80^85^90^95^100"
 S SCALCOD="6A.1 Interpersonally Irresponsible"
 S YBRS(SCALCOD,"STR")="0^30^60^65^70^75^80^85^100"
 S SCALCOD="6A.2 Autonomous Self-Image"
 S YBRS(SCALCOD,"STR")="0^30^60^65^70^75^80^85^90^95^100"
 S SCALCOD="6A.3 Acting-Out Dynamics"
 S YBRS(SCALCOD,"STR")="0^60^64^68^72^75^78^82^85^92^100"
 S SCALCOD="6B.1 Expressively Precipitate"
 S YBRS(SCALCOD,"STR")="0^30^60^64^68^72^75^78^82^85^92^100"
 S SCALCOD="6B.2 Interpersonally Abrasive"
 S YBRS(SCALCOD,"STR")="0^60^64^68^72^75^85^100"
 S SCALCOD="6B.3 Eruptive Architecture"
 S YBRS(SCALCOD,"STR")="0^60^64^68^72^75^85^100"
 S SCALCOD="7.1 Expressively Disciplined"
 S YBRS(SCALCOD,"STR")="0^15^30^45^60^65^70^75^85"
 S SCALCOD="7.2 Cognitively Constricted"
 S YBRS(SCALCOD,"STR")="0^12^24^36^48^60^64^68^72^75^80^85^100"
 S SCALCOD="7.3 Reliable Self-Image"
 S YBRS(SCALCOD,"STR")="0^10^20^30^40^50^60^68^75^85"
 S SCALCOD="8A.1 Expressively Embittered"
 S YBRS(SCALCOD,"STR")="0^60^65^70^75^77^80^83^85^100"
 S SCALCOD="8A.2 Discontented Self-Image"
 S YBRS(SCALCOD,"STR")="0^20^40^60^64^68^72^75^78^82^85^100"
 S SCALCOD="8A.3 Temperamentally Irritable"
 S YBRS(SCALCOD,"STR")="0^60^64^68^72^75^77^80^83^85^100"
 S SCALCOD="8B.1 Undeserving Self-Image"
 S YBRS(SCALCOD,"STR")="0^30^60^62^65^67^69^72^75^78^82^85^100"
 S SCALCOD="8B.2 Inverted Architecture"
 S YBRS(SCALCOD,"STR")="0^30^60^64^68^72^75^80^85^100"
 S SCALCOD="8B.3 Temperamentally Dysphoric"
 S YBRS(SCALCOD,"STR")="0^24^36^48^60^65^70^75^80^85"
 S SCALCOD="S.1 Cognitively Circumstantial"
 S YBRS(SCALCOD,"STR")="0^20^40^60^63^66^69^72^75^85"
 S SCALCOD="S.2 Estranged Self-Image"
 S YBRS(SCALCOD,"STR")="0^30^60^62^64^66^69^71^73^75^85^100"
 S SCALCOD="S.3 Chaotic Content"
 S YBRS(SCALCOD,"STR")="0^60^63^66^69^72^75^78^82^85^92^100"
 S SCALCOD="C.1 Uncertain Self-Image"
 S YBRS(SCALCOD,"STR")="0^30^60^64^68^72^75^80^85"
 S SCALCOD="C.2 Split Architecture"
 S YBRS(SCALCOD,"STR")="0^30^60^63^66^69^72^75^78^82^85^100"
 S SCALCOD="C.3 Temperamentally Labile"
 S YBRS(SCALCOD,"STR")="0^30^60^64^68^72^75^78^82^85^100"
 S SCALCOD="P.1 Expressively Defensive"
 S YBRS(SCALCOD,"STR")="0^30^60^64^68^72^75^80^85^100"
 S SCALCOD="P.2 Cognitively Mistrustful"
 S YBRS(SCALCOD,"STR")="0^60^65^70^75^80^85^100"
 S SCALCOD="P.3 Projection Dynamics"
 S YBRS(SCALCOD,"STR")="0^60^65^70^75^77^80^83^85^92^100"
 Q
