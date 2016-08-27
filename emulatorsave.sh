#!/bin/bash
#Created By Lance Zeligman
#Creates automatic backups of Visualboy Save games and Save states 
#Version 2.0

#Finds the most recent folder and sets it as a variable
mostrecentsav=$( ls -tp /home/lance/Games/Saves/sav/ | head -1)
mostrecentsgm=$( ls -tp /home/lance/Games/Saves/sgm/ | head -1)

#Diffs the VBA-M save folders against the most recent backup and sets that to be a variable 
valuesav=$( diff --exclude="*.sgm" -r /home/lance/.config/gvbam/sgm /home/lance/Games/Saves/sav/$(echo $mostrecentsav) )
valuesgm=$( diff --exclude="*.sav" -r /home/lance/.config/gvbam/sgm /home/lance/Games/Saves/sgm/$(echo $mostrecentsgm) )

#Checks value of the diff and if it's equal to 1 or higher will create a back up folder labeled with the date it was run
if [ "$valuesgm >= 1" ];
then
	mkdir /home/lance/Games/Saves/sgm/$(date +"%m-%d-%y")
	cp /home/lance/.config/gvbam/sgm/*.sgm /home/lance/Games/Saves/sgm/$(date +"%m-%d-%y")
fi

if [ "$valuesav >= 1" ];
then
	mkdir /home/lance/Games/Saves/sav/$(date +"%m-%d-%y")
	cp /home/lance/.config/gvbam/sgm/*.sav /home/lance/Games/Saves/sav/$(date +"%m-%d-%y")
fi
