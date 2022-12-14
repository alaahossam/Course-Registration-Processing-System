/*Queries*/

1-SELECT student_name , student_id FROM student as s JOIN enrolled as e ON s.student_id=e.student_id join semester_course as sem ON sem.course_code = e.course_code where
  sem.`year` = e.`year` and sem.quarter = en.quarter and  s.level = "SR" and sem.prof_id = 1 GROUP BY s.student_id;

2-SELECT max(s.age) FROM student as s JOIN enrolled as e ON s.student_id=e.student_id JOIN semester_course as sem ON e.course_code=sem.course_code JOIN professor as p ON sem.prof_id=p.prof_id
  WHERE s.major='History' OR p.prof_name='Michael Miller';

3-SELECT DISTINCT s.student_id , s.student_name , c.name 
  FROM student as s  LEFT JOIN enrolled as e ON s.student_id=e.student_id LEFT JOIN course as c ON e.course_code=c.course_code;


4-SELECT p.prof_name , p.prof_id from professor as p left join semester_course as sem on p.prof_id = sem.prof_id
  GROUP by p.prof_id  
  HAVING COUNT(sem.course_code) < 5;
  
5- SELECT s.student_name from student as s WHERE not EXISTS ((SELECT sem.course_code
   FROM semester_course as sem WHERE sem.prof_id = 2) except (SELECT e.course_code FROM enrolled as e
   WHERE s.student_id = e.student_id)); 
   
6-SELECT c.name FROM  course as c WHERE c.course_code  NOT IN ((SELECT sem.course_code FROM semester_course sem)) 
  UNION 
  SELECT c1.name FROM course as  c1, semester_course as sem NATURAL JOIN professor as p,department as dep
  WHERE   p.dept_id = dep.dept_id AND dep.dept_name = 'Computer Science' AND c1.course_code = Sem.course_code;
 
7-SELECT s.student_name from student as s WHERE s.student_name LIKE 'M%' AND s.age<20 
  UNION
 (SELECT p.prof_name from professor as p WHERE p.prof_name LIKE 'M%' AND p.prof_id IN (SELECT sem.prof_id from semester_course as sem GROUP By sem.prof_id HAVING count(*)>2) );


8-SELECT p.prof_id , p.prof_name FROM  professor as p  NATURAL left join semester_course as sem
WHERE p.dept_id in ('1','2','3','4')
GROUP BY p.prof_id HAVING COUNT(*)<2;

9-SELECT s.student_id , s.student_name, p.prof_id , p.prof_name
  FROM (student s LEFT JOIN (enrolled e NATURAL JOIN semester_course sem) on s.student_id = e.student_id) LEFT JOIN professor p on sem.prof_id = p.prof_id 
  UNION  
  SELECT s.student_id , s.student_name, p.prof_id , p.prof_name
  FROM (student s RIGHT JOIN (enrolled e NATURAL JOIN semester_course sem) on s.student_id = e.student_id) RIGHT JOIN professor p on sem.prof_id = p.prof_id;


10- SELECT p.prof_id, p.prof_name, c.course_code, c.name FROM professor as p
JOIN semester_course as sem on p.prof_id = sem.prof_id
JOIN enrolled as e on e.course_code = sem.course_code
JOIN course as c on c.course_code = e.course_code
HAVING count(e.course_code) >= 2;

11-SELECT d.dept_name FROM department d JOIN professor p on d.dept_id=p.dept_id JOIN semester_course sem ON sem.prof_id=p.prof_id 
HAVING COUNT(sem.course_code<3);