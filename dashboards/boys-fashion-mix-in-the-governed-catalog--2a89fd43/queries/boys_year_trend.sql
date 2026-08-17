SELECT year,
       COUNT(*) AS product_count
FROM fashion.catalog.products
WHERE gender = 'Boys'
GROUP BY year
ORDER BY year
