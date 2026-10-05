
-- Task 3: SQL for Data Analysis

-- 1. SELECT
SELECT * FROM sales LIMIT 10;

-- 2. WHERE
SELECT *
FROM sales
WHERE Category = 'Technology';

-- 3. ORDER BY
SELECT *
FROM sales
ORDER BY Sales DESC;

-- 4. GROUP BY + SUM
SELECT Category, SUM(Sales) AS Total_Sales
FROM sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- 5. AVG
SELECT Category, AVG(Sales) AS Average_Sales
FROM sales
GROUP BY Category
ORDER BY Average_Sales DESC;

-- 6. JOIN
SELECT 
    sales.Region,
        region_managers.Manager,
            SUM(sales.Sales) AS Total_Sales
            FROM sales
            JOIN region_managers
                ON sales.Region = region_managers.Region
                GROUP BY sales.Region, region_managers.Manager
                ORDER BY Total_Sales DESC;

                -- 7. Subquery
                SELECT Product, Sales
                FROM sales
                WHERE Sales > (
                    SELECT AVG(Sales)
                        FROM sales
                        )
                        ORDER BY Sales DESC;

                        -- 8. VIEW
                        CREATE VIEW category_sales AS
                        SELECT Category, SUM(Sales) AS Total_Sales
                        FROM sales
                        GROUP BY Category;

                        -- 9. INDEX
                        CREATE INDEX idx_region
                        ON sales(Region);
                        