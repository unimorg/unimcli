# Package

version       = "0.0.1"
author        = "sovlookup"
description   = "User-friendly nimcli."
license       = "MIT"
srcDir        = "src"
installExt    = @["nim","cfg"]
bin           = @["unimcli"]
# skipDirs      = @["tests"]
namedBin      = {"unimcli": "unim"}.toTable()

# Dependencies

requires "nim >= 1.4.0", "cligen >= 1.3.2"
requires "nimble"
