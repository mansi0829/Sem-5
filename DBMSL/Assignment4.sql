Assignment 4: 
Name: Mansi Gundre
Roll Number: 31231


1.
 create table Areas(radius int primary key, area double);
Query OK, 0 rows affected (0.04 sec)



2.
describe Areas ;
+--------+---------+------+-----+---------+-------+
| Field  | Type    | Null | Key | Default | Extra |
+--------+---------+------+-----+---------+-------+
| radius | int(11) | NO   | PRI | NULL    |       |
| area   | double  | YES  |     | NULL    |       |
+--------+---------+------+-----+---------+-------+
2 rows in set (0.00 sec)


3.
delimiter //
mysql> create procedure circle_area ()
    -> begin
    -> declare r int;
    -> declare area double;
    -> set r = 4;
    -> label: LOOP
    -> SET r = r +1;
    -> select r;
    -> set area = 3.14*r*r;
    -> IF r=10 THEN
    -> LEAVE label;
    -> ELSE
    -> INSERT INTO Areas values(r, area);
    -> END IF;
    -> END LOOP label;
    -> end
    -> //
Query OK, 0 rows affected (0.00 sec)




4.
call circle_area();
+------+
| r    |
+------+
|    5 |
+------+
1 row in set (0.00 sec)

+------+
| r    |
+------+
|    6 |
+------+
1 row in set (0.03 sec)

+------+
| r    |
+------+
|    7 |
+------+
1 row in set (0.05 sec)

+------+
| r    |
+------+
|    8 |
+------+
1 row in set (0.06 sec)

+------+
| r    |
+------+
|    9 |
+------+
1 row in set (0.07 sec)

+------+
| r    |
+------+
|   10 |
+------+
1 row in set (0.08 sec)

Query OK, 0 rows affected (0.08 sec)




5.
delimiter //
mysql> CREATE PROCEDURE calculate_circle_area (IN r INT)
    -> BEGIN
    -> DECLARE area DOUBLE;
    -> SET area = 3.14*r*r;
    -> INSERT INTO Areas VALUES(r, area);
    -> END;
    -> //
Query OK, 0 rows affected (0.00 sec)

mysql> delimiter ;


6.
CALL calculate_circle_area(10);
Query OK, 1 row affected (0.02 sec)

mysql> SELECT * FROM Areas;
+--------+--------+
| radius | area   |
+--------+--------+
|      5 |   78.5 |
|      6 | 113.04 |
|      7 | 153.86 |
|      8 | 200.96 |
|      9 | 254.34 |
|     10 |    314 |
+--------+--------+
6 rows in set (0.00 sec)



