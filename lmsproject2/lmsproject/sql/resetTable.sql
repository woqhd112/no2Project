drop table emp1;
drop table attendinfo;
drop table attendtime;
drop table score;
drop table student;
drop table exam;
drop table regnot;
drop table notice;
drop table faq;
drop table hireinfo;
drop table class;
drop sequence emp1_seq;
drop sequence exam_seq;
drop sequence regnot_seq;
drop sequence notice_seq;
drop sequence faq_seq;
drop sequence hireinfo_seq;
drop sequence student_seq;
drop sequence class_seq;
create table emp1 (
empnum number primary key,
empname varchar2(15) not null,
empid varchar2(30) not null,
emppw varchar2(13) not null,
empemail varchar2(30) not null,
empphone varchar2(11) not null,
dept varchar2(10) not null,
empaddr varchar2(500) not null,
empdate date not null
);
create sequence emp1_seq;
insert into emp1 values (emp1_seq.nextval,'설민석', 'minseok', '1234', 'minseok@gmail.com','01044441115','강사팀','비트특별시 캠프구 자바대로19길 123-4',sysdate);
insert into emp1 values (emp1_seq.nextval,'최진기', 'jingi', '1234', 'jingi@gmail.com','01044441115','강사팀','비트특별시 캠프구 자바대로19길 123-4',sysdate);
insert into emp1 values (emp1_seq.nextval,'최태성', 'taesung', '1234', 'taesung@gmail.com','01044441115','강사팀','비트특별시 캠프구 자바대로19길 123-4',sysdate);
insert into emp1 values (emp1_seq.nextval,'김덕수','deoksoo','1234','deoksoo@gmail.com','01011111111','강사팀','비트특별시 캠프구 자바대로18길 123-1',sysdate);
insert into emp1 values (emp1_seq.nextval,'고재현', 'jaehyun', '1234', 'jaehyun@gmail.com','01022221111','영업팀','비트특별시 캠프구 자바대로18길 123-2',sysdate);
insert into emp1 values (emp1_seq.nextval,'장인영', 'inyoung', '1234', 'inyoung@gmail.com','01033331111','회계팀','비트특별시 캠프구 자바대로18길 123-3',sysdate);
insert into emp1 values (emp1_seq.nextval,'유명효', 'myeonghyo', '1234', 'myeonghyo@gmail.com','01044441111','행정팀','비트특별시 캠프구 자바대로18길 123-4',sysdate);
insert into emp1 values (emp1_seq.nextval,'김덕자', 'deokja', '1234', 'deokja@gmail.com','01011111112','취업팀','비트특별시 캠프구 자바대로18길 123-5',sysdate);
insert into emp1 values (emp1_seq.nextval,'고재덕', 'jaeduck', '1234', 'jaeduck@gmail.com','01022221134','영업팀','비트특별시 캠프구 자바대로18길 123-2',sysdate);
insert into emp1 values (emp1_seq.nextval,'장영', 'young', '1234', 'young@gmail.com','01033331141','행정팀','비트특별시 캠프구 자바대로18길 123-3',sysdate);
insert into emp1 values (emp1_seq.nextval,'유명자', 'myeongja', '1234', 'myeongja@gmail.com','01044441115','강사팀','비트특별시 캠프구 자바대로19길 123-4',sysdate);
create table class(
classnum number primary key,
classname varchar2(100) not null,
teachername varchar2(15) not null,
startdate varchar2(50),
enddate varchar2(50)
);
create sequence class_seq;
insert into class values (class_seq.nextval,'미배정','미배정','','');
insert into class values (class_seq.nextval,'자바반','설민석','2020/01/20','2020/02/01');
insert into class values (class_seq.nextval,'자바스크립트반','최진기','2020/02/01','2020/02/06');
insert into class values (class_seq.nextval,'스프링반','최태성','2020/02/06','2020/02/21');
insert into class values (class_seq.nextval,'디자인반','김덕수','2020/02/06','2020/02/21');
create table exam (
examnum number primary key,
examname varchar2(100),
teachername varchar2(15) not null,
examorder varchar2(20) default '',
examdate date,
examexp varchar2(50),
examcontent varchar2(1000),
examfile varchar2(2000) default '',
origin varchar2(2000) default '',
classnum number not null,
constraint classnum_fk3 foreign key(classnum)
references class(classnum)
);
create sequence exam_seq;
insert into exam values (exam_seq.nextval,'미배정','미배정','','','','','','',1);
insert into exam values (exam_seq.nextval,'자바','설민석','1차',sysdate,'2020/01/27부터2020/02/05까지','자바시험문제출제','','',2);
insert into exam values (exam_seq.nextval,'자바스크립트','최진기','1차',sysdate,'2020/01/27부터2020/02/05까지','자바스크립트시험문제출제','','',3);
insert into exam values (exam_seq.nextval,'스프링','최태성','1차',sysdate,'2020/01/27부터2020/02/05까지','스프링시험문제출제','','',4);
insert into exam values (exam_seq.nextval,'디자인','김덕수','1차',sysdate,'2020/01/27부터2020/02/05까지','김덕수시험문제출제','','',5);
create table student (
stunum number primary key,
stuid varchar2(30) not null,
stuname varchar2(15) not null,
stupw varchar2(13) not null,
stuphone varchar2(11) not null,
stuaddr varchar2(100) not null,
classname varchar2(60),
teachername varchar2(15) not null,
classnum number not null,
constraint classnum_fk2 foreign key (classnum)
references class(classnum),
examnum number not null,
constraint examnum_fk3 foreign key (examnum)
references exam(examnum)
);
create sequence student_seq;
insert into student values (student_seq.nextval,'cooldeoksoo','김덕수','1234','01011112222','비트특별시 캠프구 자바대로18길 123-1','자바반','설민석',2,2);
insert into student values (student_seq.nextval,'jeahyunbabo','고재현','1234','01022223333','허걱특별시 희안구 파이썬대로12길 123-1','자바스크립트반','최진기',3,3);
insert into student values (student_seq.nextval,'inyoungzzang','장인영','1234','0101432132','독립도 만세시 대한대로11길 123-1','스프링반','최태성',4,4);
insert into student values (student_seq.nextval,'damnharry','유명효','1234','01014312872','어플도 제작시 애플대로14길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'healthykim','김부황','1234','01012112912','수당특별시 내놔구 예쓰대로90길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'josunhero','이순신','1234','01012212532','기타특별시 수당구 여부대로23길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'thiefking1','임꺽정','1234','01033112222','비트특별시 캠프구 스타대로1길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'bronzethief','홍길동','1234','01014412222','비트특별시 캠프구 자바대로18길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'silverthief','홍길은','1234','01015512222','비트특별시 캠프구 자바대로18길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'goldthief','홍길금','1234','01016612222','비트특별시 캠프구 자바대로18길 123-1','미배정','미배정',1,1);
insert into student values (student_seq.nextval,'yoonsikjoa','김연주','1234','01017712222','비트특별시 캠프구 자바대로18길 123-1','미배정','미배정',1,1);
create table attendinfo (
stunum number not null,
constraint stunum_fk2 foreign key(stunum)
references student(stunum),
attendpct number default 0,
ontime number default 0,
late number default 0,
absent number default 0,
checkpct number default 0
);
insert into AttendInfo values (1,40,10,20,20,20);
insert into AttendInfo values (2,20,20,20,20,20);
insert into AttendInfo values (3,10,50,20,10,10);
insert into AttendInfo values (4,10,10,30,10,10);
insert into AttendInfo values (5,20,20,20,20,20);
insert into AttendInfo values (6,10,50,20,10,10);
insert into AttendInfo values (7,10,10,30,10,10);
insert into AttendInfo values (8,20,20,20,20,20);
insert into AttendInfo values (9,10,50,20,10,10);
insert into AttendInfo values (10,10,10,30,10,10);
insert into AttendInfo values (11,10,10,30,10,10);
create table attendtime(
stunum number not null,
constraint stunum_fk foreign key(stunum)
references student(stunum),
arrtime varchar2(50),
leavetime varchar2(50),
attendstat number default 3
);
insert into attendtime values (1,'','',3);
insert into attendtime values (2,'','',3);
insert into attendtime values (3,'','',3);
insert into attendtime values (4,'','',3);
insert into attendtime values (5,'','',3);
insert into attendtime values (6,'','',3);
insert into attendtime values (7,'','',3);
insert into attendtime values (8,'','',3);
insert into attendtime values (9,'','',3);
insert into attendtime values (10,'','',3);
insert into attendtime values (11,'','',3);

create table faq (
faqnum number primary key,
faqtitle varchar2(100) not null,
faqcontent varchar2(1000) not null,
faqauthor varchar2(10) not null,
faqdate date not null
);
create sequence faq_seq;
Insert into faq values (faq_seq.nextval,'머신건 어떻게 하나요?','머신건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'손수건 어떻게 하나요?','손수건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'장동건 어떻게 하나요?','장동건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'두건 어떻게 하나요?','두건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'윤건 어떻게 하나요?','윤건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'샷건 어떻게 하나요?','샷건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'지건 어떻게 하나요??','지건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'그건 어떻게 하나요?','그건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'저건 어떻게 하나요?','저건 저렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'이건 어떻게 하나요?','이건 이렇게 하세요!!!!','행정팀',sysdate);
create table notice (
notnum number primary key,
nottitle varchar2(100) not null,
notcontent varchar2(1000) not null,
notauthor varchar2(10) not null,
notdate date not null,
cnt number not null
);
create sequence notice_seq;
Insert into notice values (notice_seq.nextval,'갸갸갸갸갸갸갹','안녕하세요 행정팀입니다.갸갸갸갹해주세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'냐냐냐냐냐냐냔','안녕하세요 행정팀입니다.냐냐냐냔해주세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'댜댜댜댜댜댜댣','안녕하세요 행정팀입니다.댜댜댜댣해주세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'랴랴랴랴랴랴랼','안녕하세요 행정팀입니다.랴랴랴랼해주세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'먀먀먀먀먀먀먐','안녕하세요 행정팀입니다.먀먀먀먐해주세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'훈련 장려금 및 훈련비 입금 관련','안녕하세요 행정팀입니다.돈 받아가세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'점심 식사 관련','안녕하세요 행정팀입니다.판도라는 이제 그만 가세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'공기청정기 관련','안녕하세요 행정팀입니다.오늘 오후 내로 공기청정기를 설치할 예정입니다.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'과제 제출 관련','안녕하세요 행정팀입니다.과레를 잘 해보시죠.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'최근 발생하는 폐렴 관련','안녕하세요 행정팀입니다.폐렴 조심하세요.','행정팀',sysdate,0);
create table regnot(
regnum number primary key,
regauthor varchar2(10) not null,
regdate date not null,
regcnt number not null,
regcontent varchar2(1000) not null,
classnum number not null,
constraint classnum_fk foreign key(classnum)
references class(classnum),
regfile varchar2(2000) default '',
origin varchar2(2000) default ''
);
create sequence regnot_seq;
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'Node.js 수업을 진행하려고 합니다.',1,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'자바 수업을 진행하려고 합니다.',2,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'파이썬 수업을 진행하려고 합니다.',3,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'데이터베이스 수업을 진행하려고 합니다.',4,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'프레임워크 수업을 진행하려고 합니다.',2,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'C++ 수업을 진행하려고 합니다.',3,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'C# 수업을 진행하려고 합니다.',4,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'유니티 수업을 진행하려고 합니다.',2,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'자바스크립트 수업을 진행하려고 합니다.',3,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'HTML/CSS 수업을 진행하려고 합니다.',4,'','');
create table hireinfo (
infonum number primary key,
infotitle varchar2(100) not null,
infoauthor varchar2(10) not null,
infodate date not null,
infocnt number default 0,
cmpname varchar2(30) not null,
cmpexp varchar2(50) not null,
cmplink varchar2(100) not null
);
create sequence hireinfo_seq;
insert into hireinfo values (hireinfo_seq.nextval,'첫번째글','관리자',sysdate,0,'네이버','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'잘가','관리자',sysdate,0,'다음','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'반가워','관리자',sysdate,0,'구글','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'ㅋㅋ','관리자',sysdate,0,'비트캠프','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'안녕','관리자',sysdate,0,'네이버','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'잘가','관리자',sysdate,0,'다음','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'반가워','관리자',sysdate,0,'구글','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'ㅎㅎ','관리자',sysdate,0,'비트캠프','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'ㅋㅋ','관리자',sysdate,0,'네이버','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'잘가','관리자',sysdate,0,'다음','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'반가워','관리자',sysdate,0,'구글','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'ㅎㅎ','관리자',sysdate,0,'비트캠프','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'잘가','관리자',sysdate,0,'다음','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'반가워','관리자',sysdate,0,'구글','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'ㅎㅎ','관리자',sysdate,0,'비트캠프','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'ㅋㅋ','관리자',sysdate,0,'네이버','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'잘가','관리자',sysdate,0,'다음','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'반가워','관리자',sysdate,0,'구글','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'ㅎㅎ','관리자',sysdate,0,'비트캠프','2020/03/01','http://https://bitcamp.co.kr');
create table score (
examnum not null,
constraint examnum_fk foreign key(examnum)
references exam(examnum),
stunum not null,
constraint stunum_fk3 foreign key(stunum)
references student(stunum),
first number default 0,
second number default 0,
third number default 0
);
insert into score values (1,1,30,50,90);
insert into score values (2,2,20,30,40);
insert into score values (3,3,30,50,90);
insert into score values (1,4,20,30,40);
insert into score values (2,5,30,50,90);
insert into score values (4,6,20,30,40);
insert into score values (5,7,30,50,90);
insert into score values (2,8,20,30,40);
insert into score values (1,9,30,50,90);
insert into score values (1,10,20,30,40);
insert into score values (5,11,20,30,40);