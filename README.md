[![AppVeyor Build status](https://ci.appveyor.com/api/projects/status/1vv03ri8bujes620/branch/master?svg=true)](https://ci.appveyor.com/project/kai2nenobu/chocolatey-packages/branch/master)

# What is this repository?

This repository stores chocolatey packages for my own.

These packages are built on [AppVeyor](https://www.appveyor.com/) automatically and stored in [MyGet public feed](https://www.myget.org/F/kai2nenobu).

# Package List

| id                                                                                                   | title                                                                                  |          version | self-contained? | auto update? |
|------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|------------------|-----------------|--------------|
| [a5m2](a5m2)                                                                                         | [A5:SQL Mk-2](http://a5m2.mmatsubara.com/)                                             | [See here](https://www.myget.org/feed/kai2nenobu/package/nuget/a5m2) |                 | ✓            |
| [aws-sam-cli](aws-sam-cli)                                                                           | [SAM CLI (Beta)](https://aws.amazon.com/serverless/sam/)                               | [See here](https://www.myget.org/feed/kai2nenobu/package/nuget/aws-sam-cli) |                 | ✓            |
| [busybox-w32](busybox-w32)                                                                           | [busybox-w32](https://frippery.org/busybox/)                                           |      1.31.0.3025 |                 |              |
| [cmigemo](cmigemo)                                                                                   | [C/Migemo](https://github.com/koron/cmigemo)                                           |              1.3 |                 |              |
| [cpdf-cr](cpdf-cr)                                                                                   | [Coherent PDF Command Line Tools Community Release](http://community.coherentpdf.com/) |            2.2.1 |                 |              |
| [mape](mape)                                                                                         | [May Authentication Proxies Explode](https://github.com/ipponshimeji/MAPE)             |         1.0.21.0 |                 |              |
| [mozc-emacs-helper](mozc-emacs-helper)                                                               | [Mozc Emacs Helper](https://github.com/google/mozc/tree/master/src/unix/emacs)         |    2.23.2815.100 | ✓               |              |
| [nkf](nkf)                                                                                           | [nkf Network Kanji Filter](https://ja.osdn.net/projects/nkf/)                          |            2.1.5 | ✓               |              |
| [pleiades-java](pleiades-java)                                                                       | [Pleiades All in One](http://mergedoc.osdn.jp/)                                        | [See here](https://www.myget.org/feed/kai2nenobu/package/nuget/pleiades-java) |                 | ✓            |
| [pleiades-java-full](pleiades-java-full)                                                             | [Pleiades All in One](http://mergedoc.osdn.jp/)                                        | [See here](https://www.myget.org/feed/kai2nenobu/package/nuget/pleiades-java-full) |                 | ✓            |

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
