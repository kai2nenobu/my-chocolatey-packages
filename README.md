[![AppVeyor Build status](https://ci.appveyor.com/api/projects/status/1vv03ri8bujes620/branch/master?svg=true)](https://ci.appveyor.com/project/kai2nenobu/chocolatey-packages/branch/master)

# What is this repository?

This repository stores chocolatey packages for my own.

These packages are built on [AppVeyor](https://www.appveyor.com/) automatically and stored in [MyGet public feed](https://www.myget.org/F/kai2nenobu).

# Package List

| id                 | title                                                                                  | release version | prerelease version |
|--------------------|----------------------------------------------------------------------------------------|-----------------|--------------------|
| [a5m2](a5m2)       | [A5:SQL Mk-2](http://a5m2.mmatsubara.com/)                                             |          2.12.2 |                    |
| [cmigemo](cmigemo) | [C/Migemo](https://github.com/koron/cmigemo)                                           |             1.3 | 1.4-rc             |
| [cpdf-cr](cpdf-cr) | [Coherent PDF Command Line Tools Community Release](http://community.coherentpdf.com/) |           2.2.1 |                    |
| [mape](mape)       | [May Authentication Proxies Explode](https://github.com/ipponshimeji/MAPE)             |        1.0.19.0 | 1.0.20.0-pre       |
| [nkf](nkf)         | [nkf Network Kanji Filter](https://ja.osdn.net/projects/nkf/)                          |           2.1.4 | 2.1.4-pre          |

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
