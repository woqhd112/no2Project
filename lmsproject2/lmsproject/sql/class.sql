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
insert into class values (class_seq.nextval,'�̹���','�̹���','','');
insert into class values (class_seq.nextval,'�ڹٹ�','���μ�','2020/01/20','2020/02/01');
insert into class values (class_seq.nextval,'�ڹٽ�ũ��Ʈ��','������','2020/02/01','2020/02/06');
insert into class values (class_seq.nextval,'��������','���¼�','2020/02/06','2020/02/21');
insert into class values (class_seq.nextval,'�����ι�','�����','2020/02/06','2020/02/21');
select * from class;
