CREATE DATABASE Course_Registration_Processing_system;

CREATE TABLE Department(
dept_id INTEGER,
dept_name varchar(30),
PRIMARY KEY(dept_id)
);

CREATE TABLE Student(
    student_id integer ,
    student_name varchar(30),
    major varchar(20),
    `level` varchar(4),
    age integer,
    PRIMARY KEY(student_id)
);

CREATE TABLE professor(
prof_id INTEGER ,
prof_name VARCHAR(30),
dept_id INTEGER,
PRIMARY KEY (prof_id)

);

CREATE TABLE course(
    course_code varchar(6),
    name varchar(20),
    PRIMARY KEY (course_code)
);

CREATE TABLE semester_course(
    course_code varchar(6),
    quarter int,
    `year` int ,
    prof_id int,
    PRIMARY KEY (course_code , quarter , `year`)
);

CREATE TABLE enrolled(
    student_id INTEGER,
    course_code varchar(6),
	quarter INTEGER,
    `year` INTEGER ,
    enrolled_at DATE,
    PRIMARY KEY (student_id,course_code , quarter , `year`)
);
ALTER TABLE professor ADD FOREIGN KEY (dept_id) REFERENCES Department(dept_id);
ALTER TABLE semester_course ADD FOREIGN KEY (course_code) REFERENCES Department(course_code);
ALTER TABLE enrolled ADD FOREIGN KEY (course_code, quarter, `year`) REFERENCES semester_course(course_code, quarter, `year`);
ALTER TABLE enrolled ADD FOREIGN KEY(student_id) REFERENCES student(student_id)
