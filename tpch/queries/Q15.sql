-- using 1472396759 as a seed to the RNG

create view revenue0 (supplier_no, total_revenue) as
	select
		l_suppkey,
		sum(l_extendedprice * (1 - l_discount))
	from
		tpch.lineitem
	where
		l_shipdate >= date '1997-05-01'
		and l_shipdate < date '1997-05-01' + interval '3' month
	group by
		l_suppkey;


select
	tpch.s_suppkey,
	tpch.s_name,
	tpch.s_address,
	tpch.s_phone,
	tpch.total_revenue
from
	supplier,
	revenue0
where
	s_suppkey = supplier_no
	and total_revenue = (
		select
			max(total_revenue)
		from
			revenue0
	)
order by
	s_suppkey;

drop view revenue0
limit 1;
