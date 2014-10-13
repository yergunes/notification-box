#!/bin/bash

#Gathering Account Informations
informations=$(cat $BASE/moduls/.gmail-config);
I=$IFS; IFS="" 
for STATEMENTS in $informations; do 
   eval $STATEMENTS 
done 
IFS=$I 

#Authorization Check
auth=$(curl -su $gmail_username:$gmail_password https://mail.google.com/mail/feed/atom | grep -ci "Unauthorized")

if [ "$auth" != "0" ]; then
    notify-send -i $BASE/icons/gmail-icon.png "Gmail" "Authorization error! Check your account settings...";
else
    while [ 1 ]; do
         mail_count=$(curl -su $gmail_username:$gmail_password https://mail.google.com/mail/feed/atom | grep "<fullcount>" | cut -d'>' -f8 | cut -d'<' -f1
        )

        if [ "$mail_count" != "0" ]; then
            notify-send -i $BASE/icons/gmail-icon.png "Gmail" "You got $mail_count new email!";
        fi
    sleep $gmail_refresh_time;
    done
fi
