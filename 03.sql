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
from dual; --�ʵ� 2���� �ʵ� 3������ �����Ѵ�.

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



