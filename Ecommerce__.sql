CREATE DATABASE ECommerce_Analytics;
GO

USE ECommerce_Analytics;
GO

 
/*
-- 1. Customers
 
CREATE TABLE customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);

-- 2. Sellers
CREATE TABLE sellers (
    seller_id VARCHAR(50),
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);

-- 3. Products
CREATE TABLE products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g FLOAT,
    product_length_cm FLOAT,
    product_height_cm FLOAT,
    product_width_cm FLOAT
);

-- 4. Orders
CREATE TABLE orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

-- 5. Order Items
CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);

-- 6. Order Payments
CREATE TABLE order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(10,2)
);

-- 7. Order Reviews
CREATE TABLE order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title VARCHAR(500),
    review_comment_message VARCHAR(MAX),
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
);

-- 8. Category Translation
CREATE TABLE product_category_translation (
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);

-- 9. Geolocation
CREATE TABLE geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat FLOAT,
    geolocation_lng FLOAT,
    geolocation_city VARCHAR(100),
    geolocation_state VARCHAR(10)
);



INSERT INTO orders
(
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
)
SELECT
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
FROM orders_import;


INSERT INTO order_items
(
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value
)
SELECT
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    CAST(price AS DECIMAL(10,2)),
    CAST(freight_value AS DECIMAL(10,2))
FROM order_items_import;


INSERT INTO order_payments
(
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
)
SELECT
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    CAST(payment_value AS DECIMAL(10,2))
FROM order_payments_import;

----------------------




-- 1. Customers
INSERT INTO customers
(
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
)
SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM customers_import;


-- 2. Sellers
INSERT INTO sellers
(
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
)
SELECT
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
FROM sellers_import;


-- 3. Products
INSERT INTO products
(
    product_id,
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
)
SELECT
    product_id,
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM products_import;


-- 4. Order Reviews
INSERT INTO order_reviews
(
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp
)
SELECT
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp
FROM order_reviews_import;


-- 5. Product Category Translation
INSERT INTO product_category_translation
(
    product_category_name,
    product_category_name_english
)
SELECT
    column1,
    column2
FROM category_name_import;


-- 6. Geolocation
INSERT INTO geolocation
(
    geolocation_zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    geolocation_city,
    geolocation_state
)
SELECT
    geolocation_zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    geolocation_city,
    geolocation_state
FROM geolocation_import;

----------------------------


TRUNCATE TABLE customers;
TRUNCATE TABLE sellers;
TRUNCATE TABLE products;
TRUNCATE TABLE order_reviews;
 



 INSERT INTO customers
(
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
)
SELECT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM customers_import;


INSERT INTO sellers
(
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
)
SELECT
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
FROM sellers_import;


INSERT INTO products
(
    product_id,
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
)
SELECT
    product_id,
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM products_import;


INSERT INTO order_reviews
(
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp
)
SELECT
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp
FROM order_reviews_import;



SELECT 'customers' AS Table_Name, COUNT(*) AS Row_Count
FROM customers

UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers

UNION ALL
SELECT 'products', COUNT(*) FROM products

UNION ALL
SELECT 'orders', COUNT(*) FROM orders

UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items

UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments

UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews

UNION ALL
SELECT 'product_category_translation', COUNT(*)
FROM product_category_translation

UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation;


*/
----------------------------------



/* =========================================================
   1. NULL CHECK
   ========================================================= */
   /*
-- Customers
SELECT
    'customers' AS Table_Name,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_nulls,
    SUM(CASE WHEN customer_unique_id IS NULL THEN 1 ELSE 0 END) AS customer_unique_id_nulls,
    SUM(CASE WHEN customer_city IS NULL THEN 1 ELSE 0 END) AS city_nulls,
    SUM(CASE WHEN customer_state IS NULL THEN 1 ELSE 0 END) AS state_nulls
FROM customers;


-- Products
SELECT
    'products' AS Table_Name,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS product_id_nulls,
    SUM(CASE WHEN product_category_name IS NULL THEN 1 ELSE 0 END) AS category_nulls,
    SUM(CASE WHEN product_weight_g IS NULL THEN 1 ELSE 0 END) AS weight_nulls,
    SUM(CASE WHEN product_length_cm IS NULL THEN 1 ELSE 0 END) AS length_nulls,
    SUM(CASE WHEN product_height_cm IS NULL THEN 1 ELSE 0 END) AS height_nulls,
    SUM(CASE WHEN product_width_cm IS NULL THEN 1 ELSE 0 END) AS width_nulls
FROM products;


-- Orders
SELECT
    'orders' AS Table_Name,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_nulls,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_nulls,
    SUM(CASE WHEN order_status IS NULL THEN 1 ELSE 0 END) AS status_nulls,
    SUM(CASE WHEN order_purchase_timestamp IS NULL THEN 1 ELSE 0 END) AS purchase_date_nulls
FROM orders;


-- Order Items
SELECT
    'order_items' AS Table_Name,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_nulls,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS product_id_nulls,
    SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS seller_id_nulls,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS price_nulls,
    SUM(CASE WHEN freight_value IS NULL THEN 1 ELSE 0 END) AS freight_nulls
FROM order_items;


-- Payments
SELECT
    'order_payments' AS Table_Name,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_nulls,
    SUM(CASE WHEN payment_type IS NULL THEN 1 ELSE 0 END) AS payment_type_nulls,
    SUM(CASE WHEN payment_value IS NULL THEN 1 ELSE 0 END) AS payment_value_nulls
FROM order_payments;
*/
 
-----------------------------------------------------------
 -------------------------------------------------------------
-------------------------------------------------------------
 
----------------------------------------------------
 

 --********************************************
/*                 Date Quality             */
--*********************************************
/*
first_order
last_order
invalid_approval_dates
invalid_delivery_dates
*/
SELECT 
    MIN(order_purchase_timestamp) AS first_order,
    MAX(order_purchase_timestamp) AS last_order
FROM orders;


SELECT *

FROM orders

WHERE order_approved_at < order_purchase_timestamp ;


SELECT *

FROM orders

WHERE order_delivered_customer_date < order_delivered_carrier_date ;  -- CHECK

------------------------------------------------------------------------------------------------

-- Task 1 — Customer Duplicates

SELECT customer_unique_id , count(*)
FROM customers
GROUP BY customer_unique_id

HAVING count(*) > 1 ;
---------------------
--Task 2 — Product Duplicates

SELECT
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm,
    COUNT(*) AS number_of_products
FROM products
GROUP BY
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
HAVING COUNT(*) > 1;
---------------------
--Task 3 — Seller Duplicates
SELECT
    seller_zip_code_prefix,
    seller_city,
    seller_state,
    COUNT(*) AS number_of_sellers
FROM sellers
GROUP BY
    seller_zip_code_prefix,
    seller_city,
    seller_state
HAVING COUNT(*) > 1;
------------------

--Task 4 — Missing Product Categories

SELECT count(*) ,
ROUND( COUNT(*) * 100.0 / (SELECT COUNT(*) FROM products) , 2 )AS missing

FROM products 

WHERE product_category_name IS NULL
------------------------------------
--Task 5 — Referential Integrity


SELECT order_id ,
c.customer_id

FROM orders o left join customers c
ON o.customer_id = c.customer_id
where c.customer_id IS NULL ;

--2 items_without_order
SELECT

oi.order_id ,
oi.product_id,
o.order_id  
FROM order_items oi

LEFT JOIN orders o 
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

--3 items_without_seller
SELECT 
order_item_id ,
s.seller_id

FROM order_items oi LEFT JOIN sellers s
ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL ;

--3 items_without_Product
SELECT 
order_item_id ,
p.product_id

FROM order_items oi LEFT JOIN products p
ON oi.product_id = p.product_id
WHERE P.product_id IS NULL
----------------------------
SELECT
    p.order_id
FROM order_payments p
LEFT JOIN orders o
    ON p.order_id = o.order_id
WHERE o.order_id IS NULL;

--------------------------------
SELECT
    r.review_id,
    r.order_id
FROM order_reviews r
LEFT JOIN orders o
    ON r.order_id = o.order_id
WHERE o.order_id IS NULL;
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~5

-- Task 6 — Price Validation

SELECT 
  SUM(CASE WHEN price < 0 THEN 1 ELSE 0 END) AS negative_prices,
    SUM(CASE WHEN freight_value < 0 THEN 1 ELSE 0 END) AS negative_freight,
    SUM(CASE WHEN price = 0 THEN 1 ELSE 0 END) AS zero_prices
FROM order_items;
 
--Task 7 — Payment Validation 

SELECT 
 SUM(CASE WHEN payment_value < 0 THEN 1 ELSE 0 END) AS negative_payments,
    SUM(CASE WHEN payment_value = 0 THEN 1 ELSE 0 END) AS zero_payments
FROM order_payments

SELECT
    payment_type,
    COUNT(*) AS payment_count
FROM order_payments
GROUP BY payment_type
ORDER BY payment_count DESC;
 
--Task 8 — Review Validation

SELECT review_score

FROM order_reviews
WHERE review_score NOT BETWEEN 1 AND 5 ;

--Task 9 — Order Status

SELECT  order_status ,
COUNT(*) AS count ,
ROUND( COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders) , 2) 

FROM orders
GROUP BY order_status 
order by count DESC ;
--Task 10 — Date Validation

SELECT COUNT(*)
FROM orders
WHERE order_approved_at < order_purchase_timestamp  ;

SELECT COUNT(*)  
 
FROM orders
WHERE order_delivered_customer_date < order_purchase_timestamp ;


SELECT COUNT(*)  
 
FROM orders
WHERE order_delivered_customer_date < order_delivered_carrier_date;


SELECT COUNT(*)  
 
FROM orders
WHERE order_estimated_delivery_date < order_purchase_timestamp ;
 --------------------------------------------------------------------

 -- Business Analysis  *****************************************************

 -- Task 11 — Total Orders

 SELECT 
 COUNT(*) COUNT_ORDER
 FROM orders ;
--------------

--Task 12 — Total Customers

SELECT 
COUNT(customer_id) AS count_customer_id,
COUNT(customer_unique_id) AS count_customer_unique_id

FROM customers ;
---------------
--Task 13 — Total Revenue

SELECT
SUM(price) AS Revenue 
FROM order_items ;
-----------------
--Task 14 — Total Freight

SELECT
SUM(freight_value) AS revenue 
FROM order_items ;
------------------
-- Task 15 — Average Order Value

SELECT 
SUM(price) / COUNT(DISTINCT order_id) AS Average_Order_Value
FROM order_items
--------------------------

-- Sales Analysis

-- Task 16 — Monthly Revenue

SELECT 
  YEAR(order_purchase_timestamp) AS YEAR ,
  MONTH(order_purchase_timestamp) AS MONTH ,

  SUM(price) AS total

FROM orders O JOIN order_items OI
ON O.order_id = OI.order_id

GROUP BY YEAR(order_purchase_timestamp)  ,  MONTH(order_purchase_timestamp)

ORDER BY YEAR DESC , MONTH DESC;
---------------------------------------------
--Task 17 — Monthly Orders

SELECT 
 YEAR(order_purchase_timestamp) AS YEAR ,
  MONTH(order_purchase_timestamp) AS MONTH ,
  COUNT(DISTINCT order_id) AS total

FROM orders 
GROUP BY YEAR(order_purchase_timestamp)  ,  MONTH(order_purchase_timestamp)
ORDER BY YEAR DESC , MONTH DESC;
--------------------------------

--Task 18 — Revenue Growth

 WITH Monthly_rev AS
 ( 

SELECT 
 YEAR(order_purchase_timestamp) AS YEAR ,
 MONTH(order_purchase_timestamp) AS MONTH ,
 SUM(price) AS CURRENT_REVUE  ,

 LAG(  SUM(price) , 1 , 0 ) OVER (ORDER BY  YEAR(order_purchase_timestamp) ,  MONTH(order_purchase_timestamp) ) AS Previous_Revenue  
 
FROM orders o  JOIN order_items oi

ON O.order_id = OI.order_id

GROUP BY YEAR(order_purchase_timestamp)   , MONTH(order_purchase_timestamp)  
) 

SELECT 
YEAR,
MONTH,
 CURRENT_REVUE , 
 Previous_Revenue ,
  ROUND(  ((CURRENT_REVUE - ISNULL(Previous_Revenue , 0) ) /NULLIF(Previous_Revenue,0) *100 ) , 2 ) AS Growth_prec


 FROM Monthly_rev ;
 -----------------

 --Task 19 — Best Sales MONTH

WITH TOP_MON AS 
(

SELECT 
 YEAR(order_purchase_timestamp) AS YEAR ,
 MONTH(order_purchase_timestamp) AS MONTH ,
 SUM(price) AS CURRENT_REVUE  

  
FROM orders o  JOIN order_items oi

ON O.order_id = OI.order_id

GROUP BY YEAR(order_purchase_timestamp)   , MONTH(order_purchase_timestamp) 

 ) 

 SELECT TOP 1 MONTH  , YEAR , CURRENT_REVUE

 FROM TOP_MON
 ORDER BY CURRENT_REVUE DESC ;
 -----------------------------
 --Task 20 — Best Sales Year

 
WITH TOP_YEAR AS 
(

SELECT 
 YEAR(order_purchase_timestamp) AS YEAR ,
  SUM(price) AS CURRENT_REVUE  

  
FROM orders o  JOIN order_items oi

ON O.order_id = OI.order_id

GROUP BY YEAR(order_purchase_timestamp)   

 ) 

 SELECT TOP 1 YEAR   , CURRENT_REVUE

 FROM TOP_YEAR
 ORDER BY CURRENT_REVUE DESC ;
 ---------------------------
 ---------------------------
 -- Product Analysis *****************************************************

 -- Task 21 — Top 10 Products by Revenue


 WITH Product_Revenue_Rank AS
 (
 SELECT
  p.product_id P,
  SUM(price) AS revenue ,
 
  DENSE_RANK() OVER ( ORDER BY SUM(price) DESC ) AS ORDER_REV

 FROM products p JOIN order_items oi
 ON P.product_id = oi.product_id 

 GROUP BY P.product_id
 )
 SELECT
 P,
 REVENUE,
 ORDER_REV

 FROM Product_Revenue_Rank
 WHERE ORDER_REV <= 10 ;
 ------------------------

-- Task 22 — Top 10 Products by Quantity

WITH BEST_QUA AS 
(
SELECT
p.product_id P,
COUNT(oi.product_id) AS total_QTY ,
DENSE_RANK() OVER (ORDER BY COUNT(oi.product_id) DESC) AS rank

 FROM products p JOIN order_items oi
 ON P.product_id = oi.product_id 

 GROUP BY P.product_id
)
SELECT 
P,
total_QTY,
rank

FROM BEST_QUA
WHERE rank <= 10 ;
------------------------------------

--Task 23 — Product Average Price

SELECT 
TOP 10 p.product_id P,
AVG(price)  AS Average_Price
 

 FROM products p JOIN order_items oi
 ON P.product_id = oi.product_id 

 GROUP BY p.product_id
 ORDER BY Average_Price DESC ;
 ---------------------------

 -- Task 24 — Category Revenue

 SELECT 
product_category_name ,
SUM(price)  AS Revenue

FROM products p JOIN order_items oi
ON P.product_id = OI.product_id
WHERE product_category_name IS NOT NULL 
GROUP BY product_category_name
ORDER BY Revenue DESC ;
----------------------------

-- Task 25 — Category Ranking

WITH CAT_RANK AS 
(
SELECT
P.product_category_name P,
SUM(price)  AS Revenue ,

DENSE_RANK() OVER ( ORDER BY SUM(price)  DESC) AS RANK

FROM products p JOIN order_items oi
ON P.product_id = OI.product_id

WHERE product_category_name IS NOT NULL 
GROUP BY product_category_name
)
SELECT
P , 
Revenue ,
RANK

FROM CAT_RANK ;
------------------------------
------------------------------

-- Customer Analysis *****************************************************

SELECT * FROM customers ;
SELECT * FROM order_items ;
SELECT * FROM orders ;


-- Task 26 — Top Customers

SELECT  TOP 10
customer_unique_id ,
COUNT(DISTINCT o.order_id) AS total_order,
SUM(price) AS revenue

FROM customers c JOIN orders o
ON C.customer_id = O.customer_id 
JOIN order_items OI
ON OI.order_id = o.order_id

GROUP BY customer_unique_id 
ORDER BY revenue DESC ;
-----------------------
-- Task 27 — Customer Order Frequency

WITH C_O AS 
(
SELECT   
customer_unique_id  C,
COUNT(o.order_id) AS total_order ,
CASE
WHEN COUNT(DISTINCT o.order_id) = 1 THEN 'One-Time'
WHEN COUNT(DISTINCT o.order_id) BETWEEN 2 AND 3 THEN 'Occasional'
WHEN COUNT(DISTINCT o.order_id) > 4 THEN 'Loyal'

END AS STATES

 
FROM orders o JOIN customers C
ON o.customer_id = C.customer_id

GROUP BY customer_unique_id 
)
SELECT 
C ,
STATES

FROM C_O ;
-----------------
-- Task 28 — Customer Revenue Ranking

WITH CUSTOMER_REV AS
(
SELECT
customer_unique_id ,
SUM(price) AS total_revenue ,
DENSE_RANK() OVER (ORDER BY  SUM(price) DESC) AS revenue_rank


FROM customers c JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items OI
ON OI.order_id = o.order_id

GROUP BY customer_unique_id
)
SELECT
customer_unique_id,
total_revenue ,
revenue_rank

FROM CUSTOMER_REV
ORDER BY revenue_rank DESC ;
-------------------------------

-- Task 29 — Customer Average Order Value

SELECT 
customer_unique_id ,
SUM(price) / COUNT( DISTINCT oi.order_id) AS AVG

FROM customers c JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items OI
ON OI.order_id = o.order_id

GROUP BY customer_unique_id ;
---------------------------

-- Task 30 — Customer Segmentation

WITH C_Segmentation AS
(
SELECT
customer_unique_id ,
COUNT(DISTINCT OI.order_id) AS total_orders ,
SUM(price) AS total_revenue ,
CASE
WHEN COUNT(DISTINCT o.order_id) = 1 THEN 'One-Time'
WHEN COUNT(DISTINCT o.order_id) BETWEEN 2 AND 3 THEN 'Occasional'
WHEN COUNT(DISTINCT o.order_id) >= 4 THEN 'Loyal'

END AS CUSTOMER_SEGEMNT



FROM customers c JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items OI
ON OI.order_id = o.order_id

GROUP BY  customer_unique_id
)
SELECT 
CUSTOMER_SEGEMNT ,
COUNT(customer_unique_id)
 

FROM C_Segmentation 
GROUP BY CUSTOMER_SEGEMNT ;
---------------------------------

-- Payment & Seller Analysis *************************************************

-- Task 31 — Payment Methods

SELECT 
payment_type ,
COUNT(payment_sequential) AS payment_count ,
SUM(payment_value) AS total_payment ,
AVG(payment_value) AS AVG_payment

FROM order_payments

GROUP BY payment_type ;
------------------------
-- Task 32 — Payment Method Share
SELECT 
    payment_type,
    SUM(payment_value) AS total_payment,

   (SUM(payment_value) / SUM(SUM(payment_value)) OVER() ) *100.0 AS  payment_percentage
FROM order_payments
GROUP BY payment_type
ORDER BY total_payment DESC;
-----------------------------

-- Task 33 — Installments

SELECT 
payment_installments ,
COUNT(*) COUNT,
SUM(payment_value) SUM_payment_value,
AVG(payment_value) AVG_payment_value

FROM order_payments
GROUP BY payment_installments ;
---------------------------------
-- Task 34 — Top Sellers
WITH Seller_Revenue AS
(
    SELECT
        s.seller_id,
        SUM(oi.price) AS total_revenue,

        DENSE_RANK() OVER (
            ORDER BY SUM(oi.price) DESC
        ) AS revenue_rank

    FROM sellers s
    JOIN order_items oi
        ON s.seller_id = oi.seller_id

    GROUP BY s.seller_id
)

SELECT
    seller_id,
    total_revenue,
    revenue_rank
FROM Seller_Revenue
WHERE revenue_rank <= 10
ORDER BY revenue_rank;
-----------------------
-- Task 35 — Seller Orders

SELECT 
s.seller_id ,

COUNT(DISTINCT o.order_id) total_order


FROM sellers s JOIN order_items o
ON s.seller_id = o.seller_id
 

GROUP BY s.seller_id 
ORDER BY total_order DESC ;
-----------------------

-- Reviews & Category Performance *********************************************

-- Task 36 — Average Review Score


SELECT
review_score ,
COUNT(review_score) AS Review_count ,
ROUND( COUNT(*) * 100.0   / SUM(  COUNT(*)  ) OVER()  , 2) AS review_percentage

FROM order_reviews
GROUP BY review_score
ORDER BY review_score DESC
 ---------------------------
 -- Task 37 — Average Review Score

 SELECT
 AVG(review_score) AS Average_Review_Score
 FROM order_reviews
 -------------------
 --Task 38 — Category vs Reviews

 SELECT 
 product_category_name ,
 AVG(review_score) AS AVG_REVIEWscore ,
 COUNT(distinct review_score) AS COUNT_REVIEW
 FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN order_reviews r ON oi.order_id = r.order_id

GROUP BY product_category_name ;
--------------------------------

-- Task 39 — Low-Rated Categories

SELECT
product_category_name ,
 
 AVG(review_score)

FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN order_reviews r ON oi.order_id = r.order_id

WHERE product_category_name IS NOT NULL
GROUP BY product_category_name
HAVING AVG(review_score) < (

SELECT 
AVG(review_score)
FROM order_reviews
);
--------------------------------

-- Task 40 — Category Performance

SELECT  
product_category_name ,
SUM(price) AS total,
AVG(review_score) AS avg_score

FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN order_reviews r ON oi.order_id = r.order_id

GROUP BY product_category_name
ORDER BY total DESC ;
--------------------------------
-- Delivery & Business Analysis

-- Task 41 — Average Delivery Time

SELECT
    ROUND(
        AVG(
            DATEDIFF(
                DAY,
                order_purchase_timestamp,
                order_delivered_customer_date
            ) * 1.0
        ),
        1
    ) AS average_delivery_days
FROM orders
WHERE order_status = 'delivered'
  AND order_delivered_customer_date IS NOT NULL;
-------------

-- Task 42 — Delivery Performance
WITH AA AS 
(
SELECT
CASE
WHEN order_delivered_customer_date < order_estimated_delivery_date THEN 'Early '
WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 'Late'
WHEN order_delivered_customer_date = order_estimated_delivery_date THEN ' On Time'
ELSE 'NO'

    END AS delivery_status
    
    
    FROM orders
 )

    SELECT
    COUNT(*) ,
    delivery_status

    FROM AA

    GROUP BY delivery_status ;
-----------------------------

-- Task 43 — Late Delivery Rate
SELECT 
    COUNT(CASE WHEN order_delivered_customer_date < order_estimated_delivery_date THEN 1 END) AS total_delivered_early,
    COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) AS total_late_orders,
    (COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) * 100.0) / COUNT(order_id) AS late_delivery_percentage
FROM 
    orders;
    ----------------------------

-- Task 44 — Seller Revenue & Delivery

WITH seller_order_summary AS
(
SELECT
oi.seller_id ,
oi.order_id ,
SUM(price) AS revenue ,
DATEDIFF(DAY , o.order_delivered_customer_date , o.order_purchase_timestamp) AS delivery_days


FROM order_items oi
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.order_status = 'delivered' 
      AND o.order_delivered_customer_date IS NOT NULL
    GROUP BY oi.seller_id, oi.order_id, o.order_delivered_customer_date, o.order_purchase_timestamp
)
SELECT 
    seller_id,
    SUM(revenue) AS revenue,
    COUNT(order_id) AS total_orders,
    ROUND(AVG(delivery_days), 1) AS average_delivery_days
FROM seller_order_summary
GROUP BY seller_id
ORDER BY revenue DESC;
-----------------------------

-- Task 45 — Business Performance Summary
WITH c_o AS
(
    SELECT
        COUNT(DISTINCT order_id) AS total_order,
        SUM(price) AS total_revenue,
        SUM(freight_value) AS total_freight,
        SUM(price) * 1.0 / COUNT(DISTINCT order_id) AS Average_order_Value
    FROM order_items oi
),

order_delivery AS
(
    SELECT
        COUNT(DISTINCT order_id) AS total_order,
        COUNT(DISTINCT customer_id) AS total_customers,
         AVG(DATEDIFF(DAY, order_purchase_timestamp, order_delivered_customer_date) * 1.0) AS average_delivery_days
    FROM orders
),

Review_state AS 
(
    SELECT
        AVG(review_score * 1.0) AS average_review_score
    FROM order_reviews
)

SELECT 
    d.total_order,
    d.total_customers,
    ROUND(f.total_revenue, 2) AS total_revenue,
    ROUND(f.total_freight, 2) AS total_freight,
    ROUND(f.Average_order_Value, 2) AS average_order_value,
    ROUND(r.average_review_score, 2) AS average_review_score,
    ROUND(d.average_delivery_days, 1) AS average_delivery_days
FROM order_delivery d
CROSS JOIN c_o f
CROSS JOIN Review_state r;
--------------------------

-- Task 46 — Revenue by Customer State

SELECT
customer_state ,
SUM(price) AS revenue

FROM customers c join orders o
ON C.customer_id = O.customer_id
JOIN order_items OI
ON OI.order_id = O.order_id

GROUP BY customer_state
ORDER BY revenue DESC ;
------------------------

-- Task 47 — Orders by Customer State


SELECT
customer_state ,
COUNT(DISTINCT O.order_id) AS total_order

FROM customers c join orders o
ON C.customer_id = O.customer_id
JOIN order_items OI
ON OI.order_id = O.order_id

GROUP BY customer_state
ORDER BY total_order DESC ;
----------------------------

-- Task 48 — Average Order Value by State

SELECT
customer_state ,
SUM(price) / count(distinct o.order_id) AS Average_Order_Value_by_State

FROM customers c join orders o
ON C.customer_id = O.customer_id
JOIN order_items OI
ON OI.order_id = O.order_id

GROUP BY customer_state
ORDER BY Average_Order_Value_by_State DESC ;
---------------------------------------------

-- Task 49 — Top 10 States by Revenue

WITH B_STATE AS 
(
SELECT
customer_state C,
SUM(price) AS Total_revenue,
DENSE_RANK() OVER(ORDER BY  SUM(price) DESC  ) AS RANK

FROM customers c join orders o
ON C.customer_id = O.customer_id
JOIN order_items OI
ON OI.order_id = O.order_id

GROUP BY customer_state 
)

SELECT
C,
Total_revenue,
RANK
FROM B_STATE
WHERE RANK <= 10 ;
--------------------------

-- Task 50 — Final Business Analysis

/*
أفضل Category من حيث Revenue
أفضل Seller من حيث Revenue
أفضل Customer من حيث Revenue
أفضل Payment Method من حيث قيمة المدفوعات
أفضل State من حيث Revenue
أفضل Sales Month
*/

WITH Best_Category AS
(
    SELECT TOP 1
        p.product_category_name AS best_category,
        SUM(oi.price) AS category_revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    WHERE p.product_category_name IS NOT NULL
    GROUP BY p.product_category_name
    ORDER BY category_revenue DESC
),

Best_Seller AS
(
 SELECT TOP 1
   oi.seller_id AS best_seller,
      SUM(oi.price) AS seller_revenue
FROM order_items oi
GROUP BY oi.seller_id
ORDER BY seller_revenue DESC
),

Best_Customer AS
(
    SELECT TOP 1
        c.customer_unique_id AS best_customer,
        SUM(oi.price) AS customer_revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_unique_id
    ORDER BY customer_revenue DESC
),

Best_Payment AS
(
    SELECT TOP 1
        payment_type AS best_payment_method,
        SUM(payment_value) AS payment_value
    FROM order_payments
    GROUP BY payment_type
    ORDER BY payment_value DESC
),

Best_State AS
(
    SELECT TOP 1
        c.customer_state AS best_state,
        SUM(oi.price) AS state_revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY c.customer_state
    ORDER BY state_revenue DESC
),

Best_Month AS
(
    SELECT TOP 1
        YEAR(o.order_purchase_timestamp) AS sales_year,
        MONTH(o.order_purchase_timestamp) AS sales_month,
        SUM(oi.price) AS month_revenue
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY
        YEAR(o.order_purchase_timestamp),
        MONTH(o.order_purchase_timestamp)
    ORDER BY month_revenue DESC
)

SELECT
    c.best_category,
    c.category_revenue,

    s.best_seller,
    s.seller_revenue,

    cu.best_customer,
    cu.customer_revenue,

    p.best_payment_method,
    p.payment_value,

    st.best_state,
    st.state_revenue,

    m.sales_year,
    m.sales_month,
    m.month_revenue

FROM Best_Category c
CROSS JOIN Best_Seller s
CROSS JOIN Best_Customer cu
CROSS JOIN Best_Payment p
CROSS JOIN Best_State st
CROSS JOIN Best_Month m;
------------------------------------------------  FINISHED SQL  -------------------------------------------------------------------
                                                 ---------------





