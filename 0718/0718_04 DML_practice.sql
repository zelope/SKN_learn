
/*
https://github.com/good593/course_sql/blob/main/mysql/mysqlsampledatabase.sql 참조
*/

SELECT 
	* 
from customers c 
limit 10;

SELECT 
	customerNumber 
	,customerName 
	,contactLastName 
	,country 
from customers c 
where 1=1
	and c.country like "G%"
;

-- 이렇게 조회해서 나온 결과를 
-- 하나의 새로운 테이블로 인식할 수 있다
-- 그래서 아래의 예시와 같이 from ( ) 안에 담고, 별칭(t1)을 붙혀
-- 활용 가능하다

SELECT 
t1.customer_Number
	,t1.country 
from ( 
SELECT 
	customerNumber as customer_Number
	,customerName 
	,contactLastName
	,city
	,state
	,country 
from customers c 
where 1=1
	and c.country like "J%"
) t1
;