# Apparel and Topwear concentrate the catalog; colour is thinnest there

Apparel holds **48.17%** of the **44,424**-product mixed-brand catalog and is the thinnest master on colour relative to scale (**509.5 products per usable base colour**). At sub-category the pile-up is sharper still: **Topwear alone is 34.67%** of the catalog and **394.9 products per colour** — more than double Shoes, the next-thinnest sizable cell.

These are distinct-product counts in a mixed-brand assortment (collection years 2007–2019), not a retailer stock snapshot. There are no price, stock, or brand-hierarchy fields, so the data cannot explain *why* volume sits in Topwear and Shoes.

## Three masters hold 94.30% of products

Every product has a non-blank master category. Catalog share uses the full **44,424** as denominator. Apparel **21,397** (48.17%), Accessories **11,274** (25.38%), and Footwear **9,219** (20.75%) together are **94.30%**. Personal Care is a distant fourth at **2,403** (5.41%). Sporting Goods is 25 products; Home is a 1-product cell whose share rounds to **0.00%** at two-decimal precision.

Bronze ranks masters by distinct products. Amber keeps that **same product-count order** and plots products per distinct base colour, so a large master that is colour-narrow stands out without re-ranking the taxonomy.

```dashboard
{"widgetId":"master-product-share","span":"half"}
```

```dashboard
{"widgetId":"master-colour-thinness","span":"half"}
```

Usable colour labels are similarly wide across the big three (**42 / 44 / 40** distinct non-blank `base_colour` values), so thinness is a scale effect: Apparel **509.5** products per colour versus Accessories **256.2**, Footwear **230.5**, and Personal Care **61.6**. Fifteen products (0.03% of the catalog) have no usable colour — 6 Apparel, 9 Personal Care. They stay in product counts and are excluded only from the colour distinct-count.

`base_colour` is a source label, not a measured hue or SKU-variant key. The same named colour can hide many true colourways, or two labels can be marketing synonyms.

## Topwear is larger than Shoes and Bags combined

The next cut is master + sub-category. Share is still of the **full catalog**, not of the parent master. The chart is the top 15 of **47** labelled pairs.

```dashboard
{"widgetId":"subcategory-sku-rank"}
```

Apparel Topwear is **15,402** products (**34.67%**) — larger than Footwear Shoes (**7,343**, 16.53%) and Accessories Bags (**3,055**, 6.88%) combined. The top two cells are **51.20%** of the catalog; the top five (adding Bottomwear **2,694** / 6.06% and Watches **2,542** / 5.72%) are **69.86%**. Rank 15 is Personal Care Lips at **527** (1.19%).

Collection years are heavily peaked: **2011–2012 alone are 29,960 products (67.44%)**. This is not a period-normalised view, and the data cannot say whether the mix shifted by year.

## Colour variety does not keep up with that scale

Among sub-categories with **at least 100 products** (27 of 47 pairs; 20 smaller cells excluded so a handful of colours on few products cannot look “deep”), higher products-per-colour means thinner variety versus scale. Distinct colour counts among these large cells only span **15–40**, so the ranking is driven by product volume, not a collapse in named colours.

```dashboard
{"widgetId":"subcategory-scale-vs-colour","span":"half"}
```

```dashboard
{"widgetId":"subcategory-thinnest-colour","span":"half"}
```

Topwear is the extreme: **15,402 / 39 colours = 394.9**, more than double Shoes (**7,343 / 40 = 183.6**) and about 4.8× Watches (**2,542 / 31 = 82.0**). Bottomwear (**81.6**) and Bags (**78.3**) sit next. On the same 100-product floor, colour is relatively richest in Free Gifts (**4.5**), Apparel Set (**5.3**), and Scarves (**5.4**).

The 100-product floor is a reading rule, not a finding about the dropped cells. Thinness here is colour cardinality relative to product count — not sell-through, price architecture, or a measured hue.
