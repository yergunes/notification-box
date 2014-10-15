#!/bin/bash
source $BASE/functions
get_data ".facebook-config" #Getting account informations
 

COOKIES='/tmp/cookies.txt'
USER_AGENT='Mozilla/5.0'
 

while [ 1 ]; do


    if [ -f "$COOKIES" ]; then
        rm $COOKIES
    fi

    curl -s -X GET 'https://www.facebook.com/home.php' --verbose --user-agent $USER_AGENT --cookie $COOKIES --cookie-jar $COOKIES --location # redirects to https://login.facebook.com/login.php
    curl -s -X POST 'https://login.facebook.com/login.php' --verbose --user-agent $USER_AGENT --data-urlencode "email=$facebook_username" --data-urlencode "pass=$facebook_password" --cookie $COOKIES --cookie-jar $COOKIES
    curl -s -X GET 'https://www.facebook.com/home.php' --verbose --user-agent $USER_AGENT --cookie $COOKIES --cookie-jar $COOKIES > /tmp/facebook;


    if [ "$CHECKBOX_FACEBOOK_MESSAGE" = "true" ]; then
        message_count=$(cat /tmp/facebook | grep -o -m 1 ".\{0,0\}mercurymessagesCountValue.\{0,10\}" | cut -d">" -f2 | cut -d"<" -f1);
    fi

    if [ "$CHECKBOX_FACEBOOK_NOTIFICATION" = "true" ]; then
        notification_count=$(cat /tmp/facebook | grep -o -m 1 ".\{0,0\}notificationsCountValue.\{0,10\}" | cut -d">" -f2 | cut -d"<" -f1);
    fi


    if [ "$message_count" != "0" ] && [ "$notification_count" != "0" ]; then
        notify-send -i $BASE/../icons/facebook-icon.png "facebook" "You got $message_count new notification and $notification_count new message"
    elif [ "$message_count" != "0" ] && [ "$message_count" != "" ]; then
        notify-send -i $BASE/icons/facebook-icon.png "facebook" "You got $message_count new message"
    elif [ "$notification_count" != "0" ] && [ "$notification_count" != "" ]; then
        notify-send -i $BASE/icons/facebook-icon.png "facebook" "You got $notification_count new notification"
    fi

sleep $facebook_refresh_time;
done