@echo off
Setlocal EnableDelayedExpansion

set "url=%~1"
echo Input URL: !url!

@REM 工作目录是在mpc-hc目录下的，所以用`%~dp0`来获取当前目录

@REM 获取mpc-hc.exe的文件名(可能是mpc-hc.exe或mpc-hc64.exe，或者还有mpc-hc32.exe?)

if exist "%~dp0mpc-hc64.exe" (
  set mpc_exe=mpc-hc64.exe
) else if exist "%~dp0mpc-hc32.exe" (
  set mpc_exe=mpc-hc32.exe
) else if exist "%~dp0mpc-hc.exe" (
  set mpc_exe=mpc-hc.exe
) else (
  echo Warning: Can't find mpc-hc.exe.
  echo Please put these files in your MPC-HC directory and then run this file.
  @echo.
  pause
  exit /b
)

REM mpc-hc://
@REM start "MPC" "%~dp0mpc-hc.exe" --open "%url:~9%"

:: Remove mpc-hc:// prefix
set "url=!url:mpc-hc://=!"
echo After removing prefix: !url!

:: Fix Chrome 130+ format
set "needfix="
echo !url! | findstr /i "^http//" >nul && set "needfix=1"
echo !url! | findstr /i "^https://" >nul && set "needfix=1"
if defined needfix (
    echo Fixing Chrome 130+ format
    set "url=!url:http//=http://!"
    set "url=!url:https//=https://!"
    echo After fixing: !url!
)

:: Ensure spaces are encoded
set "url=!url: =%%20!"
echo Final URL: !url!

:: Launch MPC
echo Launching MPC...
start "MPC" "%~dp0%mpc_exe%" "!url!"
