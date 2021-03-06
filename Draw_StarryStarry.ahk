;Starry star drawer
;Draw_StarryStarry.ahk
;By: Chdata
;2013

#include ./Inc_KillingArt.ahk
SetMouseDelay, 1
CoordMode, Mouse, Screen
Esc::
Click up
TryReload()
Return

;((i * 2) + 2 + i)

!d::
MouseGetPos, xcenter, ycenter
BlockInput MouseMove

Skip:=2
Nxt:=Skip + 1
Pnt:=(2 * Skip) + 2 + Skip
Rad:=50

Theta:=0

Loop, % Pnt + 1         ;x points to connect (In this case, 5 for a 5 pointed star)
{
    IF A_Index = 2
        Click down
    x:=Rad*Cos(Theta)
    y:=Rad*Sin(Theta)
    mx:=Round(xcenter+x)
    my:=Round(ycenter+y)
    MouseMove, mx, my
    Theta+=(Nxt * (360 / Pnt)) * dtr
}
Click up

MouseMove, xcenter, ycenter
BlockInput MouseMoveOff
Return
