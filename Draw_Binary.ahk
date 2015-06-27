;Binary rectangle drawer
;Draw_Binary.ahk
;By: Tora
;6/27/2015

#SingleInstance, Force
SetMouseDelay, 1
Esc::TryReload()
Return

!d::
Uboa = 
(
00000111111110000000000
00011111111111110000000
00111100001111111000000
01111100000000111100000
01111000000000001110000
01101000000000001111000
11101010000000000111100
11001110000111100111100
11011000001111110011100
11110000000001111011100
11000000000000011011110
11000000000000000011110
11000001000011000011110
11000111111110000011110
11000001111100000001110
11100000111100000001110
01100000011000000001110
01100000000000000001110
01100000000000000001110
00111000000000000011110
00111000000000000111110
00111100000000000111111
00111111000000001111110
00111111000000011111110
01111111110000011111110
01111111111111111111110
00000111111111111000000
)

Draw(Uboa, 10)
Return

!f::
Invader =
(
00100000100
00010001000
00111111100
01101110110
11111111111
10111111101
10100000101
00011011000
)

Draw(Invader, 10)
Return

Draw(Layout, BlockSize)
{
    PreventDesktopUsage()

    BlockInput MouseMove

    Len := StrLen(Layout)
    RowSize := StrLen(StrSplit(Layout, "`n")[1])
    Index := 0

    While (Index < Len)
    {
        Length := 1
        Char := GetChar(Layout, Index)

        if (Char == "1")
        {
            While (GetChar(Layout, Index + Length) == "1")
            {
                Length := Length + 1
            }

            if (!FillRectangle(Length, BlockSize, GetClass()))
            {
                Break
            }
        }
        else if (Char == "0")
        {
            MouseMove, BlockSize, 0, 0, R
        }
        else
        {
            MouseMove, -(RowSize * BlockSize), BlockSize, 0, R
        }
        Index := Index + Length
    }

    BlockInput MouseMoveOff
}

FillRectangle(Width, Height, StartClass)
{
    MouseGetPos, mX, mY
    mY2 := mY
    mX2 := mX + Width * Height

    Loop %Height%
    {
        CurrentClass := GetClass()

        If (CurrentClass != StartClass)
        {
            Return false
        }

        MouseClickDrag, L, mX, mY, mX2, mY2
        mY -= 1
        mY2 -= 1
    }

    MouseMove, 0, Height - 1, 0, R
    Return true
}

GetChar(String, Index)
{
    return SubStr(String, Index, 1)
}

GetClass()
{
    MouseGetPos,,, Window
    WinGetClass, Class, ahk_id %Window%
    return Class
}

PreventDesktopUsage()
{
    Class := GetClass()

    If (Class == "Progman" || Class == "WorkerW")
    {
        TryReload()
    }
}

TryReload()
{
    IfExist, %A_ScriptFullPath%
        Reload
    Else
        ExitApp
}
