#SingleInstance, Force
SetMouseDelay, 1
CoordMode, Mouse, Screen
Esc::
Click up
TryReload()
Return

!d::
DrawRr(128, 8)	;"Radius" and divisions on the axes
Return

DrawRr(r,d) {
MouseGetPos, x, y
BlockInput MouseMove
MouseClickDrag, L, x, y+r, x, y-r
MouseClickDrag, L, x+r, y, x-r, y
Loop, 4
{
fx:=Mod(A_Index,2)*2-1
fy:=A_Index > 2 ? 1 : -1
	Loop, % d
	{
		If Mod(A_Index,2)	;This extra check makes it 1.9x faster
			MouseClickDrag, L, x, y+Round(r*fy-(A_Index-1)*r/d*fy), x+Round(r*fx-(D-A_Index)*r/d*fx), y
		Else
			MouseClickDrag, L, x+Round(r*fx-(D-A_Index)*r/d*fx), y, x, y+Round(r*fy-(A_Index-1)*r/d*fy)
	}
}
MouseMove, x, y
BlockInput MouseMoveOff
}

TryReload()
{
  IfExist, %A_ScriptFullPath%
    Reload
  Else
    ExitApp
}




/*
;This is what the program used to be

Inc := 0
MouseGetPos, sX, sY
MouseClickDrag, L, sX, sY-128, sX, sY+128
MouseClickDrag, L, sX-128, sY, sX+128, sY

Ramp(-128, sX, sY, 1)
Ramp( 128, sX, sY, 0)
Ramp(-128, sX, sY, 0)
Ramp( 128, sX, sY, 1)

MouseMove, sX, sY
Return

Ramp(x, sX, sY, flag)
{
	Loop, 8
	{
		If (flag)
			MouseClickDrag, L, sX, sY+x+Inc, sX+Inc, sY
		Else
			MouseClickDrag, L, sX, sY+x+Inc, sX-Inc, sY
		If x < 0
			Inc += 16
		Else
			Inc -= 16
	}
	Inc := 0
}
*/