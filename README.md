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

### Install Windows Make:
```sh
choco install make
```

### Install Haxe
* Install Haxe using appropriate installer from https://haxe.org/download/
* Install libraries:
```sh
make init
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


### Add VSCode extensions:
In Extension marketplace within VSCode search and install the following:
* `nadako.vshaxe`
* `firefox-devtools.vscode-firefox-debug`

# Build and Run
### Target HashLink:
```sh
make build
make run
```

### Testing with Web target
Testing Heaps by compiling to Web target:
simply press F5 to run vscode's debugger utilizing setup in `.vscode/launch.json`


### Running HIDE:
```sh
make hide-build
make hide-run
```


