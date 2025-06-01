#TO GET CURRENT DATE AND TIME IN MY SQL

#ACTIVATE THE DB
USE ADMISSION;

SELECT * FROM SAMPLE_TABLE;

#ADDING THREE COLUMNS TO THE TABLE  #DDL
ALTER TABLE SAMPLE_TABLE
ADD COLUMN MY_DATE DATE,
ADD COLUMN MY_TIME TIME,
ADD COLUMN DATE_TIME DATETIME;

#MOVE FEW COLUMNS
ALTER TABLE SAMPLE_TABLE
MODIFY MY_DATE DATE FIRST,
MODIFY MY_TIME TIME AFTER EID; 

#INSERTING FEW VALUES IN THE TABLE
INSERT INTO SAMPLE_TABLE
VALUES
(current_date(),"E45",current_time(),"ABIR",25,now()),
(current_date(),"E15",current_time(),"SAM",26,now()),
(current_date(),"E95",current_time(),"JHONES",22,now());

#function current_date() , current_time() ,now() adds the current on going date , time and datetime stamp

INSERT INTO SAMPLE_TABLE
VALUES
(current_date()+1,"E45",current_time()-1,"ABIR",25,now());
#these +k ,-n will shift you back and froth to those many days back or forward