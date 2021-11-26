# ReversingEmulator
Auto Builds for the libRetroReversing emulators

# Core Status
* SameBoy - only works when you put the bootroms (e.g dmg_boot.bin) in the retroarch system directory (RetroArch/system)
* N64 - currently not even starting

---
# Manual Install (All OS)
Follow these steps no matter which Operating System you are working on. OS specific steps will be in their own section later in the document.

## Checkout all submodules
```
git submodule update --init --recursive
```

If you don't follow that step then you will get an error about missing files, make sure the recursive flag is on the end too.

---
# OS Specific Install

## MacOSX
Make sure you have installed the package manager called **Homebrew** on your Mac and then run the following commands:
```
brew install pkg-config libpng sdl freetype2 nasm
make all
```

## Windows Install
See the /windowsSetup/Readme.md guide for instructions on how to build for windows.

---
# Running
Once you have followed all the steps above that are applicable to your target platform you will have a newly created folder called **release**. It will contain all the dynamic libraries that were compiled for each Core as either .dll/.dylib/.so depending on your platform.

You will need **RetroArch** to be installed on your system, or if you want to use a different libRetro frontend then you will need to edit the scripts int he release folder for your platform.

## Running on Windows
On Windows you can drag and drop a ROM file on to the file **windows_drop_game_here.bat**.

## Running on MacOSX
On MacOSX its easiest to open a terminal and run:
```
./run_macosx.sh pathToYourROM
```

If you get an error such as 
> /Applications/RetroArch.app/Contents/MacOS/RetroArch: No such file or directory
Then make sure you have downloaded and installed RetroArch, or change the location in the bash script to point to the location of your RetroArch.