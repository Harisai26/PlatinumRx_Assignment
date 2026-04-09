-- Q1: Revenue by channel
SELECT sales_channel, SUM(amount) AS revenue
FROM clinic_sales
GROUP BY sales_channel;

-- Q2: Total revenue per month
SELECT strftime('%Y-%m', sale_date) AS month, SUM(amount) AS revenue
FROM clinic_sales
GROUP BY month;

-- Q3: Profit/Loss per month
SELECT revenue.month,
       revenue.total_revenue - expenses.total_expense AS profit
FROM (
    SELECT strftime('%Y-%m', sale_date) AS month, SUM(amount) AS total_revenue
    FROM clinic_sales
    GROUP BY month
) revenue
JOIN (
    SELECT strftime('%Y-%m', expense_date) AS month, SUM(amount) AS total_expense
    FROM expenses
    GROUP BY month
) expenses
ON revenue.month = expenses.month;