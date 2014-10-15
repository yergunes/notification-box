#!/bin/bash
source $BASE/functions
get_data ".wordpress-config"  #Getting account informations


while [ 1 ]; do
    
    #Get Cookie 1
    curl -s -D /tmp/cookie_1.txt $wordpress_url/wp-login.php;
    #Login 
    curl -s -A "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6" -D /tmp/cookie_2.txt -b /tmp/cookie_1.txt -F log=$wordpress_username -F pwd=$wordpress_password -F testcookie=1 -F wp-submit="Log In" -F redirect_to=$wordpress_url/wp-admin -F submit=login -F rememberme=forever $wordpress_url/wp-login.php;
    #Get Admin Page
    curl -s -L -o /tmp/output.html --cookie /tmp/cookie_2.txt $wordpress_url/wp-admin;


    if [ "$CHECKBOX_WORDPRESS_UPDATE" = "true" ]; then
        update_count=$(grep "wp-admin-bar-updates" /tmp/output.html | cut -d">" -f6 | cut -d"<" -f1);
    fi
    if [ "$CHECKBOX_WORDPRESS_COMMENT" = "true" ]; then
        comment_count=$(grep "wp-admin-bar-comments" /tmp/output.html | cut -d">" -f6 | cut -d"<" -f1);
    fi


    if [ "$update_count" != "0" ] && [ "$comment_count" != "0" ]; then
        notify-send -i $BASE/icons/wordpress-icon.png "Wordpress" "You got $update_count new update and $comment_count new comment"
    elif [ "$update_count" != "0" ] && [ "$update_count" != "" ]; then
        notify-send -i $BASE/icons/wordpress-icon.png "Wordpress" "You got $update_count new update"
    elif [ "$comment_count" != "0" ] && [ "$comment_count" != "" ]; then
        notify-send -i $BASE/icons/wordpress-icon.png "Wordpress" "You got $comment_count new comment"
    fi

sleep $wordpress_refresh_time;
done