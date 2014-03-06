;
;-------this AHK file is created by Tx Zhu;
;

;###########################################################################################################################
;################################## SETTING FOR THIS SCRIPT ################################################################
;###########################################################################################################################

;
;-------options=[force|Ignore|off]  force=reload the script; ignore=ignore the intent of reloading; off=open independently; default=ask each time.
;
#SingleInstance force
#NoTrayIcon
#Persistent
;
;-------replace the tray icon.
;
;IfExist , ico\my_icon.ico
;	menu tray, icon ,  ico\my_icon.Ico

;###########################################################################################################################
;##################################### SHOW ###############################################################################
;###########################################################################################################################
;
;------show date and time
;
Gui  +AlwaysOnTop +LastFound -Caption +owner 
Gui, font, cRed s23  w700, Arial ;Modern
Gui,color,FFFFFF
WinSet, TransColor,FFFFFF
SetTimer, clocktimer, 200
Gui, add,text, x0 y0 vShowTime,00:00  00-00 0
Gui, show,x1070 y-5 w200 h38 NoActivate,miniclock
return

clocktimer:
GuiControl,,ShowTime,%A_Hour%:%A_Min%  %A_MM%-%A_DD% %A_WDay%
return

;###########################################################################################################################
;##################################### EXPAND ABBREVIATIONS ##############################################################
;###########################################################################################################################

;
;-------press /dd = year-month-day.
;
::/dd::
    d=%a_yyyy%-%a_mm%-%a_dd%
    Clipboard=%d%
    send, ^v
	Return

;
;-------press /tt = hour:minute year-month-day.
;
::/tt::
    d=%a_yyyy%-%a_mm%-%a_dd% %A_Hour%:%a_min%:%A_Sec%
    Clipboard=%d%
    send, ^v
    return


;###########################################################################################################################
;############################################# HOTKEYS ####################################################################
;###########################################################################################################################

;
;-------Win + Space = run notepad.
;
#Space::run, notepad, ; ,max

;
;-------Win + A = run Scite. 
;
;#a::run, scite

;
;------Win + z =run total commander.
;
#z::
run, c:\totalcmd\totalcmd.exe /O
WinSet, Style, -0xC00000, Total Commander
return

;
;------Win + c =run Winedt_latex.
;
; #c::run, ct

;
;-----Win + f = run firefox.
;
#f::run, ff


;
;-------Win + S = run evrything.
;
#s::run, ev

;
;-------Win + ` = run AltRun.
;
#`::run, f:\安装包\run\ALTRun\ALTRun.exe

;
;-------win + F7 = Fn + F7  shutdown screen
;
#F7::
sleep, 1000
SendMessage, 0x112, 0xF170, 2,, Program Manager
return

;
;----------win + w = run webster and maxize it
;
#w::
run, f:\Win+R_Short\webster.lnk
WinWait, Merriam-Webster's 11th Collegiate Dictionary
Send, !{Space}{x}
return

;
;---------win + q = switch evernote between on and off
;
#q::
;DetectHiddenWindows, on
IfWinNotExist ahk_class ENMainFrame
Run c:\Program Files\Evernote\Evernote\Evernote.exe, max
Else
IfWinNotActive ahk_class ENMainFrame
WinActivate
Else
WinClose
Return

;~ ;
;~ ;-------Win +  v =run  vim with Lec2.tex
;~ ;
;~ #v::
;~ SetTitleMatchMode, 2
;~ run,  "c:\Program Files\Vim\vim73\gvim.exe" -o "e:\/sharefile/Vimwiki/\index.wiki" "d:\study\Misc\texts\CTEX\Comm.Algebra_tan\bbb\body\Lec4.tex"
;~ WinWait, GVIM
;~ WinSet, Style, -0xC00000,  GVIM
;~ ;WinSet, Transparent, 150, GVIM
;~ return

;
;-------m + g = send gmail address.
;
~m & g::
send, {BackSpace}
send, txzhu1010@gmail.com
return

;
;-------替换Pause/Break 和CapsLock这两个键
;
Pause::CapsLock

CapsLock::
send, {Pause}
return


;###########################################################################################################################
;############################################# Advanced Functions ############################################################
;###########################################################################################################################

;
;-------Win + Del = 安全删除硬件
;
;功能：安全删除最后添加的可移动存储设备。比如先插了U盘，最后又连了手机，那么只安全删除最后添加的手机。
;天堂之门 menk33@163.com 2009年1月17日
#Del:: 
    Run %windir%\system32\control.exe hotplug.dll ;调用安全删除硬件窗口
    WinWait 安全删除硬件
    ControlSend SysTreeView321, {End} ;定位到最后添加的设备
    ControlSend Button2, s ;按下停止按钮
    WinWait 停用硬件设备
    ControlSend Button1, {Enter} ;按下确定
    WinWait 安全地移除硬件
    ControlSend 确定,  {Enter}  ;按下确定
    WinClose 安全删除硬件
    return


;
;-------按下 win+F11 消除和恢复活动窗口的标题行
;-------来自 http://xbeta.info/mini-tc.htm#h-ideal
;
#f11::
WinSet, Style, ^0xC00000, A
return

;
;
;------令程序始终置顶
#t::
WinSet, AlwaysOnTop, Toggle, A
return

;
;-------鼠标左键选择的同时复制选定内容；鼠标中键粘贴=Ctrl+V
;------来自 http://www.autohotkey.com/forum/topic3079.html&highlight=middle+mouse+copy
;

;~ CoordMode Mouse, Screen

;~ ~LButton::
   ;~ MouseGetPos x0, y0            ; save start mouse position
   ;~ Loop
   ;~ {
     ;~ Sleep 20                    ; yield time to others
     ;~ GetKeyState keystate, LButton
     ;~ IfEqual keystate, U, {
       ;~ MouseGetPos x, y          ; position when button released
       ;~ break
     ;~ }
   ;~ }
   ;~ if (x-x0 > 5 or x-x0 < -5 or y-y0 > 5 or y-y0 < -5)
   ;~ {                             ; mouse has moved
      ;~ clip0 := ClipBoardAll      ; save old clipboard
      ;~ ClipBoard =
      ;~ Send ^c                    ; selection -> clipboard
      ;~ ClipWait 1, 1              ; restore clipboard if no data
      ;~ IfEqual ClipBoard,, SetEnv ClipBoard, %clip0%
   ;~ }
;~ return

;~ ~Mbutton::
;~ Send, ^v                   ;Paste via middle mouse click
;~ return


