# Milk Stage 2 scanner
A scanner for the new ["Fractureiser"](https://github.com/fractureiser-investigation/fractureiser) strain of malware
targetting people who download mods from sites like CurseForge. This is written in Nim so it is generally going to be
faster than the current [C#-based scanner](https://github.com/overwolf/jar-infection-scanner) and the [Java-based scanner](https://github.com/MCRcortex/nekodetector).
However, it's probably a lot more inaccurate than them too, but I intend to improve that as soon as possible.
Windows support is lackluster, I intend to fix it later.

# Build instructions
Install Git CLI from https://git-scm.com/downloads (On Windows, most Linux distributions bundle it by default)
Install Nim 1.6.12 toolchain at [nim-lang.org](https://nim-lang.org) and install it.
Open a terminal/command prompt, then run:
```
$ git clone https://github.com/xTrayambak/milks2.git
$ nimble build -d:release
```

# Run instructions (Windows)
Open up a Command Prompt as an administrator after following the above instructions, and run the following:
```
milks2
```

# Run instructions (Linux)
Open up a terminal after following the above instructions, and run the following:
```bash
$ ./milks2
```

# Credits
[The team behind the Fractureiser research](https://github.com/fractureiser-investigation/fractureiser/)
[MCRcortex's nekoscanner](https://github.com/MCRcortex/nekodetector)
