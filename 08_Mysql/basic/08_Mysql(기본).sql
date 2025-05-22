-- travel.csv 파일을 데이터베이스로 임포트하기 위한 tbl_travel 테이블을 정의하세요.

-- tbl_travel 테이블의 정의
DROP TABLE IF EXISTS tbl_travel;
CREATE TABLE tbl_travel
(
no		INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
district	VARCHAR(50)		NOT NULL,
title		VARCHAR(512)	NOT NULL,
description	TEXT,
address		VARCHAR(512),
phone		VARCHAR(256)
);

-- tbl_image 테이블의 정의
DROP TABLE IF EXISTS tbl_travel_image;
 CREATE TABLE tbl_travel_image
 (
 no        INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
 filename  VARCHAR(512)       NOT NULL,
 travel_no INT, 
 CONSTRAINT FOREIGN KEY (travel_no) REFERENCES tbl_travel (no)
 ON DELETE CASCADE
 );