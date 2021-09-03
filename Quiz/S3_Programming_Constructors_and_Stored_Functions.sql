-- Case Statements
use upgrad;
# Write your code below
select name, salary,
(case
    when salary <= 2.5 then 'A'
    when salary > 2.5 and salary <= 5.0 then 'B'
    when salary > 5.0 and salary <= 10.0 then 'C'
    when salary > 10.0 then 'D'
end) as 'Tax Slab'
from salaries;

-- Case Statements : Demonstration
use upgrad;
# Write your code below
select name, salary,
(case
    when salary <= 2.5 then 0
    when salary > 2.5 and salary <= 5.0 then round((salary-2.5) * 5000)
    when salary > 5.0 and salary <= 10.0 then round((salary-5.0) * 20000) + 12500
    when salary > 10.0 then round((salary-10.0) * 30000) + 112500
end) as 'Tax Amount'
from Salaries;
