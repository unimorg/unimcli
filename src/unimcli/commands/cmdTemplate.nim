import ../i18n/i18n, ../utils/cliConfig, nimblepkg/[tools], strutils

nimterlingua()

proc mycmd*(names:seq[string]) =
    ## add/del/use your own command
    ## 
    const cmdList = {
        "add": "add your own command.",
        "del": "del a command."
    }
    
    if names.len == 0:
        echo "「INFO」","Command list" & ":\n"
        for cmd in cmdList:
            echo cmd[0] & "\t\t\t" & cmd[1]
        for command in commands():
            echo command.name & "\t\t\t" & command.discription
        return

    case names[0]
    of cmdList[0][0]:
        # add
        var command : Command
        case names.len
        of 3:
            command = Command(
                name: names[1],
                command: names[2].replace("_"," "),
                discription: ""
            )
        of 4:
            command = Command(
                name: names[1],
                command: names[2].replace("_"," "),
                discription: names[3].replace("_"," ")
            )
        else:
            echo "「ERROR」","Example" & ": unim mycmd add mycommand unim_build_$1　your_discription_here\n" & "Use" & ": unim mycmd mycommand app.nim -> unim build app.nim"
            return
        
        addCommands([
            command
        ])

    of cmdList[1][0]:
        # del
        var command : Command
        case names.len
        of 2:
            command = Command(name:names[1])
        else:
            echo "「ERROR」","Example" & ": unim mycmd del mycommand"

        delCommands([
            command
        ])
        
    else:
        # getcmd and exec
        if names.len >= 2:
            for command in commands():
                if names[0] == command.name:
                    stdout.write doCmdEx(command.command % names[1..^1]).output
                break
        else:
            for command in commands():
                if names[0] == command.name:
                    stdout.write doCmdEx(command.command).output
                break
        