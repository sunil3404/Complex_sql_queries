-- creating tables for join queries practice
create database if not exists join_queries;
use join_queries;

-- Employee Table
create table if not exists employee(emp_id varchar(10), emp_name varchar(100), 
									salary int, dept_id  varchar(10), 
                                    manager_id varchar(10));
                                    
insert into join_queries.employee values('E1', 'Rahul', 15000, 'D1', 'M1');
insert into join_queries.employee values('E2', 'Manoj', 15000, 'D1', 'M1');
insert into join_queries.employee values('E3', 'James', 55000, 'D2', 'M2');
insert into join_queries.employee values('E4', 'Michael', 25000, 'D2', 'M2');
insert into join_queries.employee values('E5', 'Ali', 20000, 'D10', 'M3');
insert into join_queries.employee values('E6', 'Robin', 35000, 'D10', 'M3');

-- Department table
create table if not exists department(dept_id varchar(10), dept_name varchar(40));

insert into department values('D1', 'IT');
insert into department values('D2', 'HR');
insert into department values('D3', 'Finance');
insert into department values('D4', 'Admin');

-- Manager Table
create table if not exists join_queries.manager(manager_id varchar(10), manager_name varchar(40), dept_id varchar(20));

insert into join_queries.manager values('M1', 'Prem', 'D3');
insert into join_queries.manager values('M2', 'Shripathi', 'D4');
insert into join_queries.manager values('M3', 'Nick', 'D1');
insert into join_queries.manager values('M4', 'Cory', 'D1');

-- Projects Table
create table if not exists join_queries.projects(project_id varchar(10), project_name varchar(50), team_member_id varchar(20));

insert into join_queries.projects values('P1', 'Data Migration','E1');
insert into join_queries.projects values('P1', 'Data Migration','E2');
insert into join_queries.projects values('P1', 'Data Migration','M3');
insert into join_queries.projects values('P2', 'ETL Tool','E1');
insert into join_queries.projects values('P2', 'ETL Tool','M4');

-- Company table
create table if not exists join_queries.company(company_id varchar(20), company_name varchar(40), location varchar(100));

insert into join_queries.company values('C001', 'sunil Solutions',  'India');

-- FAMILY Table
drop table join_queries.family;
create table if not exists join_queries.family(member_id varchar(20), fname varchar(40), age int,  parent_id varchar(20));
insert into join_queries.family values('F1', 'David', 4, 'F5');
insert into join_queries.family values('F2', 'Carol', 10, 'F5');
insert into join_queries.family values('F3', 'Michael', 12, 'F5');
insert into join_queries.family values('F4', 'Johnson', 36, '');
insert into join_queries.family values('F5', 'Maryam', 40, 'F6');
insert into join_queries.family values('F6', 'Stewart', 70, '');
insert into join_queries.family values('F7', 'Rakshit', 6, 'F4');
insert into join_queries.family values('F8', 'Asha', 8, 'F4');


