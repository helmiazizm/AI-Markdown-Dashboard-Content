## What this dashboard shows

This dashboard analyzes `fashion.catalog.products` (44,424 catalog rows and 44,424 distinct `product_id` values, so each row is a unique product at this grain). It covers three lenses: master category volume, gender mix, and base colour concentration.

**Master category volume.** Apparel is the largest master category at 21,397 rows (48.2%), followed by Accessories (11,274 rows; 25.4%) and Footwear (9,219 rows; 20.8%). The long tail includes Personal Care (5.4%), Free Items, Sporting Goods, and a single Home row.

**Gender mix.** Men lead with 22,147 rows (49.9%), Women follow with 18,631 rows (41.9%), and Unisex accounts for 2,161 rows (4.9%). Boys and Girls cover the remaining 3.3% of catalog rows.

**Base colour concentration.** There are 46 distinct `base_colour` values, including 15 nulls shown as Unknown in the chart. Black is the most concentrated colour at 9,728 rows (21.9%), followed by White (12.5%) and Blue (11.1%). The top 15 colours account for 90.3% of catalog rows, indicating a highly concentrated colour assortment.

## Master category volume

```dashboard
{"widgetId":"w_master_category"}
```

## Gender mix

```dashboard
{"widgetId":"w_gender_mix"}
```

## Base colour concentration

```dashboard
{"widgetId":"w_base_colour_concentration"}
```
