drop table attendinfo;
create table attendinfo (
stunum number not null,
constraint stunum_fk2 foreign key(stunum)
references student(stunum),
attendpct number default 0,
ontime number default 0,
late number default 0,
absent number default 0,
checkpct number default 0
);
insert into AttendInfo values (1,40,10,20,20,20);
insert into AttendInfo values (2,20,20,20,20,20);
insert into AttendInfo values (3,10,50,20,10,10);
insert into AttendInfo values (4,10,10,30,10,10);
insert into AttendInfo values (5,20,20,20,20,20);
insert into AttendInfo values (6,10,50,20,10,10);
insert into AttendInfo values (7,10,10,30,10,10);
insert into AttendInfo values (8,20,20,20,20,20);
insert into AttendInfo values (9,10,50,20,10,10);
insert into AttendInfo values (10,10,10,30,10,10);
insert into AttendInfo values (11,10,10,30,10,10);

select * from AttendInfo;
