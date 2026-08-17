SELECT
  CAST(pickup_datetime AS DATE) AS pickup_date,
  COUNT(*) AS trips,
  ROUND(AVG(total_amount), 2) AS avg_total_usd
FROM tlc.taxi.yellow_trips
WHERE data_month BETWEEN DATE '2026-01-01' AND DATE '2026-03-01'
  AND pickup_datetime >= DATE '2026-01-01'
  AND pickup_datetime < DATE '2026-04-01'
GROUP BY CAST(pickup_datetime AS DATE)
ORDER BY pickup_date
