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


## Notes on the "Don't Lock Screen" variants

- **Insert X2** - Presses Insert two times in rapid succession. No noticeable issues so far, but be wary, since it is pressing a key that could affect input.
- **Vol-+** - Third try. Quickly pressed volume down and then volume up. Caused a pop-up like NumLock.
- **Shift** - Second version that pressed Shift only once every 290 seconds. But it turned out that Windows dings every time Shift is pressed from a minimized window. It seemed to happen when the window was hidden on other desktops too.
- **NumLock X2** - This is the original method, and it works well *except* on the latest versions of Windows where a pop-up box gets displayed every time NumLock is turned on/off. That was getting in the way of my screenshots when I'd switch between virtual machines, so I tried some alternatives.


## Changelog

- **2023-11-17**
    - Added `Don't Lock Screen Variants` that prevent screen locking with alternative keypresses.
    - Increased the delay on all "Don't Lock Screen" shortcuts to 290 seconds.

- **2023-10-23**
	- Added `rename-all.bat` to the `portable` folder to quickly rename the portable files to their correct extensions all at once.
	- Added `.screenrc` customizations to the bash installer.
