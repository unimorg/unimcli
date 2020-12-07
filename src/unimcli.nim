import cligen

import unimcli/commands/[installPkg]


proc main*() =
  dispatchMulti(
    [install,help={"names":"pkgname"}]
  )

when isMainModule:
  main()