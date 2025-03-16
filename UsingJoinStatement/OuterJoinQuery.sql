-- OUTER JOIN
select * from employee left outer join dependent on Ssn=Essn;
-- NATURAL JOIN, relies on column names being identical
select Dname, Pname
	from departament natural join project;