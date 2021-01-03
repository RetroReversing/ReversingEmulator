#!/bin/bash
GAME=$1
filename=$(basename -- "$GAME")
extension="${filename##*.}"
filename="${filename%.*}"
RA_PATH="retroarch"
COREEXT="so"
CORE="sameboy_libretro.$COREEXT"
if [ "$extension" = "gb" ]; then
    CORE="sameboy_libretro.$COREEXT"
    $RA_PATH -L $CORE "$GAME"
elif [ "$extension" = "gg" ]; then
    CORE="genesis_plus_gx_libretro.$COREEXT"
elif [ "$extension" = "sms" ]; then
    CORE="genesis_plus_gx_libretro.$COREEXT"
else
    echo "Unknown core for extension: $extension"
fi
echo $(pwd)
echo $extension
echo $RA_PATH -L $CORE \"$GAME\"
$RA_PATH -L $CORE \"$GAME\"
