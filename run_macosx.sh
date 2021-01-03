#!/bin/bash
GAME=$1
filename=$(basename -- "$GAME")
extension="${filename##*.}"
filename="${filename%.*}"
RA_PATH="/Applications/RetroArch.app/Contents/MacOS/RetroArch"
CORE="./sameboy_libretro.dylib"
if [ "$extension" = "gb" ]; then
    CORE="./sameboy_libretro.dylib"
else
    echo "Unknown core for extension: $extension"
fi
echo $extension
echo $RA_PATH -L $CORE $GAME
$RA_PATH -L $CORE "$GAME"
