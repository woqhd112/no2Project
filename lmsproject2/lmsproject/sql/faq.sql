drop table faq;
create table faq (
faqnum number primary key,
faqtitle varchar2(100) not null,
faqcontent varchar2(1000) not null,
faqauthor varchar2(10) not null,
faqdate date not null
);

drop sequence faq_seq;
create sequence faq_seq;

--Inserting Dummy data--
Insert into faq values (faq_seq.nextval,'�̰� ��� �ϳ���?','�̰� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'���� ��� �ϳ���?','���� ������ �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'�װ� ��� �ϳ���?','�װ� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'���� ��� �ϳ���?','���� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'���� ��� �ϳ���??','���� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'�ӽŰ� ��� �ϳ���?','�ӽŰ� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'���� ��� �ϳ���?','���� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'�ΰ� ��� �ϳ���?','�ΰ� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'�ռ��� ��� �ϳ���?','�ռ��� �̷��� �ϼ���!!!!','������',sysdate);
Insert into faq values (faq_seq.nextval,'�嵿�� ��� �ϳ���?','�嵿�� �̷��� �ϼ���!!!!','������',sysdate);

select * from faq;
