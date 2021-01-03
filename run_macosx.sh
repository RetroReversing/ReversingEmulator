#!/bin/bash
GAME=$1
RA_PATH="/Applications/RetroArch.app/Contents/MacOS/RetroArch"
CORE="./sameboy_libretro.dylib"
echo $GAME
echo $RA_PATH -L $CORE $GAME
$RA_PATH -L $CORE "$GAME"
