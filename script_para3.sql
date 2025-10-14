SELECT * 
FROM french
UNION
SELECT * 
FROM python; 

SELECT *
FROM french 
INTERSECT
SELECT *
FROM python;

SELECT *
FROM python 
EXCEPT 
SELECT * 
FROM french;

SELECT *
FROM french 
WHERE major = 'Политология'
UNION
SELECT * 
FROM python 
WHERE major = 'Политология';


SELECT * 
FROM flights
NATURAL JOIN airplanes;

SELECT *
FROM products
CROSS JOIN discounts;

SELECT price - ((price/100)*discount_percent) AS final_sum,product_name, discount_percent
FROM products
CROSS JOIN discounts;

