/* Query 08 - Var_0 Rev_01 - SSBench National Market Share Query */
SELECT /* dss_08.sql */
        EXTRACT(YEAR FROM LO_ORDERDATE) AS YEAR1,
        SUM(CASE
                WHEN S_NATION = 'BRAZIL'  
                THEN CAST(LO_EXTENDEDPRICE*(1-LO_DISCOUNT) AS DECIMAL(18,2))
                ELSE 0
        END) / CAST(SUM(LO_EXTENDEDPRICE*(1-LO_DISCOUNT)) AS DECIMAL(18,2)) AS MKT_SHARE
FROM 
        tpch.PART,
        tpch.SUPPLIER,
        tpch.LINEORDER,
        tpch.CUSTOMER
WHERE
        P_PARTKEY = LO_PARTKEY
        AND S_SUPPKEY = LO_SUPPKEY
        AND LO_ORDERKEY = LO_ORDERKEY
        AND LO_CUSTKEY = C_CUSTKEY
        AND C_REGION = 'AMERICA'
        AND LO_ORDERDATE BETWEEN '1995-01-01' AND '1996-12-31'
        AND P_TYPE = 'ECONOMY ANODIZED STEEL'
GROUP BY
        YEAR1
ORDER BY
        YEAR1;

