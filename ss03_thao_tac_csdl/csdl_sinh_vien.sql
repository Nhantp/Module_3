create database ss02_th_tao_csdl_sinh_vien;
use ss02_th_tao_csdl_sinh_vien;
create table class(
	classID int primary key not null auto_increment,
    className varchar(60) not null,
    startDate datetime not null,
    status bit	
);
describe class;
drop table class;
create table student(
	studentID int primary key not null auto_increment,
    studentName varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    status bit,
    classID int not null,
    foreign key (classID) references class(classID)
);
drop table student;
create table subject(
	subID int primary key not null auto_increment,
    subName varchar(30),
    credit tinyint not null default '1',
    status bit default 1,
    check(credit>=1)
);
drop table subject;	
create table mark(
	markID int primary key not null auto_increment,
    subID int not null,
    studentID int not null,
    mark float default'0',
    examTimes tinyint default 1,
    check(mark between 0 and 100 ),
	unique(subID,studentID),
	foreign key (subID) references subject(subID),
    foreign key (studentID) references student(studentID)
);
drop table mark;
describe mark;
describe table subject; 


