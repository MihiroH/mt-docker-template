##          Movable Type configuration file                   ##
##                                                            ##
## This file defines system-wide settings for Movable Type    ##
## In total, there are over a hundred options, but only those ##
## critical for everyone are listed below.                    ##
##                                                            ##
## Information on all others can be found at:                 ##
## http://www.movabletype.org/documentation/appendices/config-directives/ ##

################################################################
##################### REQUIRED SETTINGS ########################
################################################################

# The CGIPath is the URL to your Movable Type directory
CGIPath    /cgi-bin/mt/

# The StaticWebPath is the URL to your mt-static directory
# Note: Check the installation documentation to find out
# whether this is required for your environment.  If it is not,
# simply remove it or comment out the line by prepending a "#".
StaticWebPath    /mt-static/
StaticFilePath /var/www/html/mt-static

#================ DATABASE SETTINGS ==================
#   CHANGE setting below that refer to databases
#   you will be using.

##### MYSQL #####
ObjectDriver DBI::mysql
Database mt
DBUser mt
DBPassword password

# docker-compose環境ではコンテナのサービス名を指定する必要があるのでdb
DBHost db

## Change setting to language that you want to using.
#DefaultLanguage en_US
#DefaultLanguage de
#DefaultLanguage es
#DefaultLanguage fr
DefaultLanguage ja
#DefaultLanguage nl

