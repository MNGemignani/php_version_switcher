#!/usr/bin/env bash


    if [ "$1" == "7.0" ]; then
        echo
        echo "Switching to PHP 7.0 ..."
        echo
        sudo a2dismod php5.6;
        sudo a2dismod php7.1;
        sudo a2dismod php7.2;
        sudo a2enmod php7.0;
        sudo systemctl restart apache2;
        sudo ln -sfn /usr/bin/php7.0 /etc/alternatives/php
    elif [ "$1" == "7.1" ]; then
        echo
        echo "Switching to PHP 7.1 ..."
        echo
        sudo a2dismod php5.6;
        sudo a2dismod php7.0;
        sudo a2dismod php7.2;
        sudo a2enmod php7.1;
        sudo systemctl restart apache2;
        sudo ln -sfn /usr/bin/php7.1 /etc/alternatives/php
    elif [ "$1" == "7.2" ]; then
        echo
        echo "Switching to PHP 7.2 ..."
        echo
        sudo a2dismod php5.6;
        sudo a2dismod php7.0;
        sudo a2dismod php7.1;
        sudo a2enmod php7.2;
        sudo systemctl restart apache2;
        sudo ln -sfn /usr/bin/php7.2 /etc/alternatives/php
    elif [ "$1" == "5.6" ]; then
        echo
        echo "Switching to PHP 5.6 ..."
        echo
        sudo a2dismod php7.0;
        sudo a2dismod php7.1;
        sudo a2dismod php7.2;
        sudo a2enmod php5.6;
        sudo systemctl restart apache2;
        sudo ln -sfn /usr/bin/php5.6 /etc/alternatives/php
    elif [ "$1" == "" ]; then
        echo
        echo "You need to choose a php version: 5.6 | 7.0 | 7.1 | 7.2"
        echo
        echo "If you need help type: phpvto -help"
        echo
        echo "Your current version is: "
        echo
        command php -i | grep 'PHP Version'
    elif [ "$1" == "-help" ]; then
        echo
        echo "              Usage: phpvto <Version number>"
        echo
        echo "Possible versions: 5.6 | 7.0 | 7.1 | 7.2"
        echo
        echo "Example to switch to php version 7.1: phpvto 7.1"
        echo
        echo "To check your current version type: php --version"
        echo
        echo "Note: If you don't have one of those php versions installed you will get an error message, and of course, you can't change to an uninstalled version"
        echo
    else
        echo
        echo "You need to choose a php version: 5.6 | 7.0 | 7.1 | 7.2"
        echo
        echo "If you need help type: phpvto -help"
        echo
        echo "Your current version is: "
        echo
        command php -i | grep 'PHP Version'
    fi

