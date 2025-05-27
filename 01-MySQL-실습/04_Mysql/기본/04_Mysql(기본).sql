-- 문제1 : sqldb 데이터베이스에서 다음조건을 처리하세요.
	-- 사용자별로 구매 이력을 출력함.
    -- 모든 컬럼을 출력함.
	-- 구매 이력이 없는 정보는 출력하지 않음.
SELECT *
FROM buytbl b INNER JOIN usertbl u
ON b.userID = u.userID;

-- 문제2 : 앞의 결과에서(문제1) USER ID가 'JYP'인 데이터만 출력하세요.
 SELECT *
 FROM buytbl b INNER JOIN usertbl u
 ON b.userID = u.userID
 WHERE b.userID = 'JYP';
 
 -- 문제3 : sqldb데이터베이스에서 다음 조건을 처리하세요.
	-- 각 사용자별로 구매 이력을 출력하세요.
    -- 연결 컬럼은 userID로 함.
    -- 결과를 userID를 기준으로 오름차순으로 정렬함.
    -- 구매이력이 없는 사용자도 출력하세요.
    -- userID, name, prodName, addr, 연락처를 다음과 같이 출력함.
select u.userID, u.name, b.prodName, u.addr,
	concat(u.mobile1, u.mobile2) as 연락처
from usertbl u
left outer join buytbl b
on u.userID = b.userID
order by u.userID;

-- 문제4-1 : sqldb의 사용자를 모두 조회하되 전화가 없는 사람은 제외하고 출력하세요.
SELECT name, CONCAT(mobile1, mobile2) AS '전화번호' 
FROM usertbl
WHERE name NOT IN(SELECT name FROM usertbl WHERE mobile1 IS NULL);

-- 문제4-2 : sqldb의 사용자를 모두 조회하되 전화가 없는 사람만 출력하세요.
SELECT name, CONCAT(mobile1, mobile2) AS '전화번호' 
FROM usertbl
WHERE name IN(SELECT name FROM usertbl WHERE mobile1 IS NULL);