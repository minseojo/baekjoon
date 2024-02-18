-- 코드를 입력하세요
SELECT FLAVOR
FROM FIRST_HALF as a JOIN (SELECT FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER
    FROM JULY
    GROUP BY (FLAVOR)) as b
USING (FLAVOR)
ORDER BY (a.TOTAL_ORDER + b.TOTAL_ORDER) DESC
LIMIT 3