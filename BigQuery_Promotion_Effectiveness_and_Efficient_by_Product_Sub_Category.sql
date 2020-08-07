SELECT
  DISTINCT EXTRACT(YEAR
  FROM
    order_date) AS years,
  product_sub_category,
  product_category,
  SUM(sales) AS sales,
  SUM(discount_value) AS promotion_value,
  (SUM(discount_value) / SUM(sales)) AS burn_rate_percentage
FROM
  dqlab_sales_store.dqlab
WHERE
  order_status LIKE '%Order Finished%'
GROUP BY
  1,
  product_sub_category,
  product_category
ORDER BY
  1,
  sales DESC