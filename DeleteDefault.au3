#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=Oxygen-Icons.org-Oxygen-Actions-trash-empty.ico
#AutoIt3Wrapper_Outfile_x64=DeleteDefault.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=Delete c:\users\default\AppData for all non windows files that are not standard from windows first built from iso
#AutoIt3Wrapper_Res_Description=Delete AppData
#AutoIt3Wrapper_Res_Fileversion=1.0.0.9
#AutoIt3Wrapper_Res_ProductName=Delete AppData
#AutoIt3Wrapper_Res_ProductVersion=1.0.0.9
#AutoIt3Wrapper_Res_LegalCopyright=Carm0
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>
#include <array.au3>

If UBound(ProcessList(@ScriptName)) > 2 Then Exit
Local $dfiles, $dfolders, $x = 0
$cfiles = _FileListToArrayRec('C:\Users\Default\AppData\', "*" & "*", $FLTAR_FILES, $FLTAR_RECUR, $FLTAR_NOSORT, $FLTAR_FULLPATH)
FileInstall('defaultfiles.txt', @TempDir & '\defaultfiles.txt', 1)

_FileReadToArray(@TempDir & '\defaultfiles.txt', $dfiles)
;_FileReadToArray('defaultfolders.txt', $dfolders)

For $i = 1 To UBound($cfiles) - 1
	gogo()
Next

Func gogo()
	For $j = 1 To UBound($dfiles) - 1
		If $cfiles[$i] = $dfiles[$j] Then
			$x = 1
			;MsgBox(0, 'match', $cfiles[$i])
			;ContinueLoop
		EndIf
	Next

	If $x = 0 Then
		;MsgBox(0,'no match', $cfiles[$i])
		FileDelete($cfiles[$i])
	EndIf
	$x = 0
EndFunc   ;==>gogo

$i = ""
$cfiles = _FileListToArrayRec('C:\Users\Default\AppData\', "*" & "*", $FLTAR_FOLDERS, $FLTAR_RECUR, $FLTAR_NOSORT, $FLTAR_FULLPATH)
For $i = 1 To UBound($cfiles) - 1
	$size = DirGetSize($cfiles[$i], 0)
	If @error Then
		;MsgBox(0,"", 'Error')
		ContinueLoop
	ElseIf $size = 0 Then
		;MsgBox(0, $cfiles[$i], $size)
		DirRemove($cfiles[$i], 1)
	ElseIf $size > 0 Then
		;MsgBox(0, $cfiles[$i], "full")
		ContinueLoop
	EndIf
Next
FileDelete(@TempDir & '\defaultfiles.txt')
