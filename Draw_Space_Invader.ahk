;Space Invader drawer
;Draw_Space_Invader.ahk
;By: Tora
;2012

;SetMouseDelay -1
;SetBatchLines -1
Esc::TryReload()
Return
!d::
MouseGetPos, mX, mY
/*
mYtemp := mY
mXtemp := mX
Loop, 13 {
    FillSquare(mX, mY)
    mX += 20
}
mY += 20
mX -= 13*20
Loop, 4 {
    FillSquare(mX, mY)
    mX += 20
}
mX += 20
Loop, 3 {
    FillSquare(mX, mY)
    mX += 20
}
mX += 20
Loop, 4 {
    FillSquare(mX, mY)
    mX += 20
}
mX -= 13*20
mY += 20
Loop, 3 {
    FillSquare(mX, mY)
    mX += 20
}
mX += 20*7
Loop, 3 {
    FillSquare(mX, mY)
    mX += 20
}
mX -= 13*20
mY += 20
Loop, 2 {
    FillSquare(mX, mY)
    mX += 20
}
mX += 9*20
Loop, 2 {
    FillSquare(mX, mY)
    mX += 20
}
mX -= 13*20
mY += 20
FillSquare(mX, mY)
mX += 11*20
FillSquare(mX, mY)
mX -= 13*20
mY += 20
FillSquare(mX, mY)
mX += 11*20
FillSquare(mX, mY)
mX -= 13*20
mY += 20
FillSquare(mX, mY)
mX += 11*20
FillSquare(mX, mY)
mX -= 13*20
mY += 20
Loop, 4 {
    FillSquare(mX, mY)
    mX += 20
}
mX += 100
Loop, 4 {
    FillSquare(mX, mY)
    mX += 20
}
mX -= 13*20
mY += 20
Loop, 13 {
    FillSquare(mX, mY)
    mX += 20
}
mY := mYtemp
mX := mXtemp
*/
DrawSquare(mX, mY)
mX += 120
DrawSquare(mX, mY)
mY += 20
mX -= 100
DrawSquare(mX, mY)
mX += 80
DrawSquare(mX, mY)
mY +=20
mX -= 100
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX -= 140
mY += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
FillSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
FillSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX -= 180
mY += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX -= 200
mY += 20
DrawSquare(mX, mY)
mX += 20
FillSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
FillSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX -= 200
mY += 20
DrawSquare(mX, mY)
mX += 20
FillSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
FillSquare(mX, mY)
mX += 20
FillSquare(mX, mY)
mX += 20
FillSquare(mX, mY)
mX += 20
FillSquare(mX, mY)
mX += 20
FillSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
FillSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX -= 140
mY += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
FillSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)
mX += 20
DrawSquare(mX, mY)

Return

FillSquare(mX, mY)
{
    mY2 := mY
    mX2 := mX + 20
    Loop 20 {
        MouseClickDrag, L, mX, mY, mX2, mY2
        mY -= 1
        mY2 -= 1
    }
    Return
}
DrawSquare(mX, mY)
{
    mX2 := mX + 20
    mY2 := mY - 20
    MouseClickDrag, L, mX, mY, mX2, mY
    MouseClickDrag, L, mX, mY, mX, mY2
    MouseMove, mX2, mY2
    MouseGetPos, mX, mY
    mX2 := mX - 20
    mY2 := mY + 20
    MouseClickDrag, L, mX, mY, mX-20, mY
    MouseClickDrag, L, mX, mY, mX, mY+20
    Return
}

TryReload()
{
    IfExist, %A_ScriptFullPath%
        Reload
    Else
        ExitApp
}