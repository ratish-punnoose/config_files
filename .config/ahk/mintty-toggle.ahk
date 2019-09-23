;*******************************************************************************
;               Settings
;*******************************************************************************
#NoEnv
#SingleInstance force
SendMode Input
DetectHiddenWindows, on
SetWinDelay, -1




;*******************************************************************************
;               Preferences & Variables
;*******************************************************************************
; For setting on startup on Windows 10, set symlink to this file from
; <home_dir>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

SCRIPTNAME := "mintty-toggle"
; Path to mintty
mintty_exe := "C:\cygwin64\bin\mintty.exe"
;mintty_args := "-"
mintty_args := "/usr/bin/bash -l -c /usr/bin/screen"
mintty_cmd := mintty_exe . " " . mintty_args



;*******************************************************************************
;               Hotkeys
;*******************************************************************************
Hotkey, ^``, ConsoleHotkey

;*******************************************************************************
;               Menu
;*******************************************************************************
if !InStr(A_ScriptName, ".exe")
  Menu, Tray, Icon, %A_ScriptDir%\%SCRIPTNAME%.ico
Menu, Tray, NoStandard
; Menu, Tray, MainWindow
Menu, Tray, Tip, %SCRIPTNAME%
Menu, Tray, Click, 1

Menu, Tray, Add, Reload, ReloadSub
Menu, Tray, Add, Exit, ExitSub

global mintty_pid
init(mintty_cmd)

WinWaitClose, ahk_pid %mintty_pid%
ExitApp
return

init(cmd)
{
	global mintty_pid, mintty_exe, mintty_cmd
	if !WinExist("ahk_class mintty") {
	      ;  cmd , startdir, initstate, output.pid
	      Run %mintty_cmd%, , , mintty_pid

	      ; Wait,  wintitle, , seconds
	      ;WinWait, ahk_pid %mintty_pid%, , 5
	      WinWait, ahk_class mintty, , 5
	      if ErrorLevel {
		 MsgBox, WinWait timeout for class mintty_pid
		  ;    WinWait Timed out (WHY?!?)
	      }

	}

	; Get ID of window.
	WinGet, mintty_pid, PID, ahk_class mintty
	if ErrorLevel {
	     MsgBox, WinGet failed for mintty
	     ExitApp
	}


	; Hide window border
	; hide window borders and caption/title
	WinSet, Style, -0xC00000, ahk_pid %mintty_pid%
	SysGet, mon_dim, MonitorWorkArea

	width := (mon_dimRight - mon_dimLeft)
	height := (mon_dimBottom - mon_dimTop)/3

	WinSet, Redraw, , ahk_pid %mintty_pid%
	WinMove, ahk_pid %mintty_pid%, , mon_dimLeft, mon_dimTop, width, height
}


ConsoleHotkey:
	if WinExist("ahk_pid" . mintty_pid) {
	      if WinActive("ahk_pid" . mintty_pid) {
		 WinMinimize, ahk_pid %mintty_pid%
	      } else {
		 WinRestore, ahk_pid %mintty_pid%
		 WinActivate, ahk_pid %mintty_pid%
	      }
	}
return


ReloadSub:
Reload
return

ExitSub:
   ExitApp
   return


