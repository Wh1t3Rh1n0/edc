Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted

if ( ( Test-Path $profile ) -eq $False ) { new-item -itemtype file -path $profile -force }

echo 'function prompt{write-host -F White("["+(get-date -UFormat "%Y-%m-%d %H:%M UTC%Z")+"]"); write-host -F Cyan ("["+$PWD+"]");return ($ENV:username+"@"+$ENV:computername+"> ")}' | add-content -encoding ascii $profile