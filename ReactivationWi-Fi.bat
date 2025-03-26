@echo off
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting admin privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit /b
)
title Wi-Fi
color 2
echo Reactivating Wi-Fi...
Powershell "netsh interface set interface Wi-Fi enable" 
Powershell "netsh interface set interface Ethernet enable"
echo.
echo Wi-Fi reactivated.
timeout 3 >nul
del "ReactivationWi-Fi.bat"
exit

