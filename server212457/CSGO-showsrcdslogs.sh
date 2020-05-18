#WATCHING SRCRDS-RUN logs for outpout messages (stdout) and errors (stderr)
SERVER_HOMEDIR_LOG=/home/steam/csgo-servers/212457-1/csgo/log
tail -f `find $SERVER_HOMEDIR_LOG -type f -name "csgo-srcds-*" | sort -n | tail -1`
