# Description
A Windows batch file to start a Project Zomboid server.

# Installation
Unpack anywhere you like. The batch file will set settings based on the config file you provide, or read from `pzsv_config.ini` provided in the same folder as the launcher.

# Usage
Remember to port forward the server port you are using! (Ports: 16261, 8766 (not sure if this one is required, works fine without it))\
If you want to create a server config, go in-game, "HOST", "Manage settings..." and click "Create New Settings".\
Drag a config file **(NOT THE PROJECT ZOMBOID ONE, EXAMPLE PROVIDED IN `pzsv_config.ini`)** onto `pzserver.bat` *(.bat won't show if you don't have extension visibility)* to start with specified config, or via command line: `pzserver C:\sv_config.ini`\
The server should start.

# Troubleshooting
## Server path not found
The provided path in the config file doesn't exist.

## Couldn't find the 'jre64' folder.
The provided path in the config file is invalid.
The path should be the path to the server files (for example, your Project Zomboid installation).
