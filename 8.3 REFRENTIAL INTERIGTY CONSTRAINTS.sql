-- ******************************* refrential interigty constrains **************************************************
-- 1. ON DELETE SET NULL: IF WE DELETE A PK FROM THE PARENT TABLE THEN THAT CORRESPONDING VALUE (WHICH WILL ACT AS FK) IN THE
-- 						CHILD TABLE WILL BE SET NULL

-- 2. ON DELETE CASCADE : IF WE DELETE A PK FROM THE PARENT TABLE THEN THAT CORRESPONDING VALUE (WHICH WILL ACT AS FK) IN THE
-- 						CHILD TABLE , THAT PARTICULAR TUPLE WILL BE DELETED

-- 3. IF NO REFERENTIAL INTREGIRTY CONSTRAINT IS APPLIED IN THE FK THEN DEFAULT REFERENTIAL INTREGRITY CONSTRAINT IS : "ON DELETE NO ACTION"
-- ************************************* ON DELETE SET NULL ****************************************
-- FIRST LETS DROP THE EXISTSING FK FROM THE STUDENTS_DETAILS TABLE
ALTER TABLE student_details
DROP FOREIGN KEY FK_COURSE_ID;

-- NOW LETS RESET THE FK , ALONG WITH ON DELETE SET NULL
ALTER TABLE student_details
ADD CONSTRAINT FK_COURSE_ID
FOREIGN KEY (COURSE_ID) REFERENCES COURSE_DETAILS(COURSE_ID)
ON DELETE SET NULL;

#NOW WILL DELETE A ENTRY FROM THE COURSE_DETAILS (PARENT TABLE) AND WILL SEE THAT CORRESPONDING FK FOR THAT PK
-- IN THE CHILD TABLE THAT TUPLE FK WILL BE SET NULL

SELECT * FROM course_details;
SELECT * FROM student_details;

#DETELING THE COURSE ID C78 FROM THE COURSE_DETAILS(PARENT TABLE)
DELETE FROM course_details
WHERE COURSE_ID="C78";

-- THEN THE CORRESPONDING TUPLE IN THE CHILD TABLE STUDENT_DETAILS WILL BE SET NULL

# **************************************** ON DELETE CASCADE **************************************************
-- FIRST LETS DROP THE EXISTSING FK FROM THE STUDENTS_DETAILS TABLE
ALTER TABLE student_details
DROP FOREIGN KEY FK_COURSE_ID;

-- NOW LETS RESET THE FK , ALONG WITH ON DELETE SET NULL
ALTER TABLE student_details
ADD CONSTRAINT FK_COURSE_ID
FOREIGN KEY (COURSE_ID) REFERENCES COURSE_DETAILS(COURSE_ID)
ON DELETE CASCADE;

-- LETS RE-ADD C78 COURSE IN THE COURSE_dETAILS TABLE
INSERT INTO COURSE_DETAILS
VALUES
("C78","BCOM",6500.00);

-- LETS RE-UPDATE AND MAP SOME STUDENT TO C78 COURSE
UPDATE student_details
SET COURSE_ID = "C78"
WHERE COURSE_ID IS NULL;

-- NOW LETS SEE ON DELETE CASCADE IN ACTION
-- IF WE DELETE PK C78 FROM THE COURSE_DETAILS TABLE THEN
-- TUPLE WITH NAME GUPPY,ABIR AND BOB WILL BE DELETED FROM THE STUDENT_DETAILS TABLE

#DETELING THE COURSE ID C78 FROM THE COURSE_DETAILS(PARENT TABLE)
DELETE FROM course_details
WHERE COURSE_ID="C78";

-- TUPLE WITH NAME AS GUPPY , ABIR AND BOB FROM STUDENT DETAILS TABLE ARE NOW GONE-DELETED