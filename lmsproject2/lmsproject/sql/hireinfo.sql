drop table hireinfo;
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
drop sequence hireinfo_seq;
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
select * from hireinfo;