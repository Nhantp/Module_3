use ss02_th_tao_csdl_sinh_vien;
select subID, subName, credit, status, max(credit) as max_credit
from subject;

select sb.subID, sb.subName, sb.credit,max(m.mark) as max_mark
from subject sb join mark m on sb.subID=m.subID;

select s.studentID, s.studentName, s.address, s.phone, s.status, avg(m.mark)
from student s join mark m on s.studentID= m.studentID
group by studentID, studentName
order by m.mark desc;
