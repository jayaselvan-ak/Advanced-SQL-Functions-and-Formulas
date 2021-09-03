use upgrad;
# Write your code below
select employeeNumber, firstName, lastName
from employees
order by firstName;

use upgrad;
# Write your code below
select email
from employees
order by employeeNumber;

use upgrad;
# Write your code below
select firstName, lastName
from employees
where officeCode = 4
order by lastName;

use upgrad;
# Write your code below
select *
from employees
order by firstName;

use upgrad;
# Write your code below
select email
from employees
where officeCode = 6
and reportsTo = '1088'
order by employeeNumber;