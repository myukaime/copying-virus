@echo off
for /f "skip=1 tokens=1" %%d in ('wmic logicaldisk where "DriveType=2" get DeviceID') do (
    set drive=%%d
    goto :found
)
:found
if not defined drive exit /b
set drive=%drive:~0,2%

if not exist "%drive%\Backup" md "%drive%\emoo"
robocopy "%USERPROFILE%\Music" "%drive%\emoo\Music" /E /R:2 /W:2 /MT:8 /NP /NFL /NDL

exit /b
