-- Jadd Cheng
-- September 25, 2019
-- sql-challenge Data Analysis

-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT E.emp_no, E.last_name, E.first_name, E.gender, S.salary
FROM Employees AS E INNER JOIN Salaries AS S ON E.emp_no = S.emp_no;

-- 2. List employees who were hired in 1986.
SELECT *
FROM Employees
WHERE DATE_PART('year', hire_date) = 1986;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT DM.dept_no, D.dept_name, E.emp_no, E.last_name, E.first_name, DM.from_date, DM.to_date
FROM Employees AS E INNER JOIN Department_Managers AS DM ON DM.emp_no = E.emp_no INNER JOIN Departments AS D ON DM.dept_no = D.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
-- [OPTIONAL SELECT STATEMENT] DE.dept_no, 
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM Employees AS E INNER JOIN Department_Employees AS DE ON E.emp_no = DE.emp_no INNER JOIN Departments AS D ON DE.dept_no = D.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- [OPTIONAL SELECT STATEMENT] DE.dept_no
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM Employees AS E INNER JOIN Department_Employees AS DE ON E.emp_no = DE.emp_no INNER JOIN Departments AS D ON DE.dept_no = D.dept_no
WHERE DE.dept_no = (SELECT dept_no
					FROM Departments AS D
					WHERE D.dept_name = 'Sales');

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- [OPTIONAL SELECT STATEMENT] DE.dept_no, 
SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM Employees AS E
INNER JOIN Department_Employees AS DE
	ON E.emp_no = DE.emp_no
INNER JOIN Departments AS D
	ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales' OR D.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) as name_count
FROM Employees
GROUP BY last_name
ORDER BY name_count DESC, last_name;