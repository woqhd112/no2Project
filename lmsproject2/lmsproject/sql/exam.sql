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
insert into exam values (exam_seq.nextval,'�̹���','�̹���','','','','','','',1);
insert into exam values (exam_seq.nextval,'�ڹ�','���μ�','1��',sysdate,'2020/01/27����2020/02/05����','�ڹٽ��蹮������','','',2);
insert into exam values (exam_seq.nextval,'�ڹٽ�ũ��Ʈ','������','1��',sysdate,'2020/01/27����2020/02/05����','�ڹٽ�ũ��Ʈ���蹮������','','',3);
insert into exam values (exam_seq.nextval,'������','���¼�','1��',sysdate,'2020/01/27����2020/02/05����','���������蹮������','','',4);
insert into exam values (exam_seq.nextval,'������','�����','1��',sysdate,'2020/01/27����2020/02/05����','��������蹮������','','',5);