#[
  Disinfecter utility

  Authors: xTrayambak (xtrayambak at gmail dot com)

  This code is licensed under the GPLv2 license.
]#
import std/[os, osproc, strformat], chronicles

proc killPid*(pid: int32) {.inline.} =
  when defined(linux):
    discard execCmd(fmt"kill {pid}")

  when defined(win32) or defined(win64):
    discard execCmd(fmt"taskkill /F {pid}")

proc disinfect*(suspiciousFiles: seq[string]) {.inline.} =
  info "[src/disinfect.nim] Beginning disinfection. Please wait."
  
  info "[src/disinfect.nim] Killing all running Java VM instances."
  when defined(win32) or defined(win64):
    return

  when defined(linux):
    echo execCmd("killall java")

  for suspiciousFile in suspiciousFiles:
    var isFileOrDir: string

    if dirExists(suspiciousFile):
      isFileOrDir = "dir"
    elif fileExists(suspiciousFile):
      isFileOrDir = "file"

    if isFileOrDir == "dir":
      removeDir(suspiciousFile)
    else:
      removeFile(suspiciousFile)
  
  when defined(win32) or defined(win64):
    info "[src/disinfect.nim] Disinfection done. Restart your PC!"

  when defined(linux):
    info "[src/disinfect.nim] Disinfection done. Restarting ALL systemd daemons."
    discard execCmd("sudo systemctl daemon-reload")
    discard execCmd("systemctl --user daemon-reload")
    info "[src/disinfect.nim] Total disinfection complete."
