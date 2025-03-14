-- Sorting queries with clause order by
use company_constraints;
select * from employee
order by Fname, Lname;

select distinct d.Dname, concat(e.Fname,' ', e.Lname) as Manager
	from departament as d, employee as e, works_on as w, project as p
    where (d.Dnumber = e.Dno and e.Ssn=d.Mgr_ssn and w.Pno = p.Pnumber)
    order by d.Dname, e.Fname, e.Lname;

-- Query fixed by DeepSeek
SELECT d.Dname, CONCAT(e.Fname, ' ', e.Lname) AS Manager
	FROM departament AS d
	JOIN employee AS e ON d.Mgr_ssn = e.Ssn
	ORDER BY d.Dname, e.Fname, e.Lname;
    
select d.Dname as Department, concat(e.Fname, ' ', e.Lname) as employee, p.Pname as Project
	from departament as d, employee as e, works_on as w, project as p
    where d.Dnumber = e.Dno and e.Ssn = w.Essn and w.Pno = p.Pnumber
    order by d.Dname, e.Fname, e.Lname;
    
