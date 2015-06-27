;Parametric graph drawer
;Draw_Parametric.ahk
;By: Chdata
;2/7/2013

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
Reload
Return

!d::
MouseGetPos, xcenter, ycenter
BlockInput MouseMove

Step:=100

Loop, % Round(pi*2*100)*Step+2	;628
{
	C_Index:=A_Index-2
	B_Index:=C_Index/Step
	If C_Index = 0
		Click down
	t:=B_Index

Hypocycloid(50,2.1,t,xcenter,ycenter)

	;r:=10
	;x:=r*( Floor(t)*Cos(t) )
	;y:=r*( Floor(t)*Sin(t) )

	;r:=t+Mod(t,5)
	;x:=r*( Cos(t) )
	;y:=r*( Sin(t) )

	;mx:=Round(xcenter+x)
	;my:=Round(ycenter+(-1*y))
	;MouseMove, mx, my
}
Click up

MouseMove, xcenter, ycenter
BlockInput MouseMoveOff
Return

Sophi(a,b,c,d,i,j,s,t,cx,cy)	;s is scale
{
	x:=s*(Cos(a*t)-Cos(b*t)**i)
	y:=s*(Sin(c*t)-Sin(d*t)**j)

	;x:=s*Cos(a*t)-Cos(b*t)**i	;This appears to draw lissajous curves
	;y:=s*Sin(c*t)-Sin(d*t)**j

	mx:=Round(cx+x)
	my:=Round(cy+(-1*y))
	MouseMove, mx, my
}

Epicycloid(r,k,t,cx,cy)		;For int k, curve is closed with k cusps ;For rational k, k=p/q, curve has p cusps ;Irrational k never closes
{
	x:=r*(k+1)*Cos(t)-r*Cos((k+1)*t)
	y:=r*(k+1)*Sin(t)-r*Sin((k+1)*t)

	mx:=Round(cx+x)
	my:=Round(cy+(-1*y))
	MouseMove, mx, my
}

Epicycloid2(Rr,r,t,cx,cy)	;Rr = k*r
{
	x:=(Rr+r)*Cos(t)-r*Cos( (Rr+r)/r*t )
	y:=(Rr+r)*Sin(t)-r*Sin( (Rr+r)/r*t )

	mx:=Round(cx+x)
	my:=Round(cy+(-1*y))
	MouseMove, mx, my
}

Epitrochoid(Rr,r,d,t,cx,cy)	;For epicycloids, d=r ;For limaçons, Rr=r
{
	x:=(Rr+r)*Cos(t)-d*Cos( (Rr+r)/r*t )
	y:=(Rr+r)*Sin(t)-d*Sin( (Rr+r)/r*t )

	mx:=Round(cx+x)
	my:=Round(cy+(-1*y))
	MouseMove, mx, my
}

Hypocycloid(r,k,t,cx,cy)		;For int k, curve is closed with k cusps ;For rational k, k=p/q, curve has p cusps ;Irrational k never closes
{
	x:=r*(k-1)*Cos(t)+r*Cos((k-1)*t)
	y:=r*(k-1)*Sin(t)-r*Sin((k-1)*t)

	mx:=Round(cx+x)
	my:=Round(cy+(-1*y))
	MouseMove, mx, my
}

Hypocycloid2(Rr,r,t,cx,cy)		;Rr=k*r
{
	x:=(Rr-r)*Cos(t)+r*Cos( (Rr-r)/r*t )
	y:=(Rr-r)*Sin(t)-r*Sin( (Rr-r)/r*t )

	mx:=Round(cx+x)
	my:=Round(cy+(-1*y))
	MouseMove, mx, my
}

Hypotrochoid(Rr,r,d,t,cx,cy)		;Hypocycloid d=r ;Ellipse Rr=2r
{
	x:=(Rr-r)*Cos(t)+d*Cos( (Rr-r)/r*t )
	y:=(Rr-r)*Sin(t)-d*Sin( (Rr-r)/r*t )

	mx:=Round(cx+x)
	my:=Round(cy+(-1*y))
	MouseMove, mx, my
}

Lissajous(a,b,o,r,t,cx,cy)
{
	x:=r*Sin(a*t + o)
	y:=r*Sin(b*t)

	mx:=Round(cx+x)
	my:=Round(cy+(-1*y))
	MouseMove, mx, my
}

Celtic(c,p,s,t,cx,cy)	;c=2 p=2 for triqueta
{
	x:=s*(Sin(t)+c*Sin(p*t))
	y:=s*(Cos(t)-c*Cos(p*t))
	;z:=-1*Sin(3*t)

	mx:=Round(cx+x)
	my:=Round(cy+(-1*y))
	MouseMove, mx, my
}

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