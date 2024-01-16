DROP TABLE IF EXISTS STUDENT;
CREATE TABLE STUDENT (
                         student_id INT AUTO_INCREMENT  PRIMARY KEY,
                         first_name VARCHAR(255),
                         last_name VARCHAR(255),
                         email VARCHAR(255),
                         major VARCHAR(255),
                         student_year VARCHAR(255),
                         CHECK (student_year IN ('Freshman', 'Sophomore', 'Junior', 'Senior')),
--      Note:  H2 databases do not handle enums.  When we switch to the MySql database we will be able to use enums
--      We can replace the two lines above with this line:
--      student_year ENUM('Freshman', 'Sophomore', 'Junior', 'Senior'),
                         last_registration_date DATE
);
DROP TABLE IF EXISTS PROFESSOR;
CREATE TABLE PROFESSOR (
                           professor_id INT AUTO_INCREMENT  PRIMARY KEY,
                           first_name VARCHAR(255),
                           last_name VARCHAR(255),
                           title VARCHAR(255),
                           department VARCHAR(255)
);
DROP TABLE IF EXISTS COURSE;
CREATE TABLE COURSE (
                        course_id INT AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(255),
                        course_number INT,
                        department VARCHAR(255),
                        description TEXT
);
DROP TABLE IF EXISTS COURSE_OFFERING;
CREATE TABLE COURSE_OFFERING (
                                 offering_id INT AUTO_INCREMENT PRIMARY KEY,
                                 course_id INT,
                                 professor_id INT,
                                 start_date DATE,
                                 end_date DATE,
                                 semester VARCHAR(255)
);
DROP TABLE IF EXISTS REGISTRATION;
CREATE TABLE REGISTRATION (
                              registration_id INT AUTO_INCREMENT PRIMARY KEY,
                              student_id INT,
                              offering_id INT,
                              registration_date DATE,
                              grade VARCHAR(1),
                              CHECK (grade IN ('A', 'B', 'C', 'D', 'F','I', 'W')),
                              class_rating INT,
                              CHECK (class_rating <=5)
);
