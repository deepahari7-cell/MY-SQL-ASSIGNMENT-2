            /*MySQL Assignment 2 – Querying Data*/

CREATE database IF NOT exists employee_db;
Use employee_db;
SHOW databases;
CREATE TABLE IF NOT exists Departments
(
department_id int primary key,
department_Name VARCHAR(100) NOT null unique
);

CREATE TABLE IF NOT exists Location
(
Location_id int primary key,
Location varchar(30) not null
);

CREATE TABLE IF NOT exists employees
(
employee_id int auto_increment unique,
employee_Name VARCHAR(50) NOT null,
Gender ENUM("M","F"),
Age INT CHECK(Age>=18),
hire_date DATE default (current_date()),
designation varchar(100),
department_id INT,
location_id INT,
Salary decimal(10,2),
primary key(employee_id,department_id,location_id),
constraint fk_departmnet foreign key(department_id) references departments(department_id)
ON DELETE cascade
ON update cascade,
constraint fk_location foreign key(location_id) references location(location_id)
ON DELETE cascade
ON update cascade
);

Insert into departments(department_id,department_name)
values ("1","HR"),("2","ACCOUNTS"),("3","FINANCE"),("4","DOCUMENTATION");
select * from departments;

Insert into location(location_id,Location)
values ("1","Madurai"),("2","Chennai"),("3","Salem"),("4","Trichy"),
("5","Tiruppur"),("6","ooty"),("7","kanniyakumari"),("8","sivagangai"),("9","coimbatore"),("10","namakkal");
select * from location;

insert into employees(employee_Name,Gender,Age,hire_date,designation,department_id,location_id,Salary)
values ("Raja","M","30","2024-08-25","Analyst","2","4","45000"),
("Mani","M","35","2018-07-15","HR Manager","1","3","65000"),
("Kala","F","38","2015-08-12",null,"4","2","52000"),
("Kavi","F","43","2012-05-10","Analyst","1","5","80000"),
("sami","F","42","2015-06-01",null,"4","1","77000"),
("Kiruba","F","38","2016-03-03","Analyst","3","7","55000"),
("Kannan","M","45","2018-09-30","Finance Manager","3","6","85000"),
("Deva","M","26","2015-10-16",null,"1","9","68000"),
("Muthu","M","31","2019-02-12",null,"4","10","35000"),
("Mithu","F","28","2020-06-25","Exportofficer","4","8","70000");

select * from employees;

/*Distinct Values*/

select distinct salary from employees;

/*using Alias (AS)*/

Select age as Employee_Age,salary as Employee_Salary from employees;

/*using Where Clause & Operators*/

select employee_name,hire_date, salary from employees
where salary>"50000" and hire_date < "2016-01-01";

SET SQL_SAFE_UPDATES = 0;
Update employees
set designation= "Data Scientist"
where designation is null or designation=" ";

  /* order by*/

select * from employees order by department_id ASC, salary DESC;

/*limit	*/

select * from employees
 where YEAR(hire_date)=2018
 ORDER BY hire_date ASC LIMIT 5;

/*Aggregate Functions */

SELECT SUM(SALARY) AS FINANCE_department_total_SALARY FROM employees
 WHERE department_id="3";
 
 SELECT MIN(AGE) AS Minimum_Age from employees;

/*Group by clause*/

select location_id,max(salary)
from employees
group by location_id;

select designation,avg(salary) as Avg_Salary
from employees
where designation="Analyst"
group by designation;

/*Having clause*/

select department_id,count(*) as employee_Count from employees
group by department_id
having employee_count<3;

select location_id, Gender, avg(age) as Average_Age
from employees
where gender="F"
group by location_id
having Average_age <30;


/*Joins*/
/*Inner join*/
select e.employee_name,e.designation,d.department_name
from employees as e
inner join departments as d on e.department_id=d.department_id;

/*Left join*/
select d.department_name, count(e.employee_id) as total_employees
from departments as d
left join employees as e on d.department_id=e.department_id
group by d.department_id;

/*Right join*/
select e.employee_name,l.location
from employees as e
right join location as l on e.location_id=l.location_id;