XVEMRH ;DJB,VRR**Help Text ; 6/18/16 12:50pm
 ;;14.0;VICTORY PROG ENVIRONMENT;;Feb 27, 2017
 ;
VRR1 ;;;
 ;;; V R R . . . . . . . . . Routine Reader/Editor . . . . . . . . . David Bolduc
 ;;;
 ;;;  E N T R Y   P O I N T S:
 ;;;
 ;;;        DO ^XVEMR ................ Entry point to read a routine.
 ;;;        DO PARAM^XVEMR(routine) .. To bypass routine selection prompt.
 ;;;        D ^XVSE   ................ VPE routine editor that utilizes
 ;;;                                    the VRR module.
 ;;;
 ;;;  N O T E S:
 ;;;
 ;;;         VRR displays the line number for all routine lines not having a
 ;;;         line tag. It also displays total routine lines at the top of
 ;;;         the screen. The 2 vertical bars at the left side of the top and
 ;;;         bottom borders, help delineate line tags. The phrase "1 of 4"
 ;;;         that appears in the top border, refers to the routine level you
 ;;;         are currently in. As you branch to other routines, the 1 will
 ;;;         increment.
 ;;;
 ;;;         VRR has 4 modes: EDIT        Default mode
 ;;;                          INSERT      <RETURN>
 ;;;                          BLOCK       <F3>
 ;;;                          MENU BAR    <TAB>
 ;;;
 ;;;  E D I T   M O D E:
 ;;;
 ;;;  When you first enter the editor you are in EDIT mode. You may position
 ;;;  the cursor anywhere on the screen and enter code. Hitting <BS> will
 ;;;  delete the character to the left of the cursor. Hitting <DEL> will delete
 ;;;  the character under the cursor. When you move the cursor to the left side
 ;;;  of the screen, you are in the line tag area. When you enter or delete code
 ;;;  here, the code will be placed so that the tag is displayed correctly.
 ;;;
 ;;;  I N S E R T   M O D E:
 ;;;
 ;;;  In EDIT mode, when you wish to add a new line of code, type <RETURN> to
 ;;;  change to INSERT mode. A blank line will open below the line the cursor
 ;;;  is currently on. You may now add new code. Use <TAB> OR <SPACE> as a line
 ;;;  start character. Once you hit <TAB> or <SPACE> you are returned to EDIT
 ;;;  mode. If you hit <RETURN> without adding any new code, the opened line
 ;;;  will be closed.
 ;;;
 ;;;***