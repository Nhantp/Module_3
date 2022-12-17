use ss02_th_tao_csdl_sinh_vien;
insert into class
values(1,'A1','2008-12-20',1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
select *from student;

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
	
       
       
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1),
       (2,3,15,1);

select *from student ;
delete from mark
where mark;
set sql_safe_updates =0;
create view student_view as
select studentName,address from student;

select *from student_view;

update student_view
set address='Quang nam'
where studentName ='Hung';
drop view student_view;

select *from student where studentName='Hung';
explain select *from student where studentName='Hung';
alter table student add index idx_studentName(studentName);
explain select *from student where studentName ='Hung';

alter table student add index idx_studenttt(studentName, address);
explain select *from student where studentName ='Hung' or address='Quang nam' ;

alter table student drop index idx_studenttt;

explain	select *from student where studentName like '%H';      

delimiter //
create procedure findAllStudent()
begin
select *from student;
end //
delimiter ;
call findAllStudent();

delimiter //
-- drop procedure if exists `findAllStudent ` //
create procedure findAllStudent()
begin 
select *from student where studentName='Hoa';
end //       
select *from class;
select *from student;
select *from subject;
select *from mark;
select *from student where studentName like 'H%';
select *from student where studentID in(1,3);
select *from student where studentID=1 or studentID =3;
select student.*
from student