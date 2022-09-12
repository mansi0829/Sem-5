Assignment 6: 
Name: Mansi Gundre
Roll Number: 31231


1.

\d //

CREATE PROCEDURE mergeTables()
BEGIN
  DECLARE EmpId1 INT;
  DECLARE exit_loop BOOLEAN;
  DECLARE c1 CURSOR FOR SELECT O_EmpId.EmpId FROM O_EmpId;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop=TRUE;
  OPEN c1;

  emp_loop: LOOP
    FETCH c1 INTO EmpId;
    IF NOT EXISTS (SELECT * FROM N_EmpId WHERE N_EmpId.EmpId =EmpId) THEN
      INSERT INTO N_EmpId SELECT * FROM O_EmpId WHERE O_EmpId.EmpId =EmpId;
    END IF;
    IF exit_loop THEN
      CLOSE c1;
      LEAVE emp_loop;
    END IF;
  END LOOP emp_loop;
END;
//

\d ;

1.
CREATE TABLE O_EmpId(EmpId INT PRIMARY KEY, fname VARCHAR(40), lname VARCHAR(40), company VARCHAR(40), location VARCHAR(40));
Query OK, 0 rows affected (0.04 sec)


2.
INSERT INTO O_EmpId VALUES(1, 'Rohit', 'Kodam', 'Microsoft', 'Pune');
Query OK, 1 row affected (0.05 sec)

mysql> INSERT INTO O_EmpId VALUES(2, 'Vikram', 'Patil', 'Goggle', 'MUMBAI');
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO O_EmpId VALUES(3, 'Anagha', 'Chatti', 'Google', 'MUMBAI');
Query OK, 1 row affected (0.02 sec)


3.
CREATE TABLE N_EmpId(EmpId INT, fname VARCHAR(40), lname VARCHAR(40), company VARCHAR(40), location VARCHAR(40));




4.
\d //
mysql> CREATE PROCEDURE mergeTables()
    -> BEGIN
    ->   DECLARE EmpId INT;
    ->   DECLARE exit_loop BOOLEAN;
    ->   DECLARE c1 CURSOR FOR SELECT O_EmpId.EmpId FROM O_EmpId;
    ->   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop=TRUE;
    ->   OPEN c1;
    -> 
    ->   emp_loop: LOOP
    ->     FETCH c1 INTO EmpId;
    ->     IF NOT EXISTS (SELECT * FROM N_EmpId WHERE N_EmpId.EmpId =EmpId) THEN 
    ->       INSERT INTO N_EmpId SELECT * FROM O_EmpId WHERE O_EmpId.EmpId =EmpId;
    ->     END IF;
    ->     IF exit_loop THEN
    ->       CLOSE c1;
    ->       LEAVE emp_loop;
    ->     END IF;
    ->   END LOOP emp_loop;
    -> END;
    -> //
Query OK, 0 rows affected (0.00 sec)

mysql> \d ;





