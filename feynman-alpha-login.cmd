@echo off
setlocal
pwsh -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0feynman-alpha-login.ps1" %*
exit /b %ERRORLEVEL%
