;Fractal drawer
;Draw_Complex.ahk
;By: Chdata
;6/27/2015
;Based on: https://www.khanacademy.org/computer-programming/mandelbrot-set/1054272371

/* 
z -> z^2+C

z=x+yi
C=a+bi

z^2+C=(x+yi)*(x+yi)+a+bi
    =xx+yiyi+2xyi+a+bi
    =xx-yy+i(2xy+b)+a
    =(x^2-y^2+a)+i(2xy+b)
*/

#include ./Inc_KillingArt.ahk
SetMouseDelay, 1
CoordMode, Mouse, Screen
Esc::
Click up
TryReload()
Return

!d::
BlockInput MouseMove
MouseGetPos, mX, mY

a := -2.0
b := -2.0
stillDrawing := true

StartClass := GetClass()
PreventDesktopUsage()

draw()

MouseMove, mX, mY
BlockInput MouseMoveOff
Return

iterate()
{
    global x
    global y
    global a
    global b

    tmp:=x*x-y*y+a
    y:=2*x*y+b
    x:=tmp
}

;drawXY()
;{
;    global x
;    global y
;    global mX
;    global mY
;    point(mX+x*100,mY-y*100)
;}

drawAB(Length)
{
    global a
    global b
    global mX
    global mY
    ;point(mX+a*100,mY-b*100)
    if (Length <= 0)
    {
        Return true
    }
    Length-- ; Necessary correction for drawing raw pixels in Paint
    Return % line(mX+a*100,mY-b*100,mX-Length+a*100,mY-b*100)
}

;point(ex,wy)
;{
;    MouseMove, ex, wy
;    Click
;}

line(ex,wy,endX,endY)
{
    global StartClass

    MouseMove, ex, wy
    If (GetClass() != StartClass)
    {
        Return false
    }

    MouseClickDrag, L, ex, wy, endX, endY
    Return true
}

seriesDiverges(n)
{
    global x
    global y
    Loop % n
    {
        iterate()
        if(x*x+y*y>4.0)
        {
            return true
        }
    }
    return false
}

draw()
{
    global x
    global y
    global a
    global b
    global stillDrawing

    Length:=0

    While % stillDrawing
    {
        a:=a+0.01
        if(a>=2.0)
        {
            a:=-2.0
            b:=b+0.01
        }

        if(b>=2.0)
        {
            stillDrawing:=false
        }

        x:=0
        y:=0

        if (seriesDiverges(40) && a + 0.01 < 2.0) ; the higher the diverges, the more accuracy. 40 works fine for mandelbrot
        {
            Length++
        }
        Else
        {
            if (!drawAB(Length))
            {
                stillDrawing:=false
                Break
            }
            Length:=0
        }
    }
}
