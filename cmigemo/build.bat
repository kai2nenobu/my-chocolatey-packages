setlocal enabledelayedexpansion

REM Constants
set MSYS2_SHELL=%MSYS2_ROOT%\msys2_shell.cmd
set GIT_COMMAND=C:\Program Files\Git\cmd\git.exe

set CMIGEMO_VERSION=v1.4-rc
set CMIGEMO_REPO=https://github.com/koron/cmigemo.git

REM Install nkf for encoding conversion
choco source add -n kai2nenobu -s https://www.myget.org/F/kai2nenobu
choco install -y nkf

REM Fetch source
"%GIT_COMMAND%" clone --depth 1 --branch "%CMIGEMO_VERSION%" "%CMIGEMO_REPO%" src
cd src
"%GIT_COMMAND%" rev-parse HEAD

REM Build by mingw32
call "%MSYS2_SHELL%" -mingw32 -defterm -no-start -here -c "sh configure --prefix=../cmigemo; mingw32-make ICONV_EUCJP_TO_CP932='nkf -x --ic=eucjp-ms --oc=shift_jis' ICONV_CP932_TO_UTF8='nkf -x --ic=shift_jis --oc=utf-8' mingw-install"

REM Print version
..\cmigemo\bin\cmigemo --help

REM DEBUG
dir /S ..\

endlocal
