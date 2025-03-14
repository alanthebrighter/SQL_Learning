-- Aggregations functions

select count(*) from employee; -- how many employees

select count(*) from employee, departament
	where Dno=Dnumber and Dname = 'IT';
    
select Dno as 'Department Number', count(*) as 'Number of employees', round(avg(Salary), 2) as 'Average Salary' from employee
	group by Dno;
    
select Pnumber as 'Number of Projects', Pname as 'Project name', count(*) as 'Employees'
	from project, works_on
    where Pnumber=Pno
    group by Pnumber, Pname;
    
select count(distinct Salary) from employee;
select sum(Salary) as 'Total salary', max(Salary) as 'Max Salary', min(Salary) as 'Min Salary', avg(Salary) as 'Average Salary' from employee;

-- GROUP BY

select Pnumber, Pname, count(*) as 'Employees', round(avg(salary),2) as 'Avg Salary'
	from project, works_on, employee
	where Pnumber=Pno and Ssn=Essn
	group by Pnumber, Pname
    order by Pnumber, Pname;
    
select Pnumber, Pname, count(*) as 'Employees', round(avg(salary),2) as 'Avg Salary'
	from project, works_on, employee
	where Pnumber=Pno and Ssn=Essn
	group by Pnumber;
    
-- HAVING
SELECT e.*
	FROM employee AS e
	JOIN dependent AS d ON e.Ssn = d.Essn
	GROUP BY e.Ssn
	HAVING COUNT(*) > 1;
    
select Pnumber, Pname, count(*)
	from project, works_on
    where Pnumber = Pno
    group by Pnumber, Pname
    having count(*) < 2;
    
select Dno, count(*)
	from employee
    where Salary > 50000
    group by Dno
    having count(*) >= 2;
    
select Dno as 'Number of Department', count(*) as 'Employees' from employee
	where Salary>50000
    and Dno in (
		select Dno from employee
        group by Dno
        having count(*)>=2)
	group by Dno;
    