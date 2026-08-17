WITH gender_article AS (
  SELECT article_type,
         COUNT(*) FILTER (WHERE gender = 'Boys') AS boys_count,
         COUNT(*) FILTER (WHERE gender = 'Men') AS men_count
  FROM fashion.catalog.products
  WHERE gender IN ('Boys', 'Men')
  GROUP BY article_type
),
ranked AS (
  SELECT article_type,
         boys_count,
         men_count,
         ROUND(100.0 * boys_count / NULLIF(SUM(boys_count) OVER (), 0), 1) AS boys_pct,
         ROUND(100.0 * men_count / NULLIF(SUM(men_count) OVER (), 0), 1) AS men_pct
  FROM gender_article
)
SELECT article_type, boys_count, men_count, boys_pct, men_pct
FROM ranked
WHERE boys_count > 0 AND men_count > 0
ORDER BY boys_count DESC
LIMIT 10
