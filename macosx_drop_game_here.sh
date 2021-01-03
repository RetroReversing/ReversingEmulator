export GAME:="$(1)"
export RA_PATH := /Applications/RetroArch.app/Contents/MacOS/RetroArch
export CORE := ./sameboy_libretro.dylib
echo $(GAME)
echo $(RA_PATH) -L $(CORE) $(GAME)
pause