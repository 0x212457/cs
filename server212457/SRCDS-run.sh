#FILE to launch CSGO server on a linux server and log outputs (stdout and stderr)

SERVER_HOMEDIR=/home/steam/csgo-servers/212457-1/csgo/
SERVER_HOMEDIR_LOG=/home/steam/csgo-servers/212457-1/csgo/log
IP="193.65.2.255" #put IP adress of your server here (this is a fake address)
PORT=27016 #classic port of CSGO SRCDS
STEAM_ID_TOKEN=G8281Z18C2AP4083973576A2T7D0ZC95 #put your STEAM TOKEN here (this is a fake TOKEN)
TICKRATE=128
MAP_GROUP=mg_active
MAP_NAME=de_dust2
GAME_TYPE=0
GAME_MODE=1

$SERVER_HOMEDIR/srcds_run -game csgo -tickrate $TICKRATE -console -usercon +ip $IP +port $PORT +game_type $GAME_TYPE +game_mode $GAME_MODE +mapgroup $MAP_GROUP +map $MAP_NAME +sv_setsteamaccount $STEAM_ID_TOKEN -net_port_try > $SERVER_HOMEDIR_LOG/csgo-srcds-`date +%Y%m%d-%H%M`.log 2>&1
