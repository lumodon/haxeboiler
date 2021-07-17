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
cd haxeboiler
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
(To be written in future commit)
(link to NW.js)
(instructions to paste nwjs into bin folder)
(test make command)

### Add Haxe VSCode extension if not using Kode:
Search `nadako.vshaxe` in Extension marketplace within VSCode

# Build and Run
```sh
make build
make run
```
Running HIDE:
(To be written in future commit)


