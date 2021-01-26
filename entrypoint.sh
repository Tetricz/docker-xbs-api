#!/bin/sh

#------------------------------
#Checking for settings file and writing settings using env
#------------------------------
if test -f "/api/config/settings.json";
then
    echo "Settings found, skipping..."
    cp /config/settings.json /api/config/settings.json
else
    echo "Settings not found, copying settings from env variables"
    envsubst < "/ref_settings.json" > "/api/config/settings.json"
    cp /config/settings.json /api/config/settings.json
fi
echo "Starting server....."
sh
node /api/dist/api.js