-- ****************************** CAST Function ****************************
-- CAST function is used to convert a data from one Datatype to Another Datatype
-- CAST(value/expression AS  new_datatype)
-- It is used when RAW DATA VALUES ARE not in their expected format for perfroming certain operations
-- Instance Revvenu Table might have monthly revenu as string-varchar but we need that revenu in decimal format
-- In such cases CAST function uis very helpful
-- WHEN one need UNIFORM FORMATING FOR REPORTING
-- WE CAN USE CAST IN WHERE CLAUSE ALSO
-- If you need string/number/date compatibility
-- In mysql the acceptable new_dataypes are : SIGNED,UNSIGNED,DECIMAL(4,2),DATE,DATETIME,TIME,CHAR,FLOAT,DOUBLE,BINARY

SELECT * FROM RAW_TABLE;

-- IN THE RAW TABLE AMOUNT IS IN VARCHAR FORMAT but we need it to be in INT TYPE to perfrom operations

SELECT ID,AMOUNT,CAST(AMOUNT AS SIGNED) AS NEW_AMOUNT
FROM RAW_TABLE;


SELECT 
    CAST('123' AS SIGNED)   AS as_int,     -- 123
    CAST('123.45' AS DECIMAL(6,2)) AS as_decimal, -- 123.45
    CAST('2025-08-24' AS DATE) AS as_date, -- 2025-08-24
    CAST(123 AS CHAR) AS as_string;        -- '123'
