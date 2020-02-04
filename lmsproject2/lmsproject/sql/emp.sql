drop table emp1;
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

drop sequence emp1_seq;
create sequence emp1_seq;

--Inserting Dummy Data--
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

select * from emp1;



