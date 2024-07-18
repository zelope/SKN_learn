-- DBeaver sql편집기에서 쿼리문 입력
---- DCL
use mysql;

-- 사용자 확인
select * FROM user;

-- desc + table : 스키마 확인
desc user; 

-- 사용자 생성하기 create 테이블 id(user칼럼데이터@호스트칼럼데이터)
-- id가 저 형태인 이유는 그림1을 보면 알수 있듯이 pk가 Host와 User 두 칼럼으로 이루어져 있기 때문
-- identified by 'password'
-- 호스트칼럼데이터에는 localhost or '%'
-- '%'는 전체 IP에 접속 가능-> 보안 개 ㅄ
create user 'zelope'@'%' identified by 'zelope1234';

-- 쿼리문은 명령을 ;(세미클론)으로 구분한다

-- 조회 가능한 DB를 출력한다
show databases;
-- 2개만 출력
-- 이 조회 가능한이란, '해당 커넥션이 조회 할 수 있는 권한을 부여 받은 DB'
-- 즉, DB가 실존하더라도 권한이 없으면 출력 불가능

use mysql;

-- 비밀번호 변경
set PASSWORD for 'zelope'@"%" = '0000'; 

select * FROM user;

show databases;

-- userid에게 exampledb 접근 권한 부여
-- 이는 root 커넥션에서만 가능
-- 정확히는 use mysql 후
-- (상위) mysql > databases > tables > data (하위)
-- 각각에 대한 권한이 존재
-- 권한 부여는 하위에서 상위로

-- * = 전체
-- *.* : all databases . all tables
-- ALL 명령은 CRUD를 다 허락함
grant All privileges on *.* to 'zelope'@"%";

show databases;
-- 5개 출력

use mysql;

-- 비밀번호 변경
set PASSWORD for 'zelope'@"%" = '0000'; 

select * FROM user;

show databases;

-- userid에게 exampledb 접근 권한 부여
-- 이는 root 커넥션에서만 가능
-- (상위) mysql > databases > tables > data (하위)
-- 각각에 대한 권한이 존재
-- 권한 부여는 하위에서 상위로

-- * = 전체
-- *.* : all databases . all tables
-- ALL 명령은 CRUD를 다 허락함
grant All privileges on *.* to 'zelope'@"%";

show databases;

-- 권한 재설정
-- 권한 모두 삭제후 재부여 해야함
-- CRUD 전체가 아닌 일부 권한만 원하는 경우 grant (c,r,u,d) on db_nmae.table_name
-- 일부 DB나 일부 table 만을 원할경우 str으로 쓰면 안됨

grant select on examplesdb.* to 'zelope1'@'%'; 
FLUSH PRIVILEGES; # 새로운 권한 MySQL 적용!!! 

use mysql;

-- 사용자 삭제 
drop user 'zelope'@'%';
drop user 'zelope'@localhost;
drop user 'userid'@localhost;

-- 참고
-- 사용자 권한 삭제
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'zelope'@'%';
