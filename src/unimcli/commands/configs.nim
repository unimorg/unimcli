import ../i18n/i18n, ../utils/[checkSource,checkLang]

nimterlingua()

proc setConfig(opts:seq[string]) =
    ## set configs

    const cmdList = {
        "lang": "language of unimcli",
        "source": "source of pkglist"
    }

    if opts.len == 0:
        echo "「INFO」","Command list" & ":\n"
        for cmd in cmdList:
            echo cmd[0] & "\t\t" & cmd[1]
        return

    case opts[0]
    of cmdList[0][0]:
        # select language and rebuild tools
        setLang()

    of cmdList[1][0]:
        # reset source
        checkSource(reset=true)

    else:
        echo "「ERROR」","No config named" & " " & opts[0] & "\n" & "Options list" & ":\n" & $cmdList


proc config*(cmd:seq[string]) =
    ## cli configs
    
    const cmdList = {
        "set": "set config"
    }
    
    if cmd.len == 0:
        echo "「INFO」","Command list" & ":\n"
        for cmd in cmdList:
            echo cmd[0] & "\t\t" & cmd[1]
        return

    case cmd[0]
    of cmdList[0][0]:   ## config
        setConfig(cmd[1..^1])

    else:
        echo "「ERROR」","No action named" & " " & cmd[0] & "\n" & "Command list" & ":\n" & $cmdList