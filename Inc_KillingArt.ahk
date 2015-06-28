;Killing Art Include File
;Inc_KillingArt.ahk
;By: Chdata
;6/27/2015

#SingleInstance, Force
#NoEnv
SendMode Input

;Degrees to radians
;(pi/180)
dtr := 0.01745329252

;pi
pi := 3.14159265

;tau (2pi)
tau := 6.2831853

Sgn(Val)    ; Returns the sign of the value
{
    Return, x < 0 ? -1 : x > 0 ? 1 : 0
}

aRoot(Val)  ; Square root the absolute value of a number to avoid complex numbers, but multiply the result by its sign.
{
    Return Sgn(Val)*Sqrt(Abs(Val))
}

;Abs(Val)
;{
;    Return Sgn(Val)*Val
;}

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

GetClass()
{
    MouseGetPos,,, Window
    WinGetClass, Class, ahk_id %Window%
    return Class
}

; http://www.autohotkey.com/forum/viewtopic.php?p=341120#341120
; http://www.autohotkey.com/board/topic/98662-get-window-under-a-certain-xy-position
WinGetAtCoords(x,y,what="Class")
{     ; by SKAN and Learning one
    ; Returns Title/ID/Class/PID of window at given coordinates 
    WinID := DllCall( "GetAncestor", UInt      ; by SKAN
           ,DllCall( "WindowFromPoint", Int,X, Int,Y )
           , UInt, GA_ROOT := 2)
    if (what = "Title" or what = "T") {
        WinGetTitle, WinTitle, ahk_id %WinID%
        Return WinTitle
    }
    else if (what = "ID" or what = "I")
        Return WinID
    else if (what = "Class" or what = "C") {
        WinGetClass, WinClass, ahk_id %WinID%
        Return WinClass
    }
    else if (what = "PID" or what = "P") {
        WinGet, WinPID, PID, ahk_id %WinID%
        Return WinPID
    }
}

TryReload()
{
    IfExist, %A_ScriptFullPath%
        Reload
    Else
        ExitApp
}

PreventDesktopUsage()
{
    Class := GetClass()

    If (Class == "Progman" || Class == "WorkerW")
    {
        TryReload()
    }
}
