#!/bin/sh
# @author Penalver Antony
# v1.0

DB=""
USER=""
PASSWORD=""
FILENAME=""
TABLE=""

TABLES="content content_document content_document_i18n content_folder content_i18n content_image content_image_i18n content_version folder folder_document folder_document_i18n folder_i18n folder_image folder_image_i18n folder_version rewriting_url"
KEYWORD=" keyword keyword_group keyword_group_i18n keyword_i18n content_associated_keyword folder_associated_keyword"
VIEW=" view"

HELP="
This script will generate a dump of product tables (tested in Thelia 2.2.0)\n
\n
Usage: D_product.sh  [-h] [-k] [-v] -d database -u user -p password -f filename\n
\n
Options:\n
	-h\tdisplay this message\n
	-k\tadd keyword tables\n
	-v\tadd view tables\n
"
while getopts "kvhd:u:p:f:" option
do
	case $option in
		k)
			TABLES=$TABLES$KEYWORD
			;;
		v)
			TABLES=$TABLES$VIEW
			;;
		d)
		    DB="$OPTARG"
			;;
		u)
		    USER="$OPTARG"
			;;
		p)
		    PASSWORD="$OPTARG"
			;;
		f)
		    FILENAME="$OPTARG"
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

if [ -z $FILENAME  ]; then
    echo "Missing filename\n"
    echo $HELP;
    exit 1
fi

if [ -z $DB ]; then
    echo "Missing database name name\n"
    echo $HELP;
    exit 1
fi

if [ -z $USER ]; then
    echo "Missing username\n"
    echo $HELP;
    exit 1
fi

if [ -z $PASSWORD ]; then
    echo "Missing password\n"
    echo $HELP;
    exit 1
fi

echo  "\n============ GENERATE CONTENT DUMP =============\n"

now=$(date +"%m_%d_%Y")

echo  "\nmysqldump -u $USER -p$PASSWORD $DB $TABLES > $FILENAME-$now.sql\n" 
mysqldump -u $USER -p$PASSWORD $DB $TABLES > $FILENAME-$now.sql 

echo  "\n================================================\n"
