# SELECT YEAR, MONTH, GENDER, COUNT(*) USERS
# FROM USER_INFO AS a 
# RIGHT JOIN (
#     SELECT YEAR(c.SALES_DATE) AS YEAR, MONTH(c.SALES_DATE) AS MONTH, c.USER_ID
#     FROM ONLINE_SALE as c
#     GROUP BY YEAR(c.SALES_DATE), MONTH(c.SALES_DATE), c.USER_ID) as b
# ON a.USER_ID = b.USER_ID  
# WHERE a.GENDER IS NOT NULL
# GROUP BY YEAR, MONTH, GENDER
# ORDER BY YEAR, MONTH, GENDER
SELECT YEAR(SALES_DATE) AS YEAR, MONTH(SALES_DATE) AS MONTH,
       GENDER, COUNT(DISTINCT S.USER_ID) AS USERS
FROM ONLINE_SALE AS S
JOIN USER_INFO AS I
ON S.USER_ID = I.USER_ID
GROUP BY YEAR, MONTH, GENDER
HAVING GENDER IS NOT NULL
ORDER BY YEAR, MONTH, GENDER