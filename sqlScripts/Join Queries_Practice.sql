-- fetch employee name and department name they belong to.
use join_queries;

-- Inner Join / join
select e1.emp_name, d1.dept_name
from employee e1
join department d1 on e1.dept_id = d1.dept_id;

-- Question fetch all the employees from employee and their department name
-- left join -> inner join  + all rows from left table
select e1.emp_name, d1.dept_name
from employee e1
left join department d1 on e1.dept_id = d1.dept_id;

-- Question fetch all the department from department and their employee  name
-- rigth join -> inner join  + all rows from right table
select e1.emp_name, d1.dept_name
from employee e1
right join department d1 on e1.dept_id = d1.dept_id;

-- fetch all the employees their manager, their department and projects they work on 
select e.emp_name, d.dept_name, m.manager_name, p.project_name
from employee e
left join department d on e.dept_id = d.dept_id
join manager m on m.manager_id = e.manager_id
left join projects p on e.emp_id = p.team_member_id;

-- Full Join -> inner join + records from right + records from left
select e.emp_name, d.dept_name
from employee e
left join department d on e.dept_id = d.dept_id
UNION
select e.emp_name, d.dept_name
from employee e
right join department d on e.dept_id = d.dept_id;

-- Cross join returns cartesian produc
select e.emp_name, d.dept_name
from employee e
cross join department d
where e.emp_name = 'Rahul';

-- Importance of cross join when no common columns in the tables.
-- write query to fetch employee name and their corresponding department name
-- Also make sure to display the company name  and the company location corresponding to each employee

select e.emp_name , d.dept_name, c.company_name, c.location
from employee e
left join department d on e.dept_id = d.dept_id
cross join company c;

-- natural Join -> join condition decided by sql and not by user 
-- if no join conditions matched than the sql does a "CROSS JOIN"
select e.emp_name , d.dept_name
from employee e
natural join department d;

-- Change the dept_id column name on department table to id
alter table department rename column dept_id to id; 
-- here we can see that natural join will act as cross join as  the column name is changed from dept_id to id.

select e.emp_name , d.dept_name
from employee e
natural join department d;

-- change the column name back to dept_id
alter table department rename column id to dept_id; 

-- SELF JOIN
-- query to fetch child name and their age corresponding to their parent name and parent id
select child.fname as child_name, child.age as child_age, parent.fname as  parent_name, parent.age as parent_age
from family as child
left join family as parent on child.parent_id = parent.member_id