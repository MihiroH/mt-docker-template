#!/bin/sh

chmod 775 /var/www/html/mt
chmod 775 /var/www/html/mt-static
chmod 777 /var/www/html/mt-static/support

chown -R root.www-data /var/www/html/mt
chown -R root.www-data /var/www/cgi-bin/mt

find /var/www/cgi-bin/mt -name '*.cgi*' -exec chmod 755 {} \;
find /var/www/html/mt-static -name '*.cgi*' -exec chmod 755 {} \;
