-- USING 12345 AS A SEED TO THE RNG
/* QUERY 22 - STARBENCH - GLOBAL SALEDS OPPORTUNITY QUERY */
SELECT /* DSS_22.SQL */
        CNTRYCODE,
        COUNT(*) AS NUMCUST,
        SUM(C_ACCTBAL) AS TOTACCTBAL
FROM    (
        SELECT
                SUBSTRING(C_PHONE,1,2) AS CNTRYCODE,
                C_ACCTBAL
        FROM
                CUSTOMER
        WHERE
                SUBSTRING(C_PHONE,1,2) IN
                        ('42','26','43','22','30','37','35')
                AND C_ACCTBAL > (
                        SELECT
                                AVG(C_ACCTBAL)
                        FROM
                                CUSTOMER
                        WHERE
                                C_ACCTBAL > 0.00
                                AND SUBSTRING(C_PHONE,1,2) IN
					('42','26','43','22','30','37','35')
                )
                AND NOT EXISTS (
                        SELECT
                                *
                        FROM
                                ORDER_DETAIL
                        WHERE
                                OD_CUSTKEY=C_CUSTKEY
                )
        ) AS CUSTSALE
GROUP BY
        CNTRYCODE
ORDER BY
        CNTRYCODE;
