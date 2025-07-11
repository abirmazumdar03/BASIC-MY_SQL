#************************************** JOINS *****************************************************
#A JOIN IS A CLAUSE WHICH USE TO COMBINE ROWS FROM 2 OR MORE TABLE BASED ON A CONDITION ON RELATED COLUMN BETWEEN THEM 

#-**************************************** INNER JOIN / JOIN ****************************************************
#INNER JOIN = AND / INTERSECTION / COMMON IN TWO OR BOTH
#The INNER JOIN keyword returns only rows with a match in both tables only when when the related column set between tem satisfies the condition

#THIS QUERRY WILL RETURNED A JOIN TABLE DISPLAYING ALL THOSE STUDENTS AND COURSE WHICH ARE BEING ALLOCATED TO ALTELAST ONE OF THE SUDENT
SELECT * 
FROM student_details INNER JOIN course_details
ON student_details.COURSE_ID = course_details.COURSE_ID;

#************************************** LEFT JOIN/LEFT OUTER JOIN ***************************************************
#INNER JOIN + TUPLES FROM THE LHT WHICH FIALED FOR THE INNER JOIN
SELECT * 
FROM COURSE_DETAILS LEFT JOIN STUDENT_DETAILS
ON student_details.COURSE_ID = course_details.COURSE_ID;

#************************************** RIGHT JOIN/RIGHT OUTER JOIN*****************************
#INNER JOIN + ALL THE TUPLES FROM RHT WHICH FAILED FOR THE INNER JOIN
SELECT * 
FROM student_details RIGHT JOIN course_details
ON student_details.COURSE_ID = course_details.COURSE_ID;

#************************************* SELF JOIN ************************************************
# A Self JOIN is when a table is joined with itself.
# SELF JOIN IS BEST WHEN WE WANT TO SHOW THE HERICHERY RELATION BETWEEN THE TUPLES
# EXAMPLE JOB_PROFILE : [COOK , JANITOR , DELIVERY , ASST_MANAGER , MANAGER]
# COOK , JANITOR AND DELIVERY WILL REPORT TO ASST_MANAGER , AND AST_MANAGER WILL REPORT TO MANAGER
 
select * 
from table_1;

#ADD A NEW COLUMN IN THE TABLE_1
ALTER TABLE TABLE_1
ADD COLUMN REFERAL_ID INT;

#INSERT CERTAIN VALUES INTO IT
INSERT INTO TABLE_1(AMOUNT,REFERAL_ID)
VALUES
(60000.00,103),
(45000.00,NULL),
(56000,103);

#UPDATE THE REFER_ID WITH SOME REFERS
UPDATE TABLE_1
SET REFERAL_ID=102
WHERE ID=103 OR ID=105;

#map the ID with the respective ID who refered them
#SELF JOIN
SELECT DISTINCT A.REFERAL_ID AS WHO_REFERED,A.ID AS REFERED
FROM TABLE_1 AS A
INNER JOIN
TABLE_1 AS B
ON
A.REFERAL_ID=B.REFERAL_ID;

