# EDC

***Scripts that come in handy every day.***

---

## What these do

- Display time and date stamp in terminal windows. Portable shortcuts to make this portable, and install scripts included to make this permanent.
    - The `install_prompt_bash.sh` script also adds a few customizations for other commands.
- Enhance colors, fonts, and sizes of cmd.exe and powershell.exe for clear screenshots (portable versions only).
- Shortcuts to prevent screen from locking.
- Batch file to run the white command prompt when it's blocked by Group Policy.


## Notes on use

- Portable files need to be renamed after download to make them work. Just change the `-` to a `.`.


## Changelog

- **2023-11-17**
    - Added a "Don't Lock Screen" shortcut that presses Shift once instead of pressing NumLock twice.
    - Changed the timing of both "Don't Lock Screen" shortcuts to 290 seconds, just short of five minutes, to make keypresses less frequent.

- **2023-10-23**
	- Added `rename-all.bat` to the `portable` folder to quickly rename the portable files to their correct extensions all at once.
	- Added `.screenrc` customizations to the bash installer.
