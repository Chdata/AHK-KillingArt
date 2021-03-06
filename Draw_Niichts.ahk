;Star drawer
;Draw_Niichts.ahk
;By: Chdata
;2013

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

Pnt:=7      ;Points on star
Rad:=50     ;Radius
d:=0.5      ;Radius modifier
;d:=(1/Cos(180/Pnt*dtr))*(Rad/2)
Ofs:=180/Pnt    ;Theta offset

Theta:=0

Loop, % Pnt*2+1
{
    R:= Mod(A_Index,2) ? Rad : Rad*d
    If A_Index = 2
        Click down
    x:=R*Cos(Theta) ;50 pixel radius
    y:=R*Sin(Theta)
    mx:=Round(xcenter+x)
    my:=Round(ycenter+y)
    MouseMove, mx, my
    Theta+=Ofs*dtr
}
Click up

MouseMove, xcenter, ycenter
BlockInput MouseMoveOff
Return
