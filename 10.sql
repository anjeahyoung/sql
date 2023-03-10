
drop table hire_dates;

create table hire_dates (
emp_id number(8),
hire_date date default sysdate); --기본값을 null이 아닌 다른 값으로 사용

--date dictionary mata data를 저장하는 곳
select tname
from tab;

--과제: 쓰레기가 조회안되게 하라.
select tname
from tab
where length(tname) < 20;

select tname
from tab
where tname not like 'BIN%';

select tname
from tab 
where tname not like '%$0'; 

insert into hire_dates values(1,to_date('2025/12/21'));
insert into hire_dates values(2, null);
insert into hire_dates(emp_id) values(3);

select * from hire_dates;

commit;

--drop table autocommit
--create autocommit
--따라서 rollback이 안된다.

--DCL (Data Control Language

drop table employees cascade constraints;

create table employees (
employee_id number(6) constraint emp_empid_pk primary key,
first_name varchar2(20),
last_name varchar2(25) constraint emp_lastname_nn not null,
email varchar2(25) constraint emp_email_nn not null
                    constraint emp_email_uk unique,
phone_number varchar2(20),
hire_date date constraint emp_hiredate_nn not null,
job_id varchar2(10) constraint emp_jobid_nn not null,
salary number(8) constraint emp_salary_ck check(salary > 0),
commission_pct number(2, 2),
manager_id number(6) constraint emp_managerid_fk references employees(employee_id),
department_id number(4) constraint emp_dept_fk references hr.departments(department_id));


create table gu (
gu_id number(3) primary key,
gu_name char(9) not null);

create table dong(
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete cascade);
--on delete cascade 키가 사라지면 같이 사라짐

create table dong2(
dong_id number(4) primary key,
dong_name varchar2(12) not null,
gu_id number(3) references gu(gu_id) on delete set null);
--on delete set null 삭제하면 null이 들어감
insert into gu values(100, '강남구');
insert into gu values(200, '노원구');

insert into dong values(5000, '압구정동', null);
insert into dong values(5001, '삼성동', 100);
insert into dong values(5002, '역삼동', 100);
insert into dong values(6001, '상계동', 200);
insert into dong values(6002, '중계동', 200);

insert into dong2 
select * from dong;

delete gu
where gu_id = 100;

select * from dong;
select * from dong2;

commit;

create table a (
aid number(1) constraint a_aid_pk primary key);

create table b (
bid number(2),
aid number(1),
constraint b_aid_fk foreign key(aid) references a(aid));

insert into a values(1);
insert into b values(31, 1);
insert into b values(32, 9);--9는 a테이블에 없기때문에 오류

alter table b disable constraint b_aid_fk;--fk를 재운다. b테이블테스트를 위해 사용

alter table b enable constraint b_aid_fk;--fk를 기동시킨다. 데이터검사도중 fk에 걸리면 오류
alter table b enable novalidate constraint b_aid_fk;--fk를 기동시킨다 데이터검사는 하지 않는다.

insert into b values(33, 8);

create table sub_departments as
    select department_id dept_id, department_name dept_name
    from hr.departments;
--departments테이블에서 데이터를 가지고온다.
select * from sub_departments;

create table users(
user_id number(3));
desc users

alter table users add(user_name varchar2(10));
desc users

alter table users modify(user_name number(7));
desc users
--테이블의 구조를 바꾼다.
alter table users drop column user_name;
desc users


insert into users values(1);

alter table users read only;--읽기 전용 변경 불가
insert into users values(2);

alter table users read write;--변경가능
insert into users values(2);

commit;

