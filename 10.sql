
drop table hire_dates;

create table hire_dates (
emp_id number(8),
hire_date date default sysdate); --�⺻���� null�� �ƴ� �ٸ� ������ ���

--date dictionary mata data�� �����ϴ� ��
select tname
from tab;

--����: �����Ⱑ ��ȸ�ȵǰ� �϶�.
select tname
from tab
where length(tname) < 20;

select tname
from tab
where tname not like 'BIN%';

select tname
from tab 
where tname not like '%$0'; 

insert into hire_dates values(1,to_date('2025/12/21'));
insert into hire_dates values(2, null);
insert into hire_dates(emp_id) values(3);

select * from hire_dates;

commit;

--drop table autocommit
--create autocommit
--���� rollback�� �ȵȴ�.

--DCL (Data Control Language)
