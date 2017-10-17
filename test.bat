@echo off

REM Install a package in local
choco install -dv -y -s . cpdf-cr

REM Verify cpdf command is in PATH
cpdf --help
if errorlevel 1 exit /b %ERRORLEVEL%

REM Uninstall a package
choco uninstall cpdf-cr

REM Verify cpdf is removed successfully
where cpdf
if not "%ERRORLEVE%"=="1" (
    echo Fail to uninstall a package
    exit /b 1
)
