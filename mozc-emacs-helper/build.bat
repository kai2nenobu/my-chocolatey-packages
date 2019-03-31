setlocal enabledelayedexpansion

set MOZC_REPOSITORY=https://github.com/google/mozc.git
set COMMIT_HASH=afb03ddfe72dde4cf2409863a3bfea160f7a66d8

REM Install requirements
choco install ninja --version 1.7.2 --yes

REM Checkout source
git clone "%MOZC_REPOSITORY" -b master --single-branch
cd mozc
git checkout "%COMMIT_HASH%"
git submodule update --init --recursive

REM Build mozc
patch -p1 < ..\win32_build.patch
cd src
python build_mozc.py gyp --noqt --branding=GoogleJapaneseInput
python build_mozc.py build -c Release package
if errorlevel 1 exit /b %ERRORLEVEL%

REM Copy executable to bin direcory
cd ..\..\
mkdir Release
mkdir Release_x64
copy mozc\src\out_win\Release\mozc_emacs_helper.exe Release
copy mozc\src\out_win\Release_x64\mozc_emacs_helper.exe Release_x64
copy nul Release\mozc_emacs_helper.exe.ignore
copy nul Release_x64\mozc_emacs_helper.exe.ignore

endlocal
