-- using default substitutions
/* Query 21 - Var_0 Rev_01 - TPC-H/TPC-R  The Suppliers Who Kept Orders Waiting Query */
\timing
SELECT
        S_NAME,
        COUNT(*) AS NUMWAIT
FROM
        tpch.SUPPLIER,
        tpch.LINEITEM L1,
        tpch.ORDERS,
        tpch.NATION
WHERE
        S_SUPPKEY = L1.L_SUPPKEY
        AND O_ORDERKEY = L1.L_ORDERKEY
        AND O_ORDERSTATUS='F'
        AND L1.L_RECEIPTDATE > L1.L_COMMITDATE
        AND EXISTS (
                SELECT
                        *
                FROM 
                        tpch.LINEITEM L2
                WHERE
                        L2.L_ORDERKEY = L1.L_ORDERKEY
                        AND L2.L_SUPPKEY <> L1.L_SUPPKEY
        )
        AND NOT EXISTS (
                SELECT
                        *
                FROM 
                        tpch.LINEITEM L3
                WHERE
                        L3.L_ORDERKEY = L1.L_ORDERKEY
                        AND L3.L_SUPPKEY <> L1.L_SUPPKEY
                        AND L3.L_RECEIPTDATE > L3.L_COMMITDATE
        )
        AND S_NATIONKEY = N_NATIONKEY
        AND N_NAME = 'SAUDI ARABIA'
GROUP BY
        S_NAME
ORDER BY
        NUMWAIT DESC,
        S_NAME
LIMIT 100;

\timing