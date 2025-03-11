CREATE schema IF NOT EXISTS company_constraints;
use company_constraints;

CREATE table employee(
	Fname varchar(15) NOT NULL,
    Minit char,
    Lname varchar(15) NOT NULL,
    Ssn char(9) NOT NULL,
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10,2),
    Sssn char(9),
    Dno int NOT NULL,
    constraint chk_salary_employee check(salary<2000.0),
    constraint pk_employee primary key(Ssn)
);

alter table employee drop constraint chk_salary_employee,
	add constraint chk_salary_employee check(salary > 2000.0);

CREATE table departament(
	Dname varchar(15) NOT NULL,
    Dnumber int NOT NULL,
    Mgr_ssn char(9),
    Mgr_Start_Date date,
    Dpt_Create_Date date,
    constraint chk_date_depart check (Mgr_Start_Date < Dpt_Create_Date),
    constraint pk_depart primary key(Dnumber),
    constraint unique_name_depart unique(Dname),
    constraint fk_depart foreign key(Mgr_ssn) references employee(Ssn)
);

alter table departament drop constraint chk_date_depart,
	add constraint chk_date_depart check (Mgr_Start_Date > Dpt_Create_Date);

CREATE table dept_location(
	Dnumber int NOT NULL,
    Dlocation varchar(15) NOT NULL,
    constraint pk_dept_local primary key(Dnumber, Dlocation),
    constraint fk_dept_local foreign key(Dnumber) references departament(Dnumber)
);

CREATE table project(
	Pname varchar(15) NOT NULL,
    Pnumber int NOT NULL,
    Plocation varchar(15),
    Dnum int NOT NULL,
    primary key(Pnumber),
    constraint unique_project unique(Pname),
    constraint fk_project foreign key(Dnum) references departament(Dnumber)
);

CREATE table works_on(
	Essn char(9) NOT NULL,
    Pno int NOT NULL,
    Hours decimal(3,1) NOT NULL,
    primary key(Essn, Pno),
    constraint fk_workson_employee foreign key(Essn) references employee(Ssn),
    constraint fk_workson_pnumber foreign key(Pno) references project(Pnumber)
);

alter table works_on drop constraint fk_workson_pnumber,
	add constraint fk_workson_project foreign key(Pno) references project(Pnumber);

CREATE table dependent(
	Essn char(9) NOT NULL,
    Dependent_name varchar(15) NOT NULL,
    Sex char, -- F or M
    Bdate date,
    Relationship varchar(8),
    Age INT NOT NULL,
    constraint chk_dependent_age check (Age < 22),
    primary key(Essn, Dependent_name),
    constraint fk_dependent_employee foreign key(Essn) references employee(Ssn)
);

alter table employee
	add constraint fk_employee foreign key(Sssn) references employee(Ssn)
    on delete set null
    on update cascade;
