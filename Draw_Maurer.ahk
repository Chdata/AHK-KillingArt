;Maurer rose drawer
;Draw_Maurer.ahk
;By: Chdata
;2/7/2013

#include ./Inc_KillingArt.ahk
SetMouseDelay, 1
CoordMode, Mouse, Screen
Esc::
Click up
TryReload()
Return

!d::
MouseGetPos, xcenter, ycenter
BlockInput MouseMove

Petals:=6
Angle:=71
Radisu:=150

Loop, % 361+2
{
    B_Index:=A_Index-2
    If B_Index = 0
        Click down
    t:=B_Index*Angle

    r:=Radisu*Sin(Petals*t*dtr)
    x:=r*Cos(t*dtr)
    y:=r*Sin(t*dtr)

    mx:=Round(xcenter+x)
    my:=Round(ycenter+(-1*y))
    MouseMove, mx, my
}
Click up

MouseMove, xcenter, ycenter
BlockInput MouseMoveOff
Return
