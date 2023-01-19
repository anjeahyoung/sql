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
from dual;--요일을 인덱스값으로 표시
--중요***

select last_name, hire_date,
    to_char(hire_date, 'day'),
    to_char(hire_date, 'd')
from employees;

--과제: 위 테이블을 월요일부터 입사일순 오름차순 정렬하라.

select last_name, hire_date,
    to_char(hire_date, 'day') day
from employees
order by to_char(hire_date - 1, 'd');
    
select to_char(sysdate, 'hh24:mi:ss am')
from dual;

select to_char(sysdate, 'DD "of" Month')
from dual;

select to_char(hire_date, 'fmDD Month YY')
from employees;--fm 공간을 압축한다.fill mode

--과제: 사원들의 이름, 입사일, 인사평가일을 조회하라.
--      인사평가일은 입사한 지 3개월 후 첫번째 월요일이다.
--      날짜는 YYYY.MM.DD로 표시한다.

select last_name, hire_date, to_char(next_day(add_Months(hire_date, 3),2), 'YYYY.MM.DD')
from employees
order by hire_date asc;    

select last_name, to_char(hire_date, 'YYYY.MM.DD') hire_date,
to_char(next_day(add_months(hire_date, 3), 'monday'), 'YYYY.MM.DD') review_date
from employees;
--1/18 복습완료

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
from dual; -- L 프로그램이 설정되어 있는 나라돈으로 표시를 해준다.

-- 과제: <이름> earns <$,월급> monthly but wants <$,월급 x 3>. 로 조회하라.

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
where hire_date = to_date('Sep 21, 2005', 'fxMon  dd yy');--fx 형식에 안맞는데이터가 들어오면 오류발생

select to_number('1237')
from dual;

select to_number('1,237.12')
from dual;

select to_number('1,237.12', '9,999.99')
from dual;

--중요 *** 자주씀
select nvl(null, 0)
from dual;--첫번째 값이 null이면 0으로 환산한다.

select job_id, nvl(commission_pct, 0)
from employees;

--과제: 사원들의 이름, 직업, 연봉을 조회하라.

select last_name, job_id, (salary * nvl(commission_pct, 1)) * 12 
from employees;

select lst_name, job_id, salary * (1 + nvl(commission_pct, 0)) * 12 ann_sal
from employees
order by ann_sal desc;

--과제: 사원들의 이름, 커미션율을 조회하라.
--      커미션이 없으면, No Commission을 표시한다.

select last_name, nvl(to_char(commission_pct, '9.999'), 'No Commission')
from employees;

select last_name, nvl(to_char(commission_pct), 'no commission')
from employees;

select job_id, nvl2(commission_pct, 'SAL+COMM', 'SAL') income
from employees;--값이 있으면 필드 2 null이면 필드 3

select job_id, nvl2(commission_pct, 'SAL+COMM', 0) income
from employees;

select first_name, last_name,
nullif(length(first_name), length(last_name))
from employees;--값이 같으면 null 다르면 필드 1번

select to_char(null), to_number(null), to_date(null)
from dual;--null은 3가지 타입을 다 가지고 있다.

select last_name, job_id,
    coalesce(to_char(commission_pct), to_char(manager_id), 'None')
from employees;--필드값이null이면 다음 조건으로 출력

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
-- 조건 ,true시 상황,true시 값,false시 값)
--decode 기본값은 null
select decode(salary, 'a', 1)
from employees;

select decode(salary, 'a', 1, 0)
from employees;

select decode(job_id, 1, 1)
from employees;

--과제: 사원들의 직업, 직업별 등급을 조회하라.
--      기본등급은 null이다.
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
--중요**    

select last_name, job_id, salary,
    case job_id when 'IT_PROG' then 1.10 * salary
                when 'AD_PRES' then 1.05 * salary
    else salary end revised_salary
from employees;--then retrun값 when 피연산자

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
                    else '0' --피연산자끼리 타입이 같아야 한다.
        end grade
from employees;

select last_name, salary,
    case when salary < 5000 then 'low'
        when salary < 10000 then 'medium'
        when salary < 20000 then 'high'
        else 'good' --조건1번부터시작해서 true가 나오는 조건이 나오면 그값이 나온다.
    end grade
from employees;

--과제: 사원들의 이름, 입사일, 입사요일을 월요일부터 요일순으로 조회하라.

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
         
--과제: 2005년 이전에 입사한 사원들에게 100만원 상품권,
--      2005년 후에 입사한 사원들에게 10만원 상품권을 지급한다.
--      사원들의 이름, 입사일, 상품권 금액을 조회하라.

select last_name, hire_date,
    case when months_between('2005/12/31', hire_date) >= 0 then '100만원'
        when months_between('2005/12/31', hire_date) < 0 then '10만원'
    end
from employees;
    
    
select last_name, hire_date,
    case when hire_date <= '2005/12/31' then '100만원'
        else '10만원' end gift
from employees
order by gift, hire_date;