# Unimcli

![](http://img.shields.io/badge/license-MIT-blue.svg) ![](https://raw.fastgit.org/yglukhov/nimble-tag/master/nimble.png)

User-friendly nimcli.

## Features

1. i18n

   🇬🇧🇨🇳

2. Fast

   🐌clone => 🚀clone from [speed up source](https://github.com/SOVLOOKUP/nimPkg)

3. Friendly

   nim👑 & nimble💍 & useful tools✨ => All-In-One
   
4. Extensible

   add your own commands template

## Install
`nimble install unimcli`
## Examples

#### install

1. install pkgs:`unim install pkgname1,pkgname2,pkgname3`

#### run

`unim run app.nim`  

#### build

use:

`unim build app.nim` 

instead of:

 `nim c -d:release app.nim`

#### mycmd

**you can add command template like this:**

`unim mycmd add yourcmd unim_install_$1`

**use it with params:**

`unim mycmd yourcmd unim` 

this command is same as `unim install unim`

*`mycmd` will convert `_` to space*



1. create:`unim mycmd add [name] [command] [discription]`
2. del:`unim mycmd del [name]`
3. use:`unim mycmd [name]`

#### config

1. choose your language:`unim config set lang`
2. choose pkglist source:`unim config set source`

## Roadmap

1. [x] fast git clone install
2. [x] i18n select & rebuild tools
3. [x] ask configs(language/source) when first use
4. [x] add command yourself
5. [ ] update update nim & nimpkgs
6. [ ] run hot-reload debug 
7. [ ] build easy  firendly cross-compile
8. [ ] build dll
9. [ ] add other commands from nim & nimble
10. [ ] docker auto build docker image
11. [ ] nimist support
12. [ ] pack pack static files to binary
13. [ ] upx support
13. [ ] choosenim support for nim manage
14. [ ] bump support for dev 

## Contributing

Any contributions are welcome, be it pull requests, code reviews, documentation improvements, bug reports, or feature requests.

**We need your help:**

1. ⭐More language support⭐

   HOW : Add new language and improve translations in`src/unimcli/i18n/translations.cfg`

2. Examples

   HOW : Edit this readme,add more examples.

3. Code tests

   HOW : Add tests in `tests`dir

