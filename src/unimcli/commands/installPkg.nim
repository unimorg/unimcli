import os, strformat, strutils, nimblepkg/[cli, tools], ../i18n/i18n

nimterlingua()

proc checkSource() =
  const source = [
    "https://raw.fastgit.org/SOVLOOKUP/nimPkg/main/packages.json",
    "https://raw.fastgit.org/nim-lang/packages/master/packages.json",
    "https://raw.githubusercontent.com/nim-lang/packages/master/packages.json"
  ]

  const configPath = joinPath(getConfigDir(),"nimble")
  const iniPath = joinPath(configPath,"nimble.ini")

  if not existsOrCreateDir(configPath):
    discard

  if not fileExists iniPath:
    echo "「INFO」","Auto created config.ini"
    # select source
    let selectdSource = promptList(dontForcePrompt,"""Select source you want:
>> Select 1️⃣ if you are in china.
>> Select 2️⃣ if you want refresh pkg list more faster.
>> Select 3️⃣ if you want official pkg list source.""",source)

    let f = open(iniPath,fmReadWrite);defer:f.close
    f.write """[PackageList]
name = "official"
url = "$#"""" % selectdSource

proc install*(names: seq[string]) =
  ## Install nimble pkgs
  checkSource()
  if names.len > 0:
    for name in names:
      doCmd(fmt"nimble install {name}")
  else:
    echo "「INFO」","What's the pkg you want to install?"