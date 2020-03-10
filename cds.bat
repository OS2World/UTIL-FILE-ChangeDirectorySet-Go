@echo off
echo Change Directory Set/Go - by GLen  March 1992
if !%1==! goto intro
if !%cdsg%==! goto noFile
cd > %cdsg%\%1
echo Current directory saved with key "%1". Use  "CDG %1"  to retrieve.
goto end

:intro
echo.
echo CDSG is a system of saving your current position (drive and path) and then
echo returning to that point later. It was specifically designed to work between
echo the OS/2 and DOS command prompts of an OS/2 computer.
echo.
echo A environment variable called "CDSG" must be set in AUTOEXEC.BAT and/or
echo OS/2's CONFIG.SYS and must contain the name and path of a file. That filename
echo must not have an extension.    e.g. SET CDSG=D:\TEMPFILE\CDSG
echo.
echo Use CDS [key] and CDG [key] to Save and Goto specific directories. The
echo 'key' parameter is any series of letters (only first 3 significant) to
echo identify this directory.  Until that 'key' is re-used in a CDS command,
echo it is saved to disk permanently.
echo.
echo This CDSG system uses DOS and OS/2 batch files as well as a DOS TurboPascal
echo program and an OS/2 REXX program.
echo.
echo.
echo The current CDSG environment variable is now "%CDSG%".
echo.
echo Example:
echo   To save your current location (in OS/2 or DOS)...
echo      CDS 1
echo   To save a different location later (in OS/2 or DOS)...
echo      CDS ab
echo   To latter return to the first location (in OS/2 or DOS)...
echo      CDG 1
echo.
goto end

:noFile
echo Error: Environment string CDSG is not set correctly.
echo        Type CDS for instructions.
echo.

:end
