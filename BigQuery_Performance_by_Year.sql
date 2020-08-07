SELECT
  DISTINCT EXTRACT(YEAR
  FROM
    order_date) AS years,
  SUM(sales) AS sales,
  COUNT(order_id) AS number_of_order
FROM
  `linuxacademy-280016.dqlab_sales_store.dqlab`
WHERE
  STARTS_WITH(order_status, " Order Finished")
GROUP BY
  years
ORDER BY
  years ASC;