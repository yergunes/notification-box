#!/bin/bash

#Config
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
username="USERNAME_HERE"
password="PASSWORD_HERE"

#Authorization Check
auth=$(curl -su $username:$password https://mail.google.com/mail/feed/atom | grep -ci "Unauthorized")

if [ "$auth" != "0" ]; then
    notify-send -i $DIR/icons/gmail-notification-icon.png "Gmail" "Authorization error! Check your account settings...";
else
    mail_count=$(curl -su $username:$password https://mail.google.com/mail/feed/atom | grep "<fullcount>" | cut -d'>' -f8 | cut -d'<' -f1
    )

    if [ "$mail_count" != "0" ]; then
        notify-send -i $DIR/icons/gmail-notification-icon.png "Gmail" "You got $mail_count new email!";
    fi
fi
