#!/bin/bash

EXT_MONITOR=$1
LAPTOP=eDP-1

xrandr --output ${EXT_MONITOR} --primary

xrandr --listactivemonitors

xrandr --output ${LAPTOP} --off

xrandr --setmonitor left 1918/535x1080/300+0+0 ${EXT_MONITOR}
xrandr --setmonitor right 1918/535x1080/300+1919+0 none
xrandr --fb 3840x1081
xrandr --fb 3840x1080

xrandr --output ${LAPTOP} --mode 1920x1080
