@echo off
set enabledelayedexpansion

echo Starting new Username command...
timeout /t 2
echo.
echo.
echo USERNAME
echo ========================================
set /p "usrName=Please enter your new username: "
echo Welcome, %usrName%!

echo.
echo CLI NAME
echo ==========================================
set /p "oscli=New CLI Name: "
echo Currently Logging in as: [%usrName%@%oscli%]...

(
    echo set "usrName=%usrName%"
    echo set "oscli=%oscli%"
    
)>hostdata.bat

call hostdata.bat