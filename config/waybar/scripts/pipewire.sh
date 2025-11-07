#!/bin/zsh

volume=$(pamixer --get-volume)
mute=$(pamixer --get-mute)

if [ "$mute" = "true" ]; then
    echo "MUTE"
else
    if [[ $volume -le 100 && $volume -gt 50 ]]; then
        echo " $volume%"
    elif [[ $volume -le 50 && $volume -gt 25 ]]; then
        echo " $volume%"
    elif [[ $volume -le 25 && $volume -gt 0 ]]; then
        echo " $volume%"
    else
        echo " 0%"
    fi
fi
