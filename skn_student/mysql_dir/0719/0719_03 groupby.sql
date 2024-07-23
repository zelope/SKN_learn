-- Group by
-- 함수와 양식도 같고 역할도 같음
/*
SUM: 그룹별로 합계를 구하는 집계함수
MIN/MAX: 그룹별로 최소, 최댓값을 구하는 집계함수
COUNT: 그룹별로 건수를 카운트하는 집계함수
AVG: 그룹별로 평균을 구하는 집계함수
HAVING: HAVING절은 WHERE절과 유사하게 조회할 데이터를 걸러내는 역할
*/

-- 해석을 From 테이블 -> where -> Group by -> Having -> 정렬(order by)

/*
어느 나라사람들이 가장 많을까?
-> group by country
-> order by desc
 * */

SELECT 
	c.country
	, count(*) as cnt
from customers c 
group by c.country 
HAVING 1=1
and cnt > 2
order by cnt DESC
;

/*
나라별 도시 수
 * */

SELECT 
	t1.country
	,count(*) as cnt
from (
SELECT 
	c.country 
	,c.city
from customers c 
group by  c.country, c.city
) t1
group by t1.country
order by cnt desc
;

SELECT 
	c.country 
	,c.city
from customers c 
group by  c.city, c.country
;