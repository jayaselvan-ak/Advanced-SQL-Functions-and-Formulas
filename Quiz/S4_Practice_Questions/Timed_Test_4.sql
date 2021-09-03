use upgrad;
# Write your code below
select employeeNumber, firstName, lastName
from employees
where employeeNumber like '1%'
and employeeNumber like '%2'
order by firstName;

use upgrad;
# Write your code below
select productCode, priceEach
from orderdetails
where productcode like '%\_32%'
order by priceEach desc;

use upgrad;
# Write your code below
select firstName
from employees
order by firstName desc;

use upgrad;
# Write your code below
select min(priceEach * quantityOrdered) as minAmount, 
max(priceEach * quantityOrdered) as maxAmount
from orderdetails;