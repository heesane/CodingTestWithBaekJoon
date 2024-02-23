WITH NOT_AVAILABLE AS (
    SELECT DISTINCT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
    JOIN CAR_RENTAL_COMPANY_CAR C USING(CAR_ID)
    WHERE 1=1
    AND C.CAR_TYPE IN ('세단','SUV')
    AND (START_DATE<='2022-11-30' AND END_DATE >= '2022-11-1')
    ),
    PLAN AS (
    SELECT *
    FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN P
    WHERE 1=1
    AND CAR_TYPE IN ('SUV','세단') 
    AND DURATION_TYPE LIKE '30%'
    )

SELECT DISTINCT CAR_ID, CAR_TYPE,FLOOR(C.DAILY_FEE*30*(100-P.DISCOUNT_RATE)/100) AS FEE
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY H
JOIN CAR_RENTAL_COMPANY_CAR C USING(CAR_ID)
JOIN PLAN P USING(CAR_TYPE)
WHERE 1=1
AND C.CAR_TYPE IN ('세단','SUV')
AND H.CAR_ID NOT IN (
    SELECT CAR_ID
    FROM NOT_AVAILABLE
)
HAVING FEE >= 500000 AND FEE <= 2000000
ORDER BY FEE DESC, CAR_TYPE ASC,CAR_ID DESC
