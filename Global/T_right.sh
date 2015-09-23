#!/bin/bash
# @author Penalver Antony
# v0.1

echo -e "\n== Change right ==\n"

echo -e "- cache folder -\n"
sudo chmod -R 777 cache

echo -e "- media folder -\n"
sudo chmod -R 777 local/media

echo -e "- session folder -\n"
sudo chmod -R 777 local/session

echo -e "- web folder -\n"
sudo chmod -R 777 web

echo -e "- log folder -\n"
sudo chmod -R 777 log

echo -e "- modules folder -\n"
sudo chmod -R 777 local/modules

echo -e "\n== End change right ==\n"
