tzutil /g > "%temp%\tz.tmp"

set /p timezone=<"%temp%\tz.tmp"

setx PROMPT "[$D $T %timezone%]$_[$E[36m$P$E[0m]$_%username%@%computername%$G$S"