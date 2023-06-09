# Milk Stage 2 scanner
A scanner for the new ["Fractureiser"](https://github.com/fractureiser-investigation/fractureiser) strain of malware
targetting people who download mods from sites like CurseForge. This is written in Nim so it is generally going to be
faster than the current [C#-based scanner](https://github.com/overwolf/jar-infection-scanner) and the [Java-based scanner](https://github.com/MCRcortex/nekodetector).
However, it's probably a lot more inaccurate than them too, but I intend to improve that as soon as possible.

# Build instructions
Install Nim 1.6.12 toolchain at [nim-lang.org](https://nim-lang.org) and install it.
After that, run the following:
```
$ nimble build -d:release
$ ./milks2
```

# Credits
[The team behind the Fractureiser research](https://github.com/fractureiser-investigation/fractureiser/)
[MCRcortex's nekoscanner](https://github.com/MCRcortex/nekodetector)
