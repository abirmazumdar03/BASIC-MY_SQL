#************************************** JOINS *****************************************************
#A JOIN IS A CLAUSE WHICH USE TO COMBINE ROWS FROM 2 OR MORE TABLE BASED ON A RELATED COLUMN BETWEEN THEM 

#-**************************************** INNER JOIN ****************************************************
#INNER JOIN = AND / INTERSECTION / COMMON IN TWO OR BOTH
#The INNER JOIN keyword returns only rows with a match in both tables only when when the related column set between tem satisfies the consition

#THIS QUERRY WILL RETURNED A JOIN TABLE DISPLAYING ALL THOSE STUDENTS AND COURSE WHICH ARE BEING ALLOCATED TO ALTELAST ONE OF THE SUDENT
SELECT * 
FROM student_details INNER JOIN course_details
ON student_details.COURSE_ID = course_details.COURSE_ID;

#************************************** LEFT JOIN ***************************************************
#INNER JOIN + TUPLES FROM THE LHT WHICH FIALED FOR THE INNER JOIN
SELECT * 
FROM student_details LEFT JOIN course_details
ON student_details.COURSE_ID = course_details.COURSE_ID;




