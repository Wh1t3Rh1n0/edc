cd /d "%~dp0"
for /F "delims=- tokens=1,2" %%i in ('dir /b *-lnk') do ren "%%i-%%j" "%%i.%%j" 
for /F "delims=- tokens=1,2" %%i in ('dir /b *-bat') do ren "%%i-%%j" "%%i.%%j" 