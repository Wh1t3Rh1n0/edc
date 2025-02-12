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


echo ----- Disable Windows Update services -----

sc config wuauserv start= disabled

sc config uhssvc start= disabled

sc config UsoSvc start= disabled

sc config edgeupdate start= disabled


goto done

echo ----- Block Microsoft Update hosts -----

REM Host list from https://learn.microsoft.com/en-us/windows-server/administration/windows-server-update-services/deploy/2-configure-wsus#211-configure-your-firewall-to-allow-your-first-wsus-server-to-connect-to-microsoft-domains-on-the-internet

echo. >> c:\windows\system32\drivers\etc\hosts

echo 0.0.0.0 windowsupdate.microsoft.com update.microsoft.com windowsupdate.com download.windowsupdate.com download.microsoft.com download.windowsupdate.com wustat.windows.com ntservicepack.microsoft.com go.microsoft.com dl.delivery.mp.microsoft.com delivery.mp.microsoft.com >> c:\windows\system32\drivers\etc\hosts

echo. >> c:\windows\system32\drivers\etc\hosts

ipconfig /flushdns


:done
echo ----- DONE -----

echo You must reboot for all changes to take effect.
echo Press any key to reboot or CTRL+C to quit.
pause >nul
shutdown -r -f -t 00



:end