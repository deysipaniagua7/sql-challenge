--Module 9 sql-challenge: Data Engineering

--Create 6 tables based on ERD_Table Schema

--Titles Table
DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
	title_id VARCHAR(10) NOT NULL PRIMARY KEY,
	title VARCHAR(50) NOT NULL
);

SELECT * FROM titles;

--Departments Table
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
	dept_no VARCHAR(10) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL
);

SELECT * FROM departments;

--Employees Table
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
	emp_no INTEGER NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(10) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees;

--Dept_emp Table
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

SELECT * FROM dept_emp;

--Salaries Table
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL PRIMARY KEY,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;

--Dept_manager Table
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INTEGER NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_manager;