import os, strutils, nimblepkg/[cli, tools], ../i18n/i18n, cliConfig, json

nimterlingua()

proc getLangList*():seq[string] =
    ## get langlist in translations.cfg
    let exePath = getAppDir()
    let lancfgPath = joinPath(exePath,"unimcli/i18n/translations.cfg")
    let f = open(lancfgPath,fmRead);defer:f.close

    for line in f.lines:
        if "language" in line:
            if line.startsWith("#"):
                continue
            result = line.split("=")[^1].strip.split(",")
            break


proc setLang*():string {.discardable.}=
    ## set lang
    let lang = promptList(dontForcePrompt,"Select your language" & ":",getLangList())
    let exeDir = getAppDir()

    var config = getConfig()
    config["settings"]["language"] = %* lang
    writeConfig config

    doCmd("nim c -d:release -d:$1 -o=$2/unim $2/unimcli" % [lang,exeDir])
    
    echo "「INFO」","Already switch to selected language." 
    result = lang

proc checkLang*() = 
    ## check language setting at first time
    let config = getConfig()

    if not (config["settings"]["language"].getStr("") in getLangList()):
        setLang()