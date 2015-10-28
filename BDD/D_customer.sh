#!/bin/sh
# @author Penalver Antony
# v0.1

DB=""
USER=""
PASSWORD=""
FILENAME=""

TABLES_CUSTOMER="customer customer_version address"
TABLES_ORDER=" order order_address order_coupon order_coupon_country order_coupon_module order_product order_product_attribute_combination order_product_tax order_version"
TABLES_CART=" cart cart_item"

TABLES=$TABLES_CUSTOMER


HELP="
This script will generate a dump of customer tables (tested in Thelia 2.2.0)\n
\n
Usage: D_customer.sh  [-h] [-o] [-c] -d database -u user -p password -f filename\n
\n
Options:\n
	-h\tdisplay this message\n
	-o\tadd order linked tables\n
	-c\tadd cart linked tables. WARNING : Cart are linked to product\n
"
while getopts "ochd:u:p:f:" option
do
	case $option in
		o)
			TABLES=$TABLES$TABLES_ORDER
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

echo  "\n============ GENERATE Customer DUMP =============\n"

now=$(date +"%m_%d_%Y")

echo  "\nmysqldump -u $USER -p$PASSWORD $DB $TABLES > $FILENAME-$now.sql\n"
mysqldump -u $USER -p$PASSWORD $DB $TABLES > $FILENAME-$now.sql

echo  "\n================================================\n"