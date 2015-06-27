;Cartesian graph drawer
;Draw_Cartesian.ahk
;By: Chdata
;2/28/2013

;Maximum radius (May not always really be the radius)
Radisu:= 100

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
TryReload()
Return

;x:=t
;y:=t**5-3*t**3+2*t

!d::
MouseGetPos, xcenter, ycenter
BlockInput MouseMove

;[a, b]
Inta:=-50
Intb:=50
Step:=0.1

intc:=intb-inta					;4+4=8 distance

Clickstate:=0
Loop, % intc*(1/Step)+1				;8*(1/0.1)+1 = 80+1
{
	
	B_Index:=inta+((A_Index-1)*Step)	;{-4+0.1 = -3.9}, 0.2, 7.9, {-4+8.0 = 4}
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

TryReload()
{
	IfExist, %A_ScriptFullPath%
		Reload
	Else
    	ExitApp
}