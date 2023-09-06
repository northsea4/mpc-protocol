Setlocal EnableDelayedExpansion
set url=%~1
set url=!url: =%%20!
REM mpc-hc://
start "MPC" "%~dp0vlc.exe" --open "%url:~9%"
