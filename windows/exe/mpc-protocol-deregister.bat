@echo off
@echo.
echo If you see "ERROR: Access is denied." then you need to right click and use "Run as Administrator".
@echo.
echo Removing mpc-hc:// association...

reg delete HKCR\mpc-hc /f

@echo.
pause
