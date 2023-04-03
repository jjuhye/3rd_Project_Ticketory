create database reservedb;

USE reservedb;

create table  memberlist(
  id int auto_increment primary key, #유저고유넘버
  memberName varchar(20) not null, #사용자이름
  memberId varchar(30) unique key not null, #사용자아이디
  memberPw varchar(30) not null, #사용자 패스워드
  memberHP varchar(30) not null, #사용자핸드폰번호
  memberPoints INT(10) not null #사용자 포인트
);

create table ticket(
	id int auto_increment primary key, 
	image VARCHAR(100) not null, #이미지이름
	contents VARCHAR(50) not null, #세부항목
	category varchar(20) not null, #카테고리
	title varchar(50) unique key not null,  #제목
	dateStart varchar(20) not null,  #시작일
	dateEnd varchar(20) not null,  #끝일
	info varchar(100) not null,  #소개
	location varchar(50) not null, #장소
	duration varchar(50) not null,  #기간
	seatNum int(5) not null, #좌석몇까지 있는지
	price int(5) not null, #좌석가격
	discount int(5) not null,  #할인율
	star int(5) not null #평점 
)

create table board(
	id int auto_increment primary key, 
	memberId varchar(30) not null, #글쓴이
	title varchar(20) not null, #제목
	body varchar(100) not null, #내용
	writedate varchar(20) not null, #글쓴날짜
	reply varchar(100), # 리플
	CONSTRAINT fk_id FOREIGN KEY (memberId) 
    REFERENCES memberlist(memberId) ON DELETE CASCADE
)

create table reservelist(
	id int auto_increment primary key, #예약고유번호
    memberId varchar(20) not null, #예약한사람아이디
	reserveTitle varchar(20) not null, #예약제목
	reserveDate varchar(20) not null, #예약한날짜
	reserveLocation varchar(20) not null, #예약장소
	reserveSeatNum int(5) not null, #예약한좌석번호
	reservePrice int(5) not null, #예약가격
	review int(5), #리뷰별점.
	
	CONSTRAINT fk_Res_id FOREIGN KEY(memberId) REFERENCES memberlist(memberId) ON DELETE CASCADE
);

INSERT INTO memberlist(memberName, memberId, memberPw, memberHP,memberPoints)
VALUES
  ('관리자', 'admin', 'admin', '010-555-1234',3000),
  ('테스트1', 'qwer', '1234', '010-5555-5678',3000),
  ('테스트2', 'abcd', '1234', '010-5553-9012',3000),
  ('호옹이', 'asdf', '1234', '010-5222-9212',3000),
  ('로미오', 'opiu', '1234', '010-2987-9912',3000);

INSERT INTO board (memberId, title, body, writedate) VALUES
('qwer', '티켓이 언제오나요?', '안녕하세요. 저번에 예매한 티켓실물을 빨리 받아보고 싶습니다.', '2023-03-01'),
('qwer', '문의사항 입니다 ...', '예매했던 표를 환불 받고 싶습니다.', '2023-03-02'),
('qwer', '공연 업로드 건', '안녕하세요. 사이트 이용자 입니다. 제가 원하는 공연도 업로드 시켜주세요 ', '2023-03-03'),
('qwer', '문의사항 입니다 .', '예매했던 표를 환불 받고 싶습니다.', '2023-03-09'),
('qwer', '신고합니다.', '안녕하세요. 사이트 이용자 입니다. 다름이 아니라 불법이용자를 신고합니다. ', '2023-03-11'),
('abcd', '다량구매', '안녕하세요. 혹시 10장 이상 구매가능할까요 ?.', '2023-03-04'),
('abcd', '안녕하세요 .', '안녕하세요. 처음가입해봤습니다..', '2023-03-05');
  
  
INSERT INTO ticket (image, Contents, Category, Title, DateStart, DateEnd, Info, Location, Duration, SeatNum, Price, Discount, Star)
VALUES
('test1.jpg', '콘서트', '공연', '아이유 콘서트', '2023-03-25', '2023-03-29', '아이유의 새로운 앨범 라이브 공연', '서울 예술의전당', '1시간30분', 100, 50000, 4, 4),
('test2.jpg', '뮤지컬', '공연', '레미제라블', '2023-04-01', '2023-04-10', '빅토르 위고의 역사적인 이야기를 담은 뮤지컬', '씨어터 삼각지', '2시간30분', 200, 80000, 7, 4.5),
('test3.jpg', '영화', '영화', '빈센트 반 고흐 전시', '2023-03-27', '2023-04-05', '세계적인 화가 빈센트 반 고흐의 대표작품들이 전시됩니다', '국립 현대미술관', '6시간30분', 50, 30000, 25, 3.5),
('test4.jpg', '야구', '스포츠', '한화 이글스 경기', '2023-04-01', '2023-04-05', '한화 이글스의 홈 경기를 관람하세요', '인천 SK 행복드림구장', '2시간30분', 300, 25000, 20, 4),
('test5.jpg', '연극', '공연', '하이큐!!', '2023-03-21', '2023-03-28', '인기 만화 하이큐!!를 연극으로 재현한 공연', '대학로 소극장', '1시간30분', 100, 40000, 5, 4.5);
  
INSERT INTO ticket (image, Contents, Category, Title, DateStart, DateEnd, Info, Location, Duration, SeatNum, Price, Discount, Star)
VALUES
('sports1.jpg', '야구', '스포츠', '두산 vs kt', '2023-03-24', '2023-03-26', '두산과 KT의 개막전 시범경기를 선보입니다.', '잠실 야구경기장', '2시간30분', 100, 30000, 5, 4),
('sports2.jpg', '야구', '스포츠', 'KT wiz 시범경기', '2023-03-28', '2023-04-08', 'KT WIZ의 개막전 시범경기를 선보입니다.', '목동 야구경기장', '2시간30분', 100, 30000, 5, 1),
('sports3.jpg', '야구', '스포츠', '한화 vs 삼성', '2023-03-26', '2023-03-28', '삼성과 한화의 개막전 시범경기를 선보입니다.', '잠실 야구경기장', '2시간30분', 100, 30000, 5, 2),
('sports4.jpg', '축구', '스포츠', 'FC 서울 vs 수원 삼성', '2023-03-29', '2023-04-02', 'K리그 개막전 FC 서울과 수원 삼성의 경기를 선보입니다.', '상암월드컵경기장', '2시간30분', 100, 40000, 10, 5),
('sports5.jpg', '야구', '스포츠', '롯데 자이언츠 시범경기', '2023-03-13', '2023-03-27', '롯데 자이언츠의 개막전 시범경기를 선보입니다.', '사직야구장', '2시간30분', 100, 25000, 5, 4),
('sports6.jpg', '테니스', '스포츠', '제주컵 테니스 대회', '2023-03-25', '2023-04-05', '국내 최고의 테니스 대회인 제주컵이 시작됩니다.', '제주시청 테니스장', '2시간30분', 200, 50000, 15, 3),
('sports7.jpg', '야구', '스포츠', '넥센 히어로즈 시범경기', '2023-03-27', '2023-03-27', '넥센 히어로즈의 개막전 시범경기를 선보입니다.', '고척스카이돔', '2시간30분', 100, 28000, 5, 5),
('sports8.jpg', '배구', '스포츠', '한국여자배구연맹컵', '2023-05-10', '2023-05-15', '한국여자배구연맹컵 대회가 열립니다.', '청주체육관', '2시간30분', 120, 20000, 10, 4),
('sports9.jpg', '골프', '스포츠', '제주오픈 골프대회', '2023-04-13', '2023-04-16', '제주에서 열리는 국내 최고의 골프대회인 제주오픈이 시작됩니다.', '제주 골프장', '2시간30분', 150, 100000, 20, 3);
  
 INSERT INTO reservelist(memberId, reserveTitle, reserveDate, reserveLocation, reserveSeatNum, reservePrice)
VALUES ("qwer","무야호~","2023-03-29","종합문학연극장",2,2000); 

  
--  ####~ 위 까지 DB에 넣고 돌리면 됩니다 . ~#####


--#################### perpose of table Utill ; ################### 

select * from memberlist;
select * from ticket;
select * from board;
select * from reservelist;


delete from memberlist;
delete from ticket;
delete from board;
delete from reservelist;


TRUNCATE memberlist;
TRUNCATE ticket;
TRUNCATE board;
TRUNCATE reservelist;


drop table memberlist;
drop table ticket;
drop table board;
drop table reservelist;








 
--#################### perpose of ticket Test  ; ################### 
 
delete from memberlist where memberId = "qwer" and memberPw = "1234";
select memberId from memberlist where memberId="admin" and memberPw="admin";      
 
update ticket
set DateStart='2022-05-02',DateEnd = '2022-05-04'
where id=1;	 


--#################### perpose of ETC Test ; ###################


select * from ticket where Category ="스포츠" order by dateStart;


 select * from ticket where Title like CONCAT('%',"하",'%');
 select * from ticket where Category ="공연" order by Star DESC LIMIT 3;
 select * from ticket where dateStart >= '2022-04-04';
 
 select * from ticket where Category ="공연" order by dateStart;
 select * from ticket where Category ="스포츠" order by dateStart;


delete from reservelist where id = 3;

select * from reservelist order by id desc limit 1;



