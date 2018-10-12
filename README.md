[![AppVeyor Build status](https://ci.appveyor.com/api/projects/status/1vv03ri8bujes620/branch/master?svg=true)](https://ci.appveyor.com/project/kai2nenobu/chocolatey-packages/branch/master)

# What is this repository?

This repository stores chocolatey packages for my own.

These packages are built on [AppVeyor](https://www.appveyor.com/) automatically and stored in [MyGet public feed](https://www.myget.org/F/kai2nenobu).

# Package List

| id                                                                                                   | title                                                                                  |          version | self-contained? |
|------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|------------------|----------------|
| [a5m2](a5m2)                                                                                         | [A5:SQL Mk-2](http://a5m2.mmatsubara.com/)                                             |           2.12.2 |                |
| [busybox-w32](busybox-w32)                                                                           | [busybox-w32](https://frippery.org/busybox/)                                           |           1.29.0 |                |
| [cmigemo](cmigemo)                                                                                   | [C/Migemo](https://github.com/koron/cmigemo)                                           |              1.3 |                |
| [cpdf-cr](cpdf-cr)                                                                                   | [Coherent PDF Command Line Tools Community Release](http://community.coherentpdf.com/) |            2.2.1 |                |
| [mape](mape)                                                                                         | [May Authentication Proxies Explode](https://github.com/ipponshimeji/MAPE)             |         1.0.20.0 |                |
| [nkf](nkf)                                                                                           | [nkf Network Kanji Filter](https://ja.osdn.net/projects/nkf/)                          |            2.1.4 | ✓              |
| [pleiades](pleiades)-platform <br> pleiades-platform-full <br> pleiades-java <br> pleiades-java-full | [Pleiades All in One](http://mergedoc.osdn.jp/)                                        | 2018.09.20181004 |                |

# How to use

Add an above feed to chocolatey source.

```
> choco source add -n kai2nenobu -s https://www.myget.org/F/kai2nenobu
```

Then you can install a package as usual as below.

```
> choco install <package_id>
```

# References

- [CreatePackages](https://chocolatey.org/docs/create-packages)
- [Build Services](https://docs.myget.org/docs/reference/build-services)
