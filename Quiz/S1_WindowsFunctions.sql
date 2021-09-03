-- The Rank Function
use upgrad;
# Write your code below
select quantityinstock, rank()
over(order by quantityinstock desc ) as quantityrank
from products;

-- Partitioning
use upgrad;
# Write your code below
select orderNumber, quantityOrdered * priceEach as individualOrderAmount,
sum(quantityOrdered * priceEach) over (partition by orderNumber) as totalOrderAmount
from orderdetails
order by orderNumber, individualOrderAmount desc;


-- Frames
use upgrad;
# Write your code below
select year, runs,
avg(runs) over(order by year rows 4 preceding)
from Kohli_Batting;

