drop table exam;
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
drop sequence exam_seq;
create sequence exam_seq;
insert into exam values (exam_seq.nextval,'미배정','미배정','','','','','','',1);
insert into exam values (exam_seq.nextval,'자바','설민석','1차',sysdate,'2020/01/27부터2020/02/05까지','자바시험문제출제','','',2);
insert into exam values (exam_seq.nextval,'자바스크립트','최진기','1차',sysdate,'2020/01/27부터2020/02/05까지','자바스크립트시험문제출제','','',3);
insert into exam values (exam_seq.nextval,'스프링','최태성','1차',sysdate,'2020/01/27부터2020/02/05까지','스프링시험문제출제','','',4);
insert into exam values (exam_seq.nextval,'디자인','김덕수','1차',sysdate,'2020/01/27부터2020/02/05까지','김덕수시험문제출제','','',5);