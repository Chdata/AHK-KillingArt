;Parametric graph drawer
;Draw_Parametric.ahk
;By: Chdata
;2/7/2013

#include ./Inc_KillingArt.ahk
SetMouseDelay, 1
CoordMode, Mouse, Screen
Esc::
Click up
TryReload()
Return

;Maximum radius (May not always really be the radius)
Radisu:= 100

!d::
MouseGetPos, xcenter, ycenter
BlockInput MouseMove

Step:=100

Loop, % Round(pi*2*100)*Step+2  ;628
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

Sophi(a,b,c,d,i,j,s,t,cx,cy)    ;s is scale
{
    x:=s*(Cos(a*t)-Cos(b*t)**i)
    y:=s*(Sin(c*t)-Sin(d*t)**j)

    ;x:=s*Cos(a*t)-Cos(b*t)**i  ;This appears to draw lissajous curves
    ;y:=s*Sin(c*t)-Sin(d*t)**j

    mx:=Round(cx+x)
    my:=Round(cy+(-1*y))
    MouseMove, mx, my
}

Epicycloid(r,k,t,cx,cy)     ;For int k, curve is closed with k cusps ;For rational k, k=p/q, curve has p cusps ;Irrational k never closes
{
    x:=r*(k+1)*Cos(t)-r*Cos((k+1)*t)
    y:=r*(k+1)*Sin(t)-r*Sin((k+1)*t)

    mx:=Round(cx+x)
    my:=Round(cy+(-1*y))
    MouseMove, mx, my
}

Epicycloid2(Rr,r,t,cx,cy)   ;Rr = k*r
{
    x:=(Rr+r)*Cos(t)-r*Cos( (Rr+r)/r*t )
    y:=(Rr+r)*Sin(t)-r*Sin( (Rr+r)/r*t )

    mx:=Round(cx+x)
    my:=Round(cy+(-1*y))
    MouseMove, mx, my
}

Epitrochoid(Rr,r,d,t,cx,cy) ;For epicycloids, d=r ;For limaçons, Rr=r
{
    x:=(Rr+r)*Cos(t)-d*Cos( (Rr+r)/r*t )
    y:=(Rr+r)*Sin(t)-d*Sin( (Rr+r)/r*t )

    mx:=Round(cx+x)
    my:=Round(cy+(-1*y))
    MouseMove, mx, my
}

Hypocycloid(r,k,t,cx,cy)        ;For int k, curve is closed with k cusps ;For rational k, k=p/q, curve has p cusps ;Irrational k never closes
{
    x:=r*(k-1)*Cos(t)+r*Cos((k-1)*t)
    y:=r*(k-1)*Sin(t)-r*Sin((k-1)*t)

    mx:=Round(cx+x)
    my:=Round(cy+(-1*y))
    MouseMove, mx, my
}

Hypocycloid2(Rr,r,t,cx,cy)      ;Rr=k*r
{
    x:=(Rr-r)*Cos(t)+r*Cos( (Rr-r)/r*t )
    y:=(Rr-r)*Sin(t)-r*Sin( (Rr-r)/r*t )

    mx:=Round(cx+x)
    my:=Round(cy+(-1*y))
    MouseMove, mx, my
}

Hypotrochoid(Rr,r,d,t,cx,cy)        ;Hypocycloid d=r ;Ellipse Rr=2r
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

Celtic(c,p,s,t,cx,cy)   ;c=2 p=2 for triqueta
{
    x:=s*(Sin(t)+c*Sin(p*t))
    y:=s*(Cos(t)-c*Cos(p*t))
    ;z:=-1*Sin(3*t)

    mx:=Round(cx+x)
    my:=Round(cy+(-1*y))
    MouseMove, mx, my
}
