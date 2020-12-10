import os, strutils, nimblepkg/[cli, tools], ../i18n/i18n

nimterlingua()


proc checkSource*(reset: bool = false) =
  ## check or reset source
  const source = [
    "https://cdn.jsdelivr.net/gh/SOVLOOKUP/nimPkg@main/packages.json",
    "https://raw.fastgit.org/SOVLOOKUP/nimPkg/main/packages.bak.json",
    "https://raw.fastgit.org/nim-lang/packages/master/packages.json",
    "https://raw.githubusercontent.com/nim-lang/packages/master/packages.json"
  ]

  const configPath = joinPath(getConfigDir(),"nimble")
  const iniPath = joinPath(configPath,"nimble.ini")
  # auto create configPath
  discard existsOrCreateDir(configPath)

  # select and set source
  proc setSource() =
    # select source
    let selectdSource = promptList(dontForcePrompt,"""Select source you want:
>> Select 1️⃣ or 2️⃣ if you are in china.
>> Select 3️⃣ if you want refresh pkg list more faster.
>> Select 4️⃣ if you want official pkg list source.""",source)

    # write in config.ini
    let f = open(iniPath,fmReadWrite);defer:f.close
    f.write """[PackageList]
name = "official"
url = "$#"""" % selectdSource
    # refresh local cache
    stdout.write doCmdEx("nimble refresh").output

  
  if not fileExists iniPath:
    echo "「INFO」","Auto created config.ini"
    setSource()
  else:
    # reset if ini exist
    if reset:
      if prompt(dontForcePrompt,"Config already exsit , reset it?"):
        setSource()