setlocal
set PACKAGE_NAME=nkf
set COMMAND_NAME=nkf

REM Install a package in local
choco install --pre -y -s . %PACKAGE_NAME%

REM Verify command is in PATH
%COMMAND_NAME% -V
if errorlevel 1 exit /b %ERRORLEVEL%

REM Uninstall a package
choco uninstall %PACKAGE_NAME%

REM Verify command is removed successfully
where %COMMAND_NAME%
if "%ERRORLEVEL%"=="1" (
    echo Package is successfully removed
    exit /b 0
) else (
    echo Try to uninstall a package but %COMMAND_NAME% command is remaining in PATH
    exit /b 1
)

endlocal
