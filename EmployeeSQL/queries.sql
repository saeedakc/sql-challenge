-- get employee number, name, gender, and salary
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary 
FROM employees
LEFT JOIN salaries ON employees.emp_no = salaries.emp_no;

-- list employees hired in 1986
SELECT * FROM employees
WHERE hire_date LIKE '1986%';

-- managers of each department
SELECT departments.dept_no, departments.dept_name, department_manager.emp_no, department_manager.from_date, department_manager.to_date, employees.last_name, employees.first_name 
FROM departments
LEFT JOIN department_manager ON departments.dept_no = department_manager.dept_no
LEFT JOIN employees ON department_manager.emp_no = employees.emp_no;

-- List each employee number, first name, last name, and department name
SELECT employees.emp_no, first_name, last_name, dept_name
FROM employees
INNER JOIN department_employees
ON (employees.emp_no = department_employees.emp_no)
INNER JOIN departments
ON (department_employees.dept_no = departments.dept_no)
ORDER by dept_name;

-- "Hercules B."
SELECT * FROM employees 
WHERE first_name='Hercules' 
AND last_name LIKE 'B%';

-- Sales department employees
SELECT employees.emp_no, first_name, last_name, dept_name
FROM employees
INNER JOIN department_employees
ON (employees.emp_no = department_employees.emp_no)
INNER JOIN departments
ON (department_employees.dept_no = departments.dept_no)
WHERE dept_name = 'Sales';

-- Sales and Development employees
SELECT employees.emp_no, first_name, last_name, dept_name
FROM employees
INNER JOIN department_employees
ON (employees.emp_no = department_employees.emp_no)
INNER JOIN departments
ON (department_employees.dept_no = departments.dept_no)
WHERE dept_name = 'Sales'
	OR dept_name = 'Development';

-- Employees last names
SELECT last_name, COUNT(*) 
FROM employees
GROUP BY last_name
ORDER BY 2 DESC;