# .-.aliases.php
# Used to add anything PHP specific

if (exists php); then
    test "$SILENT" == false && echo -e "*\tPHP\t\t\t\t*"

    # php_config - Open for editing
    if [ -f /etc/php.ini ]; then
        # OSX
        alias php_config='$EDITOR /etc/php.ini'
    elif [ -f /etc/php5/apache2/php.ini ]; then
        # Linux
        alias php_config='$EDITOR /etc/php5/apache2/php.ini'
    fi
fi
