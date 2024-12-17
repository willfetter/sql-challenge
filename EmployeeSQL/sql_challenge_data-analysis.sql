-- Data Analysis

--1. List the employee number, last name, first name, sex, and salary of each employee.
	-- 'employees' and 'salaries' tables share 'emp_no' column
SELECT  employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.sex,
		salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;
	-- successfully creates table lising 'emp_no', 'last_name', 'first_name', 'sex', and 'salary'


--2. List the first name, last name, and hire date for the employees who were hired in 1986.
	-- only need to use 'employees' table for this query
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01';
	-- successfully creates table lising 'emp_no', 'first_name', 'last_name', 'hire_date' for all employees
	-- hired in 1986

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
	-- 'dept_manager' and 'employees' tables share 'emp_no' column
	-- 'departments' and 'dept-manager' tables share the 'dept_no' column
SELECT dept_manager.dept_no, 
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;
	-- successfully creates table lising 'dept_no', 'dept_name', 'emp_no', 'last_name', and 'first_name' 
	
--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
	-- 'dept_manager' and 'employees' tables share 'emp_no' column
	-- 'dept_manager' and 'departments' tables share 'dept_no' column
SELECT departments.dept_no,
		employees.emp_no, 
		employees.last_name, 
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no
INNER JOIN Departments ON
dept_manager.dept_no = departments.dept_no;
	-- successfully creates table lising 'dept_no', 'emp_no', 'last_name', 'first_name', and 'dept_name'


--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
	-- only need to use 'employees' table for this query
SELECT emp_no, first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
	-- successfully creates table lising employees with first name 'Hercules' and last name beginning with 'B'

--6. List each employee in the Sales department, including their employee number, last name, and first name.
	-- 'dept_emp' and 'departments' tables share 'dept_no' column
	-- 'dept_emp' and 'employees' tables share 'emp_no' column
		
SELECT  employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM departments
INNER JOIN dept_emp ON
	dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON
	dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';
	-- successfully creates table lising employees within 'sales' department 


--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
	-- 'dept_emp' and 'departments' tables share 'dept_no' column
	-- 'dept_emp' and 'employees' tables share 'emp_no' column
	-- use same query as in #6, but add additional ability to be in 'development' department
SELECT  employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM departments
INNER JOIN dept_emp ON
	dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON
	dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';
	-- successfully creates table lising employees within 'Sales' and 'Development' departments 


--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
	-- use 'count' function on last names within employee table, 'group by' last name, and order according to 'desc'
Select last_name,
	COUNT(last_name)
FROM Employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;