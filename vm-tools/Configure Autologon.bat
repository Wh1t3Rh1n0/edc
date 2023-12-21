@echo off

REM ----- Check that the file is run with administrative rights -----

net session >nul 2>&1
if %errorLevel% == 0 (
    goto :adminOK
) else (
    echo ERROR: This script must be run as an administrator
    pause
    goto :end
)
:adminOK


if "%1"=="-h" goto usage
if "%1"=="--help" goto usage
if "%1"=="/h" goto usage
if "%1"=="/?" goto usage
goto skipusage

:usage
echo Usage: %0 ^<Username^> ^<Password^> [Domain]
echo.
echo Or run with no arguments to start in interactive mode.
echo.
goto end

:skipusage

if "%1"=="" (
    set /p autouser="Username: "
    set /p autopass="Password: "
    set /p autodom="Domain (optional): "
) else (
    set autouser=%1
    set autopass=%2
    set autodom=%3
)


reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\winlogon" /v AutoAdminLogon /t REG_SZ /d "1" /f
REM reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\winlogon" /v DefaultUserName /t REG_SZ /d "%1" /f
REM reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\winlogon" /v DefaultPassword /t REG_SZ /d "%2" /f

reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\winlogon" /v DefaultUserName /t REG_SZ /d "%autouser%" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\winlogon" /v DefaultPassword /t REG_SZ /d "%autopass%" /f

if NOT "%autodom%"=="" (
  reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\winlogon" /v DefaultDomainName /t REG_SZ /d "%autodom%" /f
) else (
  reg delete "HKLM\Software\Microsoft\Windows NT\CurrentVersion\winlogon" /v DefaultDomainName /f
)

echo Done!

:end
