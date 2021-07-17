# Haxe Boilerplate

## Purpose
Boilerplate instructions for tooling with specific stack and development on specific targetplatform

Intention is NOT to have this project work for many different platforms yet - just want to get a quick up and running Windows 10 clone, follow steps, and go solution

## Details
### Dev Platform:
Windows 10

### Stack:
* Language: [Haxe Language](https://haxe.org/)
* Framework: [Heaps.io Game Engine](https://heaps.io/about.html)
* Data store: [CastleDB](http://castledb.org/)
* Runtime: [HashLink VM](https://hashlink.haxe.org/)

Target is to achieve tooling to support: GameDev NW.js SDK Application - [HIDE IDE](https://github.com/HeapsIO/hide)

# Installation Instructions

### Pre-reqs not covered:
* Visual Studio Code
* Kode Studio (optional)
* MIN-GW & Git Bash
* Chocolatey

----
### Clone Repo:
```sh
git clone --recurse-submodules git@github.com:lumodon/haxeboiler.git
cd haxeboiler/hide
git remote set-url --push origin no_push
cd ../
```

### Install Haxe
* Install Haxe using appropriate installer from https://haxe.org/download/
* Install these libraries:

```sh
haxelib git heaps https://github.com/HeapsIO/heaps
haxelib git castle https://github.com/ncannasse/castle
haxelib git hxbit https://github.com/ncannasse/hxbit
haxelib git hscript https://github.com/HaxeFoundation/hscript
haxelib git hxnodejs https://github.com/HaxeFoundation/hxnodejs
haxelib git domkit https://github.com/HeapsIO/domkit
haxelib git hx3compat https://github.com/HaxeFoundation/hx3compat
```

### Install Windows Make:
```sh
choco install make
```

### Setup HashLink:
1. [Download HashLink](https://hashlink.haxe.org/#download)
2. Extract contents to "Program Files" (or elsewhere if preferred) (copy this path to clipboard [accessible via `WinKey+V`] you'll need it for step 4)
3. `WinKey+R` - `rundll32.exe sysdm.cpl,EditEnvironmentVariables` -> `Ctrl+Shift+Enter` (Run as Administrator)
4. Under "System Variables" (bottom section) Add a new variable: `HASHLINKPATH = ${HASHLINKPATH}` substituting `${HASHLINKPATH}` with the path from step 2 above
5. Edit the `Path` system variable
    * Click "Add" on right
    * Paste `%HASHLINKPATH%`

### Setup NW.js
1. Download [NWjs SDK version](https://nwjs.io/)
2. Create a new folder with: `mkdir ./hide/bin/nwjs/`
3. Extract the contents of the folder within `nwjs-sdk-v0.54.1-win-x64` (version may be different) to newly created folder from previous step


### Add Haxe VSCode extension if not using Kode:
Search `nadako.vshaxe` in Extension marketplace within VSCode

# Build and Run
```sh
make build
make run
```

Running HIDE:
```sh
make hide-build
make hide-run
```


