drop table notice;
create table notice (
notnum number primary key,
nottitle varchar2(100) not null,
notcontent varchar2(1000) not null,
notauthor varchar2(10) not null,
notdate date not null,
cnt number not null
);

drop sequence notice_seq;
create sequence notice_seq;

--Inserting Dummy data--
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

select * from notice;
