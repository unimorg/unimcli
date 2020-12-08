import os, ../i18n/i18n, nimblepkg/[cli, tools], cligen

nimterlingua()

# TODO:import from translations.cfg
const langList = [
    "en_US",
    "zh_CH"
]

# TODO:define in global config and ask at first use
proc config*(cmd:string) =
    case cmd
    of "lang":
        let lang = promptList(dontForcePrompt,"Select your language:",langList)
        let exeDir = getAppDir()

        doCmd("nim c -d:release -d:$1 -o=$2/unim $2/unimcli" % [lang,exeDir])
        
        echo "「INFO」","Already switch to selected language." 

    of "source":
        # TODO:set source
        discard
    else:
        echo "「ERROR」","No config named" & cmd