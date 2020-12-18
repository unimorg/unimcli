import nimblepkg/[tools],strformat, ../i18n/i18n

nimterlingua()

# TODO:cross-compile & define build template yourself
proc build*(name:seq[string]) =
    ## build release
    ## 
    let outDir = ""
    let dir = if outDir == "":outDir
        else: "-o:" & outDir & "/"

    
    case name.len
    of 0:
        echo "「INFO」","Build with -d:release." 
    of 1:
        doCmd(fmt"nim c -d:release {dir} {name[0]}")
    else:
        # TODO:parse options
        discard
        