#!/bin/sh
# @author Penalver Antony
# v0.1


FILE=".bash_thelia_alias"
PROFILE=".bash_profile"

ALIAS="alias T_cc='$PWD/Global/T_cc.sh'\n
alias T_psr='$PWD/Global/T_psr.sh'\n
alias T_r='$PWD/Global/T_right.sh'\n
alias M_r='$PWD/Module/M_restart'\n
"

cd $HOME
touch $FILE
echo $ALIAS > $FILE
echo "source ~/$FILE" >> $PROFILE