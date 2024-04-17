-- Sales trends by product category
SELECT
    product_category,
    EXTRACT(YEAR FROM billing_date) AS year_period,
    EXTRACT(MONTH FROM billing_date) AS month_period,
    SUM(sales_quantity) AS total_qty,
    SUM(sales_amount) AS total_sales
FROM
    sales_transactions
GROUP BY
    product_category, year_period, month_period
ORDER BY
    product_category, year_period, month_period;

   
 -- Customer purchasing behavior
SELECT
    customer_id,
    COUNT(DISTINCT transaction_id) AS total_transactions,
    SUM(sales_amount) AS total_sales,
    ROUND(SUM(total_amount)/COUNT(DISTINCT transaction_id),0) AS purchase_power
FROM
    sales_transactions
GROUP BY
    customer_id
ORDER BY
    ROUND(SUM(total_amount)/COUNT(DISTINCT transaction_id),0) DESC;

   
 -- Top 10 best selling products by revenue
SELECT
    product_name,
    SUM(sales_amount) AS total_sales
FROM
    sales_transactions
GROUP BY
    product_name
ORDER BY
    total_revenue DESC
LIMIT 10;


-- Regional sales trends
SELECT
    region,
    EXTRACT(YEAR FROM billing_date) AS year_period,
    EXTRACT(MONTH FROM billing_date) AS month_period,
    SUM(sales_amount) AS total_sales
FROM
    sales_transactions
GROUP BY
    region, year_period, month_period
ORDER BY
    region, year_period, month_period;

   
-- Revenue by promotion type
SELECT
    promotion_type,
    SUM(sales_amount) AS total_sales
FROM
    sales_transactions
WHERE
    promotion_type IS NOT NULL
GROUP BY
    promotion_type;
