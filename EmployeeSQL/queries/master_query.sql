-- CHECK TABLES AFTER IMPORT AND FOR INTEGRITY
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- 1. List the following details of each employee: 
--employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT employees.first_name, employees.last_name, employees.hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date ASC;

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.

SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name  
FROM employees AS e
  JOIN dept_manager AS m
  ON (m.emp_no = e.emp_no)
    JOIN departments AS d
    ON (d.dept_no = m.dept_no);

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name,  e.first_name, d.dept_name  
FROM employees AS e
  JOIN dept_emp AS p
  ON (p.emp_no = e.emp_no)
    JOIN departments AS d
    ON (d.dept_no = p.dept_no)
	ORDER BY e.emp_no ASC;