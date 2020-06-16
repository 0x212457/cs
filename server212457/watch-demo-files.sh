#!/bin/bash                                                                              
#This script watch the F/S to detect the end of a demo recording and create the direct download link to get it

CSGOSRV_HOME_DIR=/home/steam/csgo-servers/212457-1/csgo/csgo
CS_WEB_SITE=/var/www/cs.bl.lc
CS_WEB_ADOC_FILE=$CS_WEB_SITE/index.adoc
CS_WEB_HTML_FILE=$CS_WEB_SITE/index.html
CS_WEB_LOG_FILE=$CS_WEB_SITE/index.log

inotifywait -m $CSGOSRV_HOME_DIR -e close_write | while read path action file
                        do
                                if [[ "$file" =~ .*dem$ ]] # Does the file end with .dem?
                                        then
                                                ln -s ${path}${file} $CS_WEB_SITE
                                                FILE_SIZE=`du -hL ${path}${file} | cut -f1`
                                                echo -e " " >> $CS_WEB_ADOC_FILE
                                                echo -e "http://cs.bl.lc/$file[$file, $FILE_SIZE]" >> $CS_WEB_ADOC_FILE
                                                echo -e " " >> $CS_WEB_ADOC_FILE

                                                asciidoctor -v -o $CS_WEB_HTML_FILE $CS_WEB_ADOC_FILE >> $CS_WEB_LOG_FILE 2>&1
                                fi
                        done
