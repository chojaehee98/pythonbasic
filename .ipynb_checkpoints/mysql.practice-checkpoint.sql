# mtsql 데이터베이스에
# user 테이블.
desc mysql.user;
describe mysql.user;

show full columns from mysql.user;

select Host, User
 from mysql.user;
 
 select user, Host from mysql.user;
 
 # 데이터베이스 사용자 만들기 '아이디'@'접근가능한주소' '비밀번호'
 CREATE USER 'test'@'localhost' identified by '1234';
 # 어디서든 접속(%) 가능한 사용자 만들기
 create user 'anywhere'@'%' identified by '1234';
 select user, host from mysql.user;
 
 # 특정 ip 대역에서만 접속 가능한 사용자를 만들기
 create user 'test2'@'192.168.0.%'identified by '1234';
 select user, host from mysql.user;

 create or replace User 'test'@'localhost' identified by '1234';
 
 # if not exists 같은 이름의 사용자가 없을 때 사용자를 추가한다
 create user if not exists 'test'@'localhost' identified by '1234';
 
 # 사용자 이름 변경
 rename user 'test2'@'192.168.0.%' TO 'test3'@'%';
 select user, host from mysql.user;
 
 # 비밀번호 변경
 set password for 'test3'@'%' = password('12345');
 
 # 데이터베이스 삭제
 select user, host from mysql.user;
 drop user 'test3'@'%';
 
 # 존재할 경우에만 삭제
 drop user if exists 'anywhere'@'%';
 
 #권한 부여하기
 show grants for 'test'@'localhost';
 grant all privileges on test.* TO 'test'@'localhost';
 flush privileges;
 # 데이터베이스 목록 조회
 show databases;
 # 데이터베이스 test라는 이름으로 생성
 create database test;
 
 # 권한 확인
 show grants for 'test'@'localhost';
 
 # 권한 제거
 revoke all on test.* from 'test'@'localhost';
 flush privileges;
 show grants for 'test'@'localhost';
 
 # 가지고 있는 모든 데이터베이스 목록 조회
 show databases;
 # 데이터베이스 생성
 create database test;
 # 데이터베이스 조건에 따라 생성
 create database if not exists test;
 
 # 특수 문자가 포함되면 에러가 발생 그래서 `이거 넣으면 에러가 나지않음
 create database `test.test`;
 # 데이터베이스 삭제
 drop database `test.test`;
 show databases;
 
 # 데이터베이스 명칭 변경 (mysqldump -u root -p test > test.sql)
 # 다시 mysqldump -u root -p test1< test.sql
 
 # 테이블 만들기 준비
 create database python;
 use python;
 
 # 테이블 만들기  fieid 
 create TABLE table1 ( column1 varchar(100));
 
 # 테이블이 잘 생성되었는지 확인
 select database();
 show tables;
 
 # 테이블 이름 변경
 rename table table1 TO table2;
 # 테이블 목록 조회
 show tables;
 
 # 테이블 삭제
 drop table table2;
 show tables;
 
 # 열 추가, 삭제 등을 해볼 테이블 생성
 create table test_table(
 test_column1 INT,
 test_column2 INT,
 test_column3 INT
 );
 desc test_table;   # 테이블 
 
 alter table test_table
 add test_column4 INT;
 desc test_table;
 ALTER TABLE test_table
ADD (
 test_column5 INT,
 test_column6 INT,
 test_column7 INT
);
DESC test_table;

alter table test_table
#  삭제
drop test_column1;
desc test_table;

# 순서 변경 
alter table test_table
modify test_column7 INT
first;
desc test_table;

# 테이블에 column 순서 변경
alter table test_table
modify test_column7 INT
after test_column6;
desc test_table; # 테이블 확인
 
 # 테이블 타입 변경
 alter table test_table
 change test_column2 test_column0 INT;
 
 desc test_table;
 
 # 타입 변경
 alter table test_table
 change test_column0 test_column0 varchar(10);
 
 desc test_table;
 
 #이름과 데이터 타입 동시에 변경
 alter table test_table
 change test_column0 test_column2 INT;
 
 desc test_table;
 
 -- 고유 값(Primary Key: PK) 고유값을 수동으로 넣을 수 있지만
 # 값을 자동으로 증가시키는 AUTO_increment를 사용해서 생성하면 편리
 # 자동으로 증가하는 column 만들기
 create table test(id int Auto_increment primary key);
 describe test;
 show databases;
 
 # auto_increment column에 데이터 추가
 insert into test values ();
 select * from test;
 
 select max(id)
	from test;
 insert into test values(100);
 
 # auto_increment column 생성 값 살펴보기
 delete from test where id = 101;
 select * from test;
 
 insert into test values ();
 select * from test;
 
 # test 테이블의 모든 데이터 삭제, 새로 데이터를 추가하면 a_i 값이 이전에 사용한 값보다 큰 값부터 이어서 시작
 delete from test;
 select * from test;
 
 insert into test values();
 select * from test;
 insert into test values(101);
 
 # 테이블 찾기
 show table status
 where name = 'test';
 # 초기화
 alter table test auto_increment= 1;
 
 # 값 수정
 set @count=0;
 update test set id=@count:=@count+1;
 select * from test;
 
 
 
 # 테이블에 데이터 추가. insert
 create table table1(
 column1 varchar(100),
 column2 varchar(100),
 column3 varchar(100)
 );
 desc table1;
 
 # 데이터 삽입 column 전체면 생략가능
 insert into table1 (column1, column2, column3) values ('a','aa','aaa');
 
 select * from table1;
 insert into table1 (column1, column2) values ('b','bb');
 
 # 테이블에 데이터 수정. update
 update table1 set column1 = 'z';
 select * from table1;
 update table1 set column1 = 'x' where column2 = 'aa';
 select * from table1;
 # 여러개 데이터 수정할때
update table1
   set column1 = 'y'
	  ,column2= 'yy'
   where column3 = 'aaa';
   select * from table1;
   
   # 테이블에 데이터 삭제. delete
   delete from table1 where column1 = 'y';
   select * from table1;
   
   # where 없이 삭제하면 싹 다 없어짐
   delete from table1;
   select * from table1;
   
   # 테스트용 테이블 생성
 # 기존 테이블 삭제(존재 시)
 drop table if exists day_visitor_realtime;
 
 # 테이블 생성
 create table if not exists day_visitor_realtime(
   ipadderss varchar(16),
   iptime_first datetime,
   before_url varchar(250),
   device_info varchar(40),
   os_info varchar(40),
   session_id varchar(80));
  
   insert into day_visitor_realtime(
   ipadderss, iptime_first, before_url, device_info)
   values ( '192.168.0.1', '2023-02-23 11:34:28', 'localhost', 'PC')
          ,( '192.168.0.2', '2023-02-23 11:34:31', 'localhost', 'iphone');
select * from day_visitor_realtime;
desc day_visitor_realtime;

 insert into day_visitor_realtime(
   ipadderss, iptime_first, before_url, device_info)
                # varchar(16)
   values ( '12345678901234567', '2023-02-23 11:34:28', 'localhost', 'PC')
              # varchar(16)에 17자리의 값을 넣어서 에러가 발생
          ,( '12345678901234567', '2023-02-23 11:34:31', 'localhost', 'iphone');
          
use python;
# 데이터 삽입
insert into `python`.`day_visitor_realtime` (`session_id`) values 
('12345.567890');
insert into `python`.`day_visitor_realtime` (`session_id`) values
('1234.567890');
insert into `python`.`day_visitor_realtime` (`session_id`) values('123');
insert into `python`.`day_visitor_realtime` (`session_id`) values('1234');
insert into `python`.`day_visitor_realtime` (`session_id`) values('12345');

SELECT * FROM day_visitor_realtime;

# 무결성 제약조건
drop table if exists day_visitor_realtime;
create table if not exists day_visitor_realtime(
   ipadderss varchar(16)not null,
   iptime_first datetime,
   before_url varchar(250),
   device_info varchar(40),
   os_info varchar(40),
   session_id varchar(80));
   
   #insert into day_visitor_realtime (
   
   
# primary key: 한개의 테이블에 하나만 생성가능, 중복된 값을 가질 수 없고 null 값을 가질 수 없다
DROP TABLE IF EXISTS day_visitor_realtime;
CREATE TABLE day_visitor_realtime (
  id INT,
  ipaddress varchar(16),
  iptime_first datetime,
  before_url varchar(250),
  device_info varchar(40),
  os_info varchar(40),
  session_id varchar(80),
  PRIMARY KEY(id)
);
SELECT * FROM day_visitor_realtime;

#  같은 값을 두 번 넣으면 오류
-- insert into day_visitor_realtime(
-- id,  ipaddress,iptime_first, before_url, device_info, os_info /*session_id*/
-- )

# foreign key : 참조하는 테이블의 컬럼에 존재하는 값만 사용하는 제약조건
create table orders(
order_id int,
customer_id int,
order_date datetime,
primary key(order_id)
);
insert into orders values(1, 1, now());
insert into orders values(2, 1, now());
insert into orders values(3, 1, now());
select * from orders;

CREATE TABLE order_detail (
  order_id INT,
  product_id INT,
  product_name VARCHAR(200),
  order_date DATETIME,
  CONSTRAINT FK_ORDERS_ORDERID FOREIGN KEY (order_id) REFERENCES orders(order_id),
  PRIMARY KEY(order_id, product_id)
);
insert into order_detail (order_id, product_id, product_name)
values ( 4, 100, 'iphone')
	  ,(4,101, 'ipad');
	select * from order_detail;
    
    
    ------------------------------------------------------------------------------
    use employees;
    show tables;
    desc current_dept_emp;
    
    desc employees;
    select count(*)
    from employees;
    
    desc departments;
    select *
    from departments;
    
    desc titles;
    
    select count(*)
		from titles;
        
select distinct title
	from titles;
    
select * from salaries where salary > 150000;

select * from dept_manager where emp_no = 111133;
        
select * from dept_manager
where emp_no between 111133 and 111939;

select * from employees
where first_name like 'Geo%';

#  연습 문제
select * from titles
where title = 'Senior engineer'
and from_date > '2002-06-01';

# null value :< >와 같은 연산자는 사용 불가, is null 혹은 is not null로만 값을 비교할 수 있음


-- select * from tab_name where confition and condition  

# min()

select *
 from employees as emp
 inner join salaries sal          # 같은 값끼리 합쳐짐 없는 값 사라지지않고, null값으로 합쳐짐
 on emp.emp_no = sal.emp_no
 ;
 
 select *
 from salaries
 where emp_no = 10001
 order by from_date desc;
 

# union 연산자 : column 갯수가 각각 동일 해야 컬럼 간의 데이터 타입이 비슷해야 하고 순서도 일치해야된다

# 현재의 타입별로 묶어서 집개의 함수를 구함? 그래서 갯수 확인
select title, count(*)
	from titles
    where to_date = '9999-01-01'
    group by 1;
    
having count(*) < 10
;


# case 표현식(식이 다 끝났는데도 True가 없으면 null값이 출력) = if else문과 비슷


----------------------------------------------------------------------
    
   use python;
   CREATE TABLE `users` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `email` varchar(255) COLLATE utf8_bin NOT NULL,
    `password` varchar(255) COLLATE utf8_bin NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin
AUTO_INCREMENT=1 ;
    select *from users;




   
 
 
 
 
  