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
insert into emp1 values (emp1_seq.nextval,'���μ�', 'minseok', '1234', 'minseok@gmail.com','01044441115','������','��ƮƯ���� ķ���� �ڹٴ��19�� 123-4',sysdate);
insert into emp1 values (emp1_seq.nextval,'������', 'jingi', '1234', 'jingi@gmail.com','01044441115','������','��ƮƯ���� ķ���� �ڹٴ��19�� 123-4',sysdate);
insert into emp1 values (emp1_seq.nextval,'���¼�', 'taesung', '1234', 'taesung@gmail.com','01044441115','������','��ƮƯ���� ķ���� �ڹٴ��19�� 123-4',sysdate);
insert into emp1 values (emp1_seq.nextval,'�����','deoksoo','1234','deoksoo@gmail.com','01011111111','������','��ƮƯ���� ķ���� �ڹٴ��18�� 123-1',sysdate);
insert into emp1 values (emp1_seq.nextval,'������', 'jaehyun', '1234', 'jaehyun@gmail.com','01022221111','������','��ƮƯ���� ķ���� �ڹٴ��18�� 123-2',sysdate);
insert into emp1 values (emp1_seq.nextval,'���ο�', 'inyoung', '1234', 'inyoung@gmail.com','01033331111','ȸ����','��ƮƯ���� ķ���� �ڹٴ��18�� 123-3',sysdate);
insert into emp1 values (emp1_seq.nextval,'����ȿ', 'myeonghyo', '1234', 'myeonghyo@gmail.com','01044441111','������','��ƮƯ���� ķ���� �ڹٴ��18�� 123-4',sysdate);
insert into emp1 values (emp1_seq.nextval,'�����', 'deokja', '1234', 'deokja@gmail.com','01011111112','�����','��ƮƯ���� ķ���� �ڹٴ��18�� 123-5',sysdate);
insert into emp1 values (emp1_seq.nextval,'�����', 'jaeduck', '1234', 'jaeduck@gmail.com','01022221134','������','��ƮƯ���� ķ���� �ڹٴ��18�� 123-2',sysdate);
insert into emp1 values (emp1_seq.nextval,'�念', 'young', '1234', 'young@gmail.com','01033331141','������','��ƮƯ���� ķ���� �ڹٴ��18�� 123-3',sysdate);
insert into emp1 values (emp1_seq.nextval,'������', 'myeongja', '1234', 'myeongja@gmail.com','01044441115','������','��ƮƯ���� ķ���� �ڹٴ��19�� 123-4',sysdate);

select * from emp1;



