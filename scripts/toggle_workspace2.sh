#!/bin/bash

current=$(hyprctl activeworkspace -j | jq '.id')

[[ "$current" == "7" ]] && hyprctl dispatch workspace 8 || hyprctl dispatch workspace 7