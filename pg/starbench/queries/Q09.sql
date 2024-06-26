-- USING DEFAULT SUBSTITUTIONS
/* QUERY 09 - STARBENCH - PRODUCT TYPE PROFIT MEASURE QUERY */
SELECT /* DSS_09.SQL */
        S_NATION  AS NATION,
        EXTRACT(YEAR FROM OD_ORDERDATE) AS L_YEAR,
        CAST(SUM(OD_EXTENDEDPRICE*(1-OD_DISCOUNT)-P_SUPPLYCOST*OD_QUANTITY) AS DECIMAL(18,2)) AS SUM_PROFIT
FROM
        ssb2.PART,
        ssb2.SUPPLIER,
        ssb2.ORDER_DETAIL
WHERE
        S_SUPPKEY = OD_SUPPKEY
        AND S_SUPPKEY = OD_SUPPKEY
        AND P_PARTKEY = OD_PARTKEY
        AND P_SUPPKEY = OD_SUPPKEY
        AND P_NAME LIKE '%GREEN%'
GROUP BY
        NATION,
        L_YEAR
ORDER BY
        NATION,
        L_YEAR DESC;

