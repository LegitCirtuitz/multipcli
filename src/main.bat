@echo off
set enabledelayedexpansion

call pkgsettings.json

for /F %%A in ('copy /Z "%~f0" nul') do set "CR=%%A"

echo Loading Packages...

if "%~1"=="" (
    goto :usage
)

if "%~1"=="install" (
    if "%~2"=="DNostics" (
        for /f "delims=" %%a in ('powershell -Command "(Get-Content 'pkgsettings.json' | ConvertFrom-Json).DNostics"') do (
        if "%%a"=="true" (
            echo Package DNostics already enabled.
        ) else (
        powershell -Command "$json = Get-Content 'pkgsettings.json' | ConvertFrom-Json; $json.setting1 = 'true'; $json | ConvertTo-Json | Set-Content 'pkgsettings.json'"
        )

        
    )
)

:usage
echo =======================================
echo PACKAGE COMMAND USAGE
echo =======================================
echo.
echo ---------------------------------------
echo "Argument   |Description              "