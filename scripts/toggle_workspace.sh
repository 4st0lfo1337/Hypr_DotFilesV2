#!/bin/bash

current=$(hyprctl activeworkspace -j | jq '.id')

case "$current" in
    8)
        hyprctl dispatch workspace 9
        ;;
    9)
        hyprctl dispatch workspace 10
        ;;
    10)
        hyprctl dispatch workspace 8
        ;;
    *)
        hyprctl dispatch workspace 8
        ;;
esac