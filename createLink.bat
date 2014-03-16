@echo off

SETLOCAL ENABLEDELAYEDEXPANSION

       :: DEFINE the following variables where applicable to your install

    SET SOURCE=.\
    SET TARGET="C:\Users\Username\Documents\Arma 3 - Other Profiles\Playername\missions"
    


:: _________________________________________________________

echo.
echo     Please enter the path to your ArmA-Mission-Folder
set /P TARGET=
mklink /J "%TARGET%\Escape.Altis" "%SOURCE%\Escape.Altis"
echo Complete
pause