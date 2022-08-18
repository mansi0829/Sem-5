Assignment 3: 
Mansi Gundre




1.
SELECT * FROM Employee NATURAL JOIN Dept;
+---------+--------+-----------+--------+-------------+--------+-----------------+-------+-----------+
| Dept_id | Emp_id | fname     | lname  | Designation | salary | JoinData        | dname | dlocation |
+---------+--------+-----------+--------+-------------+--------+-----------------+-------+-----------+
|       1 |      1 | Mansi     | Gundre | Full Stack  |     11 | 1 February 2022 | CSE   | PUNE      |
|       3 |      8 | Sanskruti | Pawar  | AI/ML       |     12 | 1 November 2022 | ENTC  | PUNE      |
|       6 |      3 | Arunima   | Garg   | SDE         |     11 | 1 February 2022 | IT    | RAJASTAN  |
+---------+--------+-----------+--------+-------------+--------+-----------------+-------+-----------+

2.
SELECT fname, designation, dlocation, JoinData FROM Employee NATURAL JOIN Dept;
+-----------+-------------+-----------+-----------------+
| fname     | designation | dlocation | JoinData        |
+-----------+-------------+-----------+-----------------+
| Mansi     | Full Stack  | PUNE      | 1 February 2022 |
| Sanskruti | AI/ML       | PUNE      | 1 November 2022 |
| Arunima   | SDE         | RAJASTAN  | 1 February 2022 |
+-----------+-------------+-----------+-----------------+

3.
SELECT *, Project_id, PcostRs FROM Employee NATURAL JOIN Project where Plocation!="Pune";
+---------+--------+---------+----------+-------------+--------+-------------+------------+-------------------+-----------+---------+-------+------------+---------+
| Dept_id | Emp_id | fname   | lname    | Designation | salary | JoinData    | Project_id | Pname             | Plocation | PcostRs | Pyear | Project_id | PcostRs |
+---------+--------+---------+----------+-------------+--------+-------------+------------+-------------------+-----------+---------+-------+------------+---------+
|       5 |      6 | Rohit   | Kodam    | Tester      |     19 | 1 June 2022 |          4 | Health Website    | Mumbai    |   10000 |  2004 |          4 |   10000 |
|       2 |      2 | Piyusha | Khandare | SDE         |     18 | 1 July 2022 |          5 | adhar verificaton | Mumbai    |   50000 |  2022 |          5 |   50000 |
|       7 |      4 | Rohan   | Patil    | SDE         |     18 | 1 JULY 2022 |          6 | Health Website    | Mumbai    |    8000 |  2007 |          6 |    8000 |
+---------+--------+---------+----------+-------------+--------+-------------+------------+-------------------+-----------+---------+-------+------------+---------+
3 rows in set (0.00 sec)

4.
SELECT dname, fname, lname, Designation FROM Employee NATURAL JOIN Dept NATURAL JOIN Project where Pyear=2022;
+-------+-------+--------+-------------+
| dname | fname | lname  | Designation |
+-------+-------+--------+-------------+
| CSE   | Mansi | Gundre | Full Stack  |
+-------+-------+--------+-------------+


5.
SELECT Designation, Dept_id, PcostRs FROM Employee NATURAL JOIN Dept NATURAL JOIN Project where PcostRs>3000;
+-------------+---------+---------+
| Designation | Dept_id | PcostRs |
+-------------+---------+---------+
| Tester      |       5 |   10000 |
| Full Stack  |       1 |   50000 |





6.
SELECT Pname FROM Project WHERE Pyear>2015;
+-------------------+
| Pname             |
+-------------------+
| adhar verificaton |
| Healt Website     |
+-------------------+
7.
SELECT Dept_id, dname, count(Emp_id) as Strength FROM Employee NATURAL JOIN Dept GROUP BY Dept_id having Strength>0;
+---------+-------+----------+
| Dept_id | dname | Strength |
+---------+-------+----------+
|       1 | CSE   |        1 |
|       3 | ENTC  |        1 |
|       5 | CIVIL |        1 |
|       6 | IT    |        1 |
+---------+-------+----------+


8.
select count(*) from Employee NATURAL JOIN Project where Pyear<2015;
+----------+
| count(*) |
+----------+
|        3 |
+----------+

9.
CREATE VIEW EmployeeDeptView AS SELECT * FROM Employee NATURAL JOIN Dept
    -> ;
Query OK, 0 rows affected (0.03 sec)

mysql> SELECT * FROM EmployeeDeptView;
+---------+--------+-----------+--------+-------------+--------+-----------------+-------+-----------+
| Dept_id | Emp_id | fname     | lname  | Designation | salary | JoinData        | dname | dlocation |
+---------+--------+-----------+--------+-------------+--------+-----------------+-------+-----------+
|       5 |      6 | Rohit     | Kodam  | Tester      |     19 | 1 June 2022     | CIVIL | HYDERABAD |
|       1 |      1 | Mansi     | Gundre | Full Stack  |     11 | 1 February 2022 | CSE   | PUNE      |
|       3 |      8 | Sanskruti | Pawar  | AI/ML       |     12 | 1 November 2022 | ENTC  | PUNE      |
|       6 |      3 | Arunima   | Garg   | SDE         |     11 | 1 February 2022 | IT    | RAJASTAN  |
+---------+--------+-----------+--------+-------------+--------+-----------------+-------+-----------+
















