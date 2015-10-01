#!/bin/sh
# @author Penalver Antony
# v0.1

DB=""
USER=""
PASSWORD=""
FILENAME=""

TABLES_PRODUCT="feature_product product product_i18n product_document product_document_i18n product_image product_image_i18n product_price product_sale_elements product_sale_elements_product_document product_sale_elements_product_image product_version "
TABLES_CAT="category category_document category_document_i18n category_image category_image_i18n category_version product_category "
TABLES_KEY="product_associated_keyword category_associated_keyword "
TABLES_CONTENT=" product_associated_content category_associated_content "

TABLES=$TABLES_PRODUCT$TABLES_CAT

HELP="
This script will generate a dump of product tables (tested in Thelia 2.2.0)\n
\n
Usage: D_product.sh  [-h] [-k] [-c] -d database -u user -p password -f filename\n
\n
Options:\n
	-h\tdisplay this message\n
	-k\tadd keyword tables\n
	-c\tadd content linked tables\n
"
while getopts "kchd:u:p:f:" option
do
	case $option in
		k)
			TABLES=$TABLES$TABLES_KEY
			;;
		c)
			TABLES=$TABLES$TABLES_CONTENT
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

echo  "\n============ GENERATE Product DUMP =============\n"

now=$(date +"%m_%d_%Y")

echo  "\nmysqldump -u $USER -p$PASSWORD $DB $TABLES > $FILENAME-$now.sql\n" 
mysqldump -u $USER -p$PASSWORD $DB $TABLES > $FILENAME-$now.sql 

echo  "\n================================================\n"
