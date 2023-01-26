create view empvu80 as
    select employee_id, last_name, department_id
    from employees
    where department_id = 80;
    
desc empvu80

select * from empvu80;

select * from (
    select employee_id, last_name, department_id
    from employees
    where department_id = 80);
    
create or replace view empvu80 as
    select employee_id, job_id
    from employees
    where department_id = 80;--만들거나 변경하거나 한다.
    
desc empvu80

--과제: 50번 부서원들의 사번, 이름, 부서번호로 구성된 DEPT50 view 를 만들어라.
-- view 구조는 EMPNO, EMPLOYEE, DEPTNO이다.

create view DEPT50 as
    select employee_id EMPNO, last_name EMPLOYEE, department_id DEPTNO
    from employees
    where department_id = 50;
--답
create or replace view dept50(empno, employee, deptno) as
    select employee_id, last_name, department_id
    from employees
    where department_id = 50;
desc DEPT50
select * from dept50;

create or replace view dept50(empno, employee, deptno) as
    select employee_id, last_name, department_id
    from employees
    where department_id = 50
    with check option constraint dept50_ck;
--view 에서도 제한을 할수 있다.

create table teams as
    select department_id team_id, department_name team_name
    from hr.departments;
    
create view team50 as
    select *
    from teams
    where team_id = 50;
    
select * from team50;

select count(*) from teams;

insert into team50
values(300, 'Marketing');--teams테이블에 저장

select count(*) from teams;

create or replace view team50 as
    select * 
    from teams
    where team_id = 50
    with check option;--where 절 조건을 만족하면 추가가능
    
insert into team50 values(50, 'IT Support');

select count (*) from teams;
insert into team50 values(301, 'IT Support');

create or replace view empvu10(employee_num, employee_name, job_title) as
    select employee_id, last_name, job_id
    from employees
    where department_id = 10
    with read only; --select 만 가능하게 만든다.
    
insert into empvu10 values(501, 'abel', 'Sales');

select * from empvu10;

--중요 hr시 사용

drop sequence team_teamid_seq;

create sequence team_teamid_seq;
--순차적으로 증가

select team_teamid_seq.nextval from dual;--실행할때마다 데이터값이 1씩 증가한다.
select team_teamid_seq.currval from dual;--실행할때의 데이터값을 읽는다.

insert into teams
values(team_teamid_seq.nextval, 'Marketing');

select * from teams
where team_id < 5;

create sequence x_xix_seq
    start with 10 --초항
    increment by 5 --공차
    maxvalue 20 --최대값
    nocache --데이터를 미리 준비한다.
    nocycle; --최대값에 도달하면 끝
    
select x_xix_seq.nextval from dual;    
--sequence 수열 
-- 과제: dept 테이블의 DEPARTMENT_ID 칼럼의 field value 로 쓸 sequence 를 만들어라.
-- sequence는 400이상, 1000이하로 생성 10씩 증가
drop sequence dept_deptid_seq;

create sequence dept_deptid_seq
    start with 400
    increment by 10
    maxvalue 1000
    nocache
    nocycle;
    
select dept_deptid_seq.nextval from dual;
select dept_deptid_seq.currval from dual;

--과제: 위 sequence 를 이용해서, dept 테이블에서 Education 부서를 insert하라.
insert into dept(department_id, department_name)
values(dept_deptid_seq.nextval, 'Education');

commit;

drop index emp_lastname_idx;

create index emp_lastname_idx
on employees(last_name);--lastname데이터를 복사해온다.

select last_name, rowid
from employees;--oracle에서 row를 구분하는 방법은 rowid이다.

select last_name
from employees
where rowid = 'AAAEAbAAEAAAADNABe';

select index_name, index_type, table_owner, table_name
from user_indexes;

--과제: dept 테이블의 department_name 에 대해 index를 만들어라.
create index dept_deptname_idx
on dept(department_name);

drop synonym team;

create synonym team
for departments;

select * from team;

select * from emps;
--과제: EMPLOYEES 테이블에 EMPS synonym 을 만들어라

create synonym emps
for employees;
