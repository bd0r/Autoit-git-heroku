#NoTrayIcon
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>


TraySetIcon(@ScriptDir & "\icon.ico")
Opt("TrayMenuMode", 3)



WinActivate("Windows PowerShell")


Sleep(500)


HotKeySet("^p", "cmdSnd")
HotKeySet("{ESC}", "cmdSnd")
HotKeySet("{'}", "cmdSnd")

myLoop()
Func myLoop()


    Local $idAbout = TrayCreateItem("About")
    TrayCreateItem("")

    Local $idExit = TrayCreateItem("Exit")

    TraySetState($TRAY_ICONSTATE_SHOW)

    While 1
		 Switch TrayGetMsg()
            Case $idAbout
                MsgBox(0, "PUSH TOOL FOR PowerShell >", "This Tool Sends commands in powerShell"&@LF& "PRESS Ctrl + P TO SEND" &@LF& "git add *"&@LF&"git commit -m"&@LF&"git push heroku master"&@LF&@LF& "FOR EXIT PRESS [ESC]")

            Case $idExit
                ExitLoop
			EndSwitch

    WEnd

EndFunc

Func cmdSnd()
   Switch @HotKeyPressed

		 Case "^p"

			If WinWaitActive("Windows PowerShell") Then
			   Send("git add .")
			   Send("{enter}")
			   Sleep(1000)
			   Send("git commit -m " &'"')
			   TrayTip("","Type Your Comment and press ['] Key",5)
			   Sleep(2000);
			   EndIf
		 Case	"{'}"
			   Send('"')
			   Send("{enter}")
			   Sleep(1000)
			   Send("git push heroku master")
			   Sleep(1000)
			   Send("{enter}")

		 Case "{ESC}"
				Exit
			 EndSwitch

   EndFunc