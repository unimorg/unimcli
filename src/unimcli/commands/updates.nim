# TODO:update self & nim & pkgs
import ../i18n/i18n

nimterlingua()

proc update*(name:seq[string]) =
    ## run with auto-reload

    case name.len
    of 0:
        echo "「INFO」","Update unimcli/nim-lang/nim-pkgs." 
    of 1:
        echo "「INFO」", "TODO"
    else:
        echo "「INFO」", "TODO"