# Package

version       = "0.0.1"
author        = "sovlookup"
description   = "An amazing nimcli."
license       = "BSD-3-Clause"
srcDir        = "src"
installExt    = @["nim","cfg"]
bin           = @["unimcli"]
# skipDirs      = @["tests"]
namedBin      = {"unimcli": "unim"}.toTable()

# Dependencies

requires "nim >= 1.4.0", "cligen >= 1.3.2", "loco >= 0.1.2", "nimble"
