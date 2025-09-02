CREATE DATABASE Carros;
USE Carros;
CREATE TABLE IF NOT EXISTS Carro(
	id_placa VARCHAR(50) PRIMARY KEY,
    marca_carro VARCHAR(50) NOT NULL,
    modelo_carro VARCHAR(50) NOT NULL,
	ano_fab INT 
);

INSERT INTO Carro(id_placa, marca_carro, modelo_carro, ano_fab)
VALUES ("DAE6534", "Ford", "Fiesta", 1999),
("DKL4598", "Wolksvagen", "Gol", 2001),
("DKL7878", "Ford", "Fiesta", 2001),
("JDM8776", "Wolksvagen", "Santana", 2002),
("JJM3692", "Chevrolet", "Corsa", 1999);

SELECT * FROM Carro;

UPDATE Carro SET modelo_carro = 'New Fiesta' WHERE id_placa = 'DAE6534';
SELECT * FROM Carro;

DELETE FROM Carro WHERE id_placa = "DKL4598";
SELECT * FROM Carro;

CREATE VIEW View_Carros_dois AS
SELECT marca_carro, modelo_carro, ano_fab
FROM Carro WHERE ano_fab >= 2000;

SELECT * FROM View_Carros_dois;
SELECT * FROM Carro;

ALTER TABLE Carro
ADD COLUMN tabela_fipe FLOAT(10) AFTER modelo_carro;
SELECT * FROM Carro;

SET SQL_SAFE_UPDATES=0;

UPDATE Carro SET tabela_fipe = CASE 
	WHEN id_placa = "DAE6534" THEN 15000
	WHEN id_placa = "DKL7878" THEN 12000
	WHEN id_placa = "JDM8776" THEN 15000
    WHEN id_placa = "JJM3692" THEN 8000
END;

SELECT * FROM Carro;