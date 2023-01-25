
drop table hire_dates;

create table hire_dates (
emp_id number(8),
hire_date date default sysdate); --기본값을 null이 아닌 다른 값으로 사용

--date dictionary mata data를 저장하는 곳
select tname
from tab;

--과제: 쓰레기가 조회안되게 하라.
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
--따라서 rollback이 안된다.

--DCL (Data Control Language)
