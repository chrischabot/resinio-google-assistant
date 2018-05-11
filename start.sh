#!/bin/bash

if [ ! -f assistant.json ] ; then
	echo $AS > assistant.json
fi

cd /usr/src/app/assistant
source env/bin/activate
python3 src/main.py

while true; do
	sleep 2
	echo -ne "."
done
