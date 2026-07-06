@echo off
setlocal
set DIR=%~dp0
gradle %* -p "%DIR%"
endlocal
