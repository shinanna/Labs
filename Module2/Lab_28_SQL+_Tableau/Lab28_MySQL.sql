USE employees_mod;

# Extracting all employees with gender hired after 1990
SELECT emp_no, gender, hire_date
FROM t_employees
WHERE hire_date > 1990;

# Extracting only the managers list with information required
SELECT e.emp_no, e.gender, d.dept_name, e.hire_date
FROM t_employees e
RIGHT JOIN t_dept_manager m
ON e.emp_no = m.emp_no
LEFT JOIN t_departments d
ON d.dept_no = m.dept_no;

# Checking with the number of rows in the target dataset
SELECT * FROM t_dept_manager;

# Create an SQL stored procedure that will allow you to obtain the average male and female salary per department
# within a certain salary range. Let this range be defined by two values the user can insert when calling the procedure. 

# Writing the script alone
SELECT d.dept_no, e.gender, ROUND(AVG(s.salary), 0)
FROM t_employees e
RIGHT JOIN t_salaries s
ON s.emp_no = e.emp_no
LEFT JOIN t_dept_emp d
ON d.emp_no = e.emp_no
GROUP BY d.dept_no, e.gender;

# Creating the procedure
DELIMITER $$
DROP PROCEDURE avg_sal$$

CREATE PROCEDURE avg_sal(IN a INT, IN b INT)
BEGIN
SELECT d.dept_no, e.gender, ROUND(AVG(s.salary), 0) AS avg_salary
FROM t_employees e
RIGHT JOIN t_salaries s
ON s.emp_no = e.emp_no
LEFT JOIN t_dept_emp d
ON d.emp_no = e.emp_no
WHERE s.salary BETWEEN a AND b
GROUP BY d.dept_no, e.gender;
END$$
DELIMITER ;

# Calling the procedure to check if it works
CALL avg_sal(50000, 100000);