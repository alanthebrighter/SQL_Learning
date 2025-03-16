-- JOIN multi tables
use company_constraints;
-- Projects, works_on and employee
select concat(Fname, ' ', Lname) as "Name",Dno as "Dept. Number", Pname as "Project Name", Pno as "Project Number", Plocation as "Project Location" from employee
	inner join works_on on Ssn=Essn
	inner join project on Pno=Pnumber
    where Plocation like "S%"
    order by Fname;
    
-- Departmente, departamente location and employee
select Dnumber as "Dept. number", Dname as "Dept. name", concat(Fname, ' ', Lname) as "Name", Salary, round(Salary*0.05) as "Bonus" from departament
	inner join dept_location using(Dnumber)
    inner join employee on Ssn=Mgr_ssn
    group by Dnumber;
    
select Dnumber as "Dept. number", Dname as "Dept. name", concat(Fname, ' ', Lname) as "Name", Salary, round(Salary*0.05) as "Bonus" from departament
	inner join dept_location using(Dnumber)
    inner join (dependent inner join employee on Ssn=Essn) on Ssn=Mgr_ssn
    group by Dnumber having count(*)>1;
    
-- Departament, project and employee
select distinct e.Fname, dname as Dept_name, Salary from employee as e
	inner join departament as d on e.Dno=d.Dnumber
    inner join project as p on p.Dnum=d.Dnumber
    where Sssn=Mgr_ssn;
    
select Fname, Lname, Pname, Dname from project 
	inner join departament on Dnum=Dnumber
    inner join employee on  Mgr_ssn=Ssn;
-- example by DeepSeek
SELECT 
    d.Dname AS Dept_Name,
    p.Pname AS Project_Name,
    p.Plocation AS Project_Location,
    GROUP_CONCAT(CONCAT(e.Fname, ' ', e.Lname) SEPARATOR ', ') AS Employees
FROM 
    employee e
INNER JOIN 
    departament d ON e.Dno = d.Dnumber
INNER JOIN 
    project p ON d.Dnumber = p.Dnum
WHERE 
    d.Dname = 'IT'
GROUP BY 
    p.Pname, p.Plocation;