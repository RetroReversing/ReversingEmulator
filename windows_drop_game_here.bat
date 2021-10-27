@echo off
REM usage run_windows.bat <filename>
REM you can also drag and drop a rom here
setlocal
setlocal ENABLEDELAYEDEXPANSION
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

set RA_PATH=""

echo Checking for Steam Version of RetroArch...
IF EXIST %programfiles(x86)%\Steam\steamapps\common\RetroArch\retroarch ( 
echo Steam version installed correctly
set RA_PATH="%programfiles(x86)%\Steam\steamapps\common\RetroArch\retroarch"
) ELSE ( echo Steam Version not installed )

echo 'Checking for Standard RetroArch...'
IF EXIST %userprofile%\AppData\Roaming\RetroArch\retroarch ( 
echo Standard Version installed correctly
set RA_PATH=%userprofile%\AppData\Roaming\RetroArch\retroarch
 ) ELSE ( echo Standard Version not installed )

if %RA_PATH%=="" ( echo Please install RetroArch either from Steam or from the Official installer on the website before continuing )
rem PAUSE
rem )

echo Checking if Core has been built...

IF EXIST %~dp0\%CORE% ( 
echo SUCCESS The Core is ready to use
 ) ELSE ( echo The Core Needs to be compiled )

@echo on
set libretro_path=%RA_PATH%
%RA_PATH% -L %~dp0\%CORE% %GAME% --verbose
pause