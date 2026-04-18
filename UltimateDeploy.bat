@echo off
title Blox Fruits God Deployer v3.0
color 0A
cls
echo Blox Fruits GOD v3.0 Deployer - Starting...

:: Roblox Check
tasklist /FI "IMAGENAME eq RobloxPlayerBeta.exe" 2>NUL | find /I /N "RobloxPlayerBeta.exe">NUL
if "%ERRORLEVEL%" NEQ "0" (
    echo ERROR: Open Roblox ^> Blox Fruits first!
    pause
    exit
)

echo ✅ Roblox Found - Injecting...

:: Direct Loadstring ^(No files needed^)
powershell -WindowStyle Hidden -ExecutionPolicy Bypass -Command "
Add-Type -AssemblyName System.Windows.Forms
$hwnd = (Get-Process RobloxPlayerBeta).MainWindowHandle
[System.Windows.Forms.SendKeys]::SendWait('^+%l')  # Ctrl+Shift+L
Start-Sleep 1
$loadstring = 'loadstring(game:HttpGet(`https://raw.githubusercontent.com/kasimbelimsalim-beep/BloxFruits-God/main/godclient.lua`))()'
foreach ($c in $loadstring.ToCharArray()) {
    [System.Windows.Forms.SendKeys]::SendWait($c)
    Start-Sleep 5ms
}
[System.Windows.Forms.SendKeys]::SendWait('{ENTER}')
Write-Host 'INJECTED!'
"

echo ✅ GOD CLIENT DEPLOYED!
echo F = Fly ^| G = Godmode ^| GUI = Top Right
pause
