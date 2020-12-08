import cligen

import unimcli/commands/[installPkg,configs,buildRelease,runDebug,updates]

proc main*() =
  ## command list:
  ## # install
  ## 
  ## # config
  ##    set
  ##      lang
  ##      source 
  ## 
  dispatchMulti(
    [install,help={"names":"pkgname"}],
    [run,help={"name":"file you to run"}],
    [build,help={"name":"file you to compile"}],
    [update],
    [config,help={"cmd":"set lang/set source"}],
  )
  
when isMainModule:
  main()