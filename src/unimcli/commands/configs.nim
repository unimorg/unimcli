import os, ../i18n/i18n, nimblepkg/[cli, tools], cligen

nimterlingua()

# TODO:import from translations.cfg
const langList = [
    "en_US",
    "zh_CH"
]

proc setConfig(opts:seq[string]) =
    ## set configs

    # lang          | cli language
    # source        | pkglist source
    const optList = [
        "lang",
        "source"
    ]

    if opts.len == 0:
        echo "「INFO」","Command list" & ":\n" & $optList
        return

    case opts[0]
    of optList[0]:
        # select language and rebuild tools
        let lang = promptList(dontForcePrompt,"Select your language" & ":",langList)
        let exeDir = getAppDir()

        doCmd("nim c -d:release -d:$1 -o=$2/unim $2/unimcli" % [lang,exeDir])
        
        echo "「INFO」","Already switch to selected language." 

    of optList[1]:
        # TODO:set source
        discard

    else:
        echo "「ERROR」","No config named" & " " & opts[0] & "\n" & "Options list" & ":\n" & $optList

# TODO:define in global config and ask at first use
proc config*(cmd:seq[string]) =
    ## cli configs
    
    # set          | set config
    const cmdList = [
        "set"       
    ] 
    
    if cmd.len == 0:
        echo "「INFO」","Command list" & ":\n" & $cmdList
        return

    case cmd[0]
    of cmdList[0]:
        # set config
        setConfig(cmd[1..^1])

    else:
        echo "「ERROR」","No action named" & " " & cmd[0] & "\n" & "Command list" & ":\n" & $cmdList