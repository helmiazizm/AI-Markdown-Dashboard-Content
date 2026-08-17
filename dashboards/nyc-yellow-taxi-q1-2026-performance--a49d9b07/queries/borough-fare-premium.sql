SELECT
  pu_borough AS borough,
  ROUND(AVG(total_amount), 2) AS avg_total_usd,
  COUNT(*) AS trips,
  ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS trip_share_pct,
  ROUND(SUM(total_amount) / 1000000, 2) AS revenue_musd
FROM tlc.taxi.yellow_trips
WHERE data_month BETWEEN DATE '2026-01-01' AND DATE '2026-03-01'
  AND pu_borough IS NOT NULL
  AND pu_borough NOT IN ('Unknown', 'N/A')
GROUP BY pu_borough
ORDER BY avg_total_usd ASC
