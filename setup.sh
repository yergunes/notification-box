#!/bin/bash

#BASE PATH
BASE="/home/arch/Desktop/notification-box"
#COPY PROGRAM IN BIN FOLDER
[[ ! -f /bin/notification/box ]] && sudo cp $BASE/notification-box /bin
#GENERAL APPLICATION SETTINGS
echo -e -n 'CHECKBOX_GMAIL="false" CHECKBOX_WORDPRESS="false" CHECKBOX_OPENGUI="false" CHECKBOX_STARTUP="false" CHECKBOX_UPDATE="false"' > $HOME/.notification-box;
#GMAIL CONFIG FILE PLACEHOLDER
echo 'gmail_username="USERNAME" gmail_password="PASSWORD" gmail_refresh_time="3600"' > $BASE/moduls/.gmail-config;
#WORDPRESS CONFIG FILE PLACEHOLDER
echo 'wordpress_url="URL" wordpress_username="ADMIN" wordpress_password="PASSWORD" wordpress_refresh_time="3600" CHECKBOX_WORDPRESS_UPDATE="false" CHECKBOX_WORDPRESS_COMMENT="false"' > $BASE/moduls/.wordpress-config;