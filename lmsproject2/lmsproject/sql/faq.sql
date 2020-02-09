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
Insert into faq values (faq_seq.nextval,'이건 어떻게 하나요?','이건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'저건 어떻게 하나요?','저건 저렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'그건 어떻게 하나요?','그건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'샷건 어떻게 하나요?','샷건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'지건 어떻게 하나요??','지건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'머신건 어떻게 하나요?','머신건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'윤건 어떻게 하나요?','윤건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'두건 어떻게 하나요?','두건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'손수건 어떻게 하나요?','손수건 이렇게 하세요!!!!','행정팀',sysdate);
Insert into faq values (faq_seq.nextval,'장동건 어떻게 하나요?','장동건 이렇게 하세요!!!!','행정팀',sysdate);

select * from faq;
