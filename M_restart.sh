#!/bin/bash
# @author Penalver Antony
# v0.1

module=$1

echo -e "\n==== Restart Module $module ====\n"
THELIA="php Thelia"

echo -e "\n-- Deactivation --\n"

sudo $THELIA module:deactivate  $module

echo -e "\n-- Activation --\n"

sudo $THELIA module:activate  $module

echo -e "\n==== $module is restart ====\n"

if [ ! -x ~/T_cc ]; then
	echo -e "\n Can't find default Script\n"
	if [ ! -x $2 ]; then
		echo -e "\n Enter a cache script if you want\n"
	else
		$2
	fi
else
	~/T_cc
fi
