use upgrad;
# Write your code below
select sum(quantityOrdered * priceEach) as 'totalAmount',
avg(quantityOrdered * priceEach) as 'avgAmount'
from orderDetails;

use upgrad;
# Write your code below
select round(sum(quantityOrdered * priceEach)) as 'totalAmount',
round(avg(quantityOrdered * priceEach)) as 'avgAmount'
from orderDetails;

use upgrad;
# Write your code below
select officeCode,
count(employeeNumber) as no_Of_Employees
from employees
group by officeCode
order by officeCode;

use upgrad;
# Write your code below
select round(sum(quantityOrdered * priceEach)) as 'roundedAmount',
orderLineNumber
from orderDetails
group by orderLineNumber
order by roundedAmount desc;

use upgrad;
# Write your code below
select round(sum(quantityOrdered * priceEach)) as 'roundedAmount',
orderLineNumber
from orderDetails
group by orderLineNumber
having roundedAmount < 100000
order by roundedAmount desc;