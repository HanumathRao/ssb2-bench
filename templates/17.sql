/* QUERY 17 - StarBench - SMALL-QUANTITY-ORDER REVENUE QUERY (Q17)
SELECT
	CAST( SUM(OD_EXTENDEDPRICE) / 7.0 AS DECIMAL(18,2) ) AS AVG_YEARLY
FROM
	ORDER_DETAIL,
	PART
WHERE
	P_PARTKEY = OD_PARTKEY
	AND P_SUPPKEY = OD_SUPPKEY
	AND P_BRAND = ':1'
	AND P_CONTAINER = ':2'
	AND OD_QUANTITY < (
		SELECT
			0.2 * AVG(OD_QUANTITY)
		FROM
			ORDER_DETAIL
		WHERE
			OD_PARTKEY = P_PARTKEY
	);
