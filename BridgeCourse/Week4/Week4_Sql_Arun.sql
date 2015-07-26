--Step1: Delete all tables if exists. This will ensure that the script does not throw an error incase it is ran multiple times
DROP TABLE IF EXISTS employee_master;
DROP TABLE IF EXISTS job_title_master;
DROP TABLE IF EXISTS job_heirarchy_master;
--
--Step2: Creating tables
--a. Job title table
CREATE TABLE job_title_master(
job_id		integer 	PRIMARY KEY,
job_title	varchar(50) 	NOT NULL
);
--b. Job heirarchy
CREATE TABLE job_heirarchy_master(
heirarchy_id		integer 	PRIMARY KEY,
heirarchy_name		varchar(50) 	NOT NULL
);
--c. The master employee table
CREATE TABLE employee_master(
employee_id		integer		PRIMARY KEY,
employee_name		varchar(100) 	NOT NULL,
job_id			integer		NOT NULL		REFERENCES job_title_master (job_id),
heirarchy_id		integer					REFERENCES job_heirarchy_master (heirarchy_id),
manager_id		integer		
);	
--
--Step3: Data feeding
--a.Data feeding into job_title_master
INSERT INTO job_title_master(job_id, job_title) values
(1, 'CEO'),
(2, 'CHIEF OPERATING OFFICER'),
(3, 'SVP. Industrial Design'),
(4, 'SVP. Marketing'),
(5, 'VP. Controller'),
(6, 'VP. TREASURER'),
(7, 'VP. Mobile Advertising'),
(8, 'SVP. Chielf financial officer');

--
--b. Data feeding into Job heirarchy
INSERT INTO job_heirarchy_master(heirarchy_id, heirarchy_name) values
(1, 'Executive Team'),
(2, 'VP Reports To Jobs'),
(3, 'Vice President');
--
--c. Data feeding into employee_master
INSERT INTO employee_master(employee_id, employee_name, job_id, heirarchy_id, manager_id) values
(1, 'Steve Jobs', 1, NULL, NULL),
(2, 'Timothy Cook', 2, 1, 1),
(3, 'Jonathan Ive', 3, 1, 1),
(4, 'Philip Schiller', 4, 1, 1),
(5, 'Andy Miller', 7, 2, 1),
(6, 'Peter Oppenheimer', 8, 1, 1),
(7, 'Betsey Rafael', 5, 3, 6),
(8, 'Gary Wipfler', 6, 3, 6);
--
--Step 4: Data visualization
SELECT 	
	Employees.employee_name as "Employee Name",
	Job_Title.job_title as "Job Title", 
	Job_Heirarchy.heirarchy_name as "Job Heirarchy",
	Managers.employee_name as "Manager Name"		
FROM
	employee_master  as Employees
INNER JOIN employee_master as Managers ON Employees.manager_id = Managers.employee_id
INNER JOIN job_title_master as Job_Title ON Employees.job_id = Job_Title.job_id
INNER JOIN job_heirarchy_master as Job_Heirarchy ON Employees.heirarchy_id = Job_Heirarchy.heirarchy_id
		



