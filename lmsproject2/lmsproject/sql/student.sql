drop table student;
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

drop sequence student_seq;
create sequence student_seq;

--Inserting Dummy Data--
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



