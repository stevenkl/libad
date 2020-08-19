;*****************************************
;libad.au3 by Steven Kleist (stevenkl) <kleist.steven@gmail.com>
;Created with ISN AutoIt Studio v. 1.11
;*****************************************


Global $g__libad_dll = Null


Func _Libad_Startup($sDll = ".\libad4.dll")
	$g__libad_dll = DllOpen($sDll)
	If @error Then Return SetError(@error, @extended, False)
	
	ConsoleWrite("Dll handle: " & $g__libad_dll & @CRLF)
	Return True
EndFunc


Func _Libad_Shutdown()
	If Not $g__libad_dll = Null Then
		DllClose($g__libad_dll)
	EndIf
EndFunc


Func _Libad_Open($sName)
	If $g__libad_dll = Null Then _Libad_Startup()
	
	Local $result = DllCall($g__libad_dll, "int", "ad_open", "str", $sName)
	
	; Error while calling dll function
	If @error Then
		Return SetError(@error, @extended, False)
	EndIf
	
	; Error opening device $sName
	If $result[0] = -1 Then
		Return SetError(1, 2)
	EndIf
	
	Return $result[0]
EndFunc


Func _Libad_Close($iHandle)
	If $g__libad_dll = Null Then _Libad_Startup()
	
	Local $result = DllCall($g__libad_dll, "int", "ad_close", "int", $iHandle)
	
	; Error while calling dll function
	If @error Then
		Return SetError(1, 1)
	EndIf
	
	; Error closing device
	If $result[0] <> 0 Then
		Return SetError(1, $result[0])
	EndIf
	
	Return True
EndFunc


Func _Libad_GetVersion()
	If $g__libad_dll = Null Then _Libad_Startup()
	
	Local $result = DllCall($g__libad_dll, "uint", "ad_get_version")
	
	; Error while calling dll function
	If @error Then
		Return SetError(@error, @extended, False)
	EndIf
	
	Return $result[0]
EndFunc


Func _Libad_GetDriverVersion()
	
EndFunc


Func _Libad_GetProductInfo($iHandle, $iID, $pInfo, $iSize)
	
EndFunc

