:: MADE BY ANAKAMATHEHEDGEHOG && CREDIT IF USED

@echo off  && echo Please wait...
@for /f %%a in ('echo prompt $E^| cmd') do set "esc=%%a" && @set version=1.1 && @set name=Minecraft_Batch_Tool
title %name% %version% by Anakama

(NET FILE||(powershell start-process -FilePath '%0' -verb runas)&&(exit \B)) >NUL 2>&1
(NET FILE||(exit)) >NUL 2>&1

MODE 85,25

SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)

:Logo
cls
echo %esc%[38;5;34m
type data\logo.txt
echo.
echo Works In Progges
echo.
timeout 3 > NUL

:64BitsVariable
set IS_X64=0 && if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set IS_X64=1) else (if "%PROCESSOR_ARCHITEW6432%"=="AMD64" (set IS_X64=1))

:InstallationCheck
if not exist C:\Users\%username%\AppData\Roaming\.minecraft\ (echo %esc%[38;5;1m && echo ! ERROR ! && echo No Minecraft installation found && pause) else goto:Menu
exit

:Menu
MODE 85,30
cls
pushd %~dp0
set "choice=-"
echo %esc%[38;5;57m
echo.
echo            __________________________________________________
echo %esc%[38;5;10m
echo                       %name% Scripts
echo %esc%[38;5;2m
echo            [ 1 ] Open/Create mods folder
echo %esc%[38;5;3m
echo            [ 2 ] Install Fabric
echo            [ 3 ] Install Forge
echo %esc%[38;5;154m
echo            [ 4 ] Install Java 8
if "%IS_X64%"=="1" echo            [ 5 ] Install Java 21
if "%IS_X64%"=="1" echo            [ 6 ] Install Java 24
echo %esc%[38;5;82m
if "%IS_X64%"=="1" echo            [ 7 ] Install Modrinth
echo            [ 8 ] Install CurseForge
echo %esc%[38;5;9m
echo            [ / ] Settings
echo            [ - ] EXIT
echo %esc%[38;5;57m
echo            __________________________________________________
set /p choice= Script:
if %choice%==/ goto:Settings
if %choice%==1 goto:ModsFolder
if %choice%==2 goto:fabric
if %choice%==3 goto:forge
if %choice%==4 goto:java8
if %choice%==5 if "%IS_X64%"=="1" goto:java24 else goto:Menu
if %choice%==6 if "%IS_X64%"=="1" goto:java24 else goto:Menu
if %choice%==7 if "%IS_X64%"=="1" goto:modrinth else goto:Menu
if %choice%==8 goto:curseforge
if %choice%==- goto:exit

:Modrinth
cls
echo %esc%[38;5;154m
echo Installing the Modrinth App (x64)
echo %esc%[38;5;9m
echo Waiting for Modrinth-x64.exe...
start /wait data\Modrinth-x64.exe
goto:Menu

:curseforge
cls
echo %esc%[38;5;154m
echo Installing the CurseForge App Standalone (x86)
echo %esc%[38;5;9m
echo Waiting for CurseForgex86.exe...
start /wait data\CurseForgex86.exe
goto:Menu

:Settings
cls
pushd %~dp0
set "choice=-"
echo %esc%[38;5;57m
echo.
echo            __________________________________________________
echo %esc%[38;5;10m
echo                        Settings
echo %esc%[38;5;154m
echo            [ 1 ] Version Info
echo %esc%[38;5;11m
echo            [ 2 ] Check Windows Bit Version
echo %esc%[38;5;9m
echo            [ - ] Go Back
echo %esc%[38;5;57m
echo            __________________________________________________
set /p choice= Setting:
if %choice%==- goto:Menu
if %choice%==1 goto:Version
if %choice%==2 goto:BitVersion

:Version
cls
echo %esc%[38;5;7m
echo                              VERSION INFO %esc%[38;5;57m
echo            __________________________________________________
echo %esc%[38;5;154m
echo                            Program: %esc%[38;5;9m %name% && echo %esc%[38;5;154m
echo                            Version: %esc%[38;5;9m %version%
echo %esc%[38;5;154m                            Author: %esc%[38;5;46m AnakamaTheHedgehog && echo %esc%[38;5;57m
echo            __________________________________________________
echo %esc%[38;5;15m
pause
goto:Settings

:BitVersion
cls
echo %esc%[38;5;9m
echo Searching for Windows Bit Version...
echo.
echo %esc%[38;5;154m
if "%IS_X64%"=="1" echo Your System is 64 Bits (x64)
if "%IS_X64%"=="0" echo Your System is 32 Bits (x86)
echo.
pause
goto:Settings

:Java8
cls
echo %esc%[38;5;154m
echo Opening Java 8 Installer...
echo %esc%[38;5;9m
echo Waiting for java8installer.exe...
start /wait data\java8installer.exe
goto:Menu

:Java21
cls
echo %esc%[38;5;154m
echo Opening Java 21 Installer...
echo %esc%[38;5;9m
echo Waiting for jdk21_x64.exe...
start /wait data\java\jdk21_x64.exe
goto:Menu

:Java24
cls
echo %esc%[38;5;154m
echo Opening Java 24 Installer...
echo %esc%[38;5;9m
echo Waiting for jdk24_x64.exe...
start /wait data\java\jdk24_x64.exe
goto:Menu

:ModsFolder
cls
echo Searching for the mods folder...
if exist C:\Users\%username%\AppData\Roaming\.minecraft\mods (echo Mods folder detected) else goto:MDModsFolder
%SystemRoot%\explorer.exe "C:\Users\%username%\AppData\Roaming\.minecraft\mods"
goto:Menu

:MDModsFolder
echo %esc%[38;5;2m
echo No mods folder found
echo %esc%[38;5;46m
echo Creating mods folder... && cd C:\Users\%username%\AppData\Roaming\.minecraft\ && md mods && cd .. && goto:Menu

:fabric
cls
echo Opening Fabric Installer..
start /wait data\fabricinstaller.exe
echo %esc%[38;5;9m
echo Waiting for fabricinstaller.exe...
goto:Menu

:Forge
cls
pushd %~dp0
set "choice=-"
echo %esc%[38;5;57m
echo.
echo            __________________________________________________
echo %esc%[38;5;10m
echo                        Select Forge Version
echo %esc%[38;5;2m
echo            [ 1 ] 1.21.X
:: echo            [ 2 ] 1.19.X
:: echo            [ 3 ] 1.18.X
echo            [ 2 ] 1.20.X
echo            [ 3 ] 1.16.X
echo %esc%[38;5;9m
echo            [ - ] Go Back
echo %esc%[38;5;57m
echo            __________________________________________________
set /p choice= Version:
if %choice%==- goto:Menu
if %choice%==1 goto:121Forge
:: if %choice%==2 goto:119Forge
:: if %choice%==3 goto:118Forge
if %choice%==2 goto:120Forge
if %choice%==3 goto:116Forge

:120Forge
cls
pushd %~dp0
set "choice=-"
echo %esc%[38;5;57m
echo            __________________________________________________
echo %esc%[38;5;10m
echo                       Select 1.20.X Forge Version
echo %esc%[38;5;2m
echo            [ 1 ] 1.20.6
echo            [ 2 ] 1.20.4
echo %esc%[38;5;9m
echo            [ - ] Go Back
echo %esc%[38;5;57m
echo            __________________________________________________
set /p choice= Script:
if %choice%==- goto:Forge
if %choice%==1 goto:1206F
if %choice%==2 goto:1204F

:116Forge
cls
pushd %~dp0
set "choice=-"
echo %esc%[38;5;57m
echo            __________________________________________________
echo %esc%[38;5;10m
echo                       Select 1.16.X Forge Version
echo %esc%[38;5;3m
echo            [ 1 ] 1.16.5
echo            [ 2 ] 1.16.4
echo            [ 3 ] 1.16.3
echo            [ 4 ] 1.16.2
echo            [ 5 ] 1.16.1
echo %esc%[38;5;9m
echo            [ - ] Go Back
echo %esc%[38;5;57m
echo            __________________________________________________
set /p choice= Version:
if %choice%==- goto:Forge
if %choice%==1 goto:1165F
if %choice%==2 goto:1164F
if %choice%==3 goto:1163F
if %choice%==4 goto:1162F
if %choice%==5 goto:1161F

:1165F
cls
set jar=forge-1.16.5-36.2.42-installer.jar
echo %esc%[38;5;226m
echo Opening Forge 1.16.5 Installer..
echo %esc%[38;5;9m
echo Waiting for %jar%...
start /wait data\forge\1.16\%jar%
goto:Menu

:1164F
cls
set jar=forge-1.16.4-35.1.37-installer.jar
echo %esc%[38;5;226m
echo Opening Forge 1.16.4 Installer..
echo %esc%[38;5;9m
echo Waiting for %jar%...
start /wait data\forge\1.16\%jar%
goto:Menu

:1163F
cls
set jar=forge-1.16.3-34.1.42-installer.jar
echo %esc%[38;5;226m
echo Opening Forge 1.16.3 Installer..
echo %esc%[38;5;9m
echo Waiting for %jar%...
start /wait data\forge\1.16\%jar%
goto:Menu

:1162F
cls
set jar=forge-1.16.2-33.0.61-installer.jar
echo %esc%[38;5;226m
echo Opening Forge 1.16.2 Installer..
echo %esc%[38;5;9m
echo Waiting for %jar%...
start /wait data\forge\1.16\%jar%
goto:Menu

:1161F
cls
set jar=forge-1.16.1-32.0.108-installer.jar
echo %esc%[38;5;226m
echo Opening Forge 1.16.1 Installer..
echo %esc%[38;5;9m
echo Waiting for %jar%...
start /wait data\forge\1.16\%jar%
goto:Menu

:121Forge
cls
pushd %~dp0
set "choice=-"
echo %esc%[38;5;57m
echo            __________________________________________________
echo %esc%[38;5;10m
echo                       Select 1.21.X Forge Version
echo %esc%[38;5;2m
echo            [ 1 ] 1.21.5
echo            [ 2 ] 1.21.4
echo            [ 3 ] 1.21.3
echo            [ 4 ] 1.21.1
echo            [ 5 ] 1.21
echo %esc%[38;5;9m
echo            [ - ] Go Back
echo %esc%[38;5;57m
echo            __________________________________________________
set /p choice= Script:
if %choice%==- goto:Forge
if %choice%==1 goto:1215F
if %choice%==2 goto:1214F
if %choice%==3 goto:1213F

:1215F
cls
echo %esc%[38;5;226m
echo Opening Forge 1.21.5 Installer..
echo %esc%[38;5;9m
echo Waiting for forge-1.21.5-55.0.3-installer.jar
start /wait data\forge\1.21\forge-1.21.5-55.0.3-installer.jar
goto:Menu

:1214F
cls
echo %esc%[38;5;226m
echo Opening Forge 1.21.4 Installer..
echo %esc%[38;5;9m
echo Waiting for forge-1.21.4-54.1.3-installer.jar
start /wait data\forge\1.21\forge-1.21.4-54.1.3-installer.jar
goto:Menu

:1213F
cls
echo %esc%[38;5;226m
echo Opening Forge 1.21.3 Installer..
echo %esc%[38;5;9m
echo Waiting for forge-1.21.3-53.1.0-installer.jar
start /wait data\forge\1.21\forge-1.21.3-53.1.0-installer.jar
goto:Menu

:1211F
cls
echo %esc%[38;5;226m
echo Opening Forge 1.21.1 Installer..
echo %esc%[38;5;9m
echo Waiting for forge-1.21.1-52.1.0-installer.jar
start /wait data\forge\1.21\forge-1.21.1-52.1.0-installer.jar
goto:Menu

:121F
set jar=forge-1.21-51.0.33-installer.jar
cls
echo %esc%[38;5;226m
echo Opening Forge 1.21 Installer..
echo %esc%[38;5;9m
echo Waiting for %jar%
start /wait data\forge\1.21\%jar%
goto:Menu

:1204F
set jar=forge-1.20.4-49.2.0-installer.jar
cls
echo %esc%[38;5;226m
echo Opening Forge 1.20.4 Installer..
echo %esc%[38;5;9m
echo Waiting for %jar%
start /wait data\forge\1.20\%jar%
goto:Menu

:1206F
set jar=forge-1.20.6-50.2.0-installer.jar && cls
echo %esc%[38;5;226m
echo Opening Forge 1.20.6 Installer..
echo %esc%[38;5;9m
echo Waiting for %jar%
start /wait data\forge\1.20\%jar%
goto:Menu

:Exit
echo %esc%[38;5;15m
cls
echo Are you sure you wanna exit?
SET /P AREYOUSURE=(Y/N)?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO:Menu