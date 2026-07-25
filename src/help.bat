@echo off
setlocal enabledelayedexpansion

set "json_file=%~dp0..\commands.json"

echo ==========================================
echo           AVAILABLE COMMANDS
echo ==========================================

for /f "usebackq tokens=*" %%a in (`powershell -Command "$json = Get-Content '%json_file%' -Raw | ConvertFrom-Json; $json.PSObject.Properties.Name"`) do (
    echo   - %%a
)

echo ==========================================
set /p cmd_choice="Enter a command name to see its path (or press Enter to exit): "

if "%cmd_choice%"=="" exit

for /f "usebackq tokens=*" %%b in (`powershell -Command "$json = Get-Content '%json_file%' -Raw | ConvertFrom-Json; $json.'%cmd_choice%'"`) do (
    if "%%b"=="" (
        echo Command not found.
    ) else (
        echo Path for '%cmd_choice%': %%b
    )
)

echo.
pause
goto :EOF