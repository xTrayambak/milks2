#[
  Milks2 Scanner Entry Point

  Authors: xTrayambak (xtrayambak at gmail dot com)

  This code is licensed under the GPLv2 license.
]#

import chronicles, find, disinfect, std/[times, strformat, rdstdin, strutils]

proc main =
  info "[src/milks2.nim] Milk Stage 2 Scanner"
  info "[src/milks2.nim] Thanks to MCRcortex for creating Nekodetector (milks2's detection methods are very similar to it)"
  info "[src/milks2.nim] I am not responsible in ANY way for any damage done by this software, though it shouldn't really do any damage."
  info "[src/milks2.nim] More information: https://github.com/fractureiser-investigation/fractureiser/"
  
  when defined(mac):
    warn "[src/milks2.nim] Fractureiser only targets Windows and Linux, the script kiddie developer couldn't figure out how to target MacOS. You're safe! :)"
    quit(0)


  info "[src/milks2.nim] Starting scanner"
  let startScanTime = cpuTime()
  let suspiciousFiles = findSuspiciousFiles()
  echo fmt"* Scanning took {cpuTime() - startScanTime} seconds"

  if suspiciousFiles.len > 0:
    warn "[src/milks2.nim] You seem to be infected by Fractureiser."
    warn "[src/milks2.nim] Persistence files were found. Listing them."
    for file in suspiciousFiles:
      echo fmt">> {file}"

    echo "In total, around {suspiciousFiles.len} files were found that are known to be Fractureiser infection vectors."

    let shouldDisinfect = readLineFromStdin("Start disinfection? [y/N]: ").toLowerAscii() == "y"

    if shouldDisinfect:
      let startDisinfectTime = cpuTime()
      info "[src/milks2.nim] Finally, a worthy opponent. Our battle will be legendary!"
      disinfect(suspiciousFiles)
      echo fmt"* Disinfection took {cpuTime() - startDisinfectTime} seconds"
      info "[src/milks2.nim] You should (hopefully) be safe now. Make sure to donate a chocolate chip cookie if this was useful for you!"
      info "[src/milks2.nim] Until the next silly voxel game malware strain, see you later! ;D"
  else:
    info "[src/milks2.nim] Hurray! You don't seem to be infected."
    info "[src/milks2.nim] Now go ahead and throw a party to your friends and family that a silly block game mod didn't let you to getting pwn'd by a lifeless person sitting in their mom's basement!"

  quit(0)

when isMainModule:
  main()
