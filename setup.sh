#!/bin/bash

#BASE PATH
BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#COPY PROGRAM IN BIN FOLDER
[[ ! -f /bin/notification/box ]] && sudo cp $BASE/notification-box /bin
#GENERAL APPLICATION SETTINGS
echo -e -n 'CHECKBOX_GMAIL="false" CHECKBOX_FACEBOOK="false" CHECKBOX_WORDPRESS="false" CHECKBOX_HIDEGUI="false" CHECKBOX_STARTUP="false"' > $HOME/.notification-box;
#GMAIL CONFIG FILE PLACEHOLDER
echo 'gmail_username="USERNAME" gmail_password="PASSWORD" gmail_refresh_time="3600"' > $BASE/moduls/.gmail-config;
#FACEBOOK CONFIG FILE PLACEHOLDER
echo 'facebook_username="USERNAME" facebook_password="PASSWORD" facebook_refresh_time="3600"' CHECKBOX_FACEBOOK_MESSAGE="false" CHECKBOX_FACEBOOK_NOTIFICATION="false" > $BASE/moduls/.facebook-config;
#WORDPRESS CONFIG FILE PLACEHOLDER
echo 'wordpress_url="URL" wordpress_username="ADMIN" wordpress_password="PASSWORD" wordpress_refresh_time="3600" CHECKBOX_WORDPRESS_UPDATE="false" CHECKBOX_WORDPRESS_COMMENT="false"' > $BASE/moduls/.wordpress-config;
