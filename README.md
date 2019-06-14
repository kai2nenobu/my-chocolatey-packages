[![AppVeyor Build status](https://ci.appveyor.com/api/projects/status/1vv03ri8bujes620/branch/master?svg=true)](https://ci.appveyor.com/project/kai2nenobu/chocolatey-packages/branch/master)

# What is this repository?

This repository stores chocolatey packages for my own.

These packages are built on [AppVeyor](https://www.appveyor.com/) automatically and stored in [MyGet public feed](https://www.myget.org/F/kai2nenobu).

# Package List

| id                                                                                                   | title                                                                                  |          version | self-contained? | auto update? |
|------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|------------------|-----------------|--------------|
| [a5m2](a5m2)                                                                                         | [A5:SQL Mk-2](http://a5m2.mmatsubara.com/)                                             | [![a5m2 version][a5m2_version]][a5m2_package]                                                                     |                 | ✓            |
| [aws-sam-cli](aws-sam-cli)                                                                           | [SAM CLI (Beta)](https://aws.amazon.com/serverless/sam/)                               | [![aws-sam-cli version][aws-sam-cli_version]][aws-sam-cli_package]                   |                 | ✓            |
| [busybox-w32](busybox-w32)                                                                           | [busybox-w32](https://frippery.org/busybox/)                                           | [![busybox-w32 version][busybox-w32_version]][busybox-w32_package]                                                                            | ✓               | ✓            |
| [cmigemo](cmigemo)                                                                                   | [C/Migemo](https://github.com/koron/cmigemo)                                           | [![cmigemo version][cmigemo_version]][cmigemo_package] |                 |              |
| [cpdf-cr](cpdf-cr)                                                                                   | [Coherent PDF Command Line Tools Community Release](http://community.coherentpdf.com/) | [![cpdf-cr version][cpdf-cr_version]][cpdf-cr_package] |                 |              |
| [mape](mape)                                                                                         | [May Authentication Proxies Explode](https://github.com/ipponshimeji/MAPE)             | [![mape version][mape_version]][mape_package] |                 | ✓            |
| [mozc-emacs-helper](mozc-emacs-helper)                                                               | [Mozc Emacs Helper](https://github.com/google/mozc/tree/master/src/unix/emacs)         | [![mozc-emacs-helper version][mozc-emacs-helper_version]][mozc-emacs-helper_package] | ✓               |              |
| [nkf](nkf)                                                                                           | [nkf Network Kanji Filter](https://ja.osdn.net/projects/nkf/)                          | [![nkf version][nkf_version]][nkf_package] | ✓               |              |
| [pleiades-java](pleiades-java)                                                                       | [Pleiades All in One](http://mergedoc.osdn.jp/)                                        | [![pleiades-java version][pleiades-java_version]][pleiades-java_package]                                 |                 | ✓            |
| [pleiades-java-full](pleiades-java-full)                                                             | [Pleiades All in One](http://mergedoc.osdn.jp/)                                        | [![pleiades-java-full version][pleiades-java-full_version]][pleiades-java-full_package]                                      |                 | ✓            |

[a5m2_version]: https://img.shields.io/myget/kai2nenobu/v/a5m2.svg?label=myget
[a5m2_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/a5m2
[aws-sam-cli_version]: https://img.shields.io/myget/kai2nenobu/v/aws-sam-cli.svg?label=myget
[aws-sam-cli_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/aws-sam-cli
[busybox-w32_version]: https://img.shields.io/myget/kai2nenobu/v/busybox-w32.svg?label=myget
[busybox-w32_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/busybox-w32
[cmigemo_version]: https://img.shields.io/myget/kai2nenobu/v/cmigemo.svg?label=myget
[cmigemo_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/cmigemo
[cpdf-cr_version]: https://img.shields.io/myget/kai2nenobu/v/cpdf-cr.svg?label=myget
[cpdf-cr_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/cpdf-cr
[mape_version]: https://img.shields.io/myget/kai2nenobu/v/mape.svg?label=myget
[mape_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/mape
[mozc-emacs-helper_version]: https://img.shields.io/myget/kai2nenobu/v/mozc-emacs-helper.svg?label=myget
[mozc-emacs-helper_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/mozc-emacs-helper
[nkf_version]: https://img.shields.io/myget/kai2nenobu/v/nkf.svg?label=myget
[nkf_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/nkf
[pleiades-java_version]: https://img.shields.io/myget/kai2nenobu/v/pleiades-java.svg?label=myget
[pleiades-java_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/pleiades-java
[pleiades-java-full_version]: https://img.shields.io/myget/kai2nenobu/v/pleiades-java-full.svg?label=myget
[pleiades-java-full_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/pleiades-java-full

If you want to know the complete list, see https://www.myget.org/F/kai2nenobu/api/v3/query.

# How to use

Install a package with an above feed url.

```
> choco install <package_id> --source https://www.myget.org/F/kai2nenobu
```

Or add an above feed to your chocolatey source and install a package.

```
> choco source add --name kai2nenobu --source https://www.myget.org/F/kai2nenobu
> choco install <package_id>
```

# References

- [CreatePackages](https://chocolatey.org/docs/create-packages)
- [Build Services](https://docs.myget.org/docs/reference/build-services)
