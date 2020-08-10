# busybox-w32 [![busybox-w32 version][busybox-w32_version]][busybox-w32_package]

[busybox-w32_version]: https://img.shields.io/myget/kai2nenobu/v/busybox-w32.svg?label=busybox-w32
[busybox-w32_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/busybox-w32

[BusyBox](http://busybox.net/) is a single binary that contains many common Unix tools. It's often found in embedded Linux systems like routers, in Android smartphones, in Linux containers and anywhere else it would be handy to have a compact set of Unix command line tools.

[busybox-w32](https://frippery.org/busybox/) is a port of BusyBox to the Microsoft Windows WIN32 API. It brings a subset of the functionality of BusyBox to Windows in a single self-contained native executable.

## Features

This version of BusyBox implements well over a hundred Unix-style commands. Some of the more significant are:

- ash
    - The BusyBox shell is based on ash. It strives to be POSIX-compatible, though it does support some features of bash. A UNIX-style shell is something like the Windows command prompt, though much more powerful. It can be used as an interactive command line or to run shell scripts (like Windows batch files, though again, much more powerful).
- awk
    - awk is a scripting language with a particular emphasis on pattern matching. It's commonly used to process text files containing rows and columns of data.
- sed
    - sed is a stream editor. It can be used to make automatic, non-interactive changes to text files.
- vi
    - vi is a powerful visual editor. If you're already familiar with vi you'll know what to expect. If not you should be aware that it's not particularly intuitive: you need to learn how to use vi. Try this BusyBox vi tutorial.
- find
- grep

## Note

busybox executable is located at `%ChocolateyInstall%\lib\busybox-w32\buxybox.exe` and is included in `PATH` environment variable.

On 32bit system, this package install a 32 bit executable, and on 64bit system, install a 64bit one. If you want to install 32bit executable on 64bit system, use `choco install --x86`.
