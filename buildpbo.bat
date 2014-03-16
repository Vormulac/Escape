@echo off
echo Starting build...
::forfiles /p %WORKSPACE%\..\%JOB_NAME%_binned /c "cmd /c del @PATH /f /q"
::rmdir /s /q %WORKSPACE%\..\packing\escape2.altis
::cho Deleted old binned files
::xcopy %WORKSPACE% %WORKSPACE%\..\packing\escape2.altis /e /i /q

echo BUILD NR: %BUILD_NUMBER% > %WORKSPACE%\version.txt
echo COMMIT: %GIT_COMMIT% >> %WORKSPACE%\version.txt
echo BRANCH: %GIT_BRANCH% >> %WORKSPACE%\version.txt
echo BUILD INFO: %BUILD_URL% >> %WORKSPACE%\version.txt

echo Copied over folder to binned folder
"C:\Program Files (x86)\Bohemia Interactive\Tools\BinPBO Personal Edition\BinPBO.exe" "%WORKSPACE%\checkout\escape.altis" "%WORKSPACE%" -PROJECT "%WORKSPACE%\checkout\escape.altis"
echo Created PBOs
::forfiles /p %WORKSPACE%\..\%JOB_NAME%_binned /c "cmd /c if @ISDIR==TRUE rmdir /s /q @PATH"
::echo Removed binned folders
if not exist %WORKSPACE%\escape.altis.pbo exit /b 1