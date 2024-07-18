-- DDL
-- (상위) mysql > databases > tables > data (하위)

-- database
create database dbname;

-- 삭제
drop database if exists dbname;
-- 일종의 예외처리
-- 없으면 오류가 나지 않고 그림2 처럼 뜸

create database customer_db;

-- customer_db안에 테이블을 만들꺼니까 시선 변경
use customer_db;

-- 테이블들 보기
show tables;

-- 테이블 생성
-- craete table 테이블명 (칼럼명1, ...., PRIMARY KEY(PK 칼럼명)
-- 아래는 mysql에서 사용하는 방법들
-- UNSIGNED : 음수부분에 할당된 숫자영역을 떼어내고, 그만큼 양수영역을 확장한다
-- --보통 PK는 양수만 존재하기 때문에, INT UNSIGNED를 세트로 사용한다
-- auto_increment 자동배분? 같은 느낌. 넣을때마다 일일이 지정할 필요는 없음
-- --보통 PK가 INT면 auto_increment도 같이 써줌
-- varchar(n) : 가변 str. 최대 n자까지 

# 학생 student
create table student (
	student_id INT UNSIGNED auto_increment COMMENT '학생아이디',
	student_name varchar(10) not null COMMENT '학생이름',
	student_address varchar(50) null COMMENT '학생집주소',
	create_dt TIMESTAMP not null default now() COMMENT '생성일자',
	modify_dt TIMESTAMP not null default now() COMMENT '수정일자',
	PRIMARY KEY(student_id)
);
-- ERD Cloud 내보내기(export)로 쉽게 생성 가능

# 교수 professor
create table professor (
	professor_id INT UNSIGNED auto_increment COMMENT '교수아이디',
	professor_name varchar(10) not null COMMENT '교수이름',
	create_dt TIMESTAMP not null default now() COMMENT '생성일자',
	modify_dt TIMESTAMP not null default now() COMMENT '수정일자',
	PRIMARY KEY(professor_id)
);

# 과목 subject
create table subject (
	subject_cd varchar(10) COMMENT '과목코드',
	subject_name varchar(10) not null unique COMMENT '과목명',
	subject_desc text COMMENT '과목설명',
	professor_id INT unsigned not null COMMENT '교수아이디',
	create_dt TIMESTAMP not null default now() COMMENT '생성일자',
	modify_dt TIMESTAMP not null default now() COMMENT '수정일자',
	PRIMARY KEY(subject_cd),
	FOREIGN KEY (professor_id) REFERENCES professor(professor_id) ON UPDATE CASCADE
);

# 수강신청 enrolment
create table enrolment (
	enrolment_id INT UNSIGNED auto_increment COMMENT '수강신청아이디',
	semester varchar(10) not null COMMENT '학기',
	student_id INT unsigned not null COMMENT '학생아이디',
	subject_cd varchar(10) not null COMMENT '과목코드',
	create_dt TIMESTAMP not null default now() COMMENT '생성일자',
	modify_dt TIMESTAMP not null default now() COMMENT '수정일자',
	PRIMARY KEY(enrolment_id),
	FOREIGN KEY (student_id) REFERENCES student(student_id) ON UPDATE cascade,
	FOREIGN KEY (subject_cd) REFERENCES subject(subject_cd) ON UPDATE CASCADE
);

show tables;

-- 이렇게 하고 그림3 같이 하면
-- 그림 4 처럼 엔티티관계도를 볼수 있다