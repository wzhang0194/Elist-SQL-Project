--Question 1: What are the monthly sales trends for Macbooks sold in North America across all years?
--for each month, calculate main sales metrics: order count, total sales, and aov
--filter to only north america and macbooks
--round numbers for readability

WITH monthly_query AS (
SELECT DATE_TRUNC(orders.purchase_ts, month) AS purchase_month,
  geo_lookup.region,
  COUNT(DISTINCT orders.id) AS order_count,
  ROUND(SUM(orders.usd_price),2) AS total_sales,
  ROUND(AVG(orders.usd_price),2) AS aov
FROM `elist-390902.elist.orders` orders
LEFT JOIN `elist-390902.elist.customers` customers
  ON orders.customer_id = customers.id
LEFT JOIN `elist-390902.elist.geo_lookup` geo_lookup
  ON customers.country_code = geo_lookup.country
WHERE LOWER(orders.product_name) LIKE '%macbook%' 
  AND geo_lookup.region = 'NA'
GROUP BY 1,2
ORDER BY 1 DESC
)

-- calculate the average across all time using a CTE (monthly)

SELECT ROUND(AVG(monthly_query.order_count),2) AS average_order_count,
  ROUND(AVG(monthly_query.total_sales),2) AS average_quarterly_sales,
  ROUND(AVG(monthly_query.aov),2) AS average_aov
FROM monthly_query;


--Question 2: What are the quarterly sales trends for Macbooks sold in North America across all years?
--for each quarter, calculate main sales metrics: order count, total sales, and aov
--filter to only north america and macbooks
--round numbers for readability

WITH quarterly_query AS (
SELECT DATE_TRUNC(orders.purchase_ts, quarter) AS purchase_quarter,
  geo_lookup.region,
  COUNT(DISTINCT orders.id) AS order_count,
  ROUND(SUM(orders.usd_price),2) AS total_sales,
  ROUND(AVG(orders.usd_price),2) AS aov
FROM `elist-390902.elist.orders` orders
LEFT JOIN `elist-390902.elist.customers` customers
  ON orders.customer_id = customers.id
LEFT JOIN `elist-390902.elist.geo_lookup` geo_lookup
  ON customers.country_code = geo_lookup.country
WHERE lower(orders.product_name) LIKE '%macbook%' 
  AND geo_lookup.region = 'NA'
GROUP BY 1,2
ORDER BY 1 DESC
)

-- calculate the average across all time using a CTE (quarterly)

SELECT ROUND(AVG(quarterly_query.order_count),2) AS average_order_count,
  ROUND(AVG(quarterly_query.total_sales),2) AS average_quarterly_sales,
  ROUND(AVG(quarterly_query.aov),2) AS average_aov
FROM quarterly_query;


--Question 3: What was the monthly refund rate for purchases made in 2020? How many refunds did we have each month in 2021 for Apple products?
--count the number of refunds per month (non-null refund date) and calculate the refund rate
--refund rate is equal to the total number of refunds divided by the total number of orders

SELECT DATE_TRUNC(orders.purchase_ts, month) AS Purchase_Month,
SUM(CASE
      WHEN order_status.refund_ts IS NOT NULL THEN 1
      ELSE 0
    END
) AS refunds,
SUM(CASE
      WHEN order_status.refund_ts IS NOT NULL THEN 1
      ELSE 0
    END 
) / COUNT(DISTINCT orders.id) AS refund_rate
FROM `elist-390902.elist.orders` orders
LEFT JOIN `elist-390902.elist.order_status` order_status
  ON orders.id = order_status.order_id
GROUP BY 1
ORDER BY 1 DESC;


--count the number of refunds, filtered to 2021
--only include products with 'apple' in the name - use lowercase to account for any differences in capitalization

SELECT DATE_TRUNC(order_status.refund_ts, month) AS month,
SUM(CASE
      WHEN order_status.refund_ts IS NOT NULL THEN 1
      ELSE 0
    END
) AS refunds
FROM `elist-390902.elist.orders` orders
LEFT JOIN `elist-390902.elist.order_status` order_status
  ON orders.id = order_status.order_id
WHERE EXTRACT(year from order_status.refund_ts) = 2021
  AND LOWER(orders.product_name) LIKE '%apple%'
GROUP BY 1
ORDER BY 1;


--Question 4: Are there certain products that are getting refunded more frequently than others? What are the top 3 most frequently refunded products across all years? What are the top 3 products that have the highest count of refunds?
--clean up product name
--calculate refund rate across products
--order in descending order of refund rate to get the top 3 frequently refunded

SELECT 
  CASE 
    WHEN orders.product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor'
    ELSE product_name
  END AS product_clean,
SUM(
  CASE
    WHEN order_status.refund_ts IS NOT NULL THEN 1
    ELSE 0
  END
) AS refunds,
SUM(
  CASE
    WHEN order_status.refund_ts IS NOT NULL THEN 1
    ELSE 0
  END
) / COUNT(DISTINCT orders.id) AS refund_rate
FROM `elist-390902.elist.orders` orders
LEFT JOIN `elist-390902.elist.order_status` order_status
  ON orders.id = order_status.order_id
GROUP BY 1
ORDER BY 3 DESC;
--order in descending order of refund count to get the top 3 highest refund count

SELECT 
  CASE
    WHEN product_name = '27in"" 4k gaming monitor' THEN '27in 4K gaming monitor'
    ELSE product_name
  END AS product_clean,
SUM(
  CASE
    WHEN order_status.refund_ts IS NOT NULL THEN 1
    ELSE 0
  END
) AS refunds,
SUM(
  CASE
    WHEN order_status.refund_ts IS NOT NULL THEN 1
    ELSE 0
  END
) / COUNT(DISTINCT orders.id) AS refund_rate
FROM `elist-390902.elist.orders` orders
LEFT JOIN `elist-390902.elist.order_status` order_status
  ON orders.id = order_status.order_id
GROUP BY 1
ORDER BY 2 DESC;


--Question 5: What’s the average order value across different account creation methods in the first two months of 2022? Which method had the most new customers in this time?
--aov and count of new customers by account creation channel in first 2 months of 2022
 
SELECT customers.account_creation_method,
  AVG(orders.usd_price) AS aov,
  COUNT(DISTINCT customers.id) AS num_customers
FROM `elist-390902.elist.orders` orders
LEFT JOIN `elist-390902.elist.customers` customers
  ON orders.customer_id = customers.id
WHERE customers.created_on BETWEEN '2022-01-01' AND '2022-02-28'
GROUP BY 1
ORDER BY 3 DESC;


--Question 6: What’s the average time between customer registration and placing an order?
--calculate days to purchase by taking date difference
--take the average of the number of days to purchase

WITH days_to_purchase_cte AS (
  SELECT customers.id AS customer_id,
    orders.id AS order_id,
    customers.created_on,
    orders.purchase_ts,
    DATE_DIFF(orders.purchase_ts, customers.created_on, day) AS days_to_purchase
  FROM `elist-390902.elist.orders` orders
  LEFT JOIN `elist-390902.elist.customers` customers
    ON orders.customer_id = customers.id
  ORDER BY 1,2,3
) 

SELECT AVG(days_to_purchase)
FROM days_to_purchase_cte;


--Question 7: What’s the average time between customer registration and placing an order?
--calculate days to deliver by taking date difference
--take the average of the number of days to deliver 

WITH days_to_deliver_cte AS (
  SELECT 
    order_status.order_id AS order_id,
    DATE_DIFF(order_status.delivery_ts,order_status.purchase_ts, day) AS days_to_deliver
  FROM `elist-390902.elist.order_status` order_status
) 

SELECT AVG(days_to_deliver) AS Average_Delivery_Days
FROM days_to_deliver_cte;


--Question 8: Which marketing channels perform the best in each region? Does the top channel differ across regions?
--calculate the total number of orders and total sales by region and registration channel
--rank the channels by total sales, and order the dataset by this ranking to surface the top channels per region first

WITH region_orders AS (
  SELECT geo_lookup.region AS region,
    customers.marketing_channel,
    COUNT(DISTINCT orders.id) AS num_orders,
    SUM(orders.usd_price) AS total_sales,
    AVG(orders.usd_price) AS aov
  FROM `elist-390902.elist.orders` orders
  LEFT JOIN `elist-390902.elist.customers` customers
    ON orders.customer_id = customers.id
  LEFT JOIN `elist-390902.elist.geo_lookup` geo_lookup
    ON customers.country_code = geo_lookup.country
  GROUP BY 1,2
  ORDER BY 1,2
)

SELECT *,
row_number() OVER (PARTITION BY region ORDER BY num_orders DESC) AS ranking
FROM region_orders
ORDER BY 6 ASC;


--Question 9: For customers who purchased more than 4 orders across all years, what was the order ID, product, and purchase date of their most recent order?
--get customers with over 4 purchases first
WITH over_4_purchases AS (
  SELECT customer_id, 
		COUNT(id)
  FROM `elist-390902.elist.orders` orders
  GROUP BY 1
  HAVING (COUNT(id)) >= 4
)

--rank customer orders by most recent first
--select the most recent orders using a qualify statement
--choose only customers who had more than 4 purchases with inner join
SELECT orders.customer_id, 
  orders.id, 
  orders.product_name, 
  orders.purchase_ts,
  ROW_NUMBER() OVER (PARTITION BY orders.customer_id ORDER BY orders.purchase_ts DESC) AS order_ranking
FROM `elist-390902.elist.orders` orders
INNER JOIN over_4_purchases 
  ON over_4_purchases.customer_id = orders.customer_id
QUALIFY ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY purchase_ts DESC) = 1


--Question 10: For each brand, which month in 2020 had the highest number of refunds, and how many refunds did that month have?
--create brand categories and filter to 2020
--count the number of refunds per month
WITH brand_refunds AS (
	SELECT 
	  CASE WHEN LOWER(product_name) LIKE '%apple%' or LOWER(product_name) LIKE '%macbook%' THEN 'Apple'
	    WHEN LOWER(product_name) LIKE '%thinkpad%' THEN 'ThinkPad'
	    WHEN LOWER(product_name) LIKE '%samsung%' THEN 'Samsung'
	    WHEN LOER(product_name) LIKE '%bose%' THEN 'Bose'
	    ELSE 'Unknown'
	  END AS brand,
	  DATE_TRUNC(refund_ts, month) AS refund_month,
	  COUNT(refund_ts) AS refunds
	FROM `elist-390902.elist.orders` orders
	LEFT JOIN `elist-390902.elist.order_status` order_status
		ON orders.id = order_status.order_id
	WHERE EXTRACT(year FROM refund_ts) = 2020
	GROUP BY 1,2)

--select the month per brand based on the highest number of refunds
SELECT * 
FROM brand_refunds
QUALIFY ROW_NUMBER() OVER (PARTITION BY brand ORDER BY refunds DESC) = 1;