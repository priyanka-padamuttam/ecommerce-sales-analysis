
-----------1) Total Revenue ----
SELECT SUM(price) AS total_revenue
FROM [dbo].[olist_order_items_dataset];

-------2) Total Orders----
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM [dbo].[olist_orders_dataset];

------3)Monthly Revenue Trend---

SELECT  
  FORMAT([dbo].[olist_orders_dataset].order_purchase_timestamp, 'yyyy-MM') AS month,  
  SUM([dbo].[olist_order_items_dataset].price) AS revenue  
FROM [dbo].[olist_orders_dataset]  
JOIN [dbo].[olist_order_items_dataset]  
  ON [dbo].[olist_orders_dataset].order_id = [dbo].[olist_order_items_dataset].order_id  
GROUP BY FORMAT([dbo].[olist_orders_dataset].order_purchase_timestamp, 'yyyy-MM')  
ORDER BY month;


-------4)Top 10 Customers--

SELECT 
 [dbo].[olist_orders_dataset] .customer_id,
  SUM([dbo].[olist_order_items_dataset].price) AS total_spent
FROM [dbo].[olist_orders_dataset]
JOIN [dbo].[olist_order_items_dataset] 
ON [dbo].[olist_orders_dataset].order_id = [dbo].[olist_order_items_dataset].order_id
GROUP BY [dbo].[olist_orders_dataset].customer_id
ORDER BY total_spent DESC;

---------5)top products------

SELECT 
  product_id,
  COUNT(*) AS total_orders
FROM [dbo].[olist_order_items_dataset]
GROUP BY product_id
ORDER BY total_orders DESC;

-----6)Revenue by Payment Type----

SELECT 
  payment_type,
  SUM(payment_value) AS revenue
FROM [dbo].[olist_order_payments_dataset]
GROUP BY payment_type;

-----7)Order Status Distribution------

SELECT 
  order_status,
  COUNT(*) AS total_orders
FROM [dbo].[olist_orders_dataset]
GROUP BY order_status;
