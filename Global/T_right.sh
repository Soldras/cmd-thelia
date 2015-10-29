#!/bin/sh
# @author Penalver Antony
# v0.2


CODE="777"

HELP="
This script will erase the cache of your Thelia application. It will ask for root authorization, since your cache has been written by www-data.\n
\n
Usage: T_right.sh [-h] [-c] CODE\n
\n
Options:\n
	-h\tdisplay this message\n
	-c\tset code for chmod ( default : 777 )\n
"

while getopts "hc:" option
do
	case $option in
		c)
			CODE=$OPTARG
			;;
		h)
			echo -e $HELP
			exit 0
			;;
		\?)
			echo "$OPTARG is an invalid option"
			echo -e $HELP
			exit 1
			;;
	esac
done

echo  "\n== Change right ==\n"

echo  "- cache folder -\n"
sudo chmod -R $CODE cache

echo  "- media folder -\n"
sudo chmod -R $CODE local/media

echo  "- session folder -\n"
sudo chmod -R $CODE local/session

echo  "- web folder -\n"
sudo chmod -R $CODE web

echo  "- log folder -\n"
sudo chmod -R $CODE log

echo  "- modules folder -\n"
sudo chmod -R $CODE local/modules

echo  "\n== End change right ==\n"
