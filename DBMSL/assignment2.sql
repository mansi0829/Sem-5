
1.


SELECT * FROM Employee;

+--------+---------+-----------+-----------+-------------+--------+------------------+

| Emp_id | Dept_id | fname | lname | Designation | salary | JoinData |

+--------+---------+-----------+-----------+-------------+--------+------------------+

| 1 | 1 | Mansi | Gundre | Full Stack | 11 | 1 August 2022 |

| 2 | 2 | Piyusha | Khandare | SDE | 10 | 1 July 2022 |

| 8 | 3 | Sanskruti | Pawar | AI/ML | 12 | 1 November 2022 |

| 9 | 4 | Dhirendra | Gundre | AI/ML | 17 | 1 September 2022 |

| 6 | 5 | Rohit | Kodam | Tester | 19 | 1 June 2022 |

| 3 | 6 | Arunima | Garg | SDE | 10 | 1 August 2022 |

| 4 | 7 | Rohan | Patil | SDE | 16 | 1 JULY 2022 |

| 7 | 8 | Sharvi | Endait | AI/ML | 18 | 1 October 2022 |

| 10 | 9 | Harsh | Deshpande | Tester | 13 | 1 July 2022 |

| 5 | 10 | Vaishnavi | Katkar | SDE | 15 | 1 June 2022 |

+--------+---------+-----------+-----------+-------------+--------+------------------+



2.

SELECT * FROM Employee WHERE (Designation='SDE' OR Designation='Tester') AND (fname LIKE 'P%' OR fname LIKE 'H%');



+--------+---------+---------+-----------+-------------+--------+-------------+

| Emp_id | Dept_id | fname | lname | Designation | salary | JoinData |

+--------+---------+---------+-----------+-------------+--------+-------------+

| 2 | 2 | Piyusha | Khandare | SDE | 10 lpa | 1 July 2022 |

| 10 | 9 | Harsh | Deshpande | Tester | 13 lpa | 1 July 2022 |

+--------+---------+---------+-----------+-------------+--------+-------------+

2 rows in set (0.00 sec)



3.

SELECT DISTINCT Designation FROM Employee;

+-------------+

| Designation |

+-------------+

| Full Stack |

| SDE |

| AI/ML |

| Tester |

+-------------+

4 rows in set (0.00 sec)





4.

UPDATE Employee SET salary=salary + (salary*10/100) WHERE JoinData<='1 June' ;

Query OK, 5 rows affected (0.01 sec)

Rows matched: 5 Changed: 5 Warnings: 0



mysql> SELECT * FROM Employee;

+--------+---------+-----------+-----------+-------------+--------+------------------+

| Emp_id | Dept_id | fname | lname | Designation | salary | JoinData |

+--------+---------+-----------+-----------+-------------+--------+------------------+

| 1 | 1 | Mansi | Gundre | Full Stack | 11 | 1 February 2022 |

| 2 | 2 | Piyusha | Khandare | SDE | 18 | 1 July 2022 |

| 8 | 3 | Sanskruti | Pawar | AI/ML | 12 | 1 November 2022 |

| 9 | 4 | Dhirendra | Gundre | AI/ML | 17 | 1 September 2022 |

| 6 | 5 | Rohit | Kodam | Tester | 19 | 1 June 2022 |

| 3 | 6 | Arunima | Garg | SDE | 11 | 1 February 2022 |

| 4 | 7 | Rohan | Patil | SDE | 18 | 1 JULY 2022 |

| 7 | 8 | Sharvi | Endait | AI/ML | 18 | 1 October 2022 |

| 10 | 9 | Harsh | Deshpande | Tester | 18 | 1 July 2022 |

| 5 | 10 | Vaishnavi | Katkar | SDE | 15 | 1 June 2022 |

+--------+---------+-----------+-----------+-------------+--------+------------------+




5.
+---------+-------+-----------+
| Dept_id | dname | dlocation |
+---------+-------+-----------+
|       1 | CSE   | PUNE      |
|       2 | ENTC  | MUMBAI    |
+---------+-------+-----------+
2 rows in set (0.00 sec)

mysql> DELETE FROM Dept WHERE dlocation="MUMBAI";
Query OK, 1 row affected (0.10 sec)

mysql> SELECT * FROM Dept;
+---------+-------+-----------+
| Dept_id | dname | dlocation |
+---------+-------+-----------+
|       1 | CSE   | PUNE      |
+---------+-------+-----------+



6.
SELECT * FROM Project WHERE Plocation='Pune';
+------------+---------+----------------+-----------+---------+-------+
| Project_id | Dept_id | Pname          | Plocation | PcostRs | Pyear |
+------------+---------+----------------+-----------+---------+-------+
|          9 |       2 | Sports Website | Pune      |    1000 |  2005 |
|         10 |       1 | Healt Website  | Pune      |   50000 |  2022 |





7.
SELECT * FROM Project WHERE 10000<=PcostRs<=50000;
+------------+---------+-------------------+-----------+---------+-------+
| Project_id | Dept_id | Pname             | Plocation | PcostRs | Pyear |
+------------+---------+-------------------+-----------+---------+-------+
|          4 |       5 | Health Website    | Mumbai    |   10000 |  2004 |
|          5 |       2 | adhar verificaton | Mumbai    |   50000 |  2022 |
|          6 |       7 | Health Website    | Mumbai    |    8000 |  2007 |
|          9 |       2 | Sports Website    | Pune      |    1000 |  2005 |
|         10 |       1 | Healt Website     | Pune      |   50000 |  2022 |
+------------+---------+-------------------+-----------+---------+-------+



8.
SELECT MAX(PcostRs) FROM Project;
+--------------+
| MAX(PcostRs) |
+--------------+
|        50000 |




9. 
SELECT Emp_id, fname, lname FROM Employee ORDER BY Emp_id DESC;
+--------+-----------+-----------+
| Emp_id | fname     | lname     |
+--------+-----------+-----------+
|     10 | Harsh     | Deshpande |
|      9 | Dhirendra | Gundre    |
|      8 | Sanskruti | Pawar     |
|      7 | Sharvi    | Endait    |
|      6 | Rohit     | Kodam     |
|      5 | Vaishnavi | Katkar    |
|      4 | Rohan     | Patil     |
|      3 | Arunima   | Garg      |
|      2 | Piyusha   | Khandare  |
|      1 | Mansi     | Gundre    |





10.
SELECT * FROM Project WHERE Pyear=2004 OR Pyear=2005 OR Pyear=2007;
+------------+---------+----------------+-----------+---------+-------+
| Project_id | Dept_id | Pname          | Plocation | PcostRs | Pyear |
+------------+---------+----------------+-----------+---------+-------+
|          4 |       5 | Health Website | Mumbai    |   10000 |  2004 |
|          6 |       7 | Health Website | Mumbai    |    8000 |  2007 |
|          9 |       2 | Sports Website | Pune      |    1000 |  2005 |





CREATE VIEW Employee_view AS SELECT Emp_id, Dept_id, fname FROM Emloyee ;
select * From Employee_view ;
+--------+---------+-----------+
| Emp_id | Dept_id | fname     |
+--------+---------+-----------+
|      1 |       1 | Mansi     |
|      2 |       2 | Piyusha   |
|      8 |       3 | Sanskruti |
|      9 |       4 | Dhirendra |
|      6 |       5 | Rohit     |
|      3 |       6 | Arunima   |
|      4 |       7 | Rohan     |
|      7 |       8 | Sharvi    |
|     10 |       9 | Harsh     |
|      5 |      10 | Vaishnavi |
+--------+---------+-----------+




index
CREATE INDEX Employee_index ON Employee (fname);
Query OK, 0 rows affected (0.08 sec)
Records: 0  Duplicates: 0  Warnings: 0



sequence


SELECT Dept_id, salary, fname FROM Employee ORDER BY salary;

+---------+--------+-----------+

| Dept_id | salary | fname |

+---------+--------+-----------+

| 1 | 10 | Mansi |

| 6 | 10 | Arunima |

| 3 | 12 | Sanskruti |

| 10 | 15 | Vaishnavi |

| 2 | 16 | Piyusha |

| 7 | 16 | Rohan |

| 9 | 16 | Harsh |

| 4 | 17 | Dhirendra |

| 8 | 18 | Sharvi |

| 5 | 19 | Rohit |

+---------+--------+-----------+





