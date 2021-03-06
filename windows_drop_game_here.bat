REM usage run_windows.bat <filename>
REM you can also drag and drop a rom here
setlocal
cd /d %~dp0
set _filename=%~n1
set _extension=%~x1
echo input file name is ^<%_filename%^> and extension is ^<%_extension%^>
set GAME=%1
set COREEXT=dll
set CORE=sameboy_libretro.%COREEXT%
if "%_extension%"==".gb" (set CORE=sameboy_libretro.%COREEXT%)
if "%_extension%"==".gg" (set CORE=genesis_plus_gx_libretro.%COREEXT%)
if "%_extension%"==".sms" (set CORE=genesis_plus_gx_libretro.%COREEXT%)
set RA_PATH=%userprofile%\AppData\Roaming\RetroArch\retroarch
set libretro_path=%userprofile%\AppData\Roaming\RetroArch\retroarch
%RA_PATH% -L %~dp0\%CORE% %GAME% --verbose
pause