#[
  Find infected persistence mechanisms

  Authors: xTrayambak (xtrayambak at gmail dot com)

  This code is licensed under the GPLv2 license.
]#
import std/os, chronicles

const 
  LINUX_INFECTED_FILES = @[
    "~/.config/.data/lib.jar",
    "~/.config/systemd/user/systemd-utility.service",
    "~/.config/.data/lib.jar"
  ]
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
