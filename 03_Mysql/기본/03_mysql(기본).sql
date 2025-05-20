-- 문제1. 다음을 처리하는 쿼리문을 작성하세요
SHOW DATABASES; -- 현재 서버에 존재하는 데이터베이스 확인.
USE employees;  -- 현재 데이터베이스를 employees로 설정하기.
show tables; -- employess데이터베이스의 테이블 목록보기.
select * from employees; -- employees 테이블의 열 목록 출력하기.
 -- 문제1 끝 --

-- 문제2. employees 테이블에서 다음 쿼리를 작성하세요.
select * from titles; -- titles 테이블의 데이터 출력하기
select first_name from employees;-- employees 테이블에서 first_name 컬럼만 출력하기
select first_name, last_name, gender from employees;-- employees 테이블에서 first_name 컬럼, last_name 컬럼, gender컬럼 출력하기.
-- 문제2 끝 --

-- 문제3. employess테이블 출력시, 다음과같이(03 SQL 기본(기본).pdf 슬라이드4장 삽입이미지 참조) 나오도록 쿼리를 작성하세요.
select first_name AS 이름, gender 성별, hire_date '회사 입사일' from employees;
-- 문제3 끝 --

-- 문제4. 배포된 sqldb.sql파일을 이용하여 sqldb 데이터베이스를 구축하세요.
-- 답안은 스크린샷으로 제출(문제4_캡쳐.png)
    -- 이후 작업은 sqldb 데이터베이스로 작업함
    use sqldb;
-- 문제4 끝 --

-- 문제5. 시작--
	-- usertbl 테이블에서 이름이 '김경호'인 행을 출력하세요.
select * from usertbl where name = '김경호';
	-- usertbl 테이블에서 생년이 1970이상이고 키가 182이상인 데이터를 출력하세요.
select * from usertbl where birthYear >= 1970 or height >= 182;
-- 문제5 끝 --

-- 문제6 시작 --
	-- usertbl테이블에서 키가 180~183 범위인 데이터를 출력하세요.
select * from usertbl where height between 180 and 183;    
    -- usertbl테이블에서 주소가 '경남' 또는 '전남' 또는 '경북'인 데이터를 출력하세요.
select * from usertbl where addr='경남' or addr="전남" or addr='경북';    
    -- usertbl테이블에서 이름이 '김'으로 시작하는 데이터를 출력하세요.
select * from usertbl where name like '김%';
-- 문제6 끝 --

-- 문제7. usertbl에서 김경호보다 큰 사람들의 이름과 키를 출력하세요.
	-- 서브쿼리를 이용하여 커리를 작성하세요.
select name, height from usertbl where height > (select height from usertbl where name = '김경호');
-- 문제7 끝 --

-- 문제8 시작
	-- usertbl을 mdate의 오름차순으로 정렬하여 출력하세요.
select * from usertbl order by mDate;    
	-- usertbl을 mdate의 내림차순으로 정렬하여 출력하세요.
select * from usertbl order by mDate desc;    
    -- usertbl을 height의 내림차순으로 정렬하고,
    -- 동률인 경우 name의 내림차순으로 정렬하여 출력하세요.
select * from usertbl order by height desc, 
								name desc;
-- 문제8 끝

-- 문제9. usertbl의 주소지를 중복없이 오름차순으로 출력하세요.
select distinct addr from usertbl order by addr;
-- 문제9 끝 --

-- 문제10.World 데이터베이스에서 다음 질문을 처리하세요.--
use world;
	-- 국가코드가'KOR'인 도시를 찾아 인구수를 역순으로 표시하세요.
select population from city where countrycode='kor' order by population desc;
	-- city 테이블에서 국가코드와 인구수를 출력하라. 정렬은 국가코드별로 오름차순으로, 동일한코드(국가) 안에서는 인구수의역순으로표시하세요.
select countrycode, population from city order by countrycode, population desc;
	-- city 테이블에서 국가코드가'KOR'인 도시의수를표시하세요.
select count(countrycode) as '국가코드가 KOR인 도시의 수' from city where countrycode='KOR';
	-- city 테이블에서 국가코드가'KOR', 'CHN', 'JPN'인 도시를 찾으세요.
select name as '국가코드가 KOR, CHN, JPN인 도시',countrycode  from city where countrycode='KOR' or countrycode='CHN' or countrycode='JPN';
	-- 국가코드가'KOR'이면서인구가100만이상인도시를찾으세요.
select name,population as '국가코드가 KOR이면서 인구가 100만이상인 도시' from city where countrycode='KOR' and population >= 1000000;
	-- 국가코드가'KOR'인도시중인구수가많은순서로상위10개만표시하세요.
select name as '국가코드가 KOR인 도시 중 인구수가 많은순서로 상위10개표시',population from city where countrycode='KOR' order by population desc limit 10;
	-- city 테이블에서 국가코드가'KOR'이고, 인구가 100만이상 500만이하인도시를찾으세요.
select name as '국가코드가 KOR이고, 인구가 100만이상 500만 이하인 도시', countrycode,population from city where countrycode='KOR' and population between 1000000 and 5000000;
-- 문제10 끝 --
    