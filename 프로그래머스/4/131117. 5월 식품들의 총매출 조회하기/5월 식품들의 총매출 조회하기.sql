SELECT P.PRODUCT_ID, P.PRODUCT_NAME, (P.PRICE * (O.AMOUNT))AS TOTAL_SALES
FROM FOOD_PRODUCT P
JOIN (
    SELECT O.PRODUCT_ID,SUM(O.AMOUNT) AS AMOUNT
    FROM FOOD_ORDER O
    WHERE DATE_FORMAT(PRODUCE_DATE,'%Y-%m') = '2022-05'
    GROUP BY O.PRODUCT_ID
) O
ON P.PRODUCT_ID = O.PRODUCT_ID
ORDER BY TOTAL_SALES DESC, PRODUCT_ID