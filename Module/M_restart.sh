#!/bin/sh
# @author Penalver Antony
# v0.1

module=$1

echo  "\n==== Restart Module $module ====\n"
THELIA="php Thelia"

echo  "\n-- Deactivation --\n"

sudo $THELIA module:deactivate  $module

echo  "\n-- Activation --\n"

sudo $THELIA module:activate  $module

echo  "\n==== $module is restart ====\n"

if [ ! hash T_cc 2>/dev/null ]; then
	echo  "\n Can't find default Script\n"
	if [ ! -x $2 ]; then
		echo  "\n Enter a cache script if you want\n"
	else
		$2
	fi
else
	echo  ${BASH_ALIASES["T_cc"]}
fi
