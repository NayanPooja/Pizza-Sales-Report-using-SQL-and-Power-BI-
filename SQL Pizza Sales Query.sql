select * from [dbo].[pizza_sales (1)]

--A. KPI’s

1. Total Revenue:
select SUM(total_price) from [pizza_sales (1)]

2. Average Order Value
select SUM(total_price) as total_revenue from [pizza_sales (1)]

3. Total Pizzas Sold
select sum (total_price)/ count(distinct order_id ) as Avg_Total_Value from [pizza_sales (1)]

4. Total Orders

  select sum (quantity) as Total_Pizza_Sold from [pizza_sales (1)]

5. Average Pizzas Per Order

select count (distinct order_id ) as Total_Orders from [pizza_sales (1)]

--B. Daily Trend for Total Orders

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT [order_id]) AS total_orders 
FROM [pizza_sales (1)]
GROUP BY DATENAME(DW, order_date)

--C. Monthly Trend for Orders

select DATENAME(MONTH, order_date) as Month_Name, COUNT(DISTINCT order_id) as Total_Orders
from [pizza_sales (1)]
GROUP BY DATENAME(MONTH, order_date)

--D. % of Sales by Pizza Category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [pizza_sales (1)]) AS DECIMAL(10,2)) AS PCT
FROM [pizza_sales (1)]
GROUP BY pizza_category

--E. % of Sales by Pizza Size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from [pizza_sales (1)]) AS DECIMAL(10,2)) AS PCT
FROM [pizza_sales (1)]
GROUP BY pizza_size
ORDER BY pizza_size

--F. Total Pizzas Sold by Pizza Category

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM [pizza_sales (1)]
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--G. Top 5 Pizzas by Revenue

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM [pizza_sales (1)]
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--H. Bottom 5 Pizzas by Revenue

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM [pizza_sales (1)]
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

--I. Top 5 Pizzas by Quantity

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM [pizza_sales (1)]
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

--J. Bottom 5 Pizzas by Quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM [pizza_sales (1)]
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

--K. Top 5 Pizzas by Total Orders

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM [pizza_sales (1)]
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--L. Borrom 5 Pizzas by Total Orders

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM [pizza_sales (1)]
GROUP BY pizza_name
ORDER BY Total_Orders ASC

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM [pizza_sales (1)]
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Orders ASC

