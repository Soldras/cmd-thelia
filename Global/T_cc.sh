#!/bin/bash
# @author Penalver Antony, Maxime Morille
# v0.2

ENV=""
HELP="
This script will erase the cache of your Thelia application. It will ask for root authorization, since your cache has been written by www-data.\n
\n
Usage: T_cc.sh [-h] [-e ENV]\n
\n
Options:\n
	-h\tdisplay this message\n
	-e\tset the environment to clear\n
"

while getopts ":e:h" option
do
	case $option in
		e)
			ENV=$OPTARG
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

THELIA="php Thelia"

echo -e "\n== Clearing Caches for $ENV ==\n"

if [[ $ENV ]]
then
	sudo $THELIA --env=$ENV cache:clear
	sudo $THELIA --env=$ENV"_dev" cache:clear
	sudo $THELIA --env=$ENV"_prod" cache:clear
	sudo $THELIA --env=$ENV"_test" cache:clear
else
	sudo $THELIA --env=dev cache:clear
	sudo $THELIA --env=prod cache:clear
	sudo $THELIA --env=test cache:clear
fi


echo -e "\n== All caches of $ENV are clear ==\n"
exit 0
