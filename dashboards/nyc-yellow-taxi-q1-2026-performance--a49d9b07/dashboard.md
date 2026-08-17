# NYC Yellow Taxi Q1 2026 Performance

Yellow taxis recorded **11,077,206 trips** and **$330.0M in total fares** in Q1 2026, averaging **$29.79 per trip**. Demand grew through the quarter once the calendar is accounted for: February looks like a decline in raw totals but was actually busier per day than January, and March was the strongest month on every measure. The quarter's real fragility was not seasonal drift but two single-day collapses — 23 February lost 79% of a normal day's demand.

The other structural finding is where the money comes from. Manhattan supplies 85.7% of trips but the lowest fare per trip in the city, while the two Queens airport zones together produce **$49.8M — about 15% of quarterly revenue from 6% of trips**. Any capacity or incentive decision that treats a trip as a trip will misprice the airport queues.

## Volume grew steadily; February's "decline" is a calendar artifact

| Month | Trips | Trips per day | Fares | Avg per trip | Median trip |
| --- | --- | --- | --- | --- | --- |
| January | 3,724,889 | 120,158 | $108.69M | $29.18 | 1.90 mi / 13.5 min |
| February | 3,399,866 | 121,424 | $102.38M | $30.11 | 1.87 mi / 14.2 min |
| March | 3,952,451 | 127,498 | $118.96M | $30.10 | 1.90 mi / 13.4 min |

February's total is 8.7% below January's, but February has 28 days. On a per-day basis it was 1.1% *higher* than January, and March added a further 5.0% on top. Fare per trip rose $0.93 from January to February and then held flat, so March's revenue gain came from volume rather than price. The median trip barely moved all quarter — 1.9 miles, about 13.5 minutes — which says the mix of short Manhattan hops stayed stable even as totals grew.

```dashboard
{"widgetId":"daily-trip-volume"}
```

Three days break the weekly rhythm badly. Against a quarterly mean of 123,080 trips per day:

- **23 February (Monday) — 26,039 trips, 79% below normal.** The lowest day of the quarter by a wide margin, and the preceding Sunday (85,555) was already depressed.
- **25 January (Sunday) — 44,858 trips, 64% below normal**, with Monday 26 January still down 44% at 69,172.

Average fare held near normal on all three days ($28.42 on 23 February), and average trip duration did not spike, so these were losses of demand or of available supply rather than trips that became slower and more expensive. The pattern — a weekend into Monday, twice, in the two coldest months — is consistent with severe-weather shutdowns, but this dataset contains no weather or service-status field, so **the cause is not established here** and should be confirmed against an external record before it is reported as such.

## Demand is a Thursday-and-Friday evening business

```dashboard
{"widgetId":"demand-by-hour-and-day"}
```

The peak slot is **18:00 on Thursday and Friday at roughly 10,200 trips per hour**, and a warm block runs 15:00–21:00 every day of the week. The trough is **03:00–04:00 on Tuesday and Wednesday at under 350 trips per hour** — a thirty-fold swing within a single day, far larger than any day-to-day or month-to-month variation in this quarter. Weekend late nights stay busy past midnight while weekday late nights empty out, so Friday and Saturday overnight coverage is a genuinely different shift from Tuesday overnight.

Each cell is the average across that weekday's occurrences in Q1, not a total, so the count is comparable across weekdays even though Wednesday occurs 12 times in this quarter and the other weekdays occur 13.

## Revenue concentrates in two airport zones

```dashboard
{"widgetId":"top-revenue-zones"}
```

**JFK Airport alone collected $32.34M**, nearly double LaGuardia's $17.49M and roughly triple the best Manhattan zone (Midtown Center, $12.12M). JFK does this on 431,039 trips — *fewer* than Upper East Side South's 479,826 — because a JFK pickup averages $75.03 against the Upper East Side's $21.72. The other twelve zones in the top fifteen are all Manhattan and cluster tightly between $6.7M and $10.5M, so below the airports the zone ranking is driven almost entirely by trip count.

```dashboard
{"widgetId":"borough-fare-premium"}
```

The borough view makes the trade explicit. Manhattan carries **85.7% of trips at the lowest average fare in the city ($25.90)**; Queens carries 9.0% of trips at $62.44 and converts that into $62.34M, or 18.9% of borough-attributed revenue. Brooklyn ($36.34) and the Bronx ($37.07) sit in between at low volume. Newark Airport and Staten Island show high averages on ~1,400 trips each — real but too thin to plan against.

## How to read these numbers

- **Grain and scope.** One row is one TLC yellow taxi trip record. Everything here is scoped by `data_month` between 2026-01-01 and 2026-03-01, which is the entire extent of this relation — Q1 2026 is all the data there is, so no year-over-year comparison is possible and no growth claim here is annual.
- **Time basis.** Volume and revenue totals are scoped by the `data_month` partition. The daily and hourly views additionally require `pickup_datetime` to fall inside Q1, which excludes 10 records whose pickup timestamps sit outside the quarter (the March partition contains one stamped 2008). Hours are as recorded by TLC, uncorrected for timezone or DST.
- **Money.** All amounts are `total_amount` in USD as recorded by TLC — fares plus surcharges, tolls, and tips where recorded — and are not inflation-adjusted. Revenue is gross collections, not driver or fleet earnings.
- **Data quality left in place.** 370,198 trips (3.34%) have zero or negative distance, 134,801 (1.22%) non-positive duration, and 90,080 (0.81%) non-positive total. Counts and revenue sums include these records so they reconcile with TLC's published totals; the median distance and duration figures exclude non-positive values and cap at 200 miles and 12 hours, which removes 2,381 trips over 12 hours and 339 over 200 miles from those two statistics only.
- **Borough and zone denominators.** Borough shares are computed over the 11,060,005 trips with a real borough, excluding 12,718 `Unknown` and 4,483 `N/A` pickups (0.16% combined). Zone rankings exclude the same placeholder labels. Zone names come from the TLC zone lookup joined at load time, so a misjoined zone would silently misattribute revenue.
- **Congestion pricing.** 7,797,800 trips (70.4% of the quarter) carried a CBD congestion fee, totalling $5.81M — an average of $0.74 per fee-paying trip, stable across all three months, consistent with a flat per-trip surcharge applied slightly unevenly. That fee is included in the revenue figures above.
- **Payment mix is only partly interpretable.** Card (`payment_type` 1) covers 62.4% of trips, cash (2) 8.5%, no-charge (3) 0.4%, and disputes (4) 1.1% — but **27.6% of trips carry code `0`, which the warehouse catalog does not document**. Those trips average $33.09, the highest of any code, so they are not junk records and cannot be dropped. Treat any cash-versus-card share as covering only the 72.4% of trips with a documented code until the codebook is confirmed.
