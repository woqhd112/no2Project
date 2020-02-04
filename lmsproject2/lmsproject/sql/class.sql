drop table class;
create table class(
classnum number primary key,
classname varchar2(100) not null,
teachername varchar2(15) not null,
startdate varchar2(50),
enddate varchar2(50)
);
drop sequence class_seq;
create sequence class_seq;
insert into class values (class_seq.nextval,'미배정','미배정','','');
insert into class values (class_seq.nextval,'자바반','설민석','2020/01/20','2020/02/01');
insert into class values (class_seq.nextval,'자바스크립트반','최진기','2020/02/01','2020/02/06');
insert into class values (class_seq.nextval,'스프링반','최태성','2020/02/06','2020/02/21');
insert into class values (class_seq.nextval,'디자인반','김덕수','2020/02/06','2020/02/21');
select * from class;
