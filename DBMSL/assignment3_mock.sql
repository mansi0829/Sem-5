1. 
CREATE TABLE Employee_mock (Emp_id int, Dept_id int Primary key,fname VARCHAR(45), lname VARCHAR(45), Designation VARCHAR(45), Salary int , Join_Date VARCHAR(255)  );


2. 
insert into Employee_mock values(1,1,'Mansi','Gundre','SDE', 30000, '01-09-2022');

insert into Employee_mock values(2,2,'Rohit','Kodam','Product Manager', 50000, '01-03-2016');

insert into Employee_mock values(4,3,'Dhiraj','Patil','SDE', 20000, '01-05-2018');

insert into Employee_mock values(3,6,'Pratik','Bembde','Product Manager', 60000, '01-07-2017');

insert into Employee_mock values(5,8,'Amruta','Kasle','UI/UX', 10000, '01-07-2022');


3.
CREATE TABLE Dept_mock (Dept_id int PRIMARY KEY, dname VARCHAR(45), dlocation VARCHAR(45), FOREIGN
KEY (Dept_id) REFERENCES Employee_mock(Dept_id)) ;


4.
insert into Dept_mock values(1,'CSE','Pune');

insert into Dept_mock values(3,'ENTC','Mumbai');

insert into Dept_mock values(2,'ENTC','Pune');


5.
CREATE TABLE Project_mock (Proj_id int PRIMARY KEY, Dept_id int, Pname VARCHAR(45), Plocation VARCHAR(45), Pcost int , Pyear VARCHAR(115), FOREIGN KEY (Dept_id) REFERENCES Employee_mock(Dept_id));


6.
select * from Employee_mock NATURAL JOIN Dept_mock;
+---------+--------+--------+--------+-----------------+--------+------------+-------+-----------+
| Dept_id | Emp_id | fname  | lname  | Designation     | Salary | Join_Date  | dname | dlocation |
+---------+--------+--------+--------+-----------------+--------+------------+-------+-----------+
|       1 |      1 | Mansi  | Gundre | SDE             |  30000 | 01-09-2022 | CSE   | Pune      |
|       2 |      2 | Rohit  | Kodam  | Product Manager |  50000 | 01-03-2016 | ENTC  | Pune      |
|       3 |      4 | Dhiraj | Patil  | SDE             |  20000 | 01-05-2018 | ENTC  | Mumbai    |
+---------+--------+--------+--------+-----------------+--------+------------+-------+-----------+


7.
SELECT fname, designation, dlocation, Join_Date FROM Employee_mock NATURAL JOIN Dept_mock;
+--------+-----------------+-----------+------------+
| fname  | designation     | dlocation | Join_Date  |
+--------+-----------------+-----------+------------+
| Mansi  | SDE             | Pune      | 01-09-2022 |
| Rohit  | Product Manager | Pune      | 01-03-2016 |
| Dhiraj | SDE             | Mumbai    | 01-05-2018 |
+--------+-----------------+-----------+------------+


8.
INSERT INTO Project_mock VALUES (19980, 2, 'Health Web Portal', 'Pune', 500000 , '2020');

INSERT INTO Project_mock VALUES (35266, 6, 'Cyber security Portal', 'Mumbai', 300000 , '2010');


10.
SELECT *, Proj_id, Pcost FROM Employee_mock NATURAL JOIN Project_mock where Plocation!="Pune";
+---------+--------+--------+--------+-----------------+--------+------------+---------+-----------------------+-----------+--------+-------+---------+--------+
| Dept_id | Emp_id | fname  | lname  | Designation     | Salary | Join_Date  | Proj_id | Pname                 | Plocation | Pcost  | Pyear | Proj_id | Pcost  |
+---------+--------+--------+--------+-----------------+--------+------------+---------+-----------------------+-----------+--------+-------+---------+--------+
|       6 |      3 | Pratik | Bembde | Product Manager |  60000 | 01-07-2017 |   35266 | Cyber security Portal | Mumbai    | 300000 | 2010  |   35266 | 300000 |
+---------+--------+--------+--------+-----------------+--------+------------+---------+-----------------------+-----------+--------+-------+---------+--------+

SELECT Emp_id, Dept_id, fname, lname, Proj_id, Pcost FROM Employee_mock NATURAL JOIN Project_mock w
here Plocation!="Pune";
+--------+---------+--------+--------+---------+--------+
| Emp_id | Dept_id | fname  | lname  | Proj_id | Pcost  |
+--------+---------+--------+--------+---------+--------+
|      3 |       6 | Pratik | Bembde |   35266 | 300000 |
+--------+---------+--------+--------+---------+--------+


11.
SELECT Dept_id,dname, Proj_id, Pcost FROM Dept_mock NATURAL JOIN Project_mock where Pyear=2020;
+---------+-------+---------+--------+
| Dept_id | dname | Proj_id | Pcost  |
+---------+-------+---------+--------+
|       2 | ENTC  |   19980 | 500000 |
+---------+-------+---------+--------+
