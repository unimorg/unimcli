import nimblepkg/[tools],strformat, ../i18n/i18n

nimterlingua()

# TODO
proc run*(name:seq[string]) =
    ## run with auto-reload

    case name.len
    of 0:
        echo "「INFO」","Run app in debug mode." 
    of 1:
        doCmd(fmt"nim c -r {name[0]}")
    else:
        echo "「INFO」", "TODO:build template"