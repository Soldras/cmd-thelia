# DB Script

## D_content

This script will generate a dump of content tables

### Usage

D_product.sh  [-h] [-k] [-v] -d database -u user -p password -f filename\n

### Options
	-h\tdisplay this message\n
	-k\tadd keyword tables\n
	-v\tadd view tables\n

## D_product

This script will generate a dump of product tables

### Usage

D_product.sh  [-h] [-k] [-c] -d database -u user -p password -f filename

### Options
	-h\tdisplay this message\n
	-k\tadd keyword tables\n
	-c\tadd content linked tables\n
	
## D_cutomer

This script will generate a dump of customer tables

### Usage

D_customer.sh  [-h] [-o] [-c] [-z] -d database -u user -p password -f filename

### Options
	-h\tdisplay this message\n
    -o\tadd order linked tables\n
    -z\tadd thelia 1 compat tables\n
    -c\tadd cart linked tables. WARNING : Cart are linked to product\n