use company_constraints;
-- Subqueries
select distinct Pnumber from project
	where Pnumber in
    (
	select distinct Pno
	from works_on, employee
	where Essn=Ssn and Lname='Souza'
)
or Pnumber in -- you can't just put a subquery after an OR without connecting it to a condition or another subquery properly.
(
	select Pnumber 
	from project, departament, employee
	where Mgr_ssn = Ssn and Lname='Souza' and Dnum=Dnumber
);

select distinct * from works_on
	where(Pno, Hours) in( 
	select Pno, Hours
	from works_on
	where Essn=678901234);
        
-- EXISTS and UNIQUE
select e.Fname, e.Lname from employee as e
	where exists (
	select * 
	from dependent as d
	where e.Ssn = d.Essn and relationship='Daughter'
	);
	
 select e.Fname, e.Lname from employee as e
	where not exists (
	select * 
	from dependent as d
	where e.Ssn = d.Essn
	);
        
select e.Fname, e.Lname from employee as e
	where exists 
		(
		select * from dependent as d
		where e.Ssn = d.Essn
		) and exists
		(
		select * from departament as dep
		where e.Ssn = dep.Mgr_ssn
		);
	
select Fname, Lname from employee where
	(
    select count(*) from dependent where Ssn=Essn  
    ) >= 2;
    
select distinct Essn from works_on where Pno in (101,201,301);
    