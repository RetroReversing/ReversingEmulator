# ReversingEmulator
Auto Builds for the libRetroReversing emulators

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
```
make all
```

## Windows Install
See the /windowsSetup/Readme.md guide for instructions on how to build for windows.
