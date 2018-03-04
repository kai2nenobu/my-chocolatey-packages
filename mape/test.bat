setlocal

chcp 65001

set PACKAGE_NAME=mape
set CLI_NAME=mape
set GUI_NAME=mapegui

REM Install a package in local
choco install -y -s . -pre %PACKAGE_NAME%

REM Verify command is in PATH
where %CLI_NAME%
if errorlevel 1 exit /b %ERRORLEVEL%

where %GUI_NAME%
if errorlevel 1 exit /b %ERRORLEVEL%

REM Uninstall a package
choco uninstall -y %PACKAGE_NAME%

REM Verify command is removed successfully
where %CLI_NAME%
if "%ERRORLEVEL%"=="1" (
    echo Package is successfully removed
    exit /b 0
) else (
    echo Try to uninstall a package but %CLI_NAME% command is remaining in PATH
    exit /b 1
)

endlocal
