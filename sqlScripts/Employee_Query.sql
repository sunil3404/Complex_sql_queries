-- Declare @ID int;
set @ID=7;

-- -- Fetch 2nd highest salary from employee table 
-- select max(salary)
-- from Employee
-- where salary < (select max(salary) from Employee);

-- -- Fetch Nth highest salary using sub query
-- -- select salary
-- -- from (select distinct top 2 salary
-- -- from Employee order by salary desc) result
-- -- order by salary

-- --  Find nth highest salary using CTE(Common table expression)
-- with result as (
-- select salary, fname, lname, row_number() over(order by salary desc) as denserank from Employee
-- )
-- select fname, lname, salary from result where denserank = 4;

-- Display Org Hieararchy

with EmployeeCTE as 
( 
	select id, emp_name, manager_id 
    from employee.Employees 
    where id=@ID
    
    union All

    select E1.id, E1.emp_name, E1.manager_id
    from Employees E1
    Join Employees E2 on E1.id = E2.id
)
select EmployeeCTE.id, EmployeeCTE.emp_name, EmployeeCTE.manager_id 
from EmployeeCTE
join Employees E1 on E1.id = EmployeeCTE.manager_id 
