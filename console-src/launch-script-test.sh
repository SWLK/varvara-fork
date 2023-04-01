#!/bin/bash

ROM=main.rom


echo "Script Starting"

#uxnemu $ROM >&0

mkfifo console-pipe

while read line; do
	$line 
	echo -ne '\x00'
	#echo -ne `$line` '\x00'

done < <(uxnemu main.rom < console-pipe) > console-pipe

rm ./console-pipe

echo "Script Terminated"
