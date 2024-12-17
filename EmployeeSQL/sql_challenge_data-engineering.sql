-- Data Engineering

-- Create tables and import data

-- create table 'departments'
DROP TABLE if exists departments;
CREATE TABLE departments (
	dept_no varchar(255) NOT NULL PRIMARY KEY,
	dept_name varchar(255) NOT NULL
);

-- test import of data
SELECT * FROM departments;
-- yes it works!


-- create table 'titles'
DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
title_id varchar(255) NOT NULL PRIMARY KEY,
title varchar(255) NOT NULL
);

SELECT * FROM titles;
-- yes it works!


-- create table 'employees'
DROP TABLE IF EXISTS employeess;
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title varchar(255) NOT NULL,
	birth_date DATE NOT NULL,
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
	sex varchar(255),
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

SELECT * FROM employees;
-- yes it works!


-- create table 'dept_emp'
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
	emp_no INT NOT NULL ,
	dept_no varchar(255) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;
-- yes it works!


-- create table 'dept_manager'
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
	dept_no varchar(255) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_manager;
-- yes it works!


-- create table 'salaries'
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;
-- yes it works!
