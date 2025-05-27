-- 문제1 : 다음결과가나오도록buytbl에대한SQL 문을각각작성하세요
USE sqldb;

SELECT userID  AS '사용자 아이디', SUM(amount) AS '총 구매 개수'
FROM buytbl 
GROUP BY userID;

SELECT userID  AS '사용자 아이디', SUM(amount*price) AS '총 구매액'
FROM buytbl 
GROUP BY userID;

-- 문제2 : 다음 결과가 나오도록 buytbl에 대한 SQL문을 각각 작성하세요.
SELECT AVG(amount) AS '평균 구매 개수' 
FROM buytbl;

SELECT userID, AVG(amount) AS '평균 구매 개수' 
FROM buytbl
GROUP BY userID;

-- 문제3 : 다음 결과가 나오도록 usertbl에 대한 SQL문을 작성하세요.
-- 가장 키가 큰 사람과 가장 키가 작은 사람을 출력함.
SELECT name, height
FROM usertbl
WHERE height = (SELECT MAX(height) FROM usertbl)  -- 서브쿼리를 사용하여 조건을 작성 (키가 가장큰)
OR height = (SELECT MIN(height) FROM usertbl);	-- 서브쿼리를 사용여, (키가 가장 작은)

-- 문제4 : 다음결과가나오도록usertbl에대한SQL 문을작성하세요.
SELECT COUNT(mobile1)  AS '휴대폰이 있는 사용자' -- count(*)이라면, null까지 포함하므로, count(컬럼명)의 경우와 크기가 달라짐 주의.
FROM usertbl;

-- 문제5 : buytbl 테이블로다음을처리하세요.
	-- 사용자별 총 구매액을 출력하세요.
	SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'
	FROM buytbl
	GROUP BY userID;
	-- 총 구매액이 1000이상인 사용자만 출력하세요.
	 SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'
	FROM buytbl
	GROUP BY userID
	HAVING SUM(price * amount) >= 1000;

-- world 데이터베이스에서 다음질문을 처리하세요.
	 --  city 테이블에서 국가코드가'KOR'인 도시들의 인구수총합을 구하시오.
	 select sum(population) from city where countrycode ='KOR';
     
	 -- city 테이블에서 국가코드가'KOR'인 도시들의 인구수 중 최소값을 구하시오. 
     -- 단 결과를 나타내는 테이블의 필드는 "최소값"으로 표시하시오
	 select min(population)as'최소값'  from city where countrycode ='KOR';
     
	 -- city 테이블에서국가코드가'KOR'인도시들의평균을구하시오.
	 select avg(population) from city where countrycode ='KOR';
     
	 -- city 테이블에서 국가코드가'KOR'인 도시들의 인구수 중 최대값을 구하시오. 
     -- 단 결과를 나타내는 테이블의 필드는 "최대값"으로 표시하시오.
	 select max(population)as'최대값'  from city where countrycode ='KOR';
     
	 -- country 테이블 각 레코드의 Name 칼럼의 글자수를 표시하시오.
	 select length(name) from country ; (limit 10)
     
	 -- country 테이블의 나라명(Name 칼럼)을 앞 세글자만 대문자로 표시하시오.
	 select upper(mid(Name, 1, 3)) from country;

-- ----------------- SQL 기본(심화2)------------------------------- --
USE EMPLOYEES;
-- 문제6 : employees db에서 각 부서별 관리자를 출력하세요.
-- 단, 현 재직자만 출력한다.
 select * from dept_manager
 where to_date = '9999-01-01';
 
-- 문제7 : 부서번호d005 부서의 현재 관리자정보를 출력하세요.
select * from employees
where emp_no = (
 select emp_no from dept_manager
 where to_date = '9999-01-01' and dept_no = 'd005'
);
 
-- 문제8 : employees 테이블에서 페이지네이션으로 페이지를 추출하려고 한다. 
-- 다음 조건하에서 8번페이지의 데이터를 출력하세요.
 -- 입사일을 내림차순으로 정렬한다.
 -- 한 페이지당 20명의 정보를 출력한다.
 select * from employees
 order by hire_date desc
 limit 140, 20;  
 -- offset, amount 
 -- offset : (page-1) * amount
 
-- 문제9 : employees db에서 재직자의 총 수를 구하시오.
 -- 재직자의 to_date값은 '9999-01-01'로 저장되어 있음
 select count(*) from dept_emp
 where to_date = '9999-01-01';
 
-- 문제10 : employees db 에서 재직자의 평균급여를 출력하시오.
select avg(salary) from salaries
where to_date = '9999-01-01';

-- 문제11 : 재직자 전체 평균 급여보다 급여를 더 많이 받는 재직자를 출력하세요.
select * from salaries
where to_date = '9999-01-01' 
and salary > (
 select avg(salary) from salaries
 where to_date = '9999-01-01'
 ); -- 서브쿼리가 단일행이냐, 다중행이냐에 따라 돌아갈수도, 아닐수도 있음을 주의

-- employees db에서 각 부서별 재직자의 수를 구하시오.
	-- 부서 번호로 구분하고, 부서 번호로 오름차순 정렬하여 출력한다.
select dept_no, count(*) from dept_emp
where to_date = '9999-01-01'
group by dept_no
order by dept_no;