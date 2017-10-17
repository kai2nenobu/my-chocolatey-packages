REM Install a package in local
choco install -y -s . cpdf-cr

REM Verify cpdf command is in PATH
cpdf -version
if errorlevel 1 exit /b %ERRORLEVEL%

REM Uninstall a package
choco uninstall cpdf-cr

REM Verify cpdf is removed successfully
where cpdf
if not "%ERRORLEVEL%"=="1" (
    echo Try to uninstall a package but cpdf command is remaining in PATH
    exit /b 1
)
