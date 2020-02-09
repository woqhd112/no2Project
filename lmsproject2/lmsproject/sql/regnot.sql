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
select regnum,regauthor,regdate,regcnt,regcontent from regnot;
select class.classname,regnot.regcontent from regnot,class where class.classnum=0;