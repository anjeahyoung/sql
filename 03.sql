-- single function
desc dual
select * from dual;

select lower('SQL Course')
from dual;--파라미터를 소문자로 변환

select upper('SQL Course')
from dual;--파라미터를 대문자로 변환

select initcap('SQL Course')
from dual;--단어 앞글자를 대문자로 변환

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
from dual;--필드를 합친다.

select substr('HelloWorld', 2, 5)
from dual;--인덱스가 2~5사이에 있는 문자를 가지고 온다.elloW

select substr('Hello', -1, 1)
from dual;

select length('Hello')
from dual;--글자수를 파악한다.

select instr('Hello', 'l') 
from dual;--왼쪽부터 2번째 필드값을 찾아서 인덱스값을 출력한다.

select instr('Hello', 'w')
from dual;

select lpad(salary, 5, '*')
from employees; --자리수를 5로 맞춘다. 빈공간을 *로 채운다.

select rpad(salary, 5, '*')
from employees;


select replace('JACK and JUE', 'J', 'BL')
from dual; --필드 2번을 필드 3번으로 변경한다.

select trim('H' from 'Hello')
from dual;

select trim('l' from 'Hello')
from dual;

select trim(' ' from ' Hello ')
from dual;

--과제: 위 query 에서 ' '가 trim 됐음을, 눈으로 확인할 수 있게 조회하라.

select '|' || trim(' ' from ' Hello ') || '|'
from dual;

select trim(' Hello World ')
from dual;

select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
    from employees
where substr(job_id, 4) = 'PROG';--인덱스 4번째에서 마지막까지


--과제: 위 query에서, where 절을 like로 refactoring 하라
select employee_id, concat(first_name, last_name) name,
    job_id, length(last_name), instr(last_name, 'a') "Contains 'a'?"
    from employees
where job_id like '%PROG';



