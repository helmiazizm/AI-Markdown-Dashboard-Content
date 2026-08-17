# Q1 2026 yellow taxis: 11.08M trips and $330.0M billed passenger spend

> NYC yellow taxis recorded 11.08 million trips and $330.0 million in billed passenger spend in Q1 2026 (the only Q1 present). March led on both volume and daily rate; demand concentrated in Manhattan (85.6% of trips) and weekday evening peaks, while JFK produced outsized spend per trip.

The warehouse holds only January–March 2026, so this is a within-quarter read, not a year-over-year comparison. Grain is one TLC yellow taxi trip. Billed passenger spend is `SUM(total_amount)` in recorded USD and is not inflation-adjusted. Trip counts and spend include 90,080 non-positive totals (0.81% of trips: 1,500 zeros and 88,580 negatives); averages below use only positive, non-null values of each metric.

## March led volume and daily intensity

January logged 3.72 million trips and $108.69 million, February 3.40 million and $102.38 million, March 3.95 million and $118.96 million. After calendar normalisation (31 / 28 / 31 days), daily volume still rose — 120,158 → 121,424 → 127,498 trips/day — and daily spend rose $3.51 million → $3.66 million → $3.84 million/day. February’s lower monthly totals are the shorter month, not weaker intensity. Typical positive billed trip was $29.83 / $30.60 / $30.42; mean positive distance fell 6.68 → 6.48 → 6.17 miles while duration stayed about 17.4–18.1 minutes. Non-positive totals by month were 40,417 / 27,774 / 21,889.

```dashboard
{"widgetId":"monthly-trips","span":"half"}
```

```dashboard
{"widgetId":"monthly-revenue","span":"half"}
```

## Demand peaked Thursday and Friday at 18:00

All 11,077,206 Q1 trips have a pickup weekday and hour (168 weekday-hour cells, none empty). Intensity peaked Thursday 18:00 (133,182 trips), then Friday 18:00 (132,043) and Thursday 17:00 (122,154). Thursday held 1.786 million trips (16.12% of Q1), Saturday 1.780 million (16.06%), Friday 1.751 million (15.81%), versus Monday 1.263 million (11.40%). Late-night demand flips on weekends (Sunday 00:00 = 99,662; Saturday 00:00 = 89,540); the quietest cell is Tuesday 03:00 (3,650). These counts are not normalised by how many of each weekday fall in Q1 2026, and this grid is trip volume only — no spend.

```dashboard
{"widgetId":"demand-heatmap"}
```

## Manhattan held 85.60% of trips; Queens and JFK lifted spend per trip

Manhattan produced 9.48 million pickups (85.60%) and $245.58 million but the lowest typical positive total ($26.23). Queens was 998,379 trips (9.01%) yet $62.34 million at a $65.03 average — far above Manhattan. Brooklyn 465,247 (4.20%, $36.46 average), Bronx 111,654 (1.01%), then Unknown 12,718 (0.11%), N/A 4,483 (0.04%, $106.72 average), EWR 1,420 (0.013%, $104.12), and Staten Island 1,415 (0.013%). Null or blank boroughs would map to Unknown; none occurred. Unknown and N/A are stored source labels and are kept separate. Passenger counts and drop-off demand are not in this grain.

```dashboard
{"widgetId":"borough-ranking","span":"half"}
```

```dashboard
{"widgetId":"zone-ranking","span":"half"}
```

Among 261 pickup zones, the top 12 by trip count are 4,252,240 trips (38.4% of Q1). Leaders: Upper East Side South 479,826 (4.33%), Upper East Side North 449,683 (4.06%), Midtown Center 447,264 (4.04%), then JFK Airport 431,039 (3.89%) — the only non-Manhattan zone in the top 12 and the spend outlier ($32.34 million, $79.69 average versus about $22–30 in core Manhattan). Zone shares use the full 11,077,206-trip denominator, not the top-12 subtotal. These columns do not identify why JFK’s average is high (airport length, tolls, and fees are possible but not established here).
