HLOT ;IRMFO-ALB/CJM - Services provided by the transport layer;03/24/2004  14:43 ;02/18/2011
 ;;1.6;HEALTH LEVEL SEVEN;**126,131,139,146,155**;Oct 13, 1995;Build 4
 ;Per VHA Directive 2004-038, this routine should not be modified.
 ;
 ;**NOTE:  tags of the format ZB* are used by the client-trace debugging tool and should not be removed
 ;
READHDR(HLCSTATE,HDR) ;
ZB10 N SUCCESS,SEG
 N MCODE
 S HLCSTATE("MESSAGE ENDED")=0
 ;**START P139 CJM
 S HLCSTATE("MESSAGE STARTED")=0
 ;**END P139
 S MCODE="S SUCCESS=$$"_HLCSTATE("READ HEADER")_"(.HLCSTATE,.HDR)"
 X MCODE
 ;**START P139 CJM
 I SUCCESS S HLCSTATE("MESSAGE STARTED")=1
 ;**END P139
ZB11 Q SUCCESS
 ;
READSEG(HLCSTATE,SEG) ;
ZB12 N RETURN
 N MCODE
 S MCODE="S RETURN=$$"_HLCSTATE("READ SEGMENT")_"(.HLCSTATE,.SEG)"
 X MCODE
ZB13 Q RETURN
 ;
OPEN(HLCSTATE) ;
 N MCODE
 S HLCSTATE("CONNECTED")=0
 Q:'$L(HLCSTATE("OPEN"))
 I $G(HLCSTATE("LINK","SINGLE THREADED")) D  Q:HLCSTATE("LOCK FAILED")
 .S HLCSTATE("LOCK FAILED")=0
 .L +^HLO("OPEN LINK",HLCSTATE("LINK","NAME")_":"_HLCSTATE("LINK","PORT")):5
 .I '$T S HLCSTATE("LOCK FAILED")=1 D
 ..Q:'HLCSTATE("LOCK FAILED")
ZB27 ..;
 ..;
 ;
 S MCODE="D "_HLCSTATE("OPEN")_"(.HLCSTATE)"
 X MCODE
 I $G(HLCSTATE("LINK","SINGLE THREADED")),'HLCSTATE("CONNECTED") L -^HLO("OPEN LINK",HLCSTATE("LINK","NAME")_":"_HLCSTATE("LINK","PORT"))
 Q
 ;
CLOSE(HLCSTATE) ;
 N MCODE
 S MCODE="D "_HLCSTATE("CLOSE")_"(.HLCSTATE)"
 X MCODE
 I $G(HLCSTATE("LINK","SINGLE THREADED")) L -^HLO("OPEN LINK",HLCSTATE("LINK","NAME")_":"_HLCSTATE("LINK","PORT"))
 ;
 S HLCSTATE("CONNECTED")=0
 Q
 ;
WRITESEG(HLCSTATE,SEG) ;
ZB14 N RETURN
 N MCODE
 S MCODE="S RETURN=$$"_HLCSTATE("WRITE SEGMENT")_"(.HLCSTATE,.SEG)"
 X MCODE
ZB15 Q RETURN
 ;
WRITEHDR(HLCSTATE,HDR) ;
ZB16 N SUCCESS
 N MCODE
 S MCODE="S SUCCESS=$$"_HLCSTATE("WRITE HEADER")_"(.HLCSTATE,.HDR)"
 X MCODE
ZB17 Q SUCCESS
 ;
ENDMSG(HLCSTATE) ;
ZB18 N RETURN
 N MCODE
 S MCODE="S RETURN=$$"_HLCSTATE("END MESSAGE")_"(.HLCSTATE)"
 X MCODE
ZB19 Q RETURN