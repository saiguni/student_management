-- Insert into student (stud_id, stud_name, stud_email, stud_address, stud_contactno) values (4, 'david smith', 'davidsm@gmail.com', '120 melissa, texas', 4545454545);

-- Insert into professor(prof_id, prof_name, prof_designation, prof_contactno, prof_address, prof_email) values (6, 'deogun', 'preofessor', 3434343434, '121 new York, new jersey', 'deokgun@gmail.com');

-- Update professor set prof_name='deokgun park' where prof_id=6;

-- Update student set stud_name='deokgun park' where prof_id=4;

-- Delete from student where stud_id = 4;

-- Select * from student;

-- select hw_name from homework inner join student on homework.stud_id = student.stud_id;

-- select course_catalog.course_name from course_catalog inner join enrolls on enrolls.course_id = course_catalog.course_id

-- select count(hw_id), teach_id from homework group by teach_id;

-- select count(hw_id), teach_id from homework group by teach_id;

-- select hw_name from homework left join teach on homework.teach_id = teach.teach_id;

-- Select course_name from course_catalog left join teach on teach.course_id = course_catalog.course_id;

-- select * from homework where homework.hw_grade = 'A';

-- select * from enrolls where enrolls.stud_id = 1;