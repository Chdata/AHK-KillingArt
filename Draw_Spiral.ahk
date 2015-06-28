;Spiral drawer
;Draw_Spiral.ahk
;By: Chdata
;2012

#include ./Inc_KillingArt.ahk
SetMouseDelay, 1        ;Never set this to 0 or it will lol at you
CoordMode, Mouse, Screen
Esc::
Click up
TryReload()
Return

!d::
MouseGetPos, xcenter, ycenter
Gui, Add, Text,, Theta: 
Gui, Add, Text,, Radius:
Gui, Add, Edit, vOffset ym
Gui, Add, Edit, vRadius
Gui, Add, Button, Default, OK
;Gui, Add, Button, Default, Cancel  ;Note: Fix positioning
Gui, Show,, Spiral Offsets
Return

ButtonOK:
Gui, Submit
BlockInput MouseMove
;Loop
;{
Offset+=1
MouseMove, xcenter, ycenter
Click down
Loop, %Radius%
{
    x:=A_Index*Cos(Theta)
    y:=A_Index*Sin(Theta)
    mx:=Round(xcenter+x)
    my:=Round(ycenter+y)
    MouseMove, mx, my
    Theta+=Offset
}
Click up
MouseMove, xcenter, ycenter
;Send ^z
;}
BlockInput MouseMoveOff
Gui, Destroy
Return

GuiClose:
ButtonCancel:
Gui, Destroy
Return

!v::
MsgBox, 0x00, Input Log, Theta input: %Offset%`nRadius input: %Radius%
Return
