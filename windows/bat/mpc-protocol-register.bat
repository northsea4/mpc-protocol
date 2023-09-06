@echo off
@echo.

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

echo If you see "ERROR: Access is denied." then you need to right click and use "Run as Administrator".
@echo.
echo Associating mpc-hc:// with mpc-protocol.bat...

reg add HKCR\mpc-hc /ve /t REG_SZ /d "URL:mpc-hc Protocol" /f

reg add HKCR\mpc-hc /v "URL Protocol" /t REG_SZ /d "" /f

reg add HKCR\mpc-hc\DefaultIcon /ve /t REG_SZ /d "%~dp0%mpc_exe%,0" /f

reg add HKCR\mpc-hc\shell\open\command /ve /t REG_SZ /d "\"%~dp0mpc-protocol.bat\" \"%%1\"" /f

@echo.
pause
