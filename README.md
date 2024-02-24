# EDC

***Scripts that come in handy every day.***

---

## What these do

- Display time and date stamp in terminal windows. Portable shortcuts to make this portable, and install scripts included to make this permanent.
    - The `install_prompt_bash.sh` script also adds a few customizations for other commands.
- Enhance colors, fonts, and sizes of cmd.exe and powershell.exe for clear screenshots (portable versions only).
- Shortcuts to prevent screen from locking.
- Batch file to run the white command prompt when it's blocked by Group Policy.
- Miscellaneous scripts that come in handy for setting up Windows virtual machines.


## Notes on use

- Portable files need to be renamed after download to make them work. Just change the `-` to a `.`.


## Notes on the "Don't Lock Screen" variants

- **Vol-+** - Quickly press volume down and then volume up. Causes a pop-up, but not as intrusive as NumLock (such as when switching between host and virtual machines).
- **Insert X2** - Presses Insert two times in rapid succession.
	- Potential issue: If you're pressing/holding Shift when this triggers, you're clipboard contents will get pasted. Not ideal. 😝
- **Shift** - Presses Shift once every 290 seconds.
	- Potential issue: Windows dings every time Shift is pressed from a minimized window. It seems to happen when the window is hidden on other desktops too.
- **NumLock X2** - This is the original method, and it works well *except* on the latest versions of Windows where a pop-up box gets displayed every time NumLock is turned on/off. That was getting in the way of my screenshots when I'd switch between virtual machines, so I tried some alternatives.

SendKeys References:
- https://learn.microsoft.com/en-us/office/vba/Language/Reference/user-interface-help/sendkeys-statement
- https://ss64.com/vb/sendkeys.html



## Changelog

- **2024-02-23**
	- Added installer for Windows Terminal settings, `install_WindowsTerminal_colors_and_settings.bat`.
	- Added scripts and notes in `vm-tools`.

- **2023-12-06**
    - Added `Toggle Numlock-lnk`. 

- **2023-11-17**
    - Added `Don't Lock Screen Variants` that prevent screen locking with alternative keypresses.
    - Increased the delay on all "Don't Lock Screen" shortcuts to 290 seconds.
    - Minor bashrc and screenrc changes.

- **2023-10-23**
	- Added `rename-all.bat` to the `portable` folder to quickly rename the portable files to their correct extensions all at once.
	- Added `.screenrc` customizations to the bash installer.
