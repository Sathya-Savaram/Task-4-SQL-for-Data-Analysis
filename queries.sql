-- 1. Show first 10 records
SELECT * 
FROM tv_sales 
LIMIT 10;

-- 2. TVs with Selling Price greater than 50000
SELECT Brand, Resolution, Size, "Selling Price"
FROM tv_sales
WHERE "Selling Price" > 50000;

-- 3. Count of models by Brand
SELECT Brand, COUNT(*) AS total_models
FROM tv_sales
GROUP BY Brand
ORDER BY total_models DESC;

-- 4. Average Selling Price by Brand
SELECT Brand, AVG("Selling Price") AS avg_selling_price
FROM tv_sales
GROUP BY Brand
ORDER BY avg_selling_price DESC;

-- 5. Most expensive TV (Selling Price)
SELECT Brand, Resolution, Size, "Selling Price"
FROM tv_sales
ORDER BY "Selling Price" DESC
LIMIT 1;

-- 6. Cheapest TV (Selling Price)
SELECT Brand, Resolution, Size, "Selling Price"
FROM tv_sales
ORDER BY "Selling Price" ASC
LIMIT 1;

-- 7. TVs with Rating greater than 4.5
SELECT Brand, Resolution, Size, Rating
FROM tv_sales
WHERE Rating > 4.5;

-- 8. Difference between Original Price and Selling Price
SELECT Brand, Resolution, Size,
       "Original Price" - "Selling Price" AS Discount
FROM tv_sales
ORDER BY Discount DESC;

-- 9. Subquery: TVs with maximum discount
SELECT *
FROM tv_sales
WHERE ("Original Price" - "Selling Price") = (
    SELECT MAX("Original Price" - "Selling Price") FROM tv_sales
);

-- 10. Create a view showing the 5 most expensive TVs by Selling Price
CREATE VIEW top_5_expensive_tvs AS
SELECT Brand, "Selling Price", "Original Price", Resolution, Size
FROM tv_sales
ORDER BY "Selling Price" DESC
LIMIT 5;

-- View query
SELECT * FROM top_5_expensive_tvs;
