Install Windows 11 on a Virtual Machine without a TPM
====================================================

When the Windows 11 install GUI first starts, press `SHIFT+F10` to open a command prompt.

Then run these commands:

```cmd
reg add HKLM\SYSTEM\Setup\LabConfig /f /t REG_DWORD /d 1 /v BypassTPMCheck
reg add HKLM\SYSTEM\Setup\LabConfig /f /t REG_DWORD /d 1 /v BypassSecureBootCheck
reg add HKLM\SYSTEM\Setup\LabConfig /f /t REG_DWORD /d 1 /v BypassRAMCheck
reg add HKLM\SYSTEM\Setup\LabConfig /f /t REG_DWORD /d 1 /v BypassCPUCheck
```

Then close the command prompt and continue with the install.