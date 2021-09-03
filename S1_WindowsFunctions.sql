select * from market_fact_full limit 10;

select * from cust_dimen limit 10;

select c.cust_id, c.Customer_Name
from market_fact_full m inner join
cust_dimen c
using(cust_id)
group by c.cust_id, c.Customer_Name
order by count(c.cust_id) desc;

-- 2. The Rank Function
-- rank
select Ord_id, round(Sales) as Rounded_Sales, Customer_Name,
rank() over(order by sales desc) as Sale_Amount_Rank
from market_fact_full
inner join cust_dimen
using (Cust_id)
where Customer_Name = 'AARON BERGMAN';

with rank_info as (
select Ord_id, round(Sales) as Rounded_Sales, Customer_Name,
rank() over(order by sales desc) as Sale_Amount_Rank
from market_fact_full
inner join cust_dimen
using (Cust_id)
where Customer_Name = 'AARON BERGMAN'
)
select Ord_id, Rounded_Sales, Customer_Name, Sale_Amount_Rank
from rank_info
where Sale_Amount_Rank <= 10;

-- 3. Rank vs. Dense Rank
select Ord_id, Discount, Customer_Name,
rank() over(order by Discount) as Discount_Rank,
dense_rank() over(order by Discount) as Discount_Dense_Rank
from market_fact_full
inner join cust_dimen
using (Cust_id)
where Customer_Name = 'AARON BERGMAN';

select Customer_Name, count(Ord_id) as Order_Count,
rank() over(order by count(Ord_id) desc) as Order_Count_Rank
from cust_dimen
inner join market_fact_full
using (Cust_id)
group by Customer_Name;

-- 4. Partitioning
with ship_table as
(
select ship_mode, month(ship_date) as shipment_month, count(*) number_shipments
from shipping_dimen
group by month(ship_date), Ship_Mode
order by ship_mode, month(ship_date)
)
select *,
rank() over (partition by ship_mode order by number_shipments desc) shipment_rank
from ship_table;

select Ord_id, Discount, Customer_Name,
row_number() over w as Discount_Row_Number,
rank() over w as discount_Rank,
dense_rank() over w as Discount_Dense_Rank
from market_fact_full
inner join cust_dimen
using (Cust_id)
where Customer_Name = 'AARON BERGMAN'
window w as (order by Discount desc);

-- 5. Frames
-- Calculate the moving average shipping costs of all orders shipped
select Shipping_cost, year(Ship_Date), month(ship_date),
avg(shipping_cost) over(order by year(ship_date), month(ship_date) rows unbounded preceding) 'Moving Average',
avg(shipping_cost) over(order by year(ship_date), month(ship_date) rows 9 preceding) 'Prev 10 Moving'
from market_fact_full
inner join shipping_dimen
using (Ship_id);