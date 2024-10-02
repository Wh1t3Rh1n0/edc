@echo off

echo Rearm Windows Evaluation License
echo ================================

:: Check Permissions
echo Administrative permissions required. Detecting permissions...
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
) else (
    echo Failure: Current permissions inadequate.
    echo Re-run this script as an Administrator.
    echo.
    echo Press any key to exit.
    pause >nul
    goto end
)

:: Execute rearm

echo Executing 'slmgr.exe /rearm'...

slmgr /rearm

echo.
echo You may need to reboot TWICE for all license expiration messages to 
echo be removed.
echo.
echo Press any key to delete this file and reboot.
pause 2>nul >nul
shutdown -r -f -t 5
del "%~dpf0"

:: Exit
:end