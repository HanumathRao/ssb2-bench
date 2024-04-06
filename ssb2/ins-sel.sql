insert into ssb2.SUPPLIER
select
s.S_SUPPKEY,
s.S_NAME,
s.S_ADDRESS,
n.N_NAME,
r.R_NAME,
s.S_PHONE,
s.S_ACCTBAL,
s.S_COMMENT
from tpch.SUPPLIER as s inner join tpch.NATION as n on s.S_NATIONKEY = n.N_NATIONKEY
inner join tpch.REGION as r on n.N_REGIONKEY = r.R_REGIONKEY; 

insert into ssb2.CUSTOMER
select
c.C_CUSTKEY,
c.C_NAME,
c.C_ADDRESS,
n.N_NAME,
r.R_NAME,
c.C_PHONE,
c.C_ACCTBAL,
c.C_MKTSEGMENT
from tpch.CUSTOMER as c inner join tpch.NATION as n on c.C_NATIONKEY = n.N_NATIONKEY
inner join tpch.REGION as r on n.N_REGIONKEY = r.R_REGIONKEY;

insert into ssb2.PART
select
p.P_PARTKEY,
p.P_NAME,
p.P_MFGR,
p.P_BRAND,
p.P_TYPE,
p.P_SIZE,
p.P_CONTAINER,
p.P_RETAILPRICE,
ps.PS_SUPPKEY,
ps.PS_AVAILQTY,
ps.PS_SUPPLYCOST
from tpch.PART p inner join tpch.PARTSUPP ps on p.P_PARTKEY = ps.PS_PARTKEY; 

insert into ssb2.LINEORDER
select
l.L_ORDERKEY,
l.L_PARTKEY,
l.L_SUPPKEY,
l.L_LINENUMBER,
l.L_QUANTITY,
l.L_EXTENDEDPRICE,
l.L_DISCOUNT,
l.L_TAX,
l.L_RETURNFLAG,
l.L_LINESTATUS,
l.L_SHIPDATE,
l.L_COMMITDATE,
l.L_RECEIPTDATE,
l.L_SHIPINSTRUCT,
l.L_SHIPMODE,
o.O_CUSTKEY,
o.O_ORDERSTATUS,
o.O_TOTALPRICE,
o.O_ORDERDATE,
o.O_ORDERPRIORITY,
o.O_CLERK,
o.O_SHIPPRIORITY,
o.O_COMMENT
from tpch.LINEITEM l inner join tpch.ORDERS o on l.L_ORDERKEY = o.O_ORDERKEY; 
