## 자바스크립트셸을통한MongoDB (기본)##

//슬라이드2//
데이터베이스를 tutorial로 선정하세요.
use tutorial
users컬렉션에 username이 smith인 문서를 저장하세요.
db.users.insert({username: "smith"})
users컬렉션에 username이 jones인 문서를 저장하세요.
db.users.insert({username: " jones"})
앞에서 저장한 모든 문서를 출력하세요.
db.users.find()
앞에서 저장한 문서 중 하나만 출력하세요.
db.users.findOne()


//슬라이드3//
 users 컬렉션에서username이"jones"인 문서를 찾아서출력하세요.
  db.users.find({username: "jones"})
 
 users 컬렉션에서username이"jones" 또는 "smith"인 문서를 찾아서 출력하세요.
  db.users.find({ $or: [
 { username: "smith" },
 { username: "jones" }
 ]})


//슬라이드4//
users 컬렉션에서username이smith인문서에country 키가Canada 가 되도록수정하세요.
db.users.update({username: "smith"}, {$set: {country: "Canada"}})

앞의문서가올바르게수정되었는지확인하세요.
db.users.find({username: "smith"})
 { 
"_id" : ObjectId("4bf9ec440e32f82523389316"),
 "country" : "Canada", 
"username" : "smith"
 }


//슬라이드5//
//users 컬렉션에서username이smith인문서를 {country: "Canada"}로 대체하고 확인하세요.
//db.users.update({username: "smith"}, {country: "Canada"}) --굳이 할필요X 이미 캐나다임.
db.users.find({country: "Canada"})

users 컬렉션에서country가Canada인문서를{username: "smith", country: "Canada"}로 대체하고 확인하세요.
db.users.update({country: "Canada"}, {$set: {username: "smith", country: "Canada"}})
db.users.find({username: "smith"})

//슬라이드6
users 컬렉션에서username이 smith인문서에서country 키를 삭제하고, 삭제여부를확인하세요.
db.users.update({username: "smith"}, {$unset: {country: 1}})
db.users.find({username: "smith"})

//슬라이드7
데이터베이스 전체목록을 출력하세요.
show dbs
현재 사용중인 데이터베이스의 컬렉션 목록을 출력하세요.
show collections
현재 사용중인 데이터베이스와 users 컬렉션의 상태를 출력하세요
db.status()
db.users.status()


//슬라이드8
 users 컬렉션에서 username이 smith인 문서를 삭제하고, 삭제여부를확인하세요.
db.users.remove({username: "smith"})
db.users.find({username: "smith"})
 users 컬렉션의모든문서를삭제하고, 삭제여부를확인하세요.
db.users.remove({})
db.users.find()
 users 
컬렉션을삭제하세요.
db.users.drop()


## 쿼리작성하기(기본) ##

//슬라이드10
다음형태의문서20,000건을추가하세요.
 ○ database: test
 ○ collection: product
 ○ 문서필드
 num: 순번(0부터시작)
  name: '스마트폰' + 순번
use test;
 for(let i=0; i<20000; i++) {
 db.product.insert({
 num: i,
 name: '스마트폰 ' + i
 });
 }

product 컬렉션의전체문서수를출력하세요.
 db.product.count();


//슬라이드11
product 컬렉션의문서를num의내림차순으로정렬하여출력하세요.
 db.product.find().sort({num: -1});

 product 컬렉션의문서를num의내림차순으로정렬하여상위10건을출력하세요.
db.product.find().sort({num: -1}).limit(10);
 
product 컬렉션의문서를num의내림차순으로정렬한상태에서다음을처리하세요.
db.product.find()
.sort({num: -1})
.skip(10*(6-1))
.limit(10)


//슬라이드12
product 컬렉션에서num이15미만이거나19995 초과인것을출력하세요.
db.product.find({ $or:
 [
 {num: {$lt: 15}},
 {num: {$gt: 19995}},
 ]
 });

 product 컬렉션에서name이'스마트폰10', '스마트폰100', '스마트폰 1000' 중에 하나이면 출력하세요.
db.product.find({ name:
 {$in: ['스마트폰 10', '스마트폰 100', '스마트폰 1000']}
 });


//슬라이드13
product 컬렉션에서num이5보다작은문서를출력하는데, name만출력하세요. (_id 출력하면 안됨)
db.product.find({num: {$lt: 5}}, {_id:0, name:1})
