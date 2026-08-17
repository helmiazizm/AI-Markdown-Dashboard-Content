SELECT article_type,
       COUNT(*) AS product_count,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS pct
FROM fashion.catalog.products
WHERE gender = 'Boys'
GROUP BY article_type
ORDER BY product_count DESC
LIMIT 15
