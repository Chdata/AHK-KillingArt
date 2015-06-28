;Spirograph drawer
;Draw_Spiro.ahk
;By: Chdata
;10/29/2012

#include ./Inc_KillingArt.ahk
SetMouseDelay, 1
CoordMode, Mouse, Screen
Esc::
;Click up
TryReload()
Return

;Radius
R:=100

;Length of line
d:=200

;Angle of increment
div:=10

!d::
MouseGetPos, x, y
BlockInput MouseMove

Loop, % 361/div
{
    C_Index:=(A_Index-1)*div
    rx:=x+r*Cos(C_Index*dtr)
    ry:=y+r*Sin(C_Index*dtr)
;TSlope:=(x-rx)/(y-ry)*-1
    x1:=rx+(d/2)*Cos((C_Index+90)*dtr)
    y1:=ry+(d/2)*Sin((C_Index+90)*dtr)
    x2:=rx-(d/2)*Cos((C_Index+90)*dtr)
    y2:=ry-(d/2)*Sin((C_Index+90)*dtr)
    MouseClickDrag, L, x1, y1, x2, y2
}

Loop, 361
{
    If A_Index = 2
        Click down
    r:=Sqrt((x1-x)**2 + (y1-y)**2)
    dx:=r*Cos(A_Index*dtr)
    dy:=r*Sin(A_Index*dtr)
    mx:=Round(x+dx)
    my:=Round(y+dy)
    MouseMove, mx, my
}
Click up

MouseMove, xcenter, ycenter
BlockInput MouseMoveOff
Return
