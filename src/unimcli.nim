import cligen

import unimcli/commands/[installPkg,configs]


proc main*() =
  dispatchMulti(
    [install,help={"names":"pkgname"}],
    [config,help={"cmd":"set lang/source"}]
  )

when isMainModule:
  main()