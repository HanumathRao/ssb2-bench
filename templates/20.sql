/* Query 20 - StarBench - The Potential Part Promotion query */
SELECT 
	S_NAME,
	S_ADDRESS
FROM
	SUPPLIER
WHERE
	S_SUPPKEY IN (
		SELECT
			P_SUPPKEY
		FROM
			PART
		WHERE
			P_PARTKEY IN (
				SELECT
					P_PARTKEY
				FROM
					PART
				WHERE
					P_NAME LIKE ':1%'
			)
			AND P_AVAILQTY > (
				SELECT
					0.5 * SUM(OD_QUANTITY)
				FROM
					ORDER_DETAIL
				WHERE
					OD_PARTKEY = P_PARTKEY
					AND OD_SUPPKEY = P_SUPPKEY
					AND OD_SHIPDATE >= DATE ':2'
					AND OD_SHIPDATE < DATE ':2' + INTERVAL '1' YEAR
			)
	)
	AND S_NATION = ':3'
ORDER BY
	S_NAME;
