SERVER_HOMEDIR=/home/steam/csgo-servers/212457-1/csgo/log
tail -f `find $SERVER_HOMEDIR -type f -name "csgo-srcds-*" | sort -n | tail -1`
