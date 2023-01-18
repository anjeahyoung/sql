select *
from departments;

select department_id, location_id
from departments;

select location_id, departmennt_id
from departments;

select last_name, salary, salary + 300
from employees;

select last_name, salary, 12 * salary + 100
from employees;

select last_name, job_id, commission_pct
from employees;

select last_name, job_id, 12 * salary + (12 * salary * commission_pct)
from employees;

select last_name as name, commission_pct comm
from employees;

select lats_name "Name", salary * 12 "Anual salary"
from employees;

select employees_id, last_name, job_id, hire_date
from employees;

select last_name || job_id
from employees;

select last_name || null
from employees;

select lats_name || commission_pct
from employees;

select last_name || ', ' || job_id "Emp and Title"
from employees;

--2장
select employee_id, last_name, department_id
from employees
where department_id = 50;

select employee_id, last_name, department_id
from employees
where employee_id = 176;

select employee_id, last_name, department_id
from employees
where last_name = 'Whalen';

select employee_id, last_name, hire_date
from employees
where hire_date = '2002/06/16';

select last_name, salary
from employees
where salary<= 3000;

select last_name, job_id
from employees
where job_id != 'IT_PROG';--직업이 IT가 아닌사람

select last_name, salary
from employees
where salary between 2500 and 3500;

select last_name
from employees
where last_name between 'king' and 'Smith';

select first_name, last_name, job_id, salary
from employees
where last_name = 'King';

select last_name, hire_date
from employees
where hire_date between '2002/01/01' and '2002/12/31';

select employee_id, last_name, manager_id
from employees
where manager_id in (100, 101, 201);

select employee_id, last_name, manager_id
from employees
where manager_id = 100 or
    manager_id = 101 or
    manager_id = 201;
    
select employee_id, last_name
from employees
where last_name in ('Jartstein', 'Vargars');

select last_name, hire_date
from employees
where hire_date in ('2003/06/17', '2005/09/21';

select last_name
from employees
where last_name like 'S%';

select last_name
from employees
where last_name like '%r';

select last_name
from employees
where last_name like '%s%';

select last_name, hire_date
from employees
where hire_date like '2005%';

select last_name
from employees
where last_name like'K___';

select last_name
from employees
where last_name like '_o%';

select job_id
from employees;

select last_name, job_id
from employees
where job_id like 'I_\_%' escape '\';

select last_name, job_id
from employees
where job_id like 'I_[_%' escape '[';

select last_name, job_id
from employees
where '%\_R%' escape '\';

select employee_id, last_name, manager_id
from employees;

select last_name, manager_id
from employees
where manager_id is null;

select last_name, job_id, salary
from employees
where salary >= 5000 and job_id like '%IT%';

select last_name, salary department_id
from employees
where (salary between 5000 and 12000) and
    department_id in(20, 50);
    
select last_name, job_id, salary
from employees
where job_id like 'SA%' and
    salary not in(2500,3500);
    
select last_name,department_id
from employees
order by department_id;

select last_name, department_id
from employees 
order by department_id;

select last_name, department_id
from employees
order by department_id desc;

select last_name, department_id
from employees
order by 2;

select last_name, depratment_id dept_id
from employees
order by dept_id;

select last_name, hire_date
from employees
where department_id = 100
order by hire_date;

select last_name, department_id, salary
from employees
where department_id > 80
order by department_id asc, salary desc;

--3장 시작

--single function
--row를 하나만 받아서 결과값을 출력한다.

select lower('SQL Course')
from dual;

select upper('SQL Course')
from dual;

select initcap('SQL Course')   
from dual;

select last_name
from employees
where last_name = 'higgins';

select last_name
from employees
where last_name = 'Higgins';

select last_name
from employees
where lower(last_name) = 'higgins';

select concat('Hello', 'Worild')
from dual;

select substr('HelloWorld', 2, 5)
from dual;

select substr('Hello', -1, 1)
from dual;

select length('Hello')
from dual;

select instr('Hello', 'l')
from dual;

select lpad(salary, 5, '*')
from employees;

select trim('H' from 'Hello')
from dual;

select trim(' Hello World ')
from dual;

select initcap(last_name), length(last_name)
from employees
where last_name like 'J%' or
    last_name like 'A%' or
    last_name like 'M%';
    
select round(45.1352, 2)
from dual;

select trunc(45.1235, 2)
from dual;

select sysdate
from dual;

select sysdate - hire_date
from employees
where department_id = 80;

select last_name, last_day(hire_date)
from employees
where months_between(sysdate, hire_date) >=20*12

select last_name, salary, lped(' ', salary / 1000, '*')
from employees

--4장 시작

select hire_date
from employees
where hire_date = ' 2003/06/17';

select salary
from employees
where salary = '7000';

select to_char(hire_date)
from employees;

select to_char(sysdate, 'yyyy-mm-dd')
from dual;

select to_char(sysdate,'Year Month Ddsp Day(Dy)')
from dual;

select to_char(sysdate, 'd')
from dual;

select to_char(hire_date, 'fmDD Month YY')
from employees;

select last_name, hire_date, to_char(next_day(add_months(hire_date, 3), 2), 'YYYY.MM.DD')
from employees
order by hire_date asc;