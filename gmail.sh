#!/bin/bash

#CONFIG
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
username="YOUR_GMAIL_USERNAME"
password="YOUR_GMAIL_PASSWORD"

mail_count=$(curl -su $username:$password https://mail.google.com/mail/feed/atom | grep "<fullcount>" | cut -d'>' -f8 | cut -d'<' -f1
)

if [ "$mail_count" != "0" ]; then
	notify-send -i $DIR/icons/gmail-notification-icon.png "Gmail" "You got $mail_count new email!";
fi

#Yetki kontrolü yap Unauthorized'e göre