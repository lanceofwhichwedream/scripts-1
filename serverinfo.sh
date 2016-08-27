#!/bin/bash
#By Lance Zeligman
minecraft=$(/home/lance/.bin/minecraft.py)
OUT=$?

if [ $OUT -eq 0 ];then
	notify-send "Warbase.xyz Minecraft Server" "$minecraft"
else
	notify-send "Warbase.xyz is offline, restart it"
fi
