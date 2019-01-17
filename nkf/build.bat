setlocal enabledelayedexpansion

REM Unix tools
set CURL=%MSYS2_ROOT%\usr\bin\curl
set GZ=%MSYS2_ROOT%\usr\bin\gzip
set TAR=%MSYS2_ROOT%\usr\bin\tar
set GCC=%MINGW_ROOT%\bin\gcc
set MAKE=%MINGW_ROOT%\bin\mingw32-make

set NKF_DIR=nkf-2.1.5
set BUILD_NO=70406
set NKF_URL=https://osdn.net/projects/nkf/downloads/%BUILD_NO%/%NKF_DIR%.tar.gz/
set ARCHIVE=%NKF_DIR%.tar.gz

"%CURL%" --version
"%CURL%" --http1.1 -sSfL -o "%ARCHIVE%" "%NKF_URL%"
if errorlevel 1 exit /b %ERRORLEVEL%

"%GZ%" --decompress --stdout "%ARCHIVE%" | "%TAR%" x
if errorlevel 1 exit /b %ERRORLEVEL%

cd "%NKF_DIR%"
REM Make nkf
"%MAKE%" CC="%GCC%" CFLAGS="-g -O2 -Wall -pedantic -DDEFAULT_NEWLINE=0x0D0A -DDEFAULT_CODE_WINDOWS_31J"
if errorlevel 1 exit /b %ERRORLEVEL%

REM Copy executable to bin direcory
cd ..
mkdir bin
copy "%NKF_DIR%\nkf.exe" bin
if errorlevel 1 exit /b %ERRORLEVEL%

REM Copy documents
mkdir doc
for %%d in (nkf.doc nkf.1 nkf.1j) do (
    copy "%NKF_DIR%\%%d" doc
    if errorlevel 1 exit /b !ERRORLEVEL!
)

REM Print nkf version
bin\nkf -V

endlocal
