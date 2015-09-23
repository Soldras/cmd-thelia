# Command for Thelia

Somes scripts for Thelia ( >= 2.1 )

## Command Type

### T_cc

Allow you to clear cache from all env

### T_right

Quick change right for Thelia in dev

### M_restart

Allow you to quickly restart a module

#### Argument

Name 		 	| Description 
------------ 	| -------------
Module name 	| Module to restart

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
