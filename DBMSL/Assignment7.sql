






DELIMITER //
CREATE TRIGGER track AFTER UPDATE ON Student 
for each row begin 
	INSERT INTO Alumini VALUES(OLD.StudId, OLD.Name, OLD.DateofAdmission, "Passout") ; 
END;
 //






