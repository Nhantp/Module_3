use ss02_th_tao_csdl_sinh_vien;

select *from student 
where studentName like 'h%';

select *from class
where startDate like '%12%';

select *from subject
where credit between 3 and 5;

set sql_safe_updates =0;
select *from student;

select *from class;

update student 
set classID=2
where studentName ='Hung';

delete from student;
select s.studentName, sub.subName, m.mark
from student s join mark m on s.studentID=m.studentID join subject sub on m.subID=sub.subID 
order by mark desc,studentName asc;

