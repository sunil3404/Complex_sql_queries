use complex_queries;

-- create table if not exists department (dept_id int, dept_name varchar(100), location varchar(100));
insert into department values(1, 'Admin', 'Bangalore');
-- insert into department values(2, 'HR', 'Bangalore');
-- insert into department values(3, 'IT', 'Bangalore');
-- insert into department values(4, 'Finance', 'Mumbai');
-- insert into department values(5, 'Market', 'Bangalore');
-- insert into department values(6, 'Sales', 'Mumbai'); 

-- Three types of subqueries

 -- 1) scalar subquery
 -- 2) Multiple row subquery
 -- 3) correlated subquery
 
 -- scalar subquery returns only one row and one column
 
 -- Ex 1 -> select salary of employees whose salary is more than the avg salary
SELECT *
FROM employee
WHERE salary > (select avg(salary) from employee);

select *
from employee e
join (select avg(salary) avg_sal from employee) emp_sal
	on e.salary > emp_sal.avg_sal;
    
-- multiple row subquery
-- Type 1) sub query which return multiple column and multiple row
-- Type 2) sub query which returns only one column and multiple row

-- Find the employees who earn the highest salary in each department
select max(salary), dept_name 
from employee group by dept_name;

select *
from employee
where (dept_name, salary) in (select dept_name, max(salary) 
								from employee group by dept_name);
                                
-- Find department who do not have employees
-- delete 
-- from department where dept_name="Admin" and dept_id=1; 
select * 
from department
where dept_name not in (select distinct dept_name from employee);

select * from complex_queries.department order by dept_id;


-- Correlated subquery
-- a query which is related to the outer query

-- Question -> find the eployee in each department who earn more than verage in that departmaent

select * 
from employee e1
where salary > (select avg(salary) from employee e2 where e2.dept_name = e1.dept_name) order by e1.dept_name; 


-- find department who do not have employees
select * 
from department d
where not exists(select 1 from employee e where d.dept_name = e.dept_name);


-- subquery inside a subquery
--  find stores whose sales were better than the averge sales accross all stores

-- create table if not exists sales(store_id int, store_name varchar(100), product_name varchar(100), quantity int, price int);
-- insert into sales values (1, 'Apple Store 1' , 'iPhone 13 Pro', 1, 1000);
-- insert into sales values (1, 'Apple Store 1' , 'Macbook Pro 14', 3, 6000);
-- insert into sales values (1, 'Apple Store 1' , 'AirPods Pro', 2, 500);
-- insert into sales values (2, 'Apple Store 2' , 'iPhone 13 Pro', 2, 2000);
-- insert into sales values (3, 'Apple Store 3' , 'iPhone 12 Pro', 1, 750);
-- insert into sales values (3, 'Apple Store 3' , 'Macbook Pro 14', 1, 2000);
-- insert into sales values (3, 'Apple Store 3' , 'Macbook Air', 4, 4400);
-- insert into sales values (3, 'Apple Store 3' , 'iPhone 13', 2, 1800);
-- insert into sales values (3, 'Apple Store 3' , 'AirPods Pro', 3, 750);
-- insert into sales values (4, 'Apple Store 4' , 'iPhone 12 Pro', 2, 1500);
-- insert into sales values (4, 'Apple Store 4' , 'MacBook pro 16', 1, 3500);

select * from sales;

-- 1) find total sales from each stores
-- 2) find avg sales for all the stores
select * 
from (select store_name, sum(price) as total_sales
	  from sales
	  group by store_name) sales
join (select avg(total_sales) as sales
	  from (select sum(price) as total_sales, store_name
	         from sales
			 group by store_name) x) avg_sales
	  on sales.total_sales > avg_sales.sales;
      
with sales as 
	(select sum(price) as total_sales, store_name
    from sales
	group by store_name)
select * 
from sales
join (select avg(total_sales) as sales
	  from sales x) avg_sales
	  on sales.total_sales > avg_sales.sales;
      

-- Using subqueries in select clause
-- Questioon -> fetch employees and add remarks to only those employees whose salary is more than the avg pay.

select * 
, (case when salary > (select avg(salary) from employee)
		then "Higher than avg salary"
	else
		null
	end) as "remarks"
from employee;

select * 
, (case when salary > avg_sales.sales
		then "Higher than avg salary"
	else
		null
	end) as "remarks"
from employee
cross join  (select avg(salary) as sales from employee) as avg_sales;


-- subquery in having clause
-- Question ->  find the stores who have sold more units  than the average units solde by all stores;

select store_name, sum(quantity)
from sales
group by store_name
having sum(quantity) > (select avg(quantity) from sales);

-- Subqueries on 
 -- Insert
 -- update
 -- delete
 
 -- Insert data into employee history table make sure no duplicate records.
 
 create table if not exists employee_history(emp_id int, emp_name varchar(100), dept_name varchar(100), salary int, location varchar(100));
 insert into employee_history
 select e.emp_id, e.emp_name, d.dept_name, e.salary, d.location
 from employee e
 join department d on e.dept_name = d.dept_name
 where not exists(select 1 
				  from employee_history eh 
                  where eh.emp_id = e.emp_id);
                  
-- UPDATE
-- Question -> Give 10% increment  to all employees in banglore location based on the maximum
-- salary earned by an emp in each dept. Only consider employees in employee_history table.




 

	

