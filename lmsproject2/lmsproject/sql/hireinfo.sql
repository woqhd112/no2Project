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
insert into hireinfo values (hireinfo_seq.nextval,'湛腰属越','淫軒切',sysdate,0,'革戚獄','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'設亜','淫軒切',sysdate,0,'陥製','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'鋼亜趨','淫軒切',sysdate,0,'姥越','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'せせ','淫軒切',sysdate,0,'搾闘跳覗','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'照括','淫軒切',sysdate,0,'革戚獄','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'設亜','淫軒切',sysdate,0,'陥製','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'鋼亜趨','淫軒切',sysdate,0,'姥越','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'ぞぞ','淫軒切',sysdate,0,'搾闘跳覗','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'せせ','淫軒切',sysdate,0,'革戚獄','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'設亜','淫軒切',sysdate,0,'陥製','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'鋼亜趨','淫軒切',sysdate,0,'姥越','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'ぞぞ','淫軒切',sysdate,0,'搾闘跳覗','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'設亜','淫軒切',sysdate,0,'陥製','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'鋼亜趨','淫軒切',sysdate,0,'姥越','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'ぞぞ','淫軒切',sysdate,0,'搾闘跳覗','2020/03/01','http://https://bitcamp.co.kr');
insert into hireinfo values (hireinfo_seq.nextval,'せせ','淫軒切',sysdate,0,'革戚獄','2020/03/01','http://naver.com');
insert into hireinfo values (hireinfo_seq.nextval,'設亜','淫軒切',sysdate,0,'陥製','2020/03/01','http://daum.net');
insert into hireinfo values (hireinfo_seq.nextval,'鋼亜趨','淫軒切',sysdate,0,'姥越','2020/03/01','http://google.com');
insert into hireinfo values (hireinfo_seq.nextval,'ぞぞ','淫軒切',sysdate,0,'搾闘跳覗','2020/03/01','http://https://bitcamp.co.kr');
select * from hireinfo;