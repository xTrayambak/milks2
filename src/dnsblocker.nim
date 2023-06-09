#[
  Add Fractureiser C&C servers to DNS blocklist

  Authors: xTrayambak (xtrayambak at gmail dot com)

  This code is licensed under the GPLv2 license.
]#
assert false, "This has not been implemented yet."

import std/[os, strformat, osproc], chronicles

# WARNING: do not connect to these servers as they probably store your IP address!
# According to the investigation timeline these are not responding as of 8th June, 2023
# But it is better to block them in case they make a return.
const FRACTUREISER_BLOCKLIST_IP = @[
  # Not responding (stage3b -- skyrage)
  "95.214.27.172",

  # Not responding (stage3b -- skyrage)
  "171.22.30.117",

  # Taken down by Cloudflare Pages hosting as per a request (initial C&C)
  "107.189.3.101",
]

proc patchDns* {.inline.} =
  info "[src/dnsblocker.nim] Blocking known Fractureiser IP addresses to the DNS blocklist."

  var
    tmp: File = open("milk2-tmp.txt", fmWrite)
    dnsFileR: string
    dnsFile: File

  when defined(win32) or defined(win64):
    dnsFileR = "C:/Windows/System32/drivers/etc/hosts"

  when defined(linux):
    dnsFileR = "/etc/hosts"

  let dnsFileContents = dnsFileR.readFile()
  
  tmp.write(dnsFileContents & "\n")
  for fracCNC in FRACTUREISER_BLOCKLIST_IP:
    echo fmt"Blocked C&C server: {fracCNC}"
    tmp.write(fracCNC & "\t" & "127.0.0.1\n")
  
  info "[src/dnsblocker.nim] Dumping!"

  when defined(win32) or defined(win64):
    discard execCmd("move milk2-tmp.txt C:/Windows/system32/drivers/etc/hosts")

  when defined(linux):
    discard execCmd("sudo -i")
    discard execCmd("cp -r milk2-tmp.txt /etc/hosts")

  info "[src/dnsblocker.nim] Done."
