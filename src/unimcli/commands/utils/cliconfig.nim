import os

# store cliConfig & command template in myconfig.json

proc checkConfig*() = 
  let exeDir = getAppDir()
  let configDir = joinPath(exeDir,"myconfig.json")
  let f = open(configDir,fmReadWrite);defer: f.close