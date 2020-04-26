#!/bin/bash

# Style variables
bold=$(tput bold)
normal=$(tput sgr0)
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
NC='\033[0m'
# End Style variables

PARAMETER=$1

PHP_VERSIONS='5.6|7.0|7.1|7.2|7.3|7.4'

_checkExitStatus () {

    retVal=$?
    if [[ $retVal -ne 0 ]]; then
        printf "${red}Something went wrong${NC}\n"
        exit $retVal
    fi

}

_restartApache () {

    systemctl restart apache2
    _checkExitStatus

}

_changeSymlinkPhp () {

    ln -sfn /usr/bin/php${PARAMETER} /etc/alternatives/php
    _checkExitStatus

}

_switchingMessage () {

    echo
    printf "${green}Switching to PHP ${PARAMETER} ...${NC}\n"
    echo

}

_endMessage () {

    echo
    printf "${green}All done!${NC}\n"
    echo

}

_printHelpMessage () {

    echo
    echo "              Usage: phpvto <Version number>"
    echo
    echo "Possible versions: 5.6 | 7.0 | 7.1 | 7.2 | 7.3 | 7.4"
    echo
    echo "Example to switch to php version 7.1: phpvto 7.1"
    echo
    echo "To check your current version type: php --version"
    echo
    echo "Note: If you don't have one of those php versions installed you will get an error message, and of course, you can't change to an uninstalled version"
    echo

}

_missingParameterMessage () {

    echo
    echo "You need to choose a php version: ${PHP_VERSIONS}"
    echo
    echo "If you need help type: phpvto --help"
    echo
    echo "Your current version is: "
    echo
    command php -i | grep 'PHP Version'

}

_disablePhpMode () {

    for (( i=0; i<${#PHP_VERSIONS}; i+=4 )); do

        local version=${PHP_VERSIONS:$i:3}

        versionCompare=${version//[.]/}
        PARAMETERCOMPARE=${PARAMETER//[.]/}

        if [[ "${versionCompare}" -ne "$PARAMETERCOMPARE" ]]
        then

            a2dismod php${PHP_VERSIONS:$i:3}

        fi
    done
}

_enablePhpMode () {

    a2enmod php${PARAMETER}
    _checkExitStatus

}

main () {

    if [[ "$PARAMETER" == "" ]]
    then

        _missingParameterMessage

    elif [[ "$PARAMETER" == "--help" ]]
    then

        _printHelpMessage

    elif [[ "$PHP_VERSIONS" =~ .*$PARAMETER.* ]]
    then

        _switchingMessage
        _disablePhpMode
        _enablePhpMode
        _endMessage

    else

        _missingParameterMessage

    fi

}

main