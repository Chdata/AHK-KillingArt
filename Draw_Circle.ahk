#SingleInstance, Force
Esc::Reload
;SetMouseDelay, 0
Return

$*Space::		; press space, then move the mouse, then release space
MouseGetPos, baseX, baseY
Keywait, Space
Speed = 15		; also effects the accuracy of the circle, be careful
Clockwise := true
SetDefaultMouseSpeed, 0
MouseGetPos, offsetX, offsetY
dx := offsetX - baseX
dy := (-offsetY + baseY) * (!Clockwise*2-1)
offsetR := (dx = 0) ? (0.25+(dy>0)/2) : (ATan(dy/dx)/6.2831853+(dx<0)/2+(dx>0 && dy<0))
SetBatchLines, -1
Loop, % slices := Ceil( (10/speed) * Dist := Sqrt(dx**2 + dy**2) )
   MouseMove, % BaseX + Dist * Cos(6.2831853*(A_Index / slices + offsetR))
   , % baseY - (!Clockwise*2-1) * Dist * Sin(6.2831853*(A_Index / slices + offsetR))
Return