
# Windows Setup

## Msys2 (recommended)
Msys2 is the reccomended option for building on windows, gcc seems to work better than clang due to the use of experimetal filesystem header
```
pacman -S make git mingw-w64-x86_64-clang
```

---
## Windows subsystem for Linux
Only use WSL if you know you want to build the Linux version under Windows. When compiled this will only work with the Linux version of RetroArch.

Run installWSL.bat as administrator (right click run as..) to install Ubuntu under Windows.

On first install you might want to update the list of packages available in apt like so:
```
sudo apt-get update
sudo apt-get upgrade
```

You will need to install retroarch/nodejs/make/libc++ into the WSL environment like so:
```
sudo apt-get install retroarch
sudo apt-get install nodejs
sudo apt-get install npm
sudo apt-get install make
sudo apt install libc++-11-dev
sudo apt install libc++abi-dev
```

## Running make inside WSL
Run a new WSL shell (I do this inside VSCode)
```
make
```

However bare in mind that if you run make in WSL it will build the Linux versions of the cores, so you will need to use the linux retroArch to use them. If you followed the steps above you will already have installed retroarch so you just need to use the script ```run_linux.sh```.

## Nodejs and Chocolatey
Note that even if you install nodejs in the WSL environment you still will want it in standard windows too, to do this you need to get the official installer from their website.

It is reccomended that when you install Nodejs you select the optional Chocolatey option in the installer.

If you have Chocolatey then you can run this to install retroarch:
```
choco install make
choco install retroarch
choco install llvm
```

If it complains that Choco is not found but you are sure that you installed it then it might have been removed from your path, try this:
```
SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```
Or in Git Bash:
```
export PATH=$PATH:/c/Users/All\ Users/chocolatey/bin:/c/Program\ Files/llvm/bin
```

