#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=
#AutoIt3Wrapper_Outfile_x64=Current_user_app_Data.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_UseX64=y
#AutoIt3Wrapper_Res_Comment=Gets Current user app Data to a file in same location as EXE
#AutoIt3Wrapper_Res_Description=Gets Current user app Data
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_ProductVersion=1.0.0.0
#AutoIt3Wrapper_Res_CompanyName=N/A
#AutoIt3Wrapper_Res_LegalCopyright=@carm
#AutoIt3Wrapper_Res_Language=1033
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <File.au3>
;#include <array.au3>
Local $dfiles, $dfolders, $x = 0
$usn = default
;un-comment line 21 and comment line 19 if you want to get the current user AppData list to be generated
;$usn = @UserName
$cfiles = _FileListToArrayRec('C:\Users\' & $usn & '\AppData\', "*" & "*", $FLTAR_FILES, $FLTAR_RECUR, $FLTAR_NOSORT, $FLTAR_FULLPATH)
_FileCreate($usn & 'AppData.txt')
_FileWriteFromArray($usn & 'AppData.txt', $cfiles,1)
