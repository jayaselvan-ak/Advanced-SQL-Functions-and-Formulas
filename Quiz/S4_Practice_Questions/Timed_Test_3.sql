use upgrad;
# Write your code below
select firstName, lastName, jobTitle
from employees
where jobTitle != 'Sales Rep'
order by jobTitle, firstName;

use upgrad;
# Write your code below
select employeeNumber, extension
from employees
where extension like '%1'
order by employeeNumber;

use upgrad;
# Write your code below
select firstName, lastName
from employees
where lastName like '%er%'
order by firstName;

use upgrad;
# Write your code below
select lastName
from employees
order by lastName;