@echo off
title extGiv_all : all files without extension
REM Make sure we start from the current directory if script is launched as Admin
cd %~dp0

set /a files=0
echo.
REM Use recursive FOR loop to count files in current and children directories
for /R "%CD%" %%A in (*.) do set /a files+=1
if %files% equ 0 goto no_files

echo %files% files without extension in the current folder and children.
echo What extension to give them ?
echo.
set /p "renameChoice=Enter your choice (for instance : jpg) : "
REM Use recursive FOR loop to rename files in current and children directories
for /R "%CD%" %%B in (*.) do ren "%%B" "%%~nB.%renameChoice%"

echo.
echo Done ^!
echo.
echo.
echo.
echo PRESS ANY KEY TO QUIT
set renameChoice=
pause>nul
exit

:no_files
cls
color 0C
echo.
echo No files without extension were found ^!
echo.
echo Make sure to put this script at the right place, in the right folder.
echo.
echo.
echo.
echo PRESS ANY KEY TO QUIT
set renameChoice=
pause>nul