choco source

exit /b 1

REM Build package
cd %SourcesPath%\cpdf-cr
choco pack

REM Verify package
call test.bat
