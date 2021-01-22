#!/bin/sh

#------------------------------
#Checking for settings file and writing settings using env
#------------------------------
if test -f "/config/settings.json";
then
    echo "Settings found, skipping..."
else
    echo "Settings not found, copying settings from env variables"
    envsubst < "/ref_settings.json" > "/config/settings.json"
fi
echo "Starting server....."
/dist/api.js