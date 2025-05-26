#select and activate the required DB
USE admission;

#Creating a table with Attributes/Columns/Fields
CREATE TABLE Btech_Admission(
DATE_TIME datetime,
ADMISSION_ID varchar(9),
FIRST_NAME varchar(20),
LAST_NAME VARCHAR(20),
COURSE VARCHAR(10),
MOBILE int8,
PAF boolean,
PAF_AMOUNT decimal
);

#CREATING A NEW TABLE TEST_TABLE
CREATE TABLE TEST_TABLE(EID VARCHAR(5));

#DELETING THE TEST_TABLE CREATED RECENTLY
DROP TABLE test_table;

#RENAMING A TABLE NAME
RENAME TABLE test_table TO SAMPLE_TABLE;