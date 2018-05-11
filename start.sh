#!/bin/bash

if [ ! -f /root/assistant.json ] ; then
	echo $AS > /root/assistant.json
fi

if [ ! -f /root/.cache/voice-recognizer/assistant_credentials.json ] ; then
	mkdir -p /root/.cache/voice-recognizer/
	echo $AC > /root/.cache/voice-recognizer/assistant_credentials.json
fi

cd /usr/src/app/assistant
source env/bin/activate
python3 src/main.py

while true; do
	sleep 2
	echo -ne "."
done
