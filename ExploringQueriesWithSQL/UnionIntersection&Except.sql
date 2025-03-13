CREATE DATABASE IF NOT EXISTS PR;
USE PR;

CREATE TABLE IF NOT EXISTS R( 
	R char(2)
    );
    
CREATE TABLE IF NOT EXISTS S( 
	S char(2)
    );

INSERT INTO R(R) value ('a1'), ('a2'), ('a2'), ('a3');
INSERT INTO S(S) value ('a1'), ('a1'), ('a2'), ('a3'), ('a4'), ('a5');

-- except -> NOT IN
select * from S where S not in(select R from R);

-- union -> distinct( union already make distinct function)
(select R.R from R)
UNION
(Select S.S from S);

-- intersect -> distinct( to 
select distinct R.R from R where R.R in(select S.S from S);