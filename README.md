[![Auto Update][auto_update_badge]][auto_update_actions]

[auto_update_badge]: https://github.com/kai2nenobu/my-chocolatey-packages/workflows/Auto%20Update/badge.svg
[auto_update_actions]: https://github.com/kai2nenobu/my-chocolatey-packages/actions?query=workflow%3A%22Auto+Update%22

----

# What is this repository?

This repository stores chocolatey packages for my own.

These packages are built on [GitHub Actions](https://github.com/kai2nenobu/my-chocolatey-packages/actions) and stored in [MyGet public feed](https://www.myget.org/F/kai2nenobu).
Some packages are automatically updated by using [AU](https://github.com/majkinetor/au). ([Update Report](https://gist.github.com/kai2nenobu/4df33f42a891ced2fe169974fd3d58ec))

# Package List

| id                                         | title                                                                                   | version                                                                                             | embedded? | auto update? |
|--------------------------------------------|-----------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|-----------|--------------|
| [a5m2](a5m2)                               | [A5:SQL Mk-2](http://a5m2.mmatsubara.com/)                                              | [![a5m2 version][a5m2_version]][a5m2_package]                                                       |           | ✓            |
| [aws-sam-cli](aws-sam-cli)                 | [AWS SAM CLI](https://aws.amazon.com/serverless/sam/)                                   | [![aws-sam-cli version][aws-sam-cli_version]][aws-sam-cli_package]                                  |           | ✓            |
| [cmigemo](cmigemo)                         | [C/Migemo](https://github.com/koron/cmigemo)                                            | [![cmigemo version][cmigemo_version]][cmigemo_package]                                              |           |              |
| [exa](exa)                                 | [exa](https://the.exa.website/)                                                         | [![exa version][exa_version]][exa_package]                                                          | ✓         |              |
| [ghq](ghq)                                 | [ghq](https://github.com/motemen/ghq)                                                   | [![ghq version][ghq_version]][ghq_package]                                                          | ✓         | ✓            |
| [gibo](gibo)                               | [fast access to .gitignore boilerplates](https://github.com/simonwhitaker/gibo)         | [![gibo version][gibo_version]][gibo_package]                                                       | ✓         |              |
| mape                                       | [Deprecated] [May Authentication Proxies Explode](https://github.com/ipponshimeji/MAPE) | Migrated to [Chocolatey.org][mape_package]                                                          |           |              |
| [mozc-emacs-helper](mozc-emacs-helper)     | [Mozc Emacs Helper](https://github.com/google/mozc/tree/master/src/unix/emacs)          | [![mozc-emacs-helper version][mozc-emacs-helper_version]][mozc-emacs-helper_package]                | ✓         |              |
| [nkf](nkf)                                 | [nkf Network Kanji Filter](https://ja.osdn.net/projects/nkf/)                           | [![nkf version][nkf_version]][nkf_package]                                                          | ✓         |              |
| pet                                        | [Deprecated] [pet : CLI Snippet Manager](https://github.com/knqyf263/pet)               | Migrated to [Chocolatey.org][pet_package]                                                           |           |              |
| [pleiades-java](pleiades-streams)          | [Pleiades All in One Java Standard Edition](http://mergedoc.osdn.jp/)                   | [![pleiades-java version][pleiades-java_version]][pleiades-java_package]                            |           | ✓            |
| [pleiades-java-full](pleiades-streams)     | [Pleiades All in One Java Full Edition](http://mergedoc.osdn.jp/)                       | [![pleiades-java-full version][pleiades-java-full_version]][pleiades-java-full_package]             |           | ✓            |
| [pleiades-platform](pleiades-streams)      | [Pleiades All in One Platform Standard Edition](http://mergedoc.osdn.jp/)               | [![pleiades-platform version][pleiades-platform_version]][pleiades-platform_package]                |           | ✓            |
| [pleiades-platform-full](pleiades-streams) | [Pleiades All in One Platform Full Edition](http://mergedoc.osdn.jp/)                   | [![pleiades-platform-full version][pleiades-platform-full_version]][pleiades-platform-full_package] |           | ✓            |
| [wsl-ssh-agent](wsl-ssh-agent)             | [wsl-ssh-agent](https://github.com/rupor-github/wsl-ssh-agent)                          | [![wsl-ssh-agent version][wsl-ssh-agent_version]][wsl-ssh-agent_package]                            | ✓         | ✓            |

[a5m2_version]: https://img.shields.io/myget/kai2nenobu/v/a5m2.svg?label=myget
[a5m2_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/a5m2
[aws-sam-cli_version]: https://img.shields.io/myget/kai2nenobu/v/aws-sam-cli.svg?label=myget
[aws-sam-cli_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/aws-sam-cli
[cmigemo_version]: https://img.shields.io/myget/kai2nenobu/v/cmigemo.svg?label=myget
[cmigemo_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/cmigemo
[exa_version]: https://img.shields.io/myget/kai2nenobu/v/exa.svg?label=myget
[exa_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/exa
[ghq_version]: https://img.shields.io/myget/kai2nenobu/v/ghq.svg?label=myget
[ghq_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/ghq
[gibo_version]: https://img.shields.io/myget/kai2nenobu/v/gibo.svg?label=gibo
[gibo_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/gibo
[mape_package]: https://chocolatey.org/packages/mape
[mozc-emacs-helper_version]: https://img.shields.io/myget/kai2nenobu/v/mozc-emacs-helper.svg?label=myget
[mozc-emacs-helper_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/mozc-emacs-helper
[nkf_version]: https://img.shields.io/myget/kai2nenobu/v/nkf.svg?label=myget
[nkf_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/nkf
[pet_package]: https://chocolatey.org/packages/pet
[pleiades-java_version]: https://img.shields.io/myget/kai2nenobu/v/pleiades-java.svg?label=myget
[pleiades-java_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/pleiades-java
[pleiades-java-full_version]: https://img.shields.io/myget/kai2nenobu/v/pleiades-java-full.svg?label=myget
[pleiades-java-full_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/pleiades-java-full
[pleiades-platform_version]: https://img.shields.io/myget/kai2nenobu/v/pleiades-platform.svg?label=myget
[pleiades-platform_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/pleiades-platform
[pleiades-platform-full_version]: https://img.shields.io/myget/kai2nenobu/v/pleiades-platform-full.svg?label=myget
[pleiades-platform-full_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/pleiades-platform-full
[wsl-ssh-agent_version]: https://img.shields.io/myget/kai2nenobu/v/wsl-ssh-agent.svg?label=myget
[wsl-ssh-agent_package]: https://www.myget.org/feed/kai2nenobu/package/nuget/wsl-ssh-agent

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

# 利用許諾 (License)

このリポジトリに含まれるスクリプト、nuspecなどのすべてのファイルにUnlicenseを適用します。ただし個別のディレクトリ、ファイルに別途利用許諾が記載されているものについてはそちらを優先します。Unlicenseの利用許諾全文は[LICENSE](./LICENSE)を参照してください。

# References

- [CreatePackages](https://chocolatey.org/docs/create-packages)
- [Build Services](https://docs.myget.org/docs/reference/build-services)
