setlocal
set PACKAGE_NAME=mozc-emacs-helper
set COMMAND_NAME=mozc_emacs_helper

REM Install a package in local
choco install --pre -y -s . %PACKAGE_NAME%

REM Verify command is in PATH
echo (0 CreateSession) | %COMMAND_NAME%
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
