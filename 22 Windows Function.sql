-- ********************************** WINDOWS FUNCTION **********************************************
-- Windows function applies Aggregreate , Ranking and Analytical/Value Function over a particular window (set of Rows)
-- OVER clause is used with window functions to define that window.
-- Define a Window : PARTITION BY , ORDER BY , ROWS
-- Aggregerate Function : MAX,MIN,SUM,COUNT,AVERAGE
-- Ranking Function :  ROW_NUMBER , RANK , DENSE_RANK , PRECENT_RANK
-- Analytical/Value Function :  LEAD , LAG , FIRST_VALUE , LAST_VALUE

--  ******************************** AGGREGERATE FUNCTION ***************************************************
-- When used with ORDER BY in window aggregate functions like SUM, AVG, COUNT:
-- It makes the aggregate cumulative (aka running total).
-- To get cumulative/rolling sums, counts, etc → ✅ Keep ORDER BY
-- To get flat aggregates repeated across all rows of group → ❌ Remove ORDER BY

SELECT * FROM EMPLOYEE ORDER BY E_ID;  # PRINT THE TABLE

SELECT SALARY,DEPT,
MIN(SALARY) OVER (PARTITION BY DEPT) AS "MIN_SALARY",
MAX(SALARY) OVER (PARTITION BY DEPT) AS "MAX_SALARY",
SUM(SALARY) OVER (PARTITION BY DEPT ORDER BY E_ID) AS "TOTAL_SALARY OF DEPT",  # Running Sum cumulative
COUNT(SALARY) OVER (PARTITION BY DEPT) AS "COUNT_SALARY",
AVG(SALARY) OVER (PARTITION BY DEPT) AS "DEPT_AVG_SALARY"
FROM EMPLOYEE;

-- FUTURE PROJECTION
SELECT DEPT,SALARY,SUM(SALARY)
OVER (ORDER BY SALARY ROWS BETWEEN 2 PRECEDING AND 1 FOLLOWING) AS NEW_COL
FROM EMPLOYEE;

-- RUNNING TOTAL SALARIES OF CORRESPONDING RESPECTIVE DEPARTMENTS MECH,IT,BBA
SELECT DEPT,SALARY,
SUM(SALARY)
OVER (PARTITION BY DEPT ORDER BY SALARY) AS RUNNING_TOTAL_DEPT
FROM EMPLOYEE
ORDER BY DEPT;

-- *************************************** RANKING FUNCTIONS *******************************************************
-- A Ranking Function is a type of SQL window function that assigns a rank or position to each row within a result set, 
-- usually based on a certain column order (like scores, salaries, etc.).
-- Ranking Functions are used :
-- 1. Find the Top Performers || 2.Assign Positions Dynamically || 3. Detect duplicates/gaps in rank || 4. Ranks within respective department wise
-- Always use ORDER BY in OVER() clause — without it, ranking has no basis.
-- The easiest and most efficient way to generate quartiles in SQL is by using the NTILE() window function
-- NTILE(4): Divides the sorted data into 4 equal-sized groups (or as equal as possible).
-- The result will have a column Quartile with values from 1 to 4.


# In this Querry OVERALL_RANKING column shows the rank of individual employee based on their salary from HIGHEST (RANK 1) to the LOWEST SALARY (LAST RANK)
# DEPT_RANK tells the Rank of CORRESPONDING employees within their own Respective Department
SELECT E_ID,DEPT,SALARY,
ROW_NUMBER() OVER (ORDER BY E_ID) AS S_NO,
RANK() OVER(PARTITION BY DEPT ORDER BY SALARY DESC) AS DEPT_RANK,
DENSE_RANK() OVER (ORDER BY SALARY DESC) AS OVER_ALL_RANKING,
PERCENT_RANK() OVER (ORDER BY E_ID) AS PERCENTAGE_TILL_NOW
FROM EMPLOYEE
ORDER BY S_NO;

SELECT E_ID,DEPT,SALARY,
NTILE(4) OVER (ORDER BY SALARY) AS QUARTILE
FROM EMPLOYEE;

-- ***************************************** ANALYTICAL/VALUE/NAVIGATION FUNCTION **********************************************
-- Value access functions let you peek into specific positions in a group (or race), relative to the current row
-- You are a judge who can look at the performance of any runner — the first, last, or someone ahead/behind any given runner in the lineup.
-- Comparing current row with previous row
-- These functions let you "peek" into other rows relative to the current row — such as previous row, next row, first or last row — 
-- all without collapsing the dataset like GROUP BY would.


-- ****************** 1. LAG() Look Backward***************
-- Fetches the value from a previous row (relative to the current row).
-- LAG(column_name, offset, default_value) OVER (PARTITION BY ... ORDER BY ...) OFFSET : HOW MANY ROWS BACK TO LOOK DEFAULT 1
-- default_value: what to return if there is no previous row
-- with LEAD(),LAG() one must specify ORDERY BY in the OVER clause

SELECT EMP_ID,NAME,DEPT,
LAG(SALARY,2) OVER (ORDER BY SALARY DESC) AS LAG_TEST
FROM TASK_TABLE
ORDER BY SALARY DESC;

-- ******************2. LEAD() Look Forward *********************
--  Fetches the value from the next row (relative to the current row).
--  LEAD(column_name, offset, default_value) OVER (PARTITION BY ... ORDER BY ...)

SELECT EMP_ID,NAME,DEPT,
LEAD(SALARY,2) OVER (ORDER BY SALARY DESC) AS LAG_TEST
FROM TASK_TABLE
ORDER BY SALARY DESC;

-- ******************3. FIRST_VALUE() AND LAST_VALUE() ***************************
-- FIRST_VALUE() : Returns the first value in the window (according to ORDER BY)
-- LAST_VALUE(column) : Returns the last value in the window. LAST_VALUE() often needs a ROWS frame to behave as expected. 
-- By default, it can show current-row value if frame isn’t properly set.

-- TABLE WHICH SHOWS THE LOWEST AND HIGHEST SALARIES WITHIN EACH RESPECTIVE DEPARTMENTS
SELECT
  NAME,
  DEPT,
  SALARY,
  FIRST_VALUE(SALARY) OVER (PARTITION BY DEPT ORDER BY SALARY) AS LOWEST_SALARY,
  LAST_VALUE(SALARY) OVER (PARTITION BY DEPT ORDER BY SALARY 
                           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS HIGHEST_SALARY
FROM TASK_TABLE;
