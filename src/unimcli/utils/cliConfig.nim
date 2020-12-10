import os, json, strutils

# store cliConfig & command template in myconfig.json
type
    # methods to oprate Hooks
    Method* = enum
        Add, Del

    # compatible with Json obj
    Command* = object
        name*: string
        command*: string
        discription* : string

let configPath = joinPath(getAppDir(),"config.json")

proc getConfig*(mode:FileMode = fmRead): JsonNode =
    ## load Json from local path
    
    # first exec
    if not fileExists configPath:
        var f = open(configPath,fmWrite)
        # f.write """{"settings":{"language":"$#"},"commands":{}}""" % setLang()
        f.write """{"settings":{"language":""},"commands":[]}"""
        f.close
    
    result = parseFile configPath

proc writeConfig*(config:JsonNode) =
    ## write config
    
    let f = open(configPath,fmWrite);defer: close f
    f.write pretty config

iterator commands*():Command = 
    for command in getConfig()["commands"]:
        yield command.to(Command)
    

proc addCommands*(addCommands:openarray[Command]):bool = 
    ## add commands to json file if unique
    var config = getConfig()
    var existNameList : seq[string]
    
    var commands = config["commands"]
    for command in commands:
        existNameList.add command["name"].getStr

    for addCommand in addCommands:
        if addCommand.name in existNameList or addCommand.name in ["add","del"]:
            echo "「ERROR」","Command {$1} has already exsit , skip!" % addCommand.name
            continue

        commands.add(%* addCommand)

    try:
        writeConfig config
        result = true
    except:
        result = false

proc delCommands*(delCommands:openarray[Command]):bool = 
    ## del commands in json file if exist
    var config = getConfig()
    var existNameList : seq[string]
    var delCommandList : seq[string]
    var nCommandList:JsonNode = %* []
    
    for existCommand in commands():
        existNameList.add existCommand.name

    for delCommand in delCommands:
        delCommandList.add delCommand.name

    for delCommand in delCommandList:
        # ensure cmd name is unique
        if not (delCommand in existNameList):
            echo "「ERROR」","No command named {$#}" % delCommand
            continue
        
    for newCommand in config["commands"]:
        # del hook
        if not (newCommand["name"].getStr() in delCommandList):
            nCommandList.add(%* newCommand)
    
    config["commands"] = %* nCommandList
    try:
        writeConfig config
        result = true
    except:
        result = false