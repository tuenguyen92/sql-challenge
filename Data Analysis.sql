--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
Select employees.emp_no,
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
from employees
left join salaries
on employees.emp_no = salaries.emp_no
order by emp_no desc

--2. List employees who were hired in 1986.

SELECT * FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no;

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT dept_managers.dept_no, 
departments.dept_name,
dept_managers.emp_no,
employees.last_name, 
employees.first_name
FROM dept_managers
LEFT JOIN departments
ON dept_managers.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_managers.emp_no = employees.emp_no
ORDER BY emp_no desc

--4. List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name 
select employees.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name,
dept_emp.dept_no
from employees
INNER JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments on departments.dept_no = dept_emp.dept_no
order by emp_no

--5. List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B
select * from employees
where first_name = 'Hercules' and last_name like 'B%'

--6. List each employee in the Sales department, including their employee number, 
--last name, and first name
SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name='Sales';

--7. List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name

SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_name in ('Sales', 'Development')

--8. List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name)
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;
