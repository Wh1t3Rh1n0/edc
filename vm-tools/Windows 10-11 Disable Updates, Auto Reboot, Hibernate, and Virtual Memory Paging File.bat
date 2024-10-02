@echo off

echo ----- Check that the file is run with administrative rights -----

net session >nul 2>&1
if %errorLevel% == 0 (
    goto :adminOK
) else (
    echo ERROR: This script must be run as an administrator
    goto :end
)
:adminOK



echo ----- Prevent Windows 10 from Automatically Rebooting when Inactive -----

REM Run this command from an elevated command prompt. It creates a scheduled task that will change Windows' "Active Hours" every hour to include the current time.

REM schtasks /create /F /RU SYSTEM /SC HOURLY /TN NoAutoReboot /TR "powershell -c '$S=(24+(Get-Date -Fo '''%H''')-1)%24;$E=($S+18)%24;$R='''HKLM:\Software\Microsoft\WindowsUpdate\UX\Settings'''; Set-ItemProperty -Path $R -Na ActiveHoursStart -V $S -PassThru -Fo ; Set-ItemProperty -Path $R -Na ActiveHoursEnd -V $E -PassThru -Fo'"

echo powershell -enc JABTAD0AKAAyADQAKwAoAEcAZQB0AC0ARABhAHQAZQAgAC0ARgBvACAAIgAlAEgAIgApAC0AMQApACUAMgA0ADsAJABFAD0AKAAkAFMAKwAxADgAKQAlADIANAA7ACQAUgA9ACIASABLAEwATQA6AFwAUwBvAGYAdAB3AGEAcgBlAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8AdwBzAFUAcABkAGEAdABlAFwAVQBYAFwAUwBlAHQAdABpAG4AZwBzACIAOwBTAGUAdAAtAEkAdABlAG0AUAByAG8AcABlAHIAdAB5ACAALQBQAGEAdABoACAAJABSACAALQBOAGEAIABBAGMAdABpAHYAZQBIAG8AdQByAHMAUwB0AGEAcgB0ACAALQBWACAAJABTACAALQBQAGEAcwBzAFQAaAByAHUAIAAtAEYAbwAgADsAIABTAGUAdAAtAEkAdABlAG0AUAByAG8AcABlAHIAdAB5ACAALQBQAGEAdABoACAAJABSACAALQBOAGEAIABBAGMAdABpAHYAZQBIAG8AdQByAHMARQBuAGQAIAAtAFYAIAAkAEUAIAAtAFAAYQBzAHMAVABoAHIAdQAgAC0ARgBvAA== > C:\Windows\NoAutoReboot.bat

schtasks /create /F /RU SYSTEM /SC HOURLY /TN NoAutoReboot /TR "C:\windows\system32\cmd.exe /c C:\windows\NoAutoReboot.bat"



echo ----- Completely disable Automatic Updates -----

REM This makes extra sure that Windows doesn't automatically reboot to install updates

REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 1 /f



echo ----- Disable hibernate -----

powercfg -h off



echo ----- Disable virtual memory paging file -----

wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=0,MaximumSize=0
wmic pagefileset delete



echo ----- DONE -----

echo You must reboot for all changes to take effect.
echo Press any key to reboot or CTRL+C to quit.
pause >nul
shutdown -r -f -t 00

:end
