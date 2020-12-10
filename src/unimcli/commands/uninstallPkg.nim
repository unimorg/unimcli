import strformat, strutils, nimblepkg/[tools], ../i18n/i18n

nimterlingua()

proc uninstall*(names: seq[string]) =
  ## Uninstall nimble pkgs
  
  if names.len == 0:
    echo "「INFO」","Use command with" & ":\n" & "unim uninstall pkgname1,pkgname2,pkgname3"
    return

  for name in names[0].split(","):
    try:
      doCmd(fmt"nimble uninstall {name}")
    except:
      echo "「ERROR」","nimble error"