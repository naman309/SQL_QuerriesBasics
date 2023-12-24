/*
NAME : NAMAN SHARMA
STUDENT NUMBER : 8837689
*/
-- Query 1
SELECT distinct student.id,name from takes,student,course
where student.id = takes.id And course.course_id = takes.course_id
and course.dept_name = 'Comp. Sci.';

-- Query 2
insert into course values ('CS-001','Weekly Seminar','Comp. Sci.',0);
/*Unable to insert course into course table as schema specifies credit limit to be greater than 0.*/

-- Query 3
insert into section (course_id, sec_id, semester, year) values('CS-001', 1,'Fall', 2017);
/*It will not affect a row, and will give an error while executing, as there is no Course_id named as 'CS-001'.*/

-- Query 4
INSERT INTO takes(ID, course_id, sec_id, semester, YEAR) 
SELECT ID, 'CS-001', '1', 'Fall', 2017 FROM student WHERE dept_name = 'Comp. Sci.';

-- Query 5
delete from takes where course_id = 'CS-001' and ID = '12345';

-- Query 6
delete from course where course_id = 'CS-001';
/* Notice that when this course_id is deleted from course table, all tuples in other tables referencing this key gets deleted as well.
 Sql database engine will take care of removing all referencing enteries.*/

-- Query 7
DELETE from takes where 
takes.course_id in (
    select takes.course_id
    from takes, course
    where takes.course_id = course.course_id
    and upper(course.title) like '% ADVANCED %' 
    ) ;
