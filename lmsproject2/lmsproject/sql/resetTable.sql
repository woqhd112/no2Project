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
create table class(
classnum number primary key,
classname varchar2(100) not null,
teachername varchar2(15) not null,
startdate varchar2(50),
enddate varchar2(50)
);
create sequence class_seq;
insert into class values (class_seq.nextval,'�̹���','�̹���','','');
insert into class values (class_seq.nextval,'�ڹٹ�','���μ�','2020/01/20','2020/02/01');
insert into class values (class_seq.nextval,'�ڹٽ�ũ��Ʈ��','������','2020/02/01','2020/02/06');
insert into class values (class_seq.nextval,'��������','���¼�','2020/02/06','2020/02/21');
insert into class values (class_seq.nextval,'�����ι�','�����','2020/02/06','2020/02/21');
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
insert into exam values (exam_seq.nextval,'�̹���','�̹���','','','','','','',1);
insert into exam values (exam_seq.nextval,'�ڹ�','���μ�','1��',sysdate,'2020/01/27����2020/02/05����','�ڹٽ��蹮������','','',2);
insert into exam values (exam_seq.nextval,'�ڹٽ�ũ��Ʈ','������','1��',sysdate,'2020/01/27����2020/02/05����','�ڹٽ�ũ��Ʈ���蹮������','','',3);
insert into exam values (exam_seq.nextval,'������','���¼�','1��',sysdate,'2020/01/27����2020/02/05����','���������蹮������','','',4);
insert into exam values (exam_seq.nextval,'������','�����','1��',sysdate,'2020/01/27����2020/02/05����','��������蹮������','','',5);
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
Insert into faq values (faq_seq.nextval,'�ӽŰ� ��� �ϳ���?','�ӽŰ� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'�ռ��� ��� �ϳ���?','�ռ��� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'�嵿�� ��� �ϳ���?','�嵿�� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'�ΰ� ��� �ϳ���?','�ΰ� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'���� ��� �ϳ���?','���� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'���� ��� �ϳ���?','���� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'���� ��� �ϳ���??','���� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'�װ� ��� �ϳ���?','�װ� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'���� ��� �ϳ���?','���� ������ �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'�̰� ��� �ϳ���?','�̰� �̷��� �ϼ���!!!!','������',sysdate);
create table notice (
notnum number primary key,
nottitle varchar2(100) not null,
notcontent varchar2(1000) not null,
notauthor varchar2(10) not null,
notdate date not null,
cnt number not null
);
create sequence notice_seq;
Insert into notice values (notice_seq.nextval,'��������������','�ȳ��ϼ��� �������Դϴ�.�����������ּ���.','������',sysdate,0);
Insert into notice values (notice_seq.nextval,'�ĳĳĳĳĳĳ�','�ȳ��ϼ��� �������Դϴ�.�ĳĳĳ����ּ���.','������',sysdate,0);
Insert into notice values (notice_seq.nextval,'�������������','�ȳ��ϼ��� �������Դϴ�.����������ּ���.','������',sysdate,0);
Insert into notice values (notice_seq.nextval,'�������������U','�ȳ��ϼ��� �������Դϴ�.�������U���ּ���.','������',sysdate,0);
Insert into notice values (notice_seq.nextval,'�ϸϸϸϸϸϐ�','�ȳ��ϼ��� �������Դϴ�.�ϸϸϐ����ּ���.','������',sysdate,0);
Insert into notice values (notice_seq.nextval,'�Ʒ� ����� �� �Ʒú� �Ա� ����','�ȳ��ϼ��� �������Դϴ�.�� �޾ư�����.','������',sysdate,0);
Insert into notice values (notice_seq.nextval,'���� �Ļ� ����','�ȳ��ϼ��� �������Դϴ�.�ǵ���� ���� �׸� ������.','������',sysdate,0);
Insert into notice values (notice_seq.nextval,'����û���� ����','�ȳ��ϼ��� �������Դϴ�.���� ���� ���� ����û���⸦ ��ġ�� �����Դϴ�.','������',sysdate,0);
Insert into notice values (notice_seq.nextval,'���� ���� ����','�ȳ��ϼ��� �������Դϴ�.������ �� �غ�����.','������',sysdate,0);
Insert into notice values (notice_seq.nextval,'�ֱ� �߻��ϴ� ��� ����','�ȳ��ϼ��� �������Դϴ�.��� �����ϼ���.','������',sysdate,0);
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
Insert into regnot values (regnot_seq.nextval,'������',sysdate,0,'Node.js ������ �����Ϸ��� �մϴ�.',1,'','');
Insert into regnot values (regnot_seq.nextval,'������',sysdate,0,'�ڹ� ������ �����Ϸ��� �մϴ�.',2,'','');
Insert into regnot values (regnot_seq.nextval,'������',sysdate,0,'���̽� ������ �����Ϸ��� �մϴ�.',3,'','');
Insert into regnot values (regnot_seq.nextval,'������',sysdate,0,'�����ͺ��̽� ������ �����Ϸ��� �մϴ�.',4,'','');
Insert into regnot values (regnot_seq.nextval,'������',sysdate,0,'�����ӿ�ũ ������ �����Ϸ��� �մϴ�.',2,'','');
Insert into regnot values (regnot_seq.nextval,'������',sysdate,0,'C++ ������ �����Ϸ��� �մϴ�.',3,'','');
Insert into regnot values (regnot_seq.nextval,'������',sysdate,0,'C# ������ �����Ϸ��� �մϴ�.',4,'','');
Insert into regnot values (regnot_seq.nextval,'������',sysdate,0,'����Ƽ ������ �����Ϸ��� �մϴ�.',2,'','');
Insert into regnot values (regnot_seq.nextval,'������',sysdate,0,'�ڹٽ�ũ��Ʈ ������ �����Ϸ��� �մϴ�.',3,'','');
Insert into regnot values (regnot_seq.nextval,'������',sysdate,0,'HTML/CSS ������ �����Ϸ��� �մϴ�.',4,'','');
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
insert into hireinfo values (hireinfo_seq.nextval,'ù��°��','������',sysdate,0,'���̹�','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'�߰�','������',sysdate,0,'����','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'�ݰ���','������',sysdate,0,'����','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'����','������',sysdate,0,'��Ʈķ��','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'�ȳ�','������',sysdate,0,'���̹�','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'�߰�','������',sysdate,0,'����','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'�ݰ���','������',sysdate,0,'����','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'����','������',sysdate,0,'��Ʈķ��','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'����','������',sysdate,0,'���̹�','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'�߰�','������',sysdate,0,'����','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'�ݰ���','������',sysdate,0,'����','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'����','������',sysdate,0,'��Ʈķ��','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'�߰�','������',sysdate,0,'����','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'�ݰ���','������',sysdate,0,'����','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'����','������',sysdate,0,'��Ʈķ��','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'����','������',sysdate,0,'���̹�','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'�߰�','������',sysdate,0,'����','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'�ݰ���','������',sysdate,0,'����','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'����','������',sysdate,0,'��Ʈķ��','2020/03/01','http://https://bitcamp.co.kr');
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