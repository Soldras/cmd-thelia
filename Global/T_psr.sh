#!/bin/sh
# @author Penalver Antony
# v0.1


MODULE=""

HELP="
This script will psr-2 for your module.\n
\n
Usage: T_psr.sh [-h] -m MODULE\n
\n
Options:\n
	-h\tdisplay this message\n
	-m\tset module name\n
"

while getopts "hm:" option
do
	case $option in
		m)
			MODULE=$OPTARG
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

if [ -z $MODULE  ]; then
    echo "Missing module name\n"
    echo $HELP;
    exit 1
fi


if [ -d "local/modules/$MODULE/Form/" ]; then
php-cs-fixer.phar fix local/modules/$MODULE/Form/ --level=psr2
fi
if [ -d "local/modules/$MODULE/Event/" ]; then
php-cs-fixer.phar fix local/modules/$MODULE/Event/ --level=psr2
fi
if [ -d "local/modules/$MODULE/EventListeners/" ]; then
php-cs-fixer.phar fix local/modules/$MODULE/EventListeners/ --level=psr2
fi
if [ -d "local/modules/$MODULE/Controller/" ]; then
php-cs-fixer.phar fix local/modules/$MODULE/Controller/ --level=psr2
fi
if [ -d "local/modules/$MODULE/Service/" ]; then
php-cs-fixer.phar fix local/modules/$MODULE/Service/ --level=psr2
fi
if [ -d "local/modules/$MODULE/Command/" ]; then
php-cs-fixer.phar fix local/modules/$MODULE/Command/ --level=psr2
fi
if [ -d "local/modules/$MODULE/Smarty/" ]; then
php-cs-fixer.phar fix local/modules/$MODULE/Smarty/ --level=psr2
fi