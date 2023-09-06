@echo off
@echo.
if not exist "%~dp0vlc-protocol.exe" (
  echo Warning: Can't find vlc-protocol.exe.
  echo Did you compile it successfully?
  @echo.
  pause
  exit /b
)
if not exist "%~dp0mpc-hc.exe" (
  echo Warning: Can't find mpc-hc.exe.
  echo Please put these files in your MPC-HC directory and then run this file.
  @echo.
  pause
  exit /b
)
echo If you see "ERROR: Access is denied." then you need to right click and use "Run as Administrator".
@echo.
echo Associating mpc-hc:// with mpc-protocol.exe...

reg add HKCR\mpc-hc /ve /t REG_SZ /d "URL:mpc-hc Protocol" /f
reg add HKCR\mpc-hc /v "URL Protocol" /t REG_SZ /d "" /f
reg add HKCR\mpc-hc\DefaultIcon /ve /t REG_SZ /d "%~dp0mpc-hc.exe,0" /f
reg add HKCR\mpc-hc\shell\open\command /ve /t REG_SZ /d "\"%~dp0mpc-protocol.exe\" \"%%1\"" /f

@echo.
pause
