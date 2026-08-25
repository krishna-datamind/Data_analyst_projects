--- TOTAL REVENUE

SELECT SUM(total_price) Total_Revenue
FROM pizza_sales;

--- AVERAGE ORDER VALUE

SELECT SUM(total_price) / COUNT(DISTINCT order_id) Avg_Order_Value
FROM pizza_Sales;

--- TOTAL PIZZAS SOLD

SELECT SUM(quantity) Total_Pizza_Sold
FROM pizza_sales;

--- Total Orders

SELECT COUNT(DISTINCT order_id) Total_Orders
FROM pizza_sales;

--- AVERAGE PIZZAS PER ORDER

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) Avg_Pizzas_Per_Order
FROM pizza_sales;

--- DAILY TREND FOR TOTAL ORDERS

SELECT DATENAME(DW,order_date) as order_Day,COUNT(DISTINCT order_id) Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)

--- MONTHLY TREND FOR TOTAL ORDERS

SELECT DATENAME(MONTH,order_date) Month_Name, COUNT(DISTINCT order_id) Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)

--- PERCENTAGE OF SALES BY PIZZA CATEGORY FOR JANUARY

SELECT pizza_category,SUM(total_price) Total_Sales,
CAST(sum(total_price)*100/(SELECT SUM(total_price) FROM pizza_Sales WHERE MONTH(order_date)=1) AS DECIMAL(10,2)) PCT
FROM pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_category

--- PERCENTAGE OF SALES BY PIZZA SIZE FOR FIRST QUARTER

SELECT pizza_size,SUM(total_price) Total_Sales,
CAST(sum(total_price)*100/(SELECT SUM(total_price) FROM pizza_Sales WHERE DATEPART(quarter,order_Date)=1) AS DECIMAL(10,2)) PCT
FROM pizza_sales
WHERE DATEPART(quarter,order_Date)=1
GROUP BY pizza_size

--- TOP 5 BEST SELLERS BY REVENUES

SELECT TOP 5 pizza_name,SUM(total_price) Total_Revenue
from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--- BOTTOM 5 BEST SELLERS BY REVENUE

SELECT TOP 5 pizza_name,SUM(total_price) Total_Revenue
from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC


