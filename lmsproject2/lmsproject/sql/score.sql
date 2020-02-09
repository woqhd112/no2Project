drop table score;
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

select * from score;