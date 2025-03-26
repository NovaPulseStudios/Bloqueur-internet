@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting admin privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit /b
)
title Wi-Fi
color 4
Powershell "netsh interface set interface Wi-Fi disable"
Powershell "netsh interface set interface Ethernet disable"
echo Your Internet has been blocked.
echo. 
echo To prevent any reactivation this code will self destruct.
timeout 4 >nul
start "del.bat"
exit