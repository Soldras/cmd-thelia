# Command for Thelia

Somes scripts for Thelia ( >= 2.1 )

## Global script

### T_cc

Allow you to clear cache from all env

### T_right

Quick change right for Thelia in dev

## Module Script

### M_restart

Allow you to quickly restart a module

#### Argument

Name 		 	| Description 
------------ 	| -------------
Module name 	| Module to restart

## DB Script

### D_content

Allow you to quicly create a Dump for Thelia content

#### Argument

Name 		 	| Description 
------------ 	| -------------
DB name 	 	| Database's name to dump
User 	 	 	| An user can have right to the database
Password 	 	| The associate password
Filename 	 	| Filname for dump
Tables options 	| 0 for base table, 1 to add Keyword's tables, 2 to add View's tables

#### Return 
You can see the command executed

### D_product

This script will generate a dump of product tables

#### Usage

D_product.sh  [-h] [-k] [-c] -d database -u user -p password -f filename

#### Options
	-h\tdisplay this message\n
	-k\tadd keyword tables\n
	-c\tadd content linked tables\n
