1.
SELECT * FROM Employee;
+--------+---------+-----------+-----------+-------------+--------+------------------+
| Emp_id | Dept_id | fname     | lname     | Designation | salary | JoinData         |
+--------+---------+-----------+-----------+-------------+--------+------------------+
|      1 |       1 | Mansi     | Gundre    | Full Stack  |     11 | 1 August 2022    |
|      2 |       2 | Piyusha   | Khandare  | SDE         |     10 | 1 July 2022      |
|      8 |       3 | Sanskruti | Pawar     | AI/ML       |     12 | 1 November 2022  |
|      9 |       4 | Dhirendra | Gundre    | AI/ML       |     17 | 1 September 2022 |
|      6 |       5 | Rohit     | Kodam     | Tester      |     19 | 1 June 2022      |
|      3 |       6 | Arunima   | Garg      | SDE         |     10 | 1 August 2022    |
|      4 |       7 | Rohan     | Patil     | SDE         |     16 | 1 JULY 2022      |
|      7 |       8 | Sharvi    | Endait    | AI/ML       |     18 | 1 October 2022   |
|     10 |       9 | Harsh     | Deshpande | Tester      |     13 | 1 July 2022      |
|      5 |      10 | Vaishnavi | Katkar    | SDE         |     15 | 1 June 2022      |
+--------+---------+-----------+-----------+-------------+--------+------------------+

2.
SELECT * FROM Employee WHERE (Designation='SDE' OR Designation='Tester') AND (fname LIKE 'P%' OR fname LIKE 'H%');

+--------+---------+---------+-----------+-------------+--------+-------------+
| Emp_id | Dept_id | fname   | lname     | Designation | salary | JoinData    |
+--------+---------+---------+-----------+-------------+--------+-------------+
|      2 |       2 | Piyusha | Khandare  | SDE         | 10 lpa | 1 July 2022 |
|     10 |       9 | Harsh   | Deshpande | Tester      | 13 lpa | 1 July 2022 |
+--------+---------+---------+-----------+-------------+--------+-------------+
2 rows in set (0.00 sec)

3.
SELECT DISTINCT Designation FROM Employee;
+-------------+
| Designation |
+-------------+
| Full Stack  |
| SDE         |
| AI/ML       |
| Tester      |
+-------------+
4 rows in set (0.00 sec)













4.
UPDATE Employee SET salary=salary + (salary*10/100) WHERE JoinData<='1 June' ;
Query OK, 5 rows affected (0.01 sec)
Rows matched: 5  Changed: 5  Warnings: 0

mysql> SELECT * FROM Employee;
+--------+---------+-----------+-----------+-------------+--------+------------------+
| Emp_id | Dept_id | fname     | lname     | Designation | salary | JoinData         |
+--------+---------+-----------+-----------+-------------+--------+------------------+
|      1 |       1 | Mansi     | Gundre    | Full Stack  |     11 | 1 February 2022  |
|      2 |       2 | Piyusha   | Khandare  | SDE         |     18 | 1 July 2022      |
|      8 |       3 | Sanskruti | Pawar     | AI/ML       |     12 | 1 November 2022  |
|      9 |       4 | Dhirendra | Gundre    | AI/ML       |     17 | 1 September 2022 |
|      6 |       5 | Rohit     | Kodam     | Tester      |     19 | 1 June 2022      |
|      3 |       6 | Arunima   | Garg      | SDE         |     11 | 1 February 2022  |
|      4 |       7 | Rohan     | Patil     | SDE         |     18 | 1 JULY 2022      |
|      7 |       8 | Sharvi    | Endait    | AI/ML       |     18 | 1 October 2022   |
|     10 |       9 | Harsh     | Deshpande | Tester      |     18 | 1 July 2022      |
|      5 |      10 | Vaishnavi | Katkar    | SDE         |     15 | 1 June 2022      |
+--------+---------+-----------+-----------+-------------+--------+------------------+




sequence

SELECT Dept_id, salary, fname FROM Employee ORDER BY salary;
+---------+--------+-----------+
| Dept_id | salary | fname     |
+---------+--------+-----------+
|       1 |     10 | Mansi     |
|       6 |     10 | Arunima   |
|       3 |     12 | Sanskruti |
|      10 |     15 | Vaishnavi |
|       2 |     16 | Piyusha   |
|       7 |     16 | Rohan     |
|       9 |     16 | Harsh     |
|       4 |     17 | Dhirendra |
|       8 |     18 | Sharvi    |
|       5 |     19 | Rohit     |
+---------+--------+-----------+
