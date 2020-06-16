#!/bin/bash                                                                              

#This script watch the F/S to detect the end of a demo recording and create the direct download link to get it

CSGOSRV_HOME_DIR=/home/steam/csgo-servers/212457-1/csgo/csgo                             
                                                                                         
inotifywait -m $CSGOSRV_HOME_DIR -e close_write | while read path action file            
                        do                                                               
                                if [[ "$file" =~ .*dem$ ]] # Does the file end with .dem?
                                        then                                             
                                                 ln -s  ${path}${file} /var/www/cs.bl.lc  
                                                 #do adoc update
                                fi                                                       
                        done
