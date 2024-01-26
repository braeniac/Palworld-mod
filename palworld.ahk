; only run when "Pal" is the active window

#IfWinActive, Pal

^f:: 
    ToggleF := !ToggleF
    Send, %ToggleF%{ f down }
return

+LButton:: 
    ClickAndHold()
    return

#IfWinActive            ; Terminate the previous #IfWinActive directive

ClickAndHold() {
    Click down
    Sleep 10000         ; Hold the click for 10 seconds
    Click up
    Sleep 5000          ; Release for 5 seconds
    ClickAndHold()      ; Repeat the process
}