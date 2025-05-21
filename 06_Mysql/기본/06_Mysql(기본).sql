-- 문제1: sqldb 데이터베이스에다음과같은컬럼을가지는테이블tbl1을생성하고, 자동생성된인덱스목록을확인하세요.
-- 컬럼목록
-- a INT PRIMARY KEY
-- b INT
-- c INT
USE sqldb;
 CREATE TABLE tbl1 (
 a INT PRIMARY KEY,
 b INT,
 c INT
 );
 SHOW INDEX FROM tbl1;

-- 문제2: sqldb 데이터베이스에다음과같은컬럼을가지는테이블tbl2를생성하고, 자동생성된인덱스목록을확인하세요.
-- 컬럼목록
-- a INT PRIMARY KEY
-- b INT UNIQUE
-- c INT UNIQUE
-- d INT
CREATE TABLE tbl2 (
 a INT PRIMARY KEY,
 b INT UNIQUE,
 c INT UNIQUE,
 d INT
 );
 SHOW INDEX FROM tbl2;


-- 문제3: sqldb 데이터베이스에다음과같은컬럼을가지는테이블tbl3을생성하고, 자동생성된인덱스목록을확인하세요.
-- 컬럼목록
-- a INT PRIMARY KEY
-- b INT UNIQUE
-- c INT UNIQUE
-- d INT
CREATE TABLE tbl3 (
 a INT UNIQUE,
 b INT UNIQUE,
 c INT UNIQUE,
 d INT
 );
SHOW INDEX FROM tbl3;


-- 문제4: sqldb 데이터베이스에다음과같은컬럼을가지는테이블tbl4을생성하고, 자동생성된인덱스목록을확인하세요.
-- 컬럼목록
-- a INT PRIMARY KEY
-- b INT UNIQUE
-- c INT UNIQUE
-- d INT 
CREATE TABLE tbl4 (
 a INT UNIQUE NOT NULL,
 b INT UNIQUE,
 c INT UNIQUE,
 d INT
 );
 SHOW INDEX FROM tbl4;
 
 
-- 문제5: sqldb 데이터베이스에다음과같은컬럼을가지는테이블tbl5을생성하고, 자동생성된인덱스목록을확인하세요.
-- 컬럼목록
-- a INT PRIMARY KEY
-- b INT UNIQUE
-- c INT UNIQUE
-- d INT
CREATE TABLE tbl5 (
 a INT UNIQUE NOT NULL,
 b INT UNIQUE,
 c INT UNIQUE,
 d INT PRIMARY KEY
 );
 SHOW INDEX FROM tbl5;


-- 문제6-1 : testdb에 다음컬럼목록을가지는 usertbl을만드세요.
-- userID CHAR(8) NOT NULL PRIMARY KEY
-- name VARCHAR(10) NOT NULL
-- birthYear INT NOT NUL
-- addr NCHAR(2) NOT NULL
CREATE DATABASE IF NOT EXISTS testdb;
 USE testdb;
 DROP TABLE IF EXISTS usertbl;
 CREATE TABLE usertbl(
 userID CHAR(8) NOT NULL PRIMARY KEY,
 name VARCHAR(10) NOT NULL,
 birthYear INT NOT NULL,
 addr NCHAR(2) NOT NULL
 );

-- 문제6-2 : 아래데이터를추가하고, 클러스터형인덱스의테이블내용을확인하세요.
-- 'LSG', '이승기', 1987, '서울'
-- 'KBS', '김범수', 1979, '경남'
-- 'KKH', '김경호', 1971, '전남'
-- 'JYP', '조용필', 1950, '경기'
-- 'S나', '성시경', 1979, '서울'
 INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울');
 INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남');
 INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남');
 INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기');
 INSERT INTO usertbl VALUES('S나', '성시경', 1979, '서울');
 SELECT * FROM usertbl;
 
-- 문제7-1 : ALTER를사용하여usertbl에서 PRIMARY KEY 제약조건을제거하고, name 컬럼에 pk_name이라는제약조건명으로기본키를설정하세요.
-- 문제7-2 : usertbl의 내용을출력하여, 새로운클러스터형인덱스를확인하세요
ALTER TABLE usertbl DROP PRIMARY KEY;
ALTER TABLE usertbl
ADD CONSTRAINT pk_name PRIMARY KEY(name);
SELECT * FROM usertbl;