drop table attendtime;
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