ENXVIEN ;WIRMFO/SAB- ENVIRONMENTAL CHECK ;4/29/97
 ;;7.0;ENGINEERING;**39**;Aug 17, 1993
 ;
 Q:'$G(XPDENV)  ; only during install package option
 ;
 S X="ENUTL" X ^%ZOSF("TEST") I '$T D
 . S XPDQUIT=2
 . W !!,"Patch EN*7*35 does not appear to have been installed."
 . W !,"It must be installed prior to installation of patch EN*7*39."
 . W !,"Please install patch EN*7*35 before installing this patch.",!
 Q
 ;ENXVIEN