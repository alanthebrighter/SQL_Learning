-- insertion of data in the Companydb

use company_constraints;
desc employee;

insert into employee values ("Maria", "A", "Silva", 234567890, "1995-05-15", "23S-São Paulo-SP", "F", 55000.0, NULL, 5),
							("Carlos", "M", "Ferreira", 345678901, "1988-12-20", "45N-Rio de Janeiro-RJ", "M", 60000.0, NULL, 5),
							("Ana", "L", "Costa", 456789012, "1992-07-25", "12E-Belo Horizonte-MG", "F", 48000.0, 234567890, 3),
							("Pedro", "S", "Santos", 567890123, "1990-03-30", "78W-Porto Alegre-RS", "M", 52000.0, 234567890, 3),
							("Juliana", "P", "Lima", 678901234, "1985-11-12", "34N-Curitiba-PR", "F", 70000.0, NULL, 2),
							("Ricardo", "C", "Oliveira", 789012345, "1998-09-05", "56S-Salvador-BA", "M", 45000.0, 678901234, 2),
							("Fernanda", "D", "Rocha", 890123456, "1993-04-18", "89E-Fortaleza-CE", "F", 58000.0, 678901234, 4),
							("Lucas", "F", "Almeida", 901234567, "1987-08-22", "67N-Recife-PE", "M", 62000.0, 678901234, 4),
							("Patricia", "G", "Mendes", 112233445, "1996-02-14", "90W-Manaus-AM", "F", 53000.0, 901234567, 1),
							("Gabriel", "H", "Barbosa", 223344556, "1991-06-28", "11S-Florianópolis-SC", "M", 49000.0, 901234567, 1);

desc dependent;
insert into dependent values
							-- Dependents for Maria (SSN = 234567890)
							(234567890, "Carla Silva", "F", "2010-11-30", "Daughter", 13),
							(234567890, "Daniel Silva", "M", "2013-05-14", "Son", 10),

							-- Dependents for Carlos (SSN = 345678901)
							(345678901, "Eva Ferreira", "F", "2016-09-22", "Daughter", 7),

							-- Dependents for Ana (SSN = 456789012)
							(456789012, "Frank Costa", "M", "2014-02-18", "Son", 9),

							-- Dependents for Pedro (SSN = 567890123)
							(567890123, "Grace Santos", "F", "2017-08-10", "Daughter", 6),

							-- Dependents for Juliana (SSN = 678901234)
							(678901234, "Henry Lima", "M", "2012-12-05", "Son", 11),

							-- Dependents for Ricardo (SSN = 789012345)
							(789012345, "Isabel Oliveira", "F", "2019-04-20", "Daughter", 4),

							-- Dependents for Fernanda (SSN = 890123456)
							(890123456, "Jack Rocha", "M", "2011-06-15", "Son", 12),

							-- Dependents for Lucas (SSN = 901234567)
							(901234567, "Karen Almeida", "F", "2015-10-30", "Daughter", 8),

							-- Dependents for Patricia (SSN = 112233445)
							(112233445, "Leo Mendes", "M", "2018-01-12", "Son", 5),

							-- Dependents for Gabriel (SSN = 223344556)
							(223344556, "Mia Barbosa", "F", "2016-07-08", "Daughter", 7);

desc departament;

insert into departament values ("Human Resources", 1, 678901234, "2015-01-15", "2010-05-20"),
								("Finance", 2, 901234567, "2018-03-10", "2015-08-25"),
								("IT", 3, 234567890, "2017-06-12", "2012-11-30"),
								("Marketing", 4, 345678901, "2019-09-05", "2016-04-15");
                                
desc dept_location;

insert into dept_location values (1, "New York"),
								(1, "Chicago"),
								(2, "San Francisco"),
								(2, "Los Angeles"),
								(3, "Austin"),
								(3, "Seattle"),
								(4, "Miami"),
								(4, "Dallas"),
								(5, "Houston"),
								(5, "Denver");
                        
desc project;

insert into project values -- Projects for Human Resources (Dnum = 1)
							("HR System", 101, "New York", 1),
							("Employee Portal", 102, "Chicago", 1),

							-- Projects for Finance (Dnum = 2)
							("Budget Tool", 201, "San Francisco", 2),
							("Payroll System", 202, "Los Angeles", 2),

							-- Projects for IT (Dnum = 3)
							("Network Upgrade", 301, "Austin", 3),
							("Cloud Migration", 302, "Seattle", 3),

							-- Projects for Marketing (Dnum = 4)
							("Ad Campaign", 401, "Miami", 4),
							("Social Media", 402, "Dallas", 4),

							-- Projects for Operations (Dnum = 5)
							("Supply Chain", 501, "Houston", 5),
							("Logistics", 502, "Denver", 5);

desc works_on;

insert into works_on values -- Employees working on HR projects (Pno = 101, 102)
							(234567890, 102, 15.0),  -- Maria Silva works on Employee Portal

							-- Employees working on Finance projects (Pno = 201, 202)
							(345678901, 201, 30.0),  -- Carlos Ferreira works on Budget Tool
							(456789012, 202, 25.5),  -- Ana Costa works on Payroll System

							-- Employees working on IT projects (Pno = 301, 302)
							(567890123, 301, 40.0),  -- Pedro Santos works on Network Upgrade
							(678901234, 302, 35.0),  -- Juliana Lima works on Cloud Migration

							-- Employees working on Marketing projects (Pno = 401, 402)
							(789012345, 401, 10.0),  -- Ricardo Oliveira works on Ad Campaign
							(890123456, 402, 12.5),  -- Fernanda Rocha works on Social Media

							-- Employees working on Operations projects (Pno = 501, 502)
							(901234567, 501, 22.0),  -- Lucas Almeida works on Supply Chain
							(112233445, 502, 18.0);  -- Patricia Mendes works on Logistics