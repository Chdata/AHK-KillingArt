;Polar graph drawer
;Draw_Polar.ahk
;By: Chdata
;10/24/2012

;Maximum radius (May not always really be the radius)
;Also known as a
Radisu:= 100

;Degrees to radians
;(pi/180)
dtr:=0.01745329252

;tau (2pi)
pi2:=6.2831853

#SingleInstance, Force
SetMouseDelay, 1
CoordMode, Mouse, Screen
Esc::
Click up
Reload
Return

9::
MouseGetPos, xcenter, ycenter
BlockInput MouseMove

;Polar equations
;r:=Radisu*( Sin(2*A_Index*dtr) )
;r:=Radisu*( Sin(2*A_Index*dtr) + 0.25*sin(6*A_Index*dtr) )
;r:=Radisu*( Sin(2*A_Index*dtr) + 0.25*sin(12*A_Index*dtr) )
;r:=Radisu*( Sin(2*A_Index*dtr) + 0.25*sin(18*A_Index*dtr) )
;r:=Radisu*( Sin(2*A_Index*dtr) + 0.25*sin(24*A_Index*dtr) )
;r:=Radisu*( Sin(2*A_Index*dtr) + 0.25*sin(36*A_Index*dtr) )	;Cool leafs
;r:=Radisu*( Sin(2*A_Index*dtr) + 0.1*sin(6*A_Index*dtr) )
;r:=Radisu*( Sin(2*A_Index*dtr) + 0.5*sin(6*A_Index*dtr) )
;r:=Radisu*( Sin(2*A_Index*dtr) + 0.75*sin(6*A_Index*dtr) )
;r:=Radisu*( Sin(6*A_Index*dtr) + 0.25*sin(24*A_Index*dtr) )
;r:=Radisu*( Sin(6*A_Index*dtr) + 0.25*sin(18*A_Index*dtr) )	;Funky thing
;r:=Radisu*( Sin(6*A_Index*dtr) + 0.25*sin(324*A_Index*dtr) )
;r:=Radisu*( Sin(1*A_Index*dtr) + 0.25*sin(3*A_Index*dtr) )
;r:=Radisu*( Sin(1*A_Index*dtr) + 0.25*sin(9*A_Index*dtr) )
;r:=Radisu*( Sin(3*A_Index*dtr) + 0.25*sin(9*A_Index*dtr) )
;r:=Radisu*( Cos(3*A_Index*dtr) )				;Example of something that can give an unwanted line, r != 0 at the start
;r:=Sqrt((Radisu**2)*( Sin(2*A_Index*dtr) ))			;Leminiscate
;r:=Sqrt((Radisu**2)*( Cos(2*A_Index*dtr)))			;2leaf clover (infinity sign)
;r:=Sqrt((Radisu**2)*( Cos(3*A_Index*dtr)))
;r:=Sqrt((Radisu**2)*( -1*Sin(7*A_Index*dtr) ))
;r:=((Radisu**3)*(Cos(2*A_Index*dtr)))**(1/3)
;r:=((Radisu**2)*(Sin(Tan(Cos(2*A_Index*dtr)))))**(1/2)
;r:=Radisu*( Cos(7*A_Index*dtr) + 0.25*Sin(21*A_Index*dtr) )	;Fans
;r:=Radisu*( Cos(2*A_Index*dtr) + 0.25*Sin(6*A_Index*dtr) )
;r:=Radisu*( Cos(3*A_Index*dtr) + 0.25*Sin(9*A_Index*dtr) )
;r:=Radisu*( Cos(6*A_Index*dtr) + 0.25*Sin(18*A_Index*dtr) )
;r:=Radisu*( Cos(2*A_Index*dtr) + 0.6*Sin(6*A_Index*dtr) )	;Fan broken
;r:=Radisu*( Cos(2*A_Index*dtr) + 0.8*Sin(6*A_Index*dtr) )
;r:=25+Radisu*( Sin(A_Index*dtr) )				;Cardioid
;r:=125+Radisu*( Sin(A_Index*dtr) )				;
;r:=Radisu*( Tan(A_Index*dtr) )					;Tangent
;Loop, 3601							;
;r:=1 + A_Index*dtr						;Archimedean spiral
;r:=1 + 4*A_Index*dtr						;
;r:=1*Exp(0.1*A_Index*dtr)					;Logarithmic spiral r = a * e^(b*theta)
;r:=Radisu*( Cos(6/7*A_Index*dtr) )				;Polar rose
;r:=Radisu*( Cos(4/6*A_Index*dtr) )
;r1:=cos(4*sin(4*cos(4*sin(cos(4*sin(cos(4*sin(tan(A_Index*dtr)))))))))
;r2:=cos(cos(cos(tan(tan(tan(A_Index*dtr))))))
;r3:=(r1+r2)
;r:=Radisu*( Cos(2*A_Index*dtr)*Sec(A_Index*dtr) )		;Strophoid
;r:=Radisu/2*( Exp(Cos(A_Index*dtr)) - 2*cos(4*A_Index*dtr) + (Sin(A_Index*dtr/12))**5 )	;Butterfly
;r:=Radisu*( 2-Csc(A_Index*dtr) )				;Conchoid - Add another Click Down before loop
;r:=Radisu*Cos(10*Cos(A_Index*dtr))				;Butterfly
;r:=Radisu*Sin(10*Sin(A_Index*dtr))				;
;r:=Radisu*Cos(Sin(46*A_Index*dtr))				;Whoa o.o
;r:=Radisu*Cos(Sin(6*A_Index*dtr))				;Sunflower
;r:=Radisu*Cos(Sin(0.6*A_Index*dtr))
;r:=Radisu*Sin(Cos(0.6*A_Index*dtr))
;r:=Radisu*Cos(Sin(6*A_Index*dtr))*aRoot(Sin(A_Index*dtr))	;Fly trap (From here and below are interesting discoveries I made ;p)
;r:=Radisu*Cos(Sin(6*A_Index*dtr))*Sqrt(Sin(A_Index*dtr))	;Lilypad
;r:=r:=25+Radisu*( Sin(A_Index*dtr)*aRoot(Cos(A_Index*dtr)) )	;
;r:=Radisu*Cos(Sin(2*A_Index*dtr))*-1*Sqrt(Sin(A_Index*dtr))	;Bell
;r:=Radisu*Sin(2*A_Index*dtr)*-1*Sqrt(Sin(A_Index*dtr))		;Dragonfly's wings
;r:=Radisu*Cos(2*A_Index*dtr)*-1*Sqrt(Sin(A_Index*dtr))		;Bomb
;r:=Radisu*Cos(Cos(2*A_Index*dtr))*-1*Sqrt(Sin(A_Index*dtr))	;Jellybean
;r:=Radisu*Sin(Sec(2*A_Index*dtr))*-1*Sqrt(Sin(A_Index*dtr))	;Face
;r:=Radisu*Sin(Tan(2*A_Index*dtr))*-1*Sqrt(Sin(A_Index*dtr))	;Dragonfly
;r:=Radisu*Cos(Cos(2*A_Index*dtr))*-1*Sqrt(Sin(4*A_Index*dtr))	;Fan

;http://en.wikipedia.org/wiki/Maurer_rose
;http://en.wikipedia.org/wiki/Lissajous_curve
;http://en.wikipedia.org/wiki/Spirograph
;http://en.wikipedia.org/wiki/Hypotrochoid
;http://en.wikipedia.org/wiki/Epicycloid
;http://en.wikipedia.org/wiki/Cycloid				;Ignore
;http://en.wikipedia.org/wiki/Hypocycloid
;http://en.wikipedia.org/wiki/Epitrochoid

Loop, 361
		;First is skipped to prevent unwanted lines when r != 0 at the start
		;We go one past 360 so we can reconnect to our starting point
		;We click down on A_Index = 2 instead of 1 because A_Index starts at 1
{
	If A_Index = 2
		Click down
	r:=Radisu*( Sin(2*A_Index*dtr) + 0.25*sin(24*A_Index*dtr) )
	x:=r*Cos(A_Index*dtr)
	y:=r*Sin(A_Index*dtr)
	mx:=Round(xcenter+x)
	my:=Round(ycenter+y)
	If r =					;This is necessary for graphs that use Square roots
		MouseMove, xcenter, ycenter	;If we try to graph the square root of a negative (For example, cos(180)) it doesn't work correctly
	Else
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