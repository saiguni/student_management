-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-12-11 02:21:50.694

-- tables
-- Table: Advisor
CREATE TABLE Advisor (
    adv_id int NOT NULL,
    adv_name varchar(50) NOT NULL,
    adv_email varchar(100) NOT NULL,
    adv_contactno varchar(10) NOT NULL,
    adv_address varchar(200) NOT NULL,
    CONSTRAINT Advisor_pk PRIMARY KEY (adv_id)
);

-- Table: Course_Catalog
CREATE TABLE Course_Catalog (
    course_id int NOT NULL,
    course_name varchar(100) NOT NULL,
    course_day varchar(100) NOT NULL,
    adv_id int NOT NULL,
    CONSTRAINT Course_Catalog_pk PRIMARY KEY (course_id)
);

-- Table: Enrolls
CREATE TABLE Enrolls (
    enroll_id int NOT NULL,
    stud_id int NOT NULL,
    course_id int NOT NULL,
    CONSTRAINT Enrolls_pk PRIMARY KEY (enroll_id)
);

-- Table: Homework
CREATE TABLE Homework (
    hw_id int NOT NULL,
    teach_id int NOT NULL,
    hw_name varchar(100) NOT NULL,
    hw_file varchar(200) NOT NULL,
    hw_grade varchar(1) NOT NULL,
    stud_id int NOT NULL,
    CONSTRAINT Homework_pk PRIMARY KEY (hw_id)
);

-- Table: Professor
CREATE TABLE Professor (
    prof_id int NOT NULL,
    prof_name varchar(100) NOT NULL,
    prof_designation varchar(100) NOT NULL,
    prof_address varchar(200) NOT NULL,
    prof_contactno varchar(10) NOT NULL,
    prof_email varchar(100) NOT NULL,
    CONSTRAINT Professor_pk PRIMARY KEY (prof_id)
);

-- Table: Student
CREATE TABLE Student (
    stud_id int NOT NULL,
    stud_name varchar(100) NOT NULL,
    stud_email varchar(100) NOT NULL,
    stud_address varchar(100) NOT NULL,
    stud_contactno varchar(10) NOT NULL,
    CONSTRAINT Student_pk PRIMARY KEY (stud_id)
);

-- Table: Teach
CREATE TABLE Teach (
    teach_id int NOT NULL,
    course_id int NOT NULL,
    prof_id int NOT NULL,
    adv_id int NOT NULL,
    CONSTRAINT Teach_pk PRIMARY KEY (teach_id)
);

-- foreign keys
-- Reference: Advisor_Course_Catalog (table: Course_Catalog)
ALTER TABLE Course_Catalog ADD CONSTRAINT Advisor_Course_Catalog FOREIGN KEY Advisor_Course_Catalog (adv_id)
    REFERENCES Advisor (adv_id);

-- Reference: Course_Catalog_Enrolls (table: Enrolls)
ALTER TABLE Enrolls ADD CONSTRAINT Course_Catalog_Enrolls FOREIGN KEY Course_Catalog_Enrolls (course_id)
    REFERENCES Course_Catalog (course_id);

-- Reference: Enrolls_Student (table: Enrolls)
ALTER TABLE Enrolls ADD CONSTRAINT Enrolls_Student FOREIGN KEY Enrolls_Student (stud_id)
    REFERENCES Student (stud_id);

-- Reference: Homework_Student (table: Homework)
ALTER TABLE Homework ADD CONSTRAINT Homework_Student FOREIGN KEY Homework_Student (stud_id)
    REFERENCES Student (stud_id);

-- Reference: Teach_Advisor (table: Teach)
ALTER TABLE Teach ADD CONSTRAINT Teach_Advisor FOREIGN KEY Teach_Advisor (adv_id)
    REFERENCES Advisor (adv_id);

-- Reference: Teach_Course_Catalog (table: Teach)
ALTER TABLE Teach ADD CONSTRAINT Teach_Course_Catalog FOREIGN KEY Teach_Course_Catalog (course_id)
    REFERENCES Course_Catalog (course_id);

-- Reference: Teach_Homework (table: Homework)
ALTER TABLE Homework ADD CONSTRAINT Teach_Homework FOREIGN KEY Teach_Homework (teach_id)
    REFERENCES Teach (teach_id);

-- Reference: Teach_Professor (table: Teach)
ALTER TABLE Teach ADD CONSTRAINT Teach_Professor FOREIGN KEY Teach_Professor (prof_id)
    REFERENCES Professor (prof_id);

-- End of file.

