# Table Of Contents
- [Haxe Boilerplate](#haxe-boilerplate)
  * [Purpose](#purpose)
  * [Details](#details)
    + [Dev Platform](#dev-platform-)
    + [Stack](#stack-)
- [Installation Instructions](#installation-instructions)
    + [Pre-reqs not covered](#pre-reqs-not-covered-)
    + [Clone Repo](#clone-repo-)
    + [Install Windows Make](#install-windows-make-)
    + [Install Haxe](#install-haxe)
    + [Setup HashLink](#setup-hashlink-)
    + [Setup NW.js](#setup-nwjs)
    + [Add VSCode extensions](#add-vscode-extensions-)
- [Resolutions to common problems](#resolutions-to-common-problems-)
  * [Target Windows Binary](#target-windows-binary)
  * [Repair Haxe SDL (Optional)](#repair-haxe-sdl--optional-)
    + [Pre-Reqs](#pre-reqs)
    + [Repair Process](#repair-process)
- [Build and Run](#build-and-run)
    + [Target HashLink](#target-hashlink-)
    + [Testing with Web target](#testing-with-web-target)
    + [Running HIDE](#running-hide-)


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
* Git >= v2.19

----
Follow instructions in order:

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

# Resolutions to common problems:

## Target Windows Binary
Seems there's complications when building targeting Windows _without_ a console (i.e. hide console window for end user)
Solution provided here and is as recent as 2020:  
https://gist.github.com/Yanrishatum/d69ed72e368e35b18cbfca726d81279a#gistcomment-3506706

## Repair Haxe SDL (Optional)
(EDIT:) This solution does not build. Working on moving forwards. In the mean-time - awaiting response from Haxe group seen here in this issue: https://github.com/HeapsIO/heaps/issues/989

As of July 17th, 2021 - Haxe's repo is outdated even though the fixes have already been merged
When following steps for target HashLink - the following error appears:

```
Failed - try fixing the error(s) and restarting the language server:

C:\HaxeToolkit\haxe\lib\heaps/git/hxd/System.hl.hx:289: characters 18-34 : Class<sdl.Sdl> has no field getClipboardText
C:\HaxeToolkit\haxe\lib\heaps/git/hxd/System.hl.hx:293: characters 18-34 : Class<sdl.Sdl> has no field setClipboardText
```

Assuming the version that `haxelib` has automatically downloaded is still less than `1.11.0`, the following steps will resolve this issue:

The following steps under this [Repair Haxe SDL (Optional)](#repair-haxe-sdl-optional) section is a lengthy and brittle process (many things could change from moment of documenting this to moment of following these steps) but _was_ able to resolve the issue for me.

### Pre-Reqs
[MinGW](http://mingw-w64.org/doku.php) or VC (Only tested with MinGW as of yet)
[SDL Development Libraries - MinGW](https://www.libsdl.org/download-2.0.php)
[Visual Studio 2015 Community Edition](https://visualstudio.microsoft.com/downloads/)

### Repair Process
1. Open bash terminal
2. Identify your Haxe installation location (Default appeared to be `C:\HaxeToolkit\haxe`)
3. Store this folder `hxipath="/c/HaxeToolkit/haxe"` replacing example path with one identified from previous step 
4. Run commands:
```sh
cd $hxipath/lib/hlsdl/
mkdir 1,11,0
mkdir staging_area
cd $_
git init
git remote add -f origin git@github.com:HaxeFoundation/hashlink.git
git config core.sparseCheckout true
echo 'libs/sdl' >> .git/info/sparse-checkout
git pull origin master
mv -f ./libs/sdl/{.,}* ../1,11,0/
cd ../
rm -rf staging_area
code ./.current
```
5. Edit the `.current` file you just opened and change version to `1.11.0` (note the period instead of folder path of comma)
6. Install SDL
    1. Using the HashLink install path from steps above `%HASHLINKPATH%`
    2. Install MinGW SDL into `hashlink/include/sdl/include` and `hashlink/include/sdl/lib`

**NOTE** -- because of how Haxelib behaves - if you ever execute `haxelib install` or `haxelib install hlsdl` or other recursive functions which some auto-installers of Haxe utilize - you'll lose this fix and need to re-repair due to hlsdl `1.11.0` not existing in the haxelib artifactory

**TODO:** find a way to version lock via `haxelib git` to _this_ specific project folder rather than relying on brittle global installs)  
as detailed here: https://lib.haxe.org/documentation/using-haxelib/  
and here: https://lib.haxe.org/documentation/per-project-setup/  
solution (albeit seems outdated) appears to be: https://github.com/lix-pm/lix.client  

> haxelib git minject git@github.com:massiveinteractive/minject.git v2          # Checkout branch or tag `v2`.

# Build and Run
### Target HashLink:
```sh
make build
make run
```

### Testing with Web target
Testing Heaps by compiling to Web target:
Set your compilation target using the Haxe extension addition in ribbon bar at bottom of VSCode
simply press F5 to run vscode's debugger utilizing setup in `.vscode/launch.json`


### Running HIDE:
```sh
make hide-build
make hide-run
```


