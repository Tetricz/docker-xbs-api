# xBrowserSync
## API for Docker

xBrowserSync is a free tool for syncing browser data between different browsers and devices, built for privacy and anonymity. For full details, see [www.xbrowsersync.org](https://www.xbrowsersync.org/).

This repository contains the Docker files required to get your own [xBrowserSync API service](https://github.com/xbrowsersync/api) up and running in moments, either by running the API image alone or by orchestrating a production-ready HTTPS service with database and reverse proxy.

## Running the API image

Running the API image alone requires that you have a MongoDB instance and (ideally) a web server to reverse proxy the API behind.

  1. The service will be exposed via port 8080.

      ```
      $ sudo docker run -dit -p 8080:8080 -e XBS_DB_HOST="" -e XBS_DB_NAME="" -e XBS_DB_USER="" -e XBS_DB_PASS="" -v /path/to/appdata:/config --name xbrowsersync tetricz/xbs-api
      ```

      You can now access your xBrowserSync API service at http://127.0.0.1:8080.
  
  3. Stop docker and edit `settings.json` you can find the documentation for the settings [here](https://github.com/xbrowsersync/api#4-modify-configuration-settings).


## Issues and feature requests

If you have found an issue with the xBrowserSync API itself or wish to request a new feature, do so in the [api Issues list](https://github.com/xbrowsersync/api/issues/).

Issues related specifically to this docker container you can do so [here](https://github.com/Tetricz/docker-xbs-api/issues).