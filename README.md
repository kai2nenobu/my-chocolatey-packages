[![AppVeyor Build status](https://ci.appveyor.com/api/projects/status/1vv03ri8bujes620/branch/master?svg=true)](https://ci.appveyor.com/project/kai2nenobu/chocolatey-packages/branch/master)

# What is this repository?

This repository stores chocolatey packages for my own.

These packages are built on [MyGet](https://www.myget.org/) automatically and stored in https://www.myget.org/F/kai2nenobu (public feed).

# Package List

| id                 | title                                                                                  |
|--------------------|----------------------------------------------------------------------------------------|
| [a5m2](a5m2)       | [A5:SQL Mk-2](http://a5m2.mmatsubara.com/)                                             |
| [cpdf-cr](cpdf-cr) | [Coherent PDF Command Line Tools Community Release](http://community.coherentpdf.com/) |

# How to use

Add an above feed to chocolatey source.

```
> choco source add -n kai2nenobu -s https://www.myget.org/F/kai2nenobu
```

Then you can install a package as usual as below.

```
> choco install <package_name>
```

# References

- [CreatePackages](https://chocolatey.org/docs/create-packages)
- [Build Services](https://docs.myget.org/docs/reference/build-services)
