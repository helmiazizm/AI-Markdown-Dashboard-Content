WITH zone_totals AS (
  SELECT
    pu_zone AS pickup_zone,
    ROUND(SUM(total_amount) / 1000000, 2) AS revenue_musd,
    COUNT(*) AS trips,
    ROUND(AVG(total_amount), 2) AS avg_total_usd
  FROM tlc.taxi.yellow_trips
  WHERE data_month BETWEEN DATE '2026-01-01' AND DATE '2026-03-01'
    AND pu_zone IS NOT NULL
    AND pu_zone NOT IN ('Unknown', 'N/A', 'NV')
  GROUP BY pu_zone
  ORDER BY SUM(total_amount) DESC, pickup_zone ASC
  LIMIT 15
)
SELECT
  pickup_zone,
  revenue_musd,
  trips,
  avg_total_usd
FROM zone_totals
ORDER BY revenue_musd ASC, pickup_zone DESC
