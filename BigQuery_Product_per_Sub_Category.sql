SELECT
  DISTINCT EXTRACT(YEAR
  FROM
    order_date) AS years,
  product_sub_category AS product_sub_category,
  SUM(sales) AS sales,
  COUNT(order_id) AS qty
FROM
  dqlab_sales_store.dqlab
WHERE
  EXTRACT(YEAR
  FROM
    order_date) IN (2011,
    2012)
  AND order_status LIKE '%Order Finished%'
GROUP BY
  years,
  product_sub_category
ORDER BY
  years ASC,
  sales DESC