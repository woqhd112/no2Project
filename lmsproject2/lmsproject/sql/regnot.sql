drop table regnot;
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

drop sequence regnot_seq;
create sequence regnot_seq;

--Inserting Dummy data--
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'Node.js 수업을 진행하려고 합니다.',1,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'자바 수업을 진행하려고 합니다.',2,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'파이썬 수업을 진행하려고 합니다.',3,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'데이터베이스 수업을 진행하려고 합니다.',4,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'프레임워크 수업을 진행하려고 합니다.',2,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'C++ 수업을 진행하려고 합니다.',3,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'C# 수업을 진행하려고 합니다.',4,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'유니티 수업을 진행하려고 합니다.',2,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'자바스크립트 수업을 진행하려고 합니다.',3,'','');
Insert into regnot values (regnot_seq.nextval,'영업팀',sysdate,0,'HTML/CSS 수업을 진행하려고 합니다.',4,'','');
select regnum,regauthor,regdate,regcnt,regcontent from regnot;
select class.classname,regnot.regcontent from regnot,class where class.classnum=0;