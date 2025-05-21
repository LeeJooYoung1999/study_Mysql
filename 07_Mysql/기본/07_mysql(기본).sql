-- 문제1 : 다음과 같이 데이터베이스를 준비하세요.
	-- 데이터베이스명 : jbdc_ex
	-- 사용자 : scoula
	-- 비밀번호 : 1234
    -- jdbc_ex 데이터베이스에 대한 모든 사용권한 부여
CREATE DATABASE jdbc_ex;
CREATE USER 'scoula'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON jdbc_ex.* TO 'scoula'@'%';
FLUSH PRIVILEGES;
 
-- 문제2 : 자바 프로젝트를 생성하세요.  =>  IntelliJ로 작성.
	-- Name: jdbc_ex
	-- Build system: gradle
    -- 의존성 : lombok  ,  mysql-connector-j
    -- Annotation Processing 활성화
-- 문제3 :  Intellij에서 다음과 같은 users 테이블을정의하세요. =>  IntelliJ애서 console을 이용해 생성하였으나, 답안은 이곳에 작성.
-- 데이터 준비
use jdbc_ex;
CREATE TABLE USERS (
 ID VARCHAR(12) NOT NULL PRIMARY KEY COMMENT '사용자 id',
 PASSWORD VARCHAR(12) NOT NULL comment '비밀번호',
 NAME VARCHAR(30) NOT NULL comment '이름',
 ROLE VARCHAR(6) NOT NULL comment '역할'
 );
 
-- 문제4: 다음과 같은 테스트 데이터를 추가하세요.(슬라이드4 이미지 참조)
INSERT INTO USERS(ID, PASSWORD, NAME, ROLE)
VALUES('guest', 'guest123', '방문자', 'USER');
INSERT INTO USERS(ID, PASSWORD, NAME, ROLE)
VALUES('admin', 'admin123', '관리자', 'ADMIN');
INSERT INTO USERS(ID, PASSWORD, NAME, ROLE)
VALUES('member', 'member123', '일반회원', 'USER');
SELECT * FROM USERS;
-- 문제5: JUnit5를 이용하여 데이터베이스에 접속하는 JDBC코드를 테스트하세요. =>  IntelliJ로 작성.
	-- test폴더에서 작업함.
    -- 패키지명: org.scoula.jdbc_ex.test
    -- 테스트 클래스명: ConnectionTest
		-- 테스트 메소드: testConnection()


-- 문제6: resource 폴더에 application.properties파일을 생성하고 다음 내용을 작성하세요.(슬라이드6 이미지 참조=> 문제에 오류있으니 확인해서 작성.)
-- =>  IntelliJ로 작업.

-- 문제7: org.scoula.jdbc_ex.common 패키지에 JDBCUtil 클래스를 작성하세요. =>  IntelliJ로 작성.
	-- Properties 클래스를 이용하여 application.properties 파일을 로드함
	-- 데이터베이스 접속에 필요한 정보를 추출함
	-- jdbc_ex 데이터베이스에 접속하여 Connection 객체를 보관함
	-- getConnection() 스태틱 메서드를 정의함
		-- 외부에서 Connection 객체를 추출하기위함
	-- 데이터베이스접속을끊는close() 메서드를 정의함

-- ConnectionTest 클래스의 testConnection2 메서드에서 JDBCUtil 클래스의 기능을 테스트하세요. =>  IntelliJ로 작성.


