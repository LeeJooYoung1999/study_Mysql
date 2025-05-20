-- 문제1-1: tabledb 데이터베이스를 생성하세요.
-- 만일, 이미 존재한다면 삭제하세요.
DROP DATABASE tabledb;
CREATE DATABASE tabledb;
-- 문제1-2: 다음컬럼을 가지는 usertbl을 만드세요.(슬라이드2 그림참조)
 DROP TABLE IF EXISTS usertbl;
 CREATE TABLE usertbl(
		userID	CHAR(8) NOT NULL PRIMARY KEY,
        name	VARCHAR(10) NOT NULL,
        birthYear INT NOT NULL,
        addr	CHAR(2) NOT NULL,
        mobile1	CHAR(3) NULL,
        mobile2	CHAR(8) NULL,
        height	SMALLINT NULL,
        mDate	DATE NULL
    );


-- 문제2: 다음컬럼을 가지는 buytbl테이블을 만드세요.(슬라이드3 그림참조)
DROP TABLE IF EXISTS buytbl;
CREATE TABLE buytbl(
	 num      
	 INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	 userid    CHAR(8) NOT NULL,
	 prodName  CHAR(6) NOT NULL,
	 groupName CHAR(4) NULL,
	 price    INT NOT NULL,
	 amount    SMALLINT NOT NULL,
	 FOREIGN KEY(userid) REFERENCES usertbl(userID)
    );
    
    
-- 문제3-1: 회원테이블에 다음 데이터를 입력하세요.
	--  순서: userID, name, birthyear, addr, mobile1, mobile2, height, mDate
	-- 'LSG', '이승기', 1987, '서울', '011', '1111111', 182,  '2008-8-8' 
	-- 'KBS', '김범수', 1979, '경남', '011', '2222222', 173,   '2012-4-4' 
	-- 'KKH', '김경호', 1971, '전남', '019', '3333333', 177,   '2007-7-7' 
INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182,  '2008-8-8'); 
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173,   '2012-4-4'); 
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177,   '2007-7-7');
-- 문제3-2: 회원테이블에 다음 데이터를 입력하세요.
--  에러가난다면, 왜발생하는지설명하세요.
	-- 순서: userid, prodName, groupName, price, amount
	-- 'KBS', '운동화', NULL, 30, 2 
	-- 'KBS', '노트북', '전자', 1000, 1 
	-- 'JYP', '모니터', '전자', 200, 1
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2); 
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1); 
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200, 1); -- >>에러발생! : userid는 외래키이므로, usertbl에 'JYP'가 있어야 하나, 해당 userid가 부재하므로 에러임.


-- 문제4 : 다음 컬럼을 가지는 usertbl을 정의하세요. (슬라이드5 이미지 참조)
	-- 기존 usertbl이 존재하는 경우 삭제함.
    -- 기본키는 테이블 레벨에서 정의하고 제약조건명을 함께 지정함.
DROP TABLE IF EXISTS usertbl;
 CREATE TABLE usertbl (
 userID  CHAR(8) NOT NULL,
 name    VARCHAR(10) NOT NULL,
 birthYear  INT NOT NULL,
 CONSTRAINT PRIMARY KEY PK_userTBL_userID(userID)
 );	

    
-- 문제5 : 다음 컬럼을 가지는 usertbl을 정의하세요. (슬라이드6 이미지 참조)
	-- 기존 prodTbl이 존재하는 경우 삭제함
DROP TABLE IF EXISTS prodTbl;
 CREATE TABLE prodTbl (
 prodCode  CHAR(3) NOT NULL,
 prodID    CHAR(4) NOT NULL,
 prodDate  DATETIME NOT NULL,
 prodCur   CHAR(10) NULL,
 CONSTRAINT PK_prodTbl_proCode_prodID 
PRIMARY KEY (prodCode, prodID)
 );


-- 문제6-1 : usertbl과 buytbl을 바탕으로 다음결과가 나오는 뷰를 정의하세요(슬라이드7의 이미지 참조)
 CREATE VIEW v_userbuytbl
 AS
 SELECT U.userid, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
 FROM usertbl U
 INNER JOIN buytbl B
 ON U.userid = B.userid; 
-- 문제6-2 : 위에서 정의한 뷰에서 userid가 '김범수'인 데이터만 출력하세요.
  SELECT * FROM v_userbuytbl WHERE name = '김범수'; 
    
