-- DML(Data Manipulation Language) : 데이터 
-- 테이블의 데이터를 삽입, 조회, 수정, 삭제하는 구문
-- DCL, DDL은 root 계정에서 하는 것이 맞지만, DML은 user 계정에서 하는 것이 맞다 (혹시 모를 경우를 대비해서)


######################################################
use mysql;

CREATE database classicmodels;
use classicmodels;

###### 테이블 생성 ######
CREATE TABLE mytable (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	modelnumber VARCHAR(15) NOT NULL,
	series VARCHAR(30) NOT NULL,
	PRIMARY KEY(id)
);

show tables;
desc mytable;

######################################################

-- 데이터 조회
select id, name from mytable;

-- 데이터 입력
-- id는 AUTO_INCREMENT이기 때문에 지정해서 입력해줄 필요가 없음
INSERT into mytable(name, modelnumber , series)
	values('name6', 'EES311', '1E v2.1');

-- 아래의 양식을 지켜서 쿼리문을 작성하는 것이 좋음
SELECT -- 명령문
-- 조회 칼럼 (칼럼 조건)
id -- pk 같이 반드시 들어가야하는 것
,name
,series 
FROM mytable -- 테이블
-- 이 아래는 행 조건
where 1=1 -- 주석처리를 용이하게 하려고(주석처리 자유도를 높히려고) 사용
-- and id>3
and modelnumber like 'EES1%'
;

-- 데이터 update
update mytable 
	set name = 'name7'
where 1=1
	and id=8
;
commit;

-- 데이터 삭제
DELETE from mytable 
where 1=1
	and id=4
;
commit;

