#!/bin/bash

save_dir="$HOME/Images/screenshots"
mkdir -p "$save_dir"

timestamp=$(date +'%a_%T_')

if [[ "$1" == "--save" ]]; then
    grim -g "$(slurp)" "$save_dir/screen_${timestamp}.png"
    echo "Screenshot saved to $save_dir/screen_${timestamp}.png"
elif [[ "$1" == "--copy" ]]; then
    grim -g "$(slurp)" - | wl-copy
    echo "Screenshot copied to clipboard"
else
    echo "Usage: $0 --save | --copy"
    exit 1
fi
