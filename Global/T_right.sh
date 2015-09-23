#!/bin/sh
# @author Penalver Antony
# v0.1

echo  "\n== Change right ==\n"

echo  "- cache folder -\n"
sudo chmod -R 777 cache

echo  "- media folder -\n"
sudo chmod -R 777 local/media

echo  "- session folder -\n"
sudo chmod -R 777 local/session

echo  "- web folder -\n"
sudo chmod -R 777 web

echo  "- log folder -\n"
sudo chmod -R 777 log

echo  "- modules folder -\n"
sudo chmod -R 777 local/modules

echo  "\n== End change right ==\n"
