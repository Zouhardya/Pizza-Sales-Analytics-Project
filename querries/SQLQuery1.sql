/* KPI QUERRIES*/

SELECT SUM(total_price)AS Total_Revenue from pizza_sales;

SELECT * FROM pizza_sales;

SELECT SUM(total_price) / COUNT(DISTINCT order_id)AS Avg_Order_Value  from pizza_sales;

SELECT SUM(quantity) AS Total_pizza_Sold from pizza_sales;

SELECT COUNT(DISTINCT order_id)AS Total_orders from pizza_sales;

SELECT CAST(CAST(SUM(quantity)AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id)AS DECIMAL(10,2))AS DECIMAL(10,2))AS Avg_pizzas_per_order from pizza_sales;

/*Charts*/

SELECT DATENAME(DW,order_date) AS Order_day , COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY DATENAME(DW,order_date); 

SELECT DATENAME(MONTH,order_date) AS Order_Month , COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY Total_Orders DESC; 

SELECT pizza_category,CAST(SUM(total_price)AS DECIMAL(10,2)) as Total_revenue ,CAST(SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales)AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

SELECT pizza_size,CAST(SUM(total_price)AS DECIMAL(10,2)) as Total_revenue ,CAST(SUM(total_price) * 100 / (select SUM(total_price) from pizza_sales)AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT;

SELECT TOP 5 pizza_name,SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;



