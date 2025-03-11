-- Querying

use company_constraints;

-- Manager and your Department
select Ssn, Fname, Dname from employee e, departament d where	(e.Ssn = d.Mgr_ssn);

-- Employee, your Dependent and Relationship
select Relationship, Fname, Dependent_name from employee, dependent where Essn = Ssn;

-- Employee query by name. 
select Bdate, Address from employee where Fname = "Maria" and Minit = "A" and Lname = "Silva";

-- Departmente query by name.
select * from departament where Dname = "IT";

-- Emplyee querying by department.
select Dname, Fname, Lname, Address from employee, departament where Dname="IT" and Dnumber=Dno;

-- Project querying by employee using Alias or AS Statement
select Pname as "Project name", Fname as "First name", Hours from project, employee, works_on where Pnumber=Pno and Essn=Ssn;

-- Concat query
select concat(Fname, " ", Lname) as "Employee Name" from employee;