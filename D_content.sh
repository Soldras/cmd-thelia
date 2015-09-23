#!/bin/bash
# @author Penalver Antony
# v0.1

DB=$1
USER=$2
PASSWORD=$3
FILENAME=$4
TABLE=$5

echo -e "\n============ GENERATE CONTENT DUMP =============\n"

TABLES="content content_document content_document_i18n content_folder content_i18n content_image content_image_i18n content_version folder folder_document folder_document_i18n folder_i18n folder_image folder_image_i18n folder_version rewriting_url"

if [ $TABLE -ge 1 ]; then
	KEYWORD=" keyword keyword_group keyword_group_i18n keyword_i18n content_associated_keyword folder_associated_keyword"
	TABLES=$TABLES$KEYWORD
fi

if [ $TABLE -ge 2 ]; then
	VIEW=" view"
	TABLES=$TABLES$VIEW
fi

now=$(date +"%m_%d_%Y")

echo -e "\nmysqldump -u $USER -p$PASSWORD $DB $TABLES > $FILENAME-$now.sql\n" 
mysqldump -u $USER -p$PASSWORD $DB $TABLES > $FILENAME-$now.sql 

echo -e "\n================================================\n"
