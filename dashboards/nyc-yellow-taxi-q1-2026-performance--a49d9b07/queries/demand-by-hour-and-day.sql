WITH scoped AS (
  SELECT
    pickup_day_name,
    pickup_iso_dow,
    pickup_hour,
    CAST(pickup_datetime AS DATE) AS pickup_date
  FROM tlc.taxi.yellow_trips
  WHERE data_month BETWEEN DATE '2026-01-01' AND DATE '2026-03-01'
    AND pickup_datetime >= DATE '2026-01-01'
    AND pickup_datetime < DATE '2026-04-01'
),
occurrences AS (
  SELECT
    pickup_iso_dow,
    COUNT(DISTINCT pickup_date) AS day_count
  FROM scoped
  GROUP BY pickup_iso_dow
)
SELECT
  scoped.pickup_day_name AS day_name,
  scoped.pickup_hour AS pickup_hour,
  ROUND(COUNT(*) * 1.0 / ANY_VALUE(occurrences.day_count), 0) AS avg_trips
FROM scoped
JOIN occurrences ON occurrences.pickup_iso_dow = scoped.pickup_iso_dow
GROUP BY scoped.pickup_day_name, scoped.pickup_iso_dow, scoped.pickup_hour
ORDER BY MIN(scoped.pickup_iso_dow), scoped.pickup_hour
