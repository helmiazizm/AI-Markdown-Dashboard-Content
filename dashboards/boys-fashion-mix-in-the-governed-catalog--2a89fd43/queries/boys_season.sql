SELECT season,
       COUNT(*) AS product_count,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS pct,
       CASE season
         WHEN 'Spring' THEN 1
         WHEN 'Summer' THEN 2
         WHEN 'Fall' THEN 3
         WHEN 'Winter' THEN 4
         ELSE 5
       END AS season_order
FROM fashion.catalog.products
WHERE gender = 'Boys'
  AND season IS NOT NULL
GROUP BY season
ORDER BY season_order
