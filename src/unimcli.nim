import cligen

import unimcli/commands/[installPkg,configs,buildRelease,runDebug,updates,cmdTemplate,uninstallPkg]
import unimcli/utils/[checkSource,checkLang]

proc init() =
  checkLang()
  checkSource()

proc main*() =
  ## command list:
  ## # install
  ## # uninstall
  ## # run
  ## # build
  ## # update
  ## # command
  ##    add
  ##    del
  ##    [others]
  ## # config
  ##    set
  ##      lang
  ##      source 

  dispatchMulti(
    [install,help={"names":"pkgname"}],
    [uninstall,help={"names":"pkgname"}],
    [run,help={"name":"file you to run"}],
    [build,help={"name":"file you to compile"}],
    [update],
    [mycmd],
    [config,help={"cmd":"set lang/set source"}],
  )
  
when isMainModule:
  init()
  main()