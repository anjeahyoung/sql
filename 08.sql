--set

select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;
--테이블의 조건이 같아야 한다. 데이터 타입이 같아야 한다.
--중복제거
select employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history
order by employee_id;
--중복 제거 안함


--과제: 과거 직업을 현재 갖고 있는 사원들의 사번, 이름, 직업을 조회하라.
select employee_id, last_name, job_id
from employees
where employee_id in (select employee_id
                    from job_history)
and job_id = (select job_id
                from job_history);
                    
select employee_id, last_name, job_id
from employees e
where exists (select * 
                from job_history j
                where e.employee_id = j.employee_id
                and e.job_id = j.job_id);
                
select employee_id, last_name, job_id
from employees e
where e.job_id in (select job_id 
                from job_history j
                where e.employee_id = j.employee_id);
                
select e.employee_id, e.last_name, e.job_id
from employees e, job_history j
where e.employee_id = j.employee_id
and e.job_id = j.job_id;
                
select location_id, department_name
from departments
union
select location_id, state_province
from locations;

--과제: 위 문장을 service 관점에서 고쳐라.
--      union 을 사용한다.
select location_id, department_name, to_char(' ') state_province
from departments
union
select location_id, to_char(' '), state_province
from locations;

--정답
select location_id, department_name, null state
from departments
union
select location_id, null, state_province
from locations;

select employee_id, job_id, salary
from employees
union
select employee_id, job_id
from job_history;

select employee_id, job_id, salary
from employees
union
select employee_id, job_id, 0
from job_history
order by salary;