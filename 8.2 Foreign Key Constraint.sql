#***************************FOREIGN KEY CONSTRAIN************************************
#FK IS AN ATTRIBUTE OR A SET OF ATTRIBUTE WHICH REFERENCES (OR POINTS) TO THE PK or Alternate Key
#OF SOME ANOTHER TABLE OR OF THE SAME TABLE
#Referential Integrity Constraint is also known as FK constraint

#CREATE A TABLE NAME COURSE_DETAILS
CREATE TABLE COURSE_DETAILS
(COURSE_ID VARCHAR(3) PRIMARY KEY,
COURSE_NAME VARCHAR(10) NOT NULL,
COURSE_FEE DECIMAL(6,2) NOT NULL,
CONSTRAINT course_fee_validator CHECK (COURSE_FEE>=1000.00 AND COURSE_FEE<=9999.99)
);

#Populate the Course_DETAILS tABLE
INSERT INTO COURSE_DETAILS
VALUES
("C12","BBA",5000.23),
("C45","BTECH",9000.00),
("C23","BCA",7415.23),
("C78","BCOM",3500.00);


#CREATE A TBALE NAMED STUDENT_DETAILS , CONTAING A FK POINTING TO THE OK OF COURSE_DETAILS TABLE
CREATE TABLE STUDENT_DETAILS
(REGISTRATION_DATE DATETIME,
SID VARCHAR(3) PRIMARY KEY,
STUDENT_NAME VARCHAR(20),
STUDENT_EMAIL VARCHAR(50) NOT NULL,
COURSE_ID VARCHAR(3),
FOREIGN KEY(COURSE_ID) REFERENCES COURSE_DETAILS(COURSE_ID)
ON DELETE SET NULL
);

#POPULATE THE STUDENT_DETAILS TABLE
INSERT INTO STUDENT_DETAILS
VALUES
(NOW(),"S45","ABIR","ABC@GMAIL.COM","C45"),
(NOW(),"S15","DAVID","DEF@GMAIL.COM","C23"),
(NOW(),"S21","ABIR","CFG@GMAIL.COM","C78");

#TO DROP A FK
ALTER TABLE STUDENT_DETAILS
DROP FOREIGN KEY student_details_ibfk_1;


#TO ADD FK TO AN EXISTING TABLE
#HERE FK_COURSE_ID IS AN ALIAS NAME GIVEN TO THE FK PRESENT IN THE STUDENT_DETAILS TABLE
ALTER TABLE STUDENT_DETAILS
ADD CONSTRAINT FK_COURSE_ID
FOREIGN KEY(COURSE_ID) REFERENCES COURSE_DETAILS(COURSE_ID);

#AS PER FOREIGN KEY CONSTRAINTS 
#WE CAN DELETE ROWS FROM A CHILD TABLE(STUDENT_DETAILS) BUT NOT FROM THE PARENT TABLE (COURSE_DETAILS)

INSERT INTO STUDENT_DETAILS
VALUES
(NOW(),"S78","MICHALE","MIC@GMAIL.COM","C23"),
(NOW(),"S94","SMITH","SIM@GMAIL.COM","C45");
