import nimblepkg/[tools],strformat, ../i18n/i18n

nimterlingua()

# TODO:cross-compile & define build template yourself
proc build*(name:seq[string]) =
    ## build release
    ## 
    
    case name.len
    of 0:
        echo "「INFO」","Build with -d:release." 
    of 1:
        doCmd(fmt"nim c -d:release {name[0]}")
    else:
        echo "「INFO」", "TODO:build template"
        