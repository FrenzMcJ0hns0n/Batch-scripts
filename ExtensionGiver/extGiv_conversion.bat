@echo off
title extGiv_conversion : ^rename files with specified extension
REM Make sure we start from the current directory if script is launched as Admin
cd %~dp0
:start
cls
color 07
set /a files=0

echo.
set /p "extChoice=Extension to look for : "
echo.
REM Check if user entered at least one char
if [%extChoice%]==[] goto nothing_written
REM Use recursive FOR loop to count files in current and children directories
for /R "%CD%" %%A in (*.%extChoice%) do set /a files+=1
if %files% equ 0 goto no_files

echo %files% files with the extension "%extChoice%" in the current folder and children.
echo What extension to give them ?
echo.
set /p "renameChoice=Enter your choice (for instance : jpg) : "
REM Use recursive FOR loop to rename files in current and children directories
for /R "%CD%" %%B in (*.%extChoice%) do ren "%%B" "%%~nB.%renameChoice%"

echo.
echo Done ^!
echo.
echo.
echo.
echo PRESS ANY KEY TO START AGAIN
set extChoice=
set renameChoice=
pause>nul
goto start

:nothing_written
cls
color 0C
echo.
echo You must enter at least one character ^!
echo.
echo.
echo.
echo PRESS ANY KEY TO START AGAIN
set extChoice=
set renameChoice=
pause > nul
goto start

:no_files
cls
color 0C
echo.
echo No files with the extension "%extChoice%" were found ^!
echo.
echo Make sure to enter the right extension.
echo.
echo.
echo.
echo PRESS ANY KEY TO START AGAIN
set extChoice=
set renameChoice=
pause>nul
goto start