use company_constraints;
-- CASE statement
select * from employee;
update employee set Salary =
	case
		when Dno=2 then Salary*1.4
        when Dno=3 then Salary*1.2
        when Dno=4 then Salary*1.3
        when Dno=5 then salary*1.5
        else Salary+0
        end;
-- query fixed by DeepSeek
SET SQL_SAFE_UPDATES = 0; -- DISABLE SAFE MODE

UPDATE employee
SET Salary =
    CASE
        WHEN Dno = 2 THEN Salary * 1.4
        WHEN Dno = 3 THEN Salary * 1.2
        WHEN Dno = 4 THEN Salary * 1.3
        WHEN Dno = 5 THEN Salary * 1.5
        ELSE Salary -- Just return the default salary
    END
WHERE Dno IN (2, 3, 4, 5);

-- JOIN statement
-- JOIN ON -> INNER JOIN most common use
select * from employee join works_on on Ssn = Essn;
select * from employee join departament on Ssn = Mgr_ssn;
select Fname, Lname, Address
	from (employee join departament on Dno=Dnumber)
    where Dname = 'Operations';
-- JOIN and USING
select Dname, Dpt_Create_Date, Dlocation
	from departament JOIN dept_location using(Dnumber)
    order by Dpt_Create_Date;
-- CROSS JOIN
select * from employee cross join dependent; -- almost never use
