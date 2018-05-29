#!/bin/bash

export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

# Remove default audio
rmmod snd_bcm2835  >/dev/null 2>&1 || true

# Enable i2c and other interfaces
modprobe i2c-dev || true

if [ ! -f .aiy_installed ] ; then
	pip3 install --upgrade google-assistant-library
	touch .aiy_installed
fi

if [ ! -f /root/assistant.json ] ; then
	echo $ASSITANT_JSON > /root/assistant.json
fi

if [ ! -f /root/.cache/voice-recognizer/assistant_credentials.json ] ; then
	mkdir -p /root/.cache/voice-recognizer/
	echo $CREDENTIALS_JSON > /root/.cache/voice-recognizer/assistant_credentials.json
fi

# Start app
python3 ./examples/voice/assistant_library_with_button_demo.py

sleep 3600
