;Cartesian graph drawer
;Draw_Cartesian.ahk
;By: Chdata
;2/28/2013

#include ./Inc_KillingArt.ahk
SetMouseDelay, 1
CoordMode, Mouse, Screen
Esc::
Click up
TryReload()
Return

;Maximum radius (May not always really be the radius)
Radisu:= 100

;x:=t
;y:=t**5-3*t**3+2*t

!d::
MouseGetPos, xcenter, ycenter
BlockInput MouseMove

;[a, b]
Inta:=-50
Intb:=50
Step:=0.1

intc:=intb-inta                 ;4+4=8 distance

Clickstate:=0
Loop, % intc*(1/Step)+1             ;8*(1/0.1)+1 = 80+1
{
    
    B_Index:=inta+((A_Index-1)*Step)    ;{-4+0.1 = -3.9}, 0.2, 7.9, {-4+8.0 = 4}
    If A_Index-1 = 1
    {
        Click down
        Clickstate:=1
    }

    t:=B_Index

;How can I reliably stretch out the X and Y axes?
;Y is simple, 100*y output
;But x? X seems unreliable.

    x:=t^2-2*t^4
    y:=t^5-3*t^3

    If x= || y=
    {
        Click up
        Clickstate:=0
    }

    If Clickstate=0 && x!= && y!=
    {
        Click down
        Clickstate:=1
    }

    mx:=Round(xcenter+x)
    my:=Round(ycenter-y)
    MouseMove, mx, my
}
Click up

MouseMove, xcenter, ycenter
BlockInput MouseMoveOff
Return
