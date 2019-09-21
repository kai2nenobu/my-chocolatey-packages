# gibo: fast access to .gitignore boilerplates [![gibo version][gibo_version]][gibo_package]

[gibo_version]: https://img.shields.io/myget/kai2nenobu/v/gibo.svg?label=gibo
[gibo_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/gibo

[gibo](https://github.com/simonwhitaker/gibo) (short for .gitignore boilerplates) is a shell script to help you easily access .gitignore boilerplates from github.com/github/gitignore

## Typical usage

```console
$ gibo dump Swift Xcode >> .gitignore
```

For additional usage instructions, run `gibo help`.

## Notes

This package installs both shell script gibo (`gibo`) and batch script gibo (`gibo.bat`).
They are placed on `%ChocolateyInstall%\bin` and are included in your `PATH` environment variable.
If you have a bash shell (like `Git Bash`, `MSYS2`), you can execute `gibo` shell script.

A version of `gibo.bat` may differ a version of `gibo` because its functionality is a bit different from `gibo`.
