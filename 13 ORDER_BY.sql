#*************************** ORDER BY CALUSE***********************
-- default is Ascending
-- If there is a conflict in arranging the values we can use another column to solve the conflict with its own ASC OR SESC

SELECT STUDENT_NAME,COURSE_ID
FROM STUDENT_DETAILS
ORDER BY  COURSE_ID;

SELECT * FROM admission.btech_admission;

SELECT EMAIL_ID,PAF_AMOUNT
FROM BTECH_ADMISSION
WHERE EMAIL_ID IS NOT NULL
ORDER BY PAF_AMOUNT DESC ,FIRST_NAME ASC;
#THE RESULT IS SORTED BASED ON THE PAF_AMOUNT VALUE IF CONFLICT OCUURS THEN WE USE THE FIRST_NAME COLUMN TO RESOLVE IT

