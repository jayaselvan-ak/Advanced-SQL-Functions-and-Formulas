use upgrad;
# Write your code below
select email
from employees
where officeCode = 6
or reportsTo = '1088'
order by firstName Desc;

use upgrad;
# Write your code below
select *
from employees
where officeCode between 2 and 4
order by firstName;

use upgrad;
# Write your code below
select extension, officeCode
from employees
where mod(officeCode, 2) = 1
order by firstName;

use upgrad;
# Write your code below
select extension, officeCode
from employees
where mod(officeCode, 2) = 0
order by firstName;

use upgrad;
# Write your code below
select *
from employees
where reportsTo is null
order by employeeNumber;