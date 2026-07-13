#!/bin/bash

current=$(hyprctl activeworkspace -j | jq '.id')

[[ "$current" == "9" ]] && hyprctl dispatch workspace 10 || hyprctl dispatch workspace 9
