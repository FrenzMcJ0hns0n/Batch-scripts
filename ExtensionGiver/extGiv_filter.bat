@echo off
title extGiv_filter : The files without extension matching ^for user input
REM Make sure we start from the current directory if script is launched as Admin
cd %~dp0
:start
cls
color 07
set /a files=0

echo.
set /p "filter=Expression to find : "
echo.
REM Check if user entered at least one char
if [%filter%]==[] goto nothing_written
REM Use recursive FOR loop to count files in current and children directories
for /R "%CD%" %%A in (*%filter%*.) do set /a files+=1
if %files% equ 0 goto no_match

echo %files% file(s) matching for your input.
echo What extension to give them ?
echo.
set /p "renameChoice=Enter your choice (for instance : jpg) : "
REM Use recursive FOR loop to rename files in current and children directories
for /R "%CD%" %%B in (*%filter%*.) do ren "%%B" "%%~nB.%renameChoice%"

echo.
echo Done ^!
echo.
echo.
echo.
echo PRESS ANY KEY TO START AGAIN
set filter=
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
set filter=
set renameChoice=
pause > nul
goto start

:no_match
cls
color 0C
echo.
echo No match :
echo No files without extension and containing the expression "%filter%" were found ^!
echo.
echo Make sure filenames are correct.
echo.
echo.
echo.
echo PRESS ANY KEY TO START AGAIN
set filter=
set renameChoice=
pause>nul
goto start