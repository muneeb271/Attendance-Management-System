CREATE DATABASE attendance_system;

USE attendance_system;

CREATE TABLE Attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    check_in TIME,
    check_out TIME
);

CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255) NOT NULL,
  gender ENUM('Male', 'Female'),
  location VARCHAR(255)
);

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'munim2006';
FLUSH PRIVILEGES;

SELECT * FROM employees;

INSERT INTO employees (emp_id, fname, lname, gender, location)
VALUES 
(139112, 'Hammad', 'Gul', 'Male', 'Rawalpindi'),
(139102, 'Heefa', 'Siab Khan', 'Female', 'Rawalpindi'),
(139113, 'Hira', 'Idress', 'Female', 'Rawalpindi'),
(139115, 'Imran', 'Qasim', 'Male', 'Rawalpindi'),
(139105, 'Muhammad Qasim', 'Shabbir', 'Male', 'Rawalpindi'),
(139106, 'Muhammad', 'Arsalan', 'Male', 'Rawalpindi'),
(139114, 'Muhammad', 'Awais', 'Male', 'Rawalpindi'),
(139124, 'Muhammad', 'Khalil', 'Male', 'Rawalpindi'),
(139103, 'Muhammad', 'Noman-ul-Haq', 'Male', 'Rawalpindi'),
(139111, 'Muhammad Usman', 'Haider', 'Male', 'Rawalpindi'),
(139110, 'Nasir', 'Iqbal', 'Male', 'Rawalpindi'),
(139104, 'Nawal', 'Rehan', 'Female', 'Rawalpindi'),
(139109, 'Rana Ubaid', 'Ur Rehman', 'Male', 'Rawalpindi'),
(139108, 'Robinson', 'Albert', 'Male', 'Rawalpindi'),
(139323, 'Shabkhez', 'Minhas', 'Male', 'Rawalpindi'),
(139093, 'Shazia', 'Qureshi', 'Female', 'Rawalpindi'),
(139263, 'Sufyana', '', 'Female', 'Rawalpindi'),
(139116, 'Zartaj', 'Khan', 'Male', 'Rawalpindi');


/*CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);*/

/*INSERT INTO employees (name) VALUES
    ('Hammad Gul'),
    ('Heefa Siab Khan'),
*/
