-- Jadd Cheng
-- September 25, 2019
-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE SCHEMA jadd_schema;

CREATE TABLE Departments (
    dept_no CHAR(4)   NOT NULL,
    dept_name VARCHAR(100)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     ),
    CONSTRAINT uc_Departments_dept_name UNIQUE (
        dept_name
    )
);

CREATE TABLE Department_Employees (
    emp_no INTEGER   NOT NULL,
    dept_no CHAR(4)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE Department_Managers (
    emp_no INTEGER(10)   NOT NULL,
    dept_no VARCHAR(4)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE Employees (
    emp_no INTEGER   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(100)   NOT NULL,
    last_name VARCHAR(100)   NOT NULL,
    gender CHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Salaries (
    emp_no INTEGER(10)   NOT NULL,
    salary INTEGER(20)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

CREATE TABLE Titles (
    emp_no INTEGER   NOT NULL,
    title VARCHAR(50)   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL
);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Managers ADD CONSTRAINT fk_Department_Managers_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Department_Managers ADD CONSTRAINT fk_Department_Managers_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);