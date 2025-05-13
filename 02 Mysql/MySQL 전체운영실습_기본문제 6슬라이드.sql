-- productTBL의 데이터를 출력하세요
select * from shopdb.membertbl;

-- membertbl의 데이터를 출력하세요
-- 단, memberName 과 memberAddress 만 출력함
select memberName, memberAddress from shopdb.membertbl;

-- memberTBL의 데이터 중 이름이 '지운이'인 데이터만 출력하세요
select * from membertbl where memberName = '지운이';