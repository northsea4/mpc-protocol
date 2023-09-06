Setlocal EnableDelayedExpansion
set url=%~1
set url=!url: =%%20!

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
@REM start "MPC" "%~dp0vlc.exe" --open "%url:~9%"
start "MPC" "%~dp0%mpc_exe%" "%url:~9%"
