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
Insert into notice values (notice_seq.nextval,'갸갸갸갸갸갸갹','안녕하세요 행정팀입니다.갸갸갸갹해주세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'냐냐냐냐냐냐냔','안녕하세요 행정팀입니다.냐냐냐냔해주세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'댜댜댜댜댜댜댣','안녕하세요 행정팀입니다.댜댜댜댣해주세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'랴랴랴랴랴랴랼','안녕하세요 행정팀입니다.랴랴랴랼해주세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'먀먀먀먀먀먀먐','안녕하세요 행정팀입니다.먀먀먀먐해주세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'훈련 장려금 및 훈련비 입금 관련','안녕하세요 행정팀입니다.돈 받아가세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'점심 식사 관련','안녕하세요 행정팀입니다.판도라는 이제 그만 가세요.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'공기청정기 관련','안녕하세요 행정팀입니다.오늘 오후 내로 공기청정기를 설치할 예정입니다.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'과제 제출 관련','안녕하세요 행정팀입니다.과레를 잘 해보시죠.','행정팀',sysdate,0);
Insert into notice values (notice_seq.nextval,'최근 발생하는 폐렴 관련','안녕하세요 행정팀입니다.폐렴 조심하세요.','행정팀',sysdate,0);

select * from notice;
