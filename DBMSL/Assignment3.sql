2.
SELECT fname, designation, dlocation, JoinData FROM Employee NATURAL JOIN Dept;
+-----------+-------------+-----------+-----------------+
| fname     | designation | dlocation | JoinData        |
+-----------+-------------+-----------+-----------------+
| Mansi     | Full Stack  | PUNE      | 1 February 2022 |
| Sanskruti | AI/ML       | PUNE      | 1 November 2022 |
| Arunima   | SDE         | RAJASTAN  | 1 February 2022 |
+-----------+-------------+-----------+-----------------+


1.
SELECT * FROM Employee NATURAL JOIN Dept;
+---------+--------+-----------+--------+-------------+--------+-----------------+-------+-----------+
| Dept_id | Emp_id | fname     | lname  | Designation | salary | JoinData        | dname | dlocation |
+---------+--------+-----------+--------+-------------+--------+-----------------+-------+-----------+
|       1 |      1 | Mansi     | Gundre | Full Stack  |     11 | 1 February 2022 | CSE   | PUNE      |
|       3 |      8 | Sanskruti | Pawar  | AI/ML       |     12 | 1 November 2022 | ENTC  | PUNE      |
|       6 |      3 | Arunima   | Garg   | SDE         |     11 | 1 February 2022 | IT    | RAJASTAN  |
+---------+--------+-----------+--------+-------------+--------+-----------------+-------+-----------+

