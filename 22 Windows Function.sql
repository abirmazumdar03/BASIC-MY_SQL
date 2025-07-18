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
-- Always use ORDER BY in OVER() clause — without it, ranking has no basis.

SELECT E_ID,DEPT,SALARY,
RANK() OVER(PARTITION BY DEPT ORDER BY SALARY DESC) AS DEPT_RANK,
DENSE_RANK() OVER (ORDER BY SALARY DESC) AS OVER_ALL_RANKING
FROM EMPLOYEE
ORDER BY DEPT;