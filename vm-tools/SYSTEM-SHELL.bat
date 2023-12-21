@echo off
REM ---------------------------------------------------------------------------
REM SYSTEM-SHELL.bat
REM ================
REM 2020-05-22 by Wh1t3Rh1n0
REM
REM SYSTEM shell for Windows 10 and up where "at" no longer works.
REM
REM Uses schtasks to create a task, execute a created batch file, display the
REM output, and then remove the created task.
REM
REM Works even if the SMB service is disabled. The SMB service is required to
REM use PSEXEC for a SYSTEM shell, so this will work when PSEXEC does not.
REM
REM Run with -v for verbose/debugging output
REM
REM ---------------------------------------------------------------------------

cd /D "%~dp0"

echo ====================
echo WINDOWS SYSTEM SHELL
echo ====================

echo %CD%|find " " 2>nul >nul
if "%errorlevel%"=="0" ( 
    echo.
    echo WARNING: This script may not work well when running from paths that contain spaces!
    echo Current path: %CD%
)
if "%1"=="-v" echo Files used for command execution and output:
if "%1"=="-v" echo - %CD%\RunAsSystem.bat
if "%1"=="-v" echo - %CD%\Output.txt
echo.

:START

set /p c="SYSTEM@%computername%> "

if "%c%"=="exit" goto EOF

echo %c% > RunAsSystem.bat

if "%1"=="-v" echo Creating scheduled task...
schtasks /create /tn RunAsSystem /RU SYSTEM /SC ONCE /ST 23:59 /TR "cmd.exe /c %CD%\RunAsSystem.bat 2>&1 > %CD%\Output.txt" /F 2>nul >nul

REM schtasks /query /TN RunAsSystem /V /FO List

if "%1"=="-v" echo Executing scheduled task...
schtasks /run /tn RunAsSystem 2>nul >nul

if "%1"=="-v" echo Waiting ~4 seconds for execution to complete...
ping -n 4 127.0.0.1 >nul 2>nul

if "%1"=="-v" echo.
if "%1"=="-v" echo Command output:
if "%1"=="-v" echo ---------------
type Output.txt
echo.

if "%1"=="-v" echo Ending task...
schtasks /End /TN RunAsSystem 2>nul >nul

if "%1"=="-v" echo Deleting task...
schtasks /delete /TN RunAsSystem /F 2>nul >nul
if "%1"=="-v" echo.

echo. > Output.txt

goto START


:EOF

echo Cleaning up created tasks...

del Output.txt
del RunAsSystem.bat

if "%1"=="-v" echo Checking that task no longer exists...
schtasks /query /TN RunAsSystem 2>&1 | find /I "ERROR: The system cannot find the file specified." >nul 2>nul

if not "%errorlevel%"=="0" (
    if "%1"=="-v" echo Ending task...
    schtasks /End /TN RunAsSystem 2>nul >nul
    if "%1"=="-v" echo Deleting task...
    schtasks /delete /TN RunAsSystem /F 2>nul >nul
    ping 127.0.0.1 >nul 2>nul
    goto EOF
)

echo DONE!