-- USING 12345 AS A SEED TO THE RNG
/* QUERY 17 - STARBENCH - SMALL-QUANTITY-ORDER REVENUE QUERY */
/* DECORELLATED VERSION FOR MYSQL AND POSTGRESQL             */
WITH   /* DSS_17.SQL */
	T1(PARTKEY, QUANTITY) AS (
		SELECT 
		OD_PARTKEY,
		0.2 * AVG(OD_QUANTITY) 
		FROM ORDER_DETAIL 
		GROUP BY 1
	)
	SELECT 
	CAST(SUM(OD_EXTENDEDPRICE) / 7.0 AS DECIMAL(18,2)) AS AVG_YEARLY
	FROM
		T1,
		PART,
		ORDER_DETAIL
	WHERE 
		P_PARTKEY = OD_PARTKEY
		AND T1.PARTKEY = P_PARTKEY
		AND P_SUPPKEY = OD_SUPPKEY
		AND P_BRAND = 'BRAND#12'
		AND P_CONTAINER = 'SM CAN'
		AND OD_QUANTITY < T1.QUANTITY;