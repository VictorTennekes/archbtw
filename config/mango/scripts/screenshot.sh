#!/bin/bash

save_dir="$HOME/Images/screenshots"
mkdir -p "$save_dir"

timestamp=$(date +'%a_%T_')

filename="$save_dir/screen_${timestamp}.png"


if [[ "$1" == "--save" ]]; then
    grim -g "$(slurp)" $filename
    echo "Screenshot saved to $save_dir/screen_${timestamp}.png"
elif [[ "$1" == "--copy" ]]; then
    grim -g "$(slurp)" - | wl-copy
    echo "Screenshot copied to clipboard"
elif [[ "$1" == "--full" ]]; then
	grim $filename 
else
    echo "Usage: $0 --save | --copy"
    exit 1
fi
