@echo off
setlocal enabledelayedexpansion
call settings.bat

for /f %%a in ('echo prompt $E^|cmd') do set "ESC=%%a"

set "OK=!ESC![92m"
set "INFO=!ESC![94m"
set "ERROR=!ESC![91m"
set "WARN=!ESC![93m"
set "CLR_RESET=!ESC![0m"

if "!clienabled!"=="1" (
    echo [!INFO!INFO!CLR_RESET!] CLI is enabled.
    echo [!INFO!INFO!CLR_RESET!] Starting CLI...
)

cls

echo !versionData!
echo.

if exist "hostdata.bat" call hostdata.bat

if "%usrName%"=="" goto :firstrun
if "%oscli%"=="" goto :firstrun

goto :climain

:firstrun
echo USERNAME
echo ========================================
set /p "usrName=Please enter your username: "
echo Welcome, %usrName%!

echo.
echo CLI NAME
echo ==========================================
set /p "oscli=CLI Name: "
echo Currently Logging in as: [%usrName%@%oscli%]...

(
    echo set "usrName=%usrName%"
    echo set "oscli=%oscli%"
    
)>hostdata.bat

echo.
echo Would You Like to Install MSYS2?
echo ============================================
echo /p msysask="Install Msys? (Y/N): "
if /i "%msysask%"=="Y" (
    call msyscheck.bat
)
if /i "%msysask%"=="N" (
    call hostdata.bat
    goto :climain
)

call hostdata.bat
goto :climain

set "inputdata=[%usrName%@%oscli%]"

:climain
set "cmdInput="
set /p "cmdInput=[%usrName%@%oscli%] $ "

for /f "tokens=1,* delims= " %%a in ("%userInput%") do (
    set "cmdInput=%%a"
    set "cmdArgs=%%b"
)

for /f "tokens=*" %%a in ('powershell -command "$j = Get-Content 'commands.json' -Raw | ConvertFrom-Json; if($j.PSObject.Properties.Name -contains '%cmdInput%') { $j.%cmdInput% }"') do (
    set "targetScript=%%a"
)

if defined targetScript (
    if exist "!targetScript!" (
        call "!targetScript!"
    ) else (
        echo [!ERROR!Error: Script '!targetScript!' not found.!CLR_RESET!]
    )
    set "targetScript="
) else (
    echo !ERROR!Command '%cmdInput%' not found.!CLR_RESET!
)

goto :climain
pause