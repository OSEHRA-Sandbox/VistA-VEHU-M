YTSMPIRD ;SLC/KCM - Data for Scoring MMPI-2-RF ; 10/24/2015
 ;;5.01;MENTAL HEALTH;**123,142**;Dec 30, 1994;Build 14
 ;
BLDRAW ; Build tables for raw scores
 ; T("raw",scale,qId)=#^key {^#^key^+-^CBS^Qa^Qb^Kb^Qc^Kc}
 ;   where qId is question number or #key#key for pair
 ;         +- indicates add or subtract         (for TRIN-r)
 ;         CBS indicates common, both, or skip  (for VRIN-r)
 ;         Qa is common question                (for VRIN-r)
 ;         Qb,Kb,Qc,Kc are other items in pair  (for VRIN-r) 
 ;
 ; build tables for raw scores
 N I,J,X,SCALE,ROW,QID,RAW,DFLT,SCORE
 K T  ; start fresh
 F I=1:1 S X=$P($T(TBLRAW+I^YTSMPI2T),";;",2,99) Q:X="zzzzz"  D
 .S SCALE=$P(X,";"),X=$P(X,";",2)
 .F J=1:1 S ROW=$P(X,"~",J) Q:'$L(ROW)  D
 ..S QID=$S(+$P(ROW,U,3):$TR($P(ROW,U,1,4),U,""),1:+ROW)
 ..S T("raw",SCALE,QID)=ROW
 ; build tables for scale information
 F I=1:1 S X=$P($T(TBLINFO+I^YTSMPI2T),";;",2,99) Q:X="zzzzz"  D
 .S SCALE=$P(X,U)
 .S T("info",SCALE,"count")=$P(X,U,2)
 .S T("info",SCALE,"adjust")=+$P(X,U,3)
 ; build tables for T-Scores
 F I=1:1 S X=$P($T(TBLTSCOR+I),";;",2,99) Q:X="zzzzz"  D
 .S SCALE=$P(X,";"),DFLT=$P(X,";",2),X=$P(X,";",3,999)
 .S T("tscore",SCALE,"default")=DFLT
 .F J=1:1 S ROW=$P(X,"~",J) Q:'$L(ROW)  D
 ..S RAW=$P(ROW,U),SCORE=$P(ROW,U,2)
 ..S T("tscore",SCALE,RAW)=SCORE
 Q
TBLTSCOR ;; T-Score tables
 ;;VRIN-r;120;0^34~1^39~2^43~3^48~4^53~5^58~6^63~7^68~8^73~9^77~10^82~11^87~12^92~13^97~14^102~15^106~16^111~17^116~
 ;;TRIN-r;120;2^118~3^110~4^103~5^95~6^88~7^80~8^73~9^65~10^57~11^50~12^57~13^65~14^73~15^80~16^88~17^95~18^103~19^110~20^118~
 ;;F-r;120;0^42~1^47~2^51~3^56~4^61~5^65~6^70~7^74~8^79~9^83~10^88~11^92~12^97~13^101~14^106~15^111~16^115~
 ;;Fp-r;120;0^42~1^51~2^59~3^68~4^77~5^85~6^94~7^102~8^111~9^119~
 ;;Fs;120;0^42~1^50~2^58~3^66~4^74~5^83~6^91~7^99~8^107~9^115~
 ;;FBS-r;120;0^26~1^29~2^32~3^35~4^39~5^42~6^45~7^48~8^51~9^54~10^58~11^61~12^64~13^67~14^70~15^73~16^77~17^80~18^83~19^86~20^89~21^92~22^96~23^99~24^102~25^105~26^108~27^111~28^115~29^118~30^120~
 ;;RBS;120;0^29~1^33~2^38~3^42~4^46~5^50~6^54~7^59~8^63~9^67~10^71~11^76~12^80~13^84~14^88~15^92~16^97~17^101~18^105~19^109~20^114~21^118~22^120~23^120~24^120~25^120~26^120~27^120~28^120~
 ;;L-r;120;0^37~1^42~2^47~3^52~4^57~5^62~6^66~7^71~8^76~9^81~10^86~11^91~12^95~13^100~14^105~
 ;;K-r;120;0^24~1^28~2^31~3^35~4^38~5^42~6^45~7^48~8^52~9^55~10^59~11^62~12^66~13^69~14^72~
 ;;EID;120;0^30~1^33~2^36~3^38~4^41~5^43~6^45~7^46~8^48~9^49~10^51~11^52~12^53~13^54~14^56~15^57~16^58~17^59~18^61~19^62~20^64~21^65~22^66~23^68~24^69~25^71~26^72~27^73~
 ;;EID;120;28^75~29^76~30^78~31^79~32^80~33^82~34^83~35^85~36^86~37^87~38^89~39^90~40^92~41^93~
 ;;THD;100;0^39~1^48~2^53~3^57~4^60~5^63~6^67~7^70~8^74~9^77~10^81~11^84~12^88~13^91~14^94~15^98~
 ;;BXD;0;0^32~1^36~2^40~3^43~4^46~5^48~6^50~7^53~8^55~9^57~10^60~11^63~12^65~13^68~14^70~15^73~16^76~17^78~18^81~19^84~20^86~21^89~22^92~23^94~
 ;;RCd;0;0^37~1^42~2^46~3^49~4^51~5^53~6^54~7^55~8^57~9^58~10^60~11^62~12^64~13^66~14^67~15^69~16^71~17^73~18^75~19^77~20^79~21^81~22^83~23^85~24^86~
 ;;RC1;100;0^36~1^42~2^47~3^51~4^54~5^56~6^59~7^61~8^63~9^65~10^68~11^70~12^72~13^74~14^77~15^79~16^81~17^84~18^86~19^88~20^90~21^93~22^95~23^97~24^99~
 ;;RC2;0;0^34~1^38~2^42~3^46~4^50~5^54~6^58~7^61~8^65~9^69~10^73~11^76~12^80~13^84~14^88~15^92~16^95~17^99~
 ;;RC3;0;0^34~1^38~2^41~3^43~4^46~5^47~6^49~7^51~8^54~9^57~10^61~11^65~12^70~13^74~14^79~15^83~
 ;;RC4;0;0^34~1^39~2^43~3^46~4^49~5^52~6^54~7^57~8^59~9^62~10^65~11^68~12^71~13^73~14^76~15^79~16^82~17^85~18^87~19^90~20^93~21^96~22^99~
 ;;RC6;100;0^43~1^56~2^61~3^66~4^70~5^75~6^80~7^84~8^89~9^94~10^98~
 ;;RC7;0;0^34~1^38~2^41~3^44~4^46~5^48~6^50~7^52~8^53~9^55~10^57~11^60~12^62~13^65~14^68~15^70~16^73~17^75~18^78~19^81~20^83~21^86~22^88~23^91~24^94~
 ;;RC8;100;0^39~1^47~2^52~3^56~4^59~5^63~6^66~7^70~8^73~9^76~10^80~11^83~12^86~13^90~14^93~15^96~
 ;;RC9;0;0^25~1^28~2^31~3^33~4^36~5^38~6^40~7^42~8^43~9^45~10^46~11^48~12^50~13^51~14^53~15^56~16^58~17^61~18^63~19^66~20^69~21^72~22^74~23^77~24^80~25^83~26^85~27^88~28^91~
 ;;MLS;0;0^38~1^46~2^52~3^57~4^63~5^69~6^75~7^81~8^87~
 ;;HPC;0;0^42~1^53~2^59~3^65~4^72~5^78~6^85~
 ;;NUC;0;0^41~1^53~2^59~3^65~4^70~5^75~6^80~7^86~8^91~9^96~10^100~
 ;;GIC;0;0^46~1^64~2^72~3^80~4^88~5^96~
 ;;SUI;100;0^45~1^66~2^79~3^91~
 ;;HLP;0;0^40~1^52~2^60~3^69~4^79~5^88~
 ;;SFD;0;0^42~1^52~2^56~3^65~4^76~
 ;;NFC;0;0^36~1^43~2^48~3^51~4^54~5^58~6^64~7^69~8^75~9^80~
 ;;COG;0;0^40~1^50~2^54~3^58~4^64~5^69~6^75~7^80~8^86~9^91~10^96~
 ;;STW;0;0^36~1^43~2^47~3^52~4^57~5^65~6^73~7^81~
 ;;AXY;0;0^44~1^59~2^70~3^80~4^91~5^100~
 ;;ANP;0;0^39~1^47~2^51~3^54~4^59~5^66~6^73~7^80~
 ;;BRF;100;0^43~1^56~2^63~3^71~4^79~5^86~6^94~
 ;;MSF;0;0^36~1^42~2^46~3^48~4^51~5^54~6^59~7^65~8^71~9^78~
 ;;JCP;0;0^40~1^50~2^57~3^63~4^70~5^77~6^84~
 ;;SUB;0;0^41~1^50~2^55~3^61~4^69~5^77~6^85~7^93~
 ;;AGG;0;0^37~1^45~2^51~3^56~4^61~5^67~6^73~7^79~8^86~9^92~
 ;;ACT;0;0^33~1^39~2^44~3^48~4^53~5^59~6^67~7^75~8^83~
 ;;FML;0;0^37~1^44~2^49~3^53~4^58~5^63~6^68~7^74~8^79~9^84~10^90~
 ;;IPP;0;0^34~1^39~2^43~3^46~4^49~5^52~6^56~7^62~8^68~9^74~10^81~
 ;;SAV;0;0^36~1^43~2^47~3^50~4^52~5^55~6^59~7^65~8^70~9^75~10^80~
 ;;SHY;0;0^37~1^44~2^47~3^50~4^52~5^57~6^66~7^75~
 ;;DSF;0;0^44~1^58~2^68~3^78~4^88~5^98~6^100~
 ;;AES;0;0^33~1^39~2^45~3^50~4^56~5^62~6^68~7^73~
 ;;MEC;0;0^38~1^43~2^47~3^52~4^56~5^61~6^65~7^69~8^74~9^78~
 ;;AGGR;0;0^28~1^32~2^35~3^37~4^39~5^41~6^43~7^45~8^47~9^50~10^53~11^56~12^60~13^65~14^69~15^74~16^78~17^83~18^88~
 ;;PSYC;100;0^38~1^47~2^52~3^56~4^59~5^63~6^66~7^69~8^73~9^76~10^79~11^83~12^86~13^89~14^93~15^96~
 ;;DISC;0;0^31~1^35~2^38~3^41~4^44~5^47~6^49~7^51~8^54~9^56~10^59~11^63~12^66~13^69~14^72~15^75~16^79~17^82~18^85~19^88~20^92~
 ;;NEGE;0;0^32~1^36~2^40~3^42~4^45~5^47~6^49~7^51~8^53~9^56~10^59~11^62~12^66~13^69~14^73~15^77~16^80~17^84~18^88~19^91~20^95~
 ;;INTR;0;0^32~1^36~2^39~3^42~4^45~5^47~6^49~7^52~8^54~9^57~10^60~11^64~12^67~13^70~14^74~15^77~16^80~17^83~18^87~19^90~20^93~
 ;;zzzzz
 Q
