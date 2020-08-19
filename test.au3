#pragma Compile(x64, true)
;test.au3

#include "libad.au3"


_Libad_Startup()
if @error then ConsoleWrite(StringFormat("[_Libad_Startup()] @error: %d, @extended: %d", @error, @extended) & @CRLF)

Global $iHandle = _Libad_Open("usb-pio")
if @error then ConsoleWrite(StringFormat("[_Libad_Open()] @error: %d, @extended: %d", @error, @extended) & @CRLF)


local $version = _Libad_GetVersion()
if @error then
	ConsoleWrite(StringFormat("[_Libad_GetVersion()] @error: %d, @extended: %d", @error, @extended) & @CRLF)
Else
	ConsoleWrite(StringFormat("_Libad_GetVersion =  %d", $version) & @CRLF)
EndIf


_Libad_Close($iHandle)
if @error then ConsoleWrite(StringFormat("[_Libad_Close()] @error: %d, @extended: %d", @error, @extended) & @CRLF)


;~ While 1
;~ 	Sleep(100)
;~ Wend


_Libad_Shutdown()