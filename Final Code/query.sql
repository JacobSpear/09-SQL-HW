-- emp_no, last_name, first_name, gender, and salary for all employees
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.gender,
	salaries.salary
FROM 
	employees INNER JOIN salaries
		ON employees.emp_no = salaries.emp_no;

-- Returns all employees hired in 1986
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.gender,
	EXTRACT(YEAR FROM employees.hire_date)
FROM 
	employees 
WHERE
	EXTRACT(YEAR FROM employees.hire_date) = 1986
;

--Lists the current manager of each department
SELECT departments.dept_name, employees.emp_no, 
	employees.last_name, employees.first_name, 
	dept_manager.from_date, dept_manager.to_date
FROM (employees INNER JOIN dept_manager 
	  	ON employees.emp_no = dept_manager.emp_no)
	  INNER JOIN departments 
	  	ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date = '9999-01-01'
;

--Lists Employees and their Departments
SELECT e.emp_no , e.last_name, e.first_name, d.dept_name FROM
	employees e INNER JOIN dept_emp de
		ON e.emp_no = de.emp_no
	INNER JOIN departments d
		ON de.dept_no = d.dept_no;

--Lists Employees with name Hercules B
SELECT * FROM employees WHERE 
	first_name = 'Hercules' 
	AND last_name LIKE 'B%';

--Lists all employees in Sales and Development Departments
SELECT e.emp_no , e.last_name, e.first_name, d.dept_name FROM
	employees e INNER JOIN dept_emp de
		ON e.emp_no = de.emp_no
	INNER JOIN departments d
		ON de.dept_no = d.dept_no
WHERE
	d.dept_name IN ('Sales','Development');
	
--Lists Last Names by Employee Count
SELECT last_name,COUNT(*) FROM 
	employees GROUP BY last_name 
	ORDER BY COUNT(*) DESC;
