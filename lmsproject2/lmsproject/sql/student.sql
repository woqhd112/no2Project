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
insert into student values (student_seq.nextval,'cooldeoksoo','�����','1234','01011112222','��ƮƯ���� ķ���� �ڹٴ��18�� 123-1','�ڹٹ�','���μ�',2,2);
insert into student values (student_seq.nextval,'jeahyunbabo','������','1234','01022223333','���Ư���� ��ȱ� ���̽���12�� 123-1','�ڹٽ�ũ��Ʈ��','������',3,3);
insert into student values (student_seq.nextval,'inyoungzzang','���ο�','1234','0101432132','������ ������ ���Ѵ��11�� 123-1','��������','���¼�',4,4);
insert into student values (student_seq.nextval,'damnharry','����ȿ','1234','01014312872','���õ� ���۽� ���ô��14�� 123-1','�̹���','�̹���',1,1);
insert into student values (student_seq.nextval,'healthykim','���Ȳ','1234','01012112912','����Ư���� ������ �������90�� 123-1','�̹���','�̹���',1,1);
insert into student values (student_seq.nextval,'josunhero','�̼���','1234','01012212532','��ŸƯ���� ���籸 ���δ��23�� 123-1','�̹���','�̹���',1,1);
insert into student values (student_seq.nextval,'thiefking1','�Ӳ���','1234','01033112222','��ƮƯ���� ķ���� ��Ÿ���1�� 123-1','�̹���','�̹���',1,1);
insert into student values (student_seq.nextval,'bronzethief','ȫ�浿','1234','01014412222','��ƮƯ���� ķ���� �ڹٴ��18�� 123-1','�̹���','�̹���',1,1);
insert into student values (student_seq.nextval,'silverthief','ȫ����','1234','01015512222','��ƮƯ���� ķ���� �ڹٴ��18�� 123-1','�̹���','�̹���',1,1);
insert into student values (student_seq.nextval,'goldthief','ȫ���','1234','01016612222','��ƮƯ���� ķ���� �ڹٴ��18�� 123-1','�̹���','�̹���',1,1);
insert into student values (student_seq.nextval,'yoonsikjoa','�迬��','1234','01017712222','��ƮƯ���� ķ���� �ڹٴ��18�� 123-1','�̹���','�̹���',1,1);



