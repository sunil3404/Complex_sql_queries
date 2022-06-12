-- COMMON TABLE EXPRESSION TABLES

-- create database if not exists SQL_CTE;

-- create table if not exists employee(emp_id int, emp_name varchar(30), salary int);

-- insert into employee values(101, 'Mohan', 40000);
-- insert into employee values(102, 'James', 50000);
-- insert into employee values(103, 'Rohan', 60000);
-- insert into employee values(104, 'Carol', 70000);
-- insert into employee values(105, 'Alice', 80000);
-- insert into employee values(106, 'Jimmy', 90000);

-- Fetch salary of all employees who earn more than avg salary of all the employees.
use employee;

with average_salary (avg_sal) as 
	(select avg(salary) from employee)
select *
from employee e, average_salary av
where salary > av.avg_sal;

use complex_queries;
--  find stores whose sales were better than average sales accross all stores

-- 1) Total sales per each store --> Total Sales
select s.store_id, sum(price) as total_sales_per_store
from complex_queries.sales s
group by s.store_id;

-- 2) find avg wrt all the stores --> Avg Sales
select avg(total_sales_per_store) as average_sales_for_all_stores
from (select s.store_id, sum(price) as total_sales_per_store
from complex_queries.sales s
group by s.store_id) x;

-- 3) Find stores where Total_sales > Avg Sales
select *
from (select s.store_id, sum(price) as total_sales_per_store
	  from complex_queries.sales s
	  group by s.store_id) total_sales
Join
	(select avg(total_sales_per_store) as average_sales_for_all_stores
	from (select s.store_id, sum(price) as total_sales_per_store
	from complex_queries.sales s
	group by s.store_id) x) avg_sales
on total_sales.total_sales_per_store >  avg_sales.average_sales_for_all_stores;

-- Writing above queries Using With Clause
with Total_sales(store_id, total_sales_per_store) as(
		select s.store_id, sum(price) as total_sales_per_store
		from complex_queries.sales s
		group by s.store_id),
      avg_sales(average_sales_for_all_stores) as(
		select avg(total_sales_per_store) as average_sales_for_all_stores
        from Total_sales)

select * 
from Total_sales as ts
join avg_sales as av
on ts.total_sales_per_store >  av.average_sales_for_all_stores
      
