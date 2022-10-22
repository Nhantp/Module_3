use ss02_th_tao_csdl_sinh_vien;
select *from student;

select *from student 
where status=true;

select *from subject 
where credit <10;

select st.studentID, st.studentName, cl.classID
from student st join class cl on st.classID=cl.classID; 

select s.studentID, s.studentName, c.className
from student s join class c on s.classID=c.classID
where c.className='A1';

select *from student;
select *from class;

select s.studentID, s.studentName, sb.subName, m.mark
from student s join mark m on s.studentID= m.studentID join subject sb on sb.subID=m.subID;

select s.studentID, s.studentName, sb.subName, m.mark
from student s join mark m on s.studentID=m.studentID join subject sb on sb.subID=m.subID
where sb.subName='CF';

