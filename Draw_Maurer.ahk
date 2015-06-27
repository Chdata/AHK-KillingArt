;Maurer rose drawer
;Draw_Maurer.ahk
;By: Chdata
;2/7/2013

;Degrees to radians
;(pi/180)
dtr:=0.01745329252

;pi
pi:=3.14159265

;tau (2pi)
tau:=6.2831853

#SingleInstance, Force
SetMouseDelay, 1
CoordMode, Mouse, Screen
Esc::
Click up
Reload
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

Sgn(Val)	;Returns the sign of the value
{
Return, x < 0 ? -1 : x > 0 ? 1 : 0
;Return, x < 0 ? -1 : !!x		;This one's actually slower than the above operation, but I like it more
}

aRoot(Val)
{
Return Sgn(Val)*Sqrt(Abs(Val))
}

/*
;Better than those custom defined ones that go If Val > 0 ...
Abs(Val)
{
Return Sgn(Val)*Val
}
*/

Csc(Theta)
{
Return 1/Sin(Theta)
}

Sec(Theta)
{
Return 1/Cos(Theta)
}

Cot(Theta)
{
Return 1/Tan(Theta)
}