#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
LWin::
    WinShow, ahk_class Shell_TrayWnd
    ExitApp
!F4::
    ExitApp