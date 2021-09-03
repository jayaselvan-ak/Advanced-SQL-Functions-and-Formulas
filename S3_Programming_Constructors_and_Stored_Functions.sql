-- 2. Case Statements
select Market_fact_id, Profit,
(case
when Profit < -500 then 'Huge loss'
when Profit between -500 and 0 then 'Bearable loss'
when Profit between 0 and 500 then 'Decent profit'
else 'Great profit'
end) as Market_Fact_Report
from market_fact_full;

-- 3. Case Statements : Demonstration
with raw_file as
(
	with raw_data as
	(
		select c.cust_id, Customer_Name, round(sum(Sales)) as Total_Sales
		from market_fact_full m
		inner join cust_dimen c
		on m.Cust_id = c.Cust_id
		group by Cust_id
		order by Total_sales desc
    )
	select *,
	percent_rank() over(order by total_sales desc) as 'rank1'
    from raw_data
)
select *,
(case
when rank1 < 0.2 then 'GOLD'
when rank1 between 0.2 and 0.55 then 'SILVER'
else 'BRONZE'
end) as 'Customer_type'
from raw_file;

-- 4. Stored Functions
delimiter $$

create function productStatus(Profit int)
returns varchar(25) deterministic

begin
	declare Market_Fact_Report varchar(25);
	if Profit < -500 then
		set Market_Fact_Report = 'Huge loss';
	elseif (Profit >= -500 and Profit < 0) then
		set Market_Fact_Report = 'Bearable loss';
	elseif (Profit >=0 and Profit < 500) then
		set Market_Fact_Report = 'Decent profit';
	else
		set Market_Fact_Report = 'Great profit';
	end if;
		return Market_Fact_Report;
end $$

delimiter ;