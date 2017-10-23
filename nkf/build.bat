setlocal

REM Unix tools
set CURL=%MSYS2_ROOT%\usr\bin\curl
set GZ=%MSYS2_ROOT%\usr\bin\gzip
set TAR=%MSYS2_ROOT%\usr\bin\tar
set GCC=%MINGW_ROOT%\bin\gcc
set MAKE=%MINGW_ROOT%\bin\mingw32-make

set NKF_DIR=nkf-2.1.4
set NKF_URL=https://osdn.net/projects/nkf/downloads/64158/%NKF_DIR%.tar.gz/
set ARCHIVE=%NKF_DIR%.tar.gz

"%CURL%" -sSfL -o "%ARCHIVE%" "%NKF_URL%"
if errorlevel 1 exit /b %ERRORLEVEL%

"%GZ%" --decompress --stdout "%ARCHIVE%" | "%TAR%" x
if errorlevel 1 exit /b %ERRORLEVEL%

cd "%NKF_DIR%"
REM Make nkf
if errorlevel 1 exit /b %ERRORLEVEL%

REM Copy to bin direcory
cd ..
mkdir bin
copy "%NKF_DIR%\nkf.exe" bin
if errorlevel 1 exit /b %ERRORLEVEL%

REM Print nkf version
bin\nkf -V

endlocal
