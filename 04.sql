select hire_date
from employees
where hire_date = '2003/06/17';

select salary
from employees
where salary = '7000';

select hire_date || ''
from employees;

select salary || ''
from employees;

select to_char(hire_date)
from employees;

select to_char(sysdate, 'yyyy-mm-dd')
from dual;

select to_char(sysdate, 'YEAR MONTH DDsp DAY(DY)')
from dual;

select to_char(sysdate, 'Year Month Ddsp Day(Dy)')
from dual;

select to_char(sysdate, 'd')
from dual;--������ �ε��������� ǥ��
--�߿�***

select last_name, hire_date,
    to_char(hire_date, 'day'),
    to_char(hire_date, 'd')
from employees;

--����: �� ���̺��� �����Ϻ��� �Ի��ϼ� �������� �����϶�.

select last_name, hire_date,
    to_char(hire_date, 'day') day
from employees
order by to_char(hire_date - 1, 'd');
    
select to_char(sysdate, 'hh24:mi:ss am')
from dual;

select to_char(sysdate, 'DD "of" Month')
from dual;

select to_char(hire_date, 'fmDD Month YY')
from employees;--fm ������ �����Ѵ�.fill mode

--����: ������� �̸�, �Ի���, �λ������� ��ȸ�϶�.
--      �λ������� �Ի��� �� 3���� �� ù��° �������̴�.
--      ��¥�� YYYY.MM.DD�� ǥ���Ѵ�.

select last_name, hire_date, to_char(next_day(add_Months(hire_date, 3),2), 'YYYY.MM.DD')
from employees
order by hire_date asc;    

select last_name, to_char(hire_date, 'YYYY.MM.DD') hire_date,
to_char(next_day(add_months(hire_date, 3), 'monday'), 'YYYY.MM.DD') review_date
from employees;
--1/18 �����Ϸ�

select to_char(salary)
from employees;

select to_char(salary, '$99,999.99'), to_char(salary, '$00,000.00')
from employees
where last_name = 'Ernst';

select '|' || to_char(12.12, '9999.99') || '|',
    '|' || to_char(12.12, '0000.00') || '|'
from dual;

select '|' || to_char(12.12, 'fm9999.99') || '|',
    '|' || to_char(12.12, 'fm0000.00') || '|'
from dual;

select to_char(1237, 'L9999')
from dual; -- L ���α׷��� �����Ǿ� �ִ� �������� ǥ�ø� ���ش�.

-- ����: <�̸�> earns <$,����> monthly but wants <$,���� x 3>. �� ��ȸ�϶�.

select last_name || 'earns ' ||
    to_char(salary, 'fmL99999') || ' monthly but wants ' ||
    to_char(salary * 3, 'fmL99999') || '.'
from employees;

select last_name, hire_date
from employees
where hire_date = to_date('Sep 21, 2005', 'Mon dd, yyyy');

select last_name, hire_date
from employees 
where hire_date = to_date('Sep 21, 2005', 'Mon  dd yy');

select last_name, hire_date
from employees 
where hire_date = to_date('Sep 21, 2005', 'fxMon  dd yy');--fx ���Ŀ� �ȸ´µ����Ͱ� ������ �����߻�

select to_number('1237')
from dual;

select to_number('1,237.12')
from dual;

select to_number('1,237.12', '9,999.99')
from dual;

--�߿� *** ���־�
select nvl(null, 0)
from dual;--ù��° ���� null�̸� 0���� ȯ���Ѵ�.

select job_id, nvl(commission_pct, 0)
from employees;

--����: ������� �̸�, ����, ������ ��ȸ�϶�.

select last_name, job_id, (salary * nvl(commission_pct, 1)) * 12 
from employees;

select lst_name, job_id, salary * (1 + nvl(commission_pct, 0)) * 12 ann_sal
from employees
order by ann_sal desc;

--����: ������� �̸�, Ŀ�̼����� ��ȸ�϶�.
--      Ŀ�̼��� ������, No Commission�� ǥ���Ѵ�.

select last_name, nvl(to_char(commission_pct, '9.999'), 'No Commission')
from employees;

select last_name, nvl(to_char(commission_pct), 'no commission')
from employees;

select job_id, nvl2(commission_pct, 'SAL+COMM', 'SAL') income
from employees;--���� ������ �ʵ� 2 null�̸� �ʵ� 3

select job_id, nvl2(commission_pct, 'SAL+COMM', 0) income
from employees;

select first_name, last_name,
nullif(length(first_name), length(last_name))
from employees;--���� ������ null �ٸ��� �ʵ� 1��

select to_char(null), to_number(null), to_date(null)
from dual;--null�� 3���� Ÿ���� �� ������ �ִ�.

select last_name, job_id,
    coalesce(to_char(commission_pct), to_char(manager_id), 'None')
from employees;--�ʵ尪��null�̸� ���� �������� ���

select last_name, salary,
    decode(trunc(salary / 2000), 
    0, 0.00,
    1, 0.09,
    2, 0.20,
    3, 0.30,
    4, 0.40,
    5, 0,42,
    6, 0.44,
        0.45) tax_rate
from employees
where department_id = 80;
-- ���� ,true�� ��Ȳ,true�� ��,false�� ��)
--decode �⺻���� null
select decode(salary, 'a', 1)
from employees;

select decode(salary, 'a', 1, 0)
from employees;

select decode(job_id, 1, 1)
from employees;

--����: ������� ����, ������ ����� ��ȸ�϶�.
--      �⺻����� null�̴�.
--      IT_PROG     A
--      AD_PRES     B
--      ST_MAN      C
--      ST_CLERK    D

select job_id, decode(job_id,
    'IT_PROG', 'A',
    'AD_PRES', 'B',
    'ST_MAN' , 'C',
    'ST_CLERK', 'D') grade
from employees;
--�߿�**    

select last_name, job_id, salary,
    case job_id when 'IT_PROG' then 1.10 * salary
                when 'AD_PRES' then 1.05 * salary
    else salary end revised_salary
from employees;--then retrun�� when �ǿ�����

select case job_id when '1' then 1
                    when '2' then 2
                    else 0
        end grade
from employees;

select case job_id when '1' then '1'
                    when '2' then '2'
                    else '0'
        end grade
from employees;

select case salary when 1 then '1'
                    when 2 then '2'
                    else '0' --�ǿ����ڳ��� Ÿ���� ���ƾ� �Ѵ�.
        end grade
from employees;

select last_name, salary,
    case when salary < 5000 then 'low'
        when salary < 10000 then 'medium'
        when salary < 20000 then 'high'
        else 'good' --����1�����ͽ����ؼ� true�� ������ ������ ������ �װ��� ���´�.
    end grade
from employees;

--����: ������� �̸�, �Ի���, �Ի������ �����Ϻ��� ���ϼ����� ��ȸ�϶�.

select last_name, hire_date, to_char(hire_date, 'fmday') day
from employees
order by case day
            when 'monday' then 1
            when 'tuesday' then 2
            when 'wednesday' then 3
            when 'thursday' then 4
            when 'firday' then 5
            when 'saturday' then 6
            when 'sunday' then 7
    end;
         
--����: 2005�� ������ �Ի��� ����鿡�� 100���� ��ǰ��,
--      2005�� �Ŀ� �Ի��� ����鿡�� 10���� ��ǰ���� �����Ѵ�.
--      ������� �̸�, �Ի���, ��ǰ�� �ݾ��� ��ȸ�϶�.

select last_name, hire_date,
    case when months_between('2005/12/31', hire_date) >= 0 then '100����'
        when months_between('2005/12/31', hire_date) < 0 then '10����'
    end
from employees;
    
    
select last_name, hire_date,
    case when hire_date <= '2005/12/31' then '100����'
        else '10����' end gift
from employees
order by gift, hire_date;