#To create a new DB
create database ADMISSION;

#Another Database creation
create database passout;

#To activate and use a DB
USE admission;

#To delete a database
DROP DATABASE passout;

#To change a DB setting as read only
#i.e we can access the DB but can ONLY perform READ operation , other than that all other operations are restrictred
ALTER DATABASE admission READ ONLY = 1;

#After read only mode if we try to delete the DB it will raise error
DROP DATABASE admission;

ALTER DATABASE admission READ ONLY = 0
