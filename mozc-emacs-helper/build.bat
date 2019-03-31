setlocal enabledelayedexpansion

set GIT_COMMAND=C:\Program Files\Git\cmd\git
set PATCH_COMMAND=%MSYS2_ROOT%\usr\bin\patch

set MOZC_REPOSITORY=https://github.com/google/mozc.git
set COMMIT_HASH=afb03ddfe72dde4cf2409863a3bfea160f7a66d8

REM Install requirements
choco install ninja --version 1.7.2 --yes

REM Checkout source
"%GIT_COMMAND%" clone "%MOZC_REPOSITORY%" -b master --single-branch
cd mozc
"%GIT_COMMAND%" checkout "%COMMIT_HASH%"
"%GIT_COMMAND%" submodule update --init --recursive

REM Build mozc
"%PATCH_COMMAND%" -p1 < ..\win32_build.patch
cd src
python build_mozc.py gyp --noqt --branding=GoogleJapaneseInput
python build_mozc.py build -c Release package
if errorlevel 1 exit /b %ERRORLEVEL%

REM Copy executable to bin direcory
cd ..\..\
dir /S mozc\src\out_win\Release
dir /S mozc\src\out_win\Release_x64
mkdir Release
mkdir Release_x64
copy mozc\src\out_win\Release\mozc_emacs_helper.exe Release
copy mozc\src\out_win\Release_x64\mozc_emacs_helper.exe Release_x64
copy nul Release\mozc_emacs_helper.exe.ignore
copy nul Release_x64\mozc_emacs_helper.exe.ignore

endlocal
