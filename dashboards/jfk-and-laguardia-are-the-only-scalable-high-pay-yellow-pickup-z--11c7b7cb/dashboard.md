# JFK and LaGuardia are the only scalable high-pay yellow pickup zones in Q1 2026

In January–March 2026, **JFK Airport ($79.66 average passenger total) and LaGuardia Airport ($69.86)** are the only high-value origins with real scale — **663k combined pickups** against a **$30.33 citywide mean**. Reposition toward those airports and adjacent **East Elmhurst ($64.56)** and **South Ozone Park ($57.66)** in the afternoon–evening. Do not chase **Newark Airport ($104.59)** or **Outside of NYC ($106.40)** — those ranks are duration artifacts — and do not trade Manhattan’s volume ($26.28 average passenger total, 85.6% of trips) for Far Rockaway–style long, low occupied-hour trips.

Grain is one qualifying yellow trip (`data_month` 2026-01-01, 2026-02-01, 2026-03-01; all three months are loaded). Of 11,077,206 Q1 rows, **10,852,386 qualify** after dropping 224,820 (2.03%) with `total_amount` ≤ 0 (90,080) and/or `trip_duration_minutes` ≤ 0 (134,801); null `pu_zone` = 0. Shares use that 10,852,386 denominator. A 1,000-trip floor keeps 209 of 261 zones.

## The only high-pay zones that can take more cabs

Average passenger total (USD per trip) is the ranking metric. Occupied-hour earnings (USD per occupied hour) and qualifying trip count decide whether a zone can absorb drivers. Occupied-hour earnings use in-trip minutes only — they ignore wait, deadhead, and airport queues — so they are not take-home pay.

```dashboard
{"widgetId":"zone_total_rank"}
```

JFK Airport is 2.6× the citywide per-trip mean on 412,635 trips (3.80% share, $120.77 per occupied hour, 39.6 min). LaGuardia Airport is 2.3× on 250,345 trips (2.31%, $141.12 per occupied hour). Both beat Manhattan’s $26.28 average passenger total and $103.90 per occupied hour (citywide occupied-hour earnings are $103.04). East Elmhurst (21,505 trips, $134.47 per occupied hour) and South Ozone Park (9,292, $158.96 per occupied hour) add airport-adjacent volume.

Newark Airport and Outside of NYC rank 1–2 on average passenger total and still are not actionable NYC reposition targets. Newark Airport averages 1.22 min / 0.43 miles (1,313 of 1,385 trips under 2 min). The extract cannot say whether those rows are meter artifacts, fee-only records, or GPS errors.

## Thin high-fare cells are not a market

```dashboard
{"widgetId":"zone_volume_value"}
```

Upper-right zones combine above-average passenger totals with material volume and can absorb extra cabs. Upper-left outliers cannot. Far Rockaway prints $50.62 per trip but only $45.91 per occupied hour over 66 minutes — a long, slow trip, not a raise. Average trip miles include 358,918 qualifying zeros and rare GPS spikes (Richmond Hill mean 47.6 vs median 4.5); do not read miles as a clean length measure.

This dashboard cannot say whether extra drivers at JFK or LaGuardia would dilute per-trip totals or lengthen airport-stand queues.

## The citywide clock is not the airport clock

Per-trip pay citywide peaks **before the morning rush**, not at the 18:00 volume peak. Occupied-hour earnings peak overnight because occupied minutes shorten — that is not evidence of more completed shifts. The citywide clock mixes Manhattan short hops with airport long hauls, so these hour ranks are not zone-specific. There is no day-of-week split.

```dashboard
{"widgetId":"hour_total_line","span":"half"}
```

```dashboard
{"widgetId":"hour_rate_line","span":"half"}
```

Volume peaks at 18:00 (786,766), then 17:00 (733,739) and 19:00 (702,055), versus a 04:00 trough of 91,052. Average passenger total is highest at 05:00 ($36.32) and 04:00 ($35.01) and lowest at 10:00 ($28.19) — 22% below the 05:00 peak and 7% below the $30.33 citywide mean. Occupied-hour earnings peak at 04:00 ($133.47) and 03:00 ($129.38), hold $118–$121 from 21:00–23:00, and fall to $90.50 at 15:00 when trips last 20.3 minutes.

February’s 3.33M qualifying trips is a 28-day month, not a demand collapse: daily rates are 117.4k (Jan), 119.0k (Feb), 125.2k (Mar). Monthly mean totals stay $29.88–$30.65.

## Sit JFK after 16:00; sit LaGuardia at both peaks

The twelve highest average-passenger-total zones are not uniformly profitable all day. Stage drivers on high-pay, high-volume cells only. Cell averages on sparse hours (Newark Airport overnight, Bellerose 19:00) are unstable. This grid never shows a high-volume Manhattan hour, because zones were chosen by Q1-wide average passenger total.

```dashboard
{"widgetId":"zone_hour_heat"}
```

JFK Airport pays most at 16:00 ($89.89 on 30,719 trips) and 17:00 ($88.42); 03:00–05:00 drop to about $60 on 1.6k–6.0k trips. LaGuardia Airport’s best per-trip hours are 07:00–08:00 ($76.26–$76.89) while volume peaks 14:00–15:00 (~19k trips near $72). East Elmhurst stays $58–$71 after 10:00. South Ozone Park is $72–$75 at 15:00–16:00 versus $33–$39 overnight. Bellerose 19:00 ($136.10) is only 25 trips. Newark Airport and Outside of NYC stay high-dollar every hour and still are not local dispatch markets. Every one of the 288 cells had at least one trip in this extract.

## What this cannot decide

- Deadhead, fuel, tolls, airport-stand queues, and CBD/airport fees, so occupied-hour earnings are not take-home pay.
- Whether extra drivers at JFK or LaGuardia would dilute averages or raise wait time.
- Destination mix, payment type, or tip versus fare inside `total_amount`.
