#[
  Find infected persistence mechanisms

  Authors: xTrayambak (xtrayambak at gmail dot com)

  This code is licensed under the GPLv2 license.
]#
import std/[strformat, os], chronicles

const 
  WINDOWS_INFECTED_FILES = @[
    ".ref",
    "client.jar",
    "lib.dll",
    "libWebGL64.jar",
    "run.bat"
  ]

proc findSuspiciousFiles*: seq[string] {.inline.} =
  var suspiciousFiles: seq[string] = @[]
  when defined(linux):
    let LINUX_INFECTED_FILES = @[
      fmt"{getHomeDir()}.config/.data/lib.jar",
      fmt"{getHomeDir()}.config/systemd/user/systemd-utility.service",
      "/etc/systemd/system/systemd-utility.service"
    ]
    for lif in LINUX_INFECTED_FILES:
      if fileExists(lif):
        warn "[src/find.nim] Found malware persistence file!", f=lif
        suspiciousFiles.add(lif)

  when defined(win32) or defined(win64):
    let 
      appData = getEnv("APPDATA")
      edgeFolder = appData & "\\Microsoft Edge"

    if dirExists(edgeFolder):
      warn "[src/find.nim] Found malware persistence file!", f=edgeFolder
      suspiciousFiles.add(absolutePath(edgeFolder))

  suspiciousFiles
