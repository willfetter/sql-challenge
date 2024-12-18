-- Data Engineering

-- Create tables and import data

-- create table 'departments'
CREATE TABLE IF NOT EXISTS departments (
	dept_no varchar(255) NOT NULL PRIMARY KEY,
	dept_name varchar(255) NOT NULL
);

-- test import of data
SELECT * FROM departments;
-- yes it works!


-- create table 'titles'
CREATE TABLE IF NOT EXISTS titles (
title_id varchar(255) NOT NULL PRIMARY KEY,
title varchar(255) NOT NULL
);

SELECT * FROM titles;
-- yes it works!


-- create table 'employees'
CREATE TABLE IF NOT EXISTS employees (
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
CREATE TABLE IF NOT EXISTS  dept_emp (
	emp_no INT NOT NULL ,
	dept_no varchar(255) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;
-- yes it works!


-- create table 'dept_manager'
CREATE TABLE IF NOT EXISTS dept_manager (
	dept_no varchar(255) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_manager;
-- yes it works!


-- create table 'salaries'
CREATE TABLE IF NOT EXISTS salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;
-- yes it works!
