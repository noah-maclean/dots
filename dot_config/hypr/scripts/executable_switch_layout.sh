#!/bin/bash
CURRENT_LAYOUT=$(hyprctl getoption general:layout -j | jq -r '.str')

if [ "$CURRENT_LAYOUT" = "dwindle" ]; then
    hyprctl keyword general:layout "scrolling"
    notify-send -u low -i "view-dual-symbolic" "Layout Switched" "Mode: <i>Scrolling</i>"
else
    hyprctl keyword general:layout "dwindle"
    notify-send -u low -i "view-grid-symbolic" "Layout Switched" "Mode: <i>Dwindle</i>"
fi
