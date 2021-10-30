@echo off
setlocal enabledelayedexpansion

set EXA_REPO=https://github.com/skyline75489/exa.git
set EXA_BRANCH=chesterliu/dev/win-support

REM Clone exa sources
git clone --depth 1 --branch "%EXA_BRANCH%" "%EXA_REPO%" exa
REM BUild exa
pushd exa
cargo build --release --target x86_64-pc-windows-msvc
if ERRORLEVEL 1 echo Fail to build exa&& exit 1
REM Copy a build executable into a tools directory
if not exist ..\tools mkdir ..\tools
copy .\target\x86_64-pc-windows-msvc\release\exa.exe ..\tools

endlocal
