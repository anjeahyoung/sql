--set

select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;
--���̺��� ������ ���ƾ� �Ѵ�. ������ Ÿ���� ���ƾ� �Ѵ�.
--�ߺ�����
select employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history
order by employee_id;
--�ߺ� ���� ����


--����: ���� ������ ���� ���� �ִ� ������� ���, �̸�, ������ ��ȸ�϶�.
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
                
