
-- 1. Sales & Profit by Region
SELECT 
  region,
  ROUND(SUM(sale_price), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit 
FROM df_orders
GROUP BY region
ORDER BY total_sales DESC;

-- 2. Top 5 Most Profitable Cities
SELECT 
  city,
  state,
  ROUND(SUM(profit)) AS total_profit
FROM df_orders
GROUP BY city, state
ORDER BY total_profit DESC
LIMIT 5;

-- 3. Average Discount by Category
SELECT 
  category, 
  ROUND(AVG(discount), 2) AS avg_discount 
FROM df_orders 
GROUP BY category;

-- 4. Monthly Sales Trend
SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  ROUND(SUM(sale_price), 2) AS monthly_sales
FROM df_orders
GROUP BY month
ORDER BY month;

-- 5. Customer Segment Performance
SELECT 
  segment,
  COUNT(order_id) AS total_orders,
  ROUND(SUM(sale_price), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM df_orders 
GROUP BY segment;
