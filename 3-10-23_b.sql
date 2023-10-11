use cdac;
desc employees;
desc departments;
create table student(sno int primary key,sname varchar(45) not null,course varchar(50),marks int,fees int);
desc student;
create table m(m int primary key default 600);
desc m;
insert into m values (default),(700);
select * from m;
delete from m where m=600;
update m set m=default where m=700;
insert into m values (800);
select * from student;
insert into student values(100,'Reena','PGDAC',600,76000),(200,'Meena','PGDGI',700,76000);
desc student;
alter table student modify sname varchar(50) not null default 'Rita';
insert into student values(300,default,'PGDAC',600,76000);
alter table student modify course varchar(45) default 'PGDAC';

/* VIEWS */

create view vu80 as select employee_id,last_name,department_id,job_id from employees where department_id=8;
desc vu80;
select * from vu80;
drop view vu80;
create or replace view vu80 as select employee_id,last_name,department_id,job_id,phone_number from employees where department_id =9;
desc vu80;
select * from vu80;
create or replace view empdep as select e.employee_id,e.last_name,e.salary,d.department_name from employees e inner join departments d on(e.department_id=d.department_id) where e.salary between 5000 and 10000;

select * from empdep;
use information_schema;
show tables;
desc views;
select * from views where table_schema='CDAC';
use cdac;
desc view_table_usage;
select * from view_table_usage where view_schema='CDAC';
insert into vu80 values(601,'Maria',9,6,'515-123-6789');
desc employees;
desc student;
create or replace view vustu as select sno,sname,course from student where course='PGDAC';
select * from vustu;
insert into vustu values(400,'Rita','PGDAC');
select * from student;
insert into vustu values(700,'John',default);
create or replace view vu10 as
select d.department_name,count(e.employee_id) 
from employees e inner join departments d
on(e.department_id=d.department_id)
group by d.department_name;

desc vu10;
select * from vu10;
create or replace view vu7 
as select employee_id,last_name,salary,department_id,manager_id from employees where department_id=7
with check option;
select * from vu7;
insert into vu7 values(900,'Green',34000,7,102);
update vu7 set last_name='Green' where employee_id=204;
select * from employees where department_id=7;
select department_id
from employees
UNION 
select department_id
from departments;
select distinct(salary) from employees order by salary desc limit 4,1;
select * from employees limit 2,42;
create table a(a int primary key auto_increment);
insert into a values(default);
select * from a;
alter table a auto_increment=10;
insert into a values(200);
select last_insert_id();
show indexes from student;
show indexes from employees;
create index emp_idx on employees(last_name);
select * from employees where last_name='Kochhar';
select * from employees where first_name='Neena';