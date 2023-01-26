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
    where department_id = 80;--����ų� �����ϰų� �Ѵ�.
    
desc empvu80

--����: 50�� �μ������� ���, �̸�, �μ���ȣ�� ������ DEPT50 view �� ������.
-- view ������ EMPNO, EMPLOYEE, DEPTNO�̴�.

create view DEPT50 as
    select employee_id EMPNO, last_name EMPLOYEE, department_id DEPTNO
    from employees
    where department_id = 50;
--��
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
--view ������ ������ �Ҽ� �ִ�.

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
values(300, 'Marketing');--teams���̺� ����

select count(*) from teams;

create or replace view team50 as
    select * 
    from teams
    where team_id = 50
    with check option;--where �� ������ �����ϸ� �߰�����
    
insert into team50 values(50, 'IT Support');

select count (*) from teams;
insert into team50 values(301, 'IT Support');

create or replace view empvu10(employee_num, employee_name, job_title) as
    select employee_id, last_name, job_id
    from employees
    where department_id = 10
    with read only; --select �� �����ϰ� �����.
    
insert into empvu10 values(501, 'abel', 'Sales');

select * from empvu10;

--�߿� hr�� ���

drop sequence team_teamid_seq;

create sequence team_teamid_seq;
--���������� ����

select team_teamid_seq.nextval from dual;--�����Ҷ����� �����Ͱ��� 1�� �����Ѵ�.
select team_teamid_seq.currval from dual;--�����Ҷ��� �����Ͱ��� �д´�.

insert into teams
values(team_teamid_seq.nextval, 'Marketing');

select * from teams
where team_id < 5;

create sequence x_xix_seq
    start with 10 --����
    increment by 5 --����
    maxvalue 20 --�ִ밪
    nocache --�����͸� �̸� �غ��Ѵ�.
    nocycle; --�ִ밪�� �����ϸ� ��
    
select x_xix_seq.nextval from dual;    
--sequence ���� 
-- ����: dept ���̺��� DEPARTMENT_ID Į���� field value �� �� sequence �� ������.
-- sequence�� 400�̻�, 1000���Ϸ� ���� 10�� ����
drop sequence dept_deptid_seq;

create sequence dept_deptid_seq
    start with 400
    increment by 10
    maxvalue 1000
    nocache
    nocycle;
    
select dept_deptid_seq.nextval from dual;
select dept_deptid_seq.currval from dual;

--����: �� sequence �� �̿��ؼ�, dept ���̺��� Education �μ��� insert�϶�.
insert into dept(department_id, department_name)
values(dept_deptid_seq.nextval, 'Education');

commit;

drop index emp_lastname_idx;

create index emp_lastname_idx
on employees(last_name);--lastname�����͸� �����ؿ´�.

select last_name, rowid
from employees;--oracle���� row�� �����ϴ� ����� rowid�̴�.

select last_name
from employees
where rowid = 'AAAEAbAAEAAAADNABe';

select index_name, index_type, table_owner, table_name
from user_indexes;

--����: dept ���̺��� department_name �� ���� index�� ������.
create index dept_deptname_idx
on dept(department_name);

drop synonym team;

create synonym team
for departments;

select * from team;

select * from emps;
--����: EMPLOYEES ���̺� EMPS synonym �� ������

create synonym emps
for employees;
