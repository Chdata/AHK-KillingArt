;Celtic knot drawer
;Draw_Celtic.ahk
;By: Chdata
;2013

;8x8
;each square is a 4x4 grid of 16/2 pixels each (64/2 pixels)
;each 512/2 pixels in size

;Honestly the way I made this just looks stupid now

#include ./Inc_KillingArt.ahk
SetMouseDelay, 2
Esc::TryReload()
Return

!d::

d:=0.5      ;Size modifier

BlockInput MouseMove
MouseGetPos, mX, mY

;Outbox
Line(mX,mY,-256*d,-256*d,0,64*d)
Line(mX,mY,256*d,-256*d,0,64*d)
Line(mX,mY,256*d,256*d,0,-64*d)
Line(mX,mY,-256*d,256*d,0,-64*d)

Line(mX,mY,-256*d,-256*d,64*d,0)
Line(mX,mY,-256*d,256*d,64*d,0)
Line(mX,mY,256*d,256*d,-64*d,0)
Line(mX,mY,256*d,-256*d,-64*d,0)

;Inbox
Line(mX,mY,-208*d,-208*d,0,16*d)
Line(mX,mY,208*d,-208*d,0,16*d)
Line(mX,mY,208*d,208*d,0,-16*d)
Line(mX,mY,-208*d,208*d,0,-16*d)

Line(mX,mY,-208*d,-208*d,16*d,0)
Line(mX,mY,-208*d,208*d,16*d,0)
Line(mX,mY,208*d,208*d,-16*d,0)
Line(mX,mY,208*d,-208*d,-16*d,0)

;Small up slants /
Y6 := -64*d ;Left
Loop, 3
{
    Line(mX,mY,-208*d,Y6,16*d,-32*d)
    Y6 += 128*d
}

Y6 := -160*d    ;Right
Loop, 3
{
    Line(mX,mY,192*d,Y6,16*d,-32*d)
    Y6 += 128*d
}

;Small down slants \
Y6 := -192*d    ;Left
Loop, 3
{
    Line(mX,mY,-208*d,Y6,16*d,32*d)
    Y6 += 128*d
}

Y6 := -96*d ;Right
Loop, 3
{
    Line(mX,mY,192*d,Y6,16*d,32*d)
    Y6 += 128*d
}

;Small right slants <
Y6 := -96*d ;Above
Loop, 3
{
    Line(mX,mY,Y6,-192*d,32*d,-16*d)
    Y6 += 128*d
}

Y6 := -192*d    ;Below
Loop, 3
{
    Line(mX,mY,Y6,208*d,32*d,-16*d)
    Y6 += 128*d
}

;Small left slants >
Y6 := -192*d    ;Above
Loop, 3
{
    Line(mX,mY,Y6,-208*d,32*d,16*d)
    Y6 += 128*d
}

Y6 := -96*d ;Below
Loop, 3
{
    Line(mX,mY,Y6,192*d,32*d,16*d)
    Y6 += 128*d
}

;Large up slants /
Y6 := -64*d ;Left
Loop, 3
{
    Line(mX,mY,-256*d,Y6,32*d,-64*d)
    Y6 += 128*d
}

Y6 := -128*d    ;Right
Loop, 3
{
    Line(mX,mY,224*d,Y6,32*d,-64*d)
    Y6 += 128*d
}

;Large down slants /
Y6 := -192*d    ;Left
Loop, 3
{
    Line(mX,mY,-256*d,Y6,32*d,64*d)
    Y6 += 128*d
}

Y6 := -128*d    ;Right
Loop, 3
{
    Line(mX,mY,224*d,Y6,32*d,64*d)
    Y6 += 128*d
}

;Large right slants <
Y6 := -128*d    ;Above
Loop, 3
{
    Line(mX,mY,Y6,-224*d,64*d,-32*d)
    Y6 += 128*d
}

Y6 := -192*d    ;Below
Loop, 3
{
    Line(mX,mY,Y6,256*d,64*d,-32*d)
    Y6 += 128*d
}

;Large left slants >
Y6 := -192*d    ;Above
Loop, 3
{
    Line(mX,mY,Y6,-256*d,64*d,32*d)
    Y6 += 128*d
}

Y6 := -128*d    ;Below
Loop, 3
{
    Line(mX,mY,Y6,224*d,64*d,32*d)
    Y6 += 128*d
}

;Small upwards diagonals
Y6 := -192*d    ;Above
Loop, 3
{
    Line(mX,mY,Y6,-160*d,64*d,-64*d)
    Y6 += 128*d
}

Y6 := -160*d
Loop, 3
{
    Line(mX,mY,Y6,-128*d,64*d,-64*d)
    Y6 += 128*d
}

Y6 := -160*d    ;Below

Loop, 3
{
    Line(mX,mY,Y6,192*d,64*d,-64*d)
    Y6 += 128*d
}

Y6 := -128*d
Loop, 3
{
    Line(mX,mY,Y6,224*d,64*d,-64*d)
    Y6 += 128*d
}

;Small downwards diagonals
Y6 := -128*d    ;Left
Loop, 3
{
    Line(mX,mY,-224*d,Y6,64*d,64*d)
    Y6 += 128*d
}

Y6 := -160*d
Loop, 3
{
    Line(mX,mY,-192*d,Y6,64*d,64*d)
    Y6 += 128*d
}

Y6 := -160*d    ;Right

Loop, 3
{
    Line(mX,mY,128*d,Y6,64*d,64*d)
    Y6 += 128*d
}

Y6 := -192*d
Loop, 3
{
    Line(mX,mY,160*d,Y6,64*d,64*d)
    Y6 += 128*d
}

;Large upwards diagonals
z6 := -192*d
Y6 := -32*d
Loop, 2
{
    Loop, 3
    {
        Line(mX,mY,z6,Y6,96*d,-96*d)
        z6 += 128*d
    }
    z6 := -160*d
    y6 += 32*d
}

z6 := -192*d
Y6 := 96*d
Loop, 2
{
    Loop, 3
    {
        Line(mX,mY,z6,Y6,96*d,-96*d)
        z6 += 128*d
    }
    z6 := -160*d
    y6 += 32*d
}

;Large downwards diagonals
z6 := -128*d
Y6 := -160*d
Loop, 2
{
    Loop, 3
    {
        Line(mX,mY,z6,Y6,96*d,96*d)
        y6 += 128*d
    }
    y6 := -192*d
    z6 += 32*d
}

z6 := 0
Y6 := -160*d
Loop, 2
{
    Loop, 3
    {
        Line(mX,mY,z6,Y6,96*d,96*d)
        y6 += 128*d
    }
    y6 := -192*d
    z6 += 32*d
}

MouseMove, mX, mY
BlockInput MouseMoveOff
Return

Line(mX,mY,coordX,coordY,offsX,offsy)
{
    MouseMove, mX+coordX, mY+coordY
    MouseGetPos, zX, zY
    MouseClickDrag, L, zX, zY, zX+offsX, zY+offsy
}

;For small 45 degree angles
;D  = 64*d
;D2 = -64*d upwards slant, 64*d downwards slant

;For large 45 degree angles
;D  = 96*d
;D2 = -96*d upwards slant, 96*d downwards slant

;For small /\ angles
;D  = 8
;D2 = -16*d upwards slant, 16*d downwards slant

;For large /\ angles
;D  = 32*d
;D2 = -64*d upwards slant, 64*d downwards slant

;For small <> angles
;D  = 16*d
;D2 = -8 upwards slant, 8 downwards slant

;For large <> angles
;D  = 64*d
;D2 = -32*d upwards slant, 32*d downwards slant
