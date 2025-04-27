CREATE TABLE UgyfelMaszk
(
ID INT IDENTITY PRIMARY KEY,
LOGIN nvarchar(255)	MASKED WITH (Function = 'partial(1,"XXX",1)'),
EMAIL nvarchar(255) MASKED WITH (Function = 'email()'),
NEV nvarchar(255) MASKED WITH (Function = 'default()'),
SZULEV int MASKED WITH (Function = 'random(1,5)'),
NEM nvarchar(1),
CIM nvarchar(255) MASKED WITH (Function = 'default()')
);
Insert into UgyfelMaszk
(LOGIN,EMAIL,NEV,SZULEV,NEM,CIM)
SELECT
LOGIN,EMAIL,NEV,SZULEV,NEM,CIM
FROM Ugyfel;
CREATE USER Felhasznalo WITHOUT Login;
GRANT SELECT ON UgyfelMaszk TO Felhasznalo
EXECUTE AS User= 'Felhasznalo';
SELECT * FROM UgyfelMaszk
