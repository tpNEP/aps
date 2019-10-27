:MAIN
@ECHO OFF
MODE 50,30
REM COLOR F0
CLS
SET apsv=0.1
REM - set env variables
FOR /F "usebackq" %%i IN (`hostname`) DO SET hostnamevar=%%i
FOR /F "usebackq" %%i IN (`echo %username%`) DO SET uservar=%%i
FOR /F "usebackq" %%i IN (`echo %homedrive%`) DO SET hdvar=%%i
FOR /F "usebackq" %%i IN (`echo %homepath%`) DO SET hpvar=%%i
SET t1=timeout 1
SET t2=timeout 2
SET pversion=13.0
REM - set path variables
SET apsroot=\\nexisa\ADADFBME_AviFileBased_ME\aps
SET adobeserver=%hdvar%%hpvar%Documents\Adobe\Premiere Pro\%pversion%\Profile-%uservar%
REM DEBUG - MKDIR "%hdvar%%hpvar%\Documents\Adobe\Premiere Pro\%pversion%\Profile-%uservar%"
SET adobelocal=C:\Users\%uservar%\Documents\Adobe\Premiere Pro\%pversion%\Profile-%uservar%
IF %uservar%==Edit (SET adobeloop=%adobelocal%) ELSE  (SET adobeloop=%adobeserver%)
REM - color escape chars
SET ESC=
SET Yellow=%ESC%[33m
SET Red=%ESC%[31m
SET Green=%ESC%[32m
SET White=%ESC%[37m
REM - main script
TITLE APS %apsv% - USER: %uservar%
ECHO       %White%-- APS Adobe Premiere Selector v%apsv% --
ECHO.
REM - premiere version
ECHO %Yellow%Get Adobe Premiere version...
TIMEOUT 1 >NUL
ECHO %Green%Version: %pversion%
ECHO.
REM - set premiere path
TIMEOUT 2 >NUL
ECHO %Yellow%Set Adobe Premiere settings path...
TIMEOUT 1 >NUL
ECHO %Green%%adobeloop%
TIMEOUT 2 >NUL
ECHO.
REM - copy settings file from server to adobe settings folder (either local, or on profile drive)
ECHO %Yellow%Copy Adobe Premiere settings preset...
ECHO %Green%
copy "%apsroot%\Adobe Premiere Pro Prefs" "%adobeloop%\Adobe Premiere Pro Prefs"
PAUSE >NUL
goto MAIN
