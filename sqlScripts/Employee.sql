create database if not exists Employee;
use Employee;

drop table if exists Employee;
create table if not exists Employee(id int, fname varchar(100), lname varchar(100), gender varchar(30), salary int);

insert into Employee values(1, "Ben", "Hoskins", "Male", 70000);
insert into Employee values(2, "Mark", "Hastings", "Male", 60000);
insert into Employee values(3, "Steve", "Pound", "Male", 45000);
insert into Employee values(4, "Ben", "Hoskins", "Male", 70000);
insert into Employee values(5, "Philip", "Hastings", "Male", 45000);
insert into Employee values(6, "Mary", "Lambeth", "Female", 30000);
insert into Employee values(7, "Valarie", "Vikings", "Female", 35000);
insert into Employee values(8, "John", "Stanmore", "Male", 80000);

-- Get Org hierarchy from Employees table
drop table if exists Employees;
create table if not exists Employees(id int, emp_name varchar(100), manager_id varchar(100));

insert into Employees values(1, "John", 5);
insert into Employees values(2, "Mark", 8);
insert into Employees values(3, "Steve", 8);
insert into Employees values(4, "Tom", 3);
insert into Employees values(5, "Lara", 8 );
insert into Employees values(6, "Simon", 2);
insert into Employees values(7, "David", 4);
insert into Employees values(8, "Ben", null);
insert into Employees values(9, "Stacy", 2 );
insert into Employees values(10, "Sam", 5);

-- select * from Employee limit 2;