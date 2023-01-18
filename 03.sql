-- single function
desc dual
select * from dual;

select lower('SQL Course')
from dual;--�Ķ���͸� �ҹ��ڷ� ��ȯ

select upper('SQL Course')
from dual;--�Ķ���͸� �빮�ڷ� ��ȯ

select initcap('SQL Course')
from dual;--�ܾ� �ձ��ڸ� �빮�ڷ� ��ȯ

select last_name
from employees 
where last_name = 'higgins';

select last_name
from employees 
where last_name = 'Higgins';

select last_name
from employees 
where lower(last_name) = 'higgins';

select concat('Hello', 'World')
from dual;--�ʵ带 ��ģ��.

select substr('HelloWorld', 2, 5)
from dual;--�ε����� 2~5���̿� �ִ� ���ڸ� ������ �´�.elloW

select substr('Hello', -1, 1)
from dual;

select length('Hello')
from dual;--���ڼ��� �ľ��Ѵ�.

select instr('Hello', 'l') 
from dual;--���ʺ��� 2��° �ʵ尪�� ã�Ƽ� �ε������� ����Ѵ�.

select instr('Hello', 'w')
from dual;

select lpad(salary, 5, '*')
from employees; --�ڸ����� 5�� �����. ������� *�� ä���.

select rpad(salary, 5, '*')
from employees;

select replace('JACK and JUE', 'J', 'BL')
from dual; --�ʵ� 2���� �ʵ尪�� 3�� �ʵ尪���� �����Ѵ�.

select trim('H' from 'Hello')
from dual;

select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;

--����: �� query ���� ' '�� trim ������, ������ Ȯ���� �� �ְ� ��ȸ�϶�.

select '|' || trim(' ' from ' Hello ') || '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
    from employees
where substr(job_id, 4) = 'PROG';--�ε��� 4��°���� ����������


--����: �� query����, where ���� like�� refactoring �϶�
select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
    from employees
where job_id like '%PROG';

--����: �̸��� J�� A�� M���� �����ϴ� ������� �̸�, �̸��� ���ڼ��� ��ȸ�϶�.
--      �̸��� ù���ڴ� �빮��, �������� �ҹ��ڷ� ����Ѵ�.
--initcap length 

select initcap(last_name), length(last_name)
from employees
where last_name like 'J%' or
    last_name like 'A%' or
    last_name like 'M%';
    
select round(45.926, 2)
from dual; -- �ݿø�

select trunc(45.926, 2)
from dual; --����

select round(45.923, 0), round (45.923)
from dual;

select trunc(45.926,0), trunc (45.926)
from dual;

--����: ������� �̸�, ����, 15.5% �λ�� ����(New Salary, ����), �λ��(Increase)�� ��ȸ�϶�

select last_name, salary,
round(salary * 1.155) "New Salary",
round(salary * 0.155) "Increase"
from employees;
 
select last_name salary, trunc(salary * 1.155) "initcap(new_salary)", salary * 0.155 "Increase"
from employees;

select sysdate
from dual;

select sysdate + 1
from dual;

select sysdate - 1
from dual;

select sysdate - sysdate
from dual;

select last_name, sysdate - hire_date
from employees
where department_id = 90;

select months_between('2023/12/31', '2022/12/31')
from dual;

select add_months('2023/01/18', 3)
from dual;

select next_day('2023/01/18', 4)
from dual;-- 1=�Ͽ��� ���� ��¥�κ��� ���� ����� ������ �˷��ش�.

select next_day('2023/01/18', 'thursday')
from dual;

select next_day('2023/01/18', 'thu')
from dual;

select last_day('2023/01/18')
from dual;--���� ���� ���������� �˷��ش�.

--����: 20�� �̻� ������ ������� �̸�, ù�������� ��ȸ�϶�.
--      ������ �ſ� ���Ͽ� �����Ѵ�.

select last_name, last_day(hire_date)
from employees
where months_between(sysdate, hire_date) >= 20*12;

--����: ������� �̸�, ����, ���� �׷����� ��ȸ�϶�.
--      �׷����� $1000�� *�ϳ��� ǥ���Ѵ�.

select last_name, salary, lpad('*', salary / 1000, '*') sal
from employees
order by sal desc;