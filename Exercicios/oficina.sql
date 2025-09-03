CREATE DATABASE Oficina;
Use Oficina;

CREATE TABLE Veiculos(
	placa VARCHAR(10) PRIMARY KEY,
    marca VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    ano INT NOT NULL
);

INSERT INTO Veiculos(placa, marca, modelo, ano)
VALUES ("ABC1234", "Volkwagen", "Fusca", 1950),
("CBA4321", "Renault", "Logan", 2000),
("DDD6666", "Ford", "Camaro", 2005);

SELECT * FROM Veiculos;

UPDATE Veiculos SET ano = 2000 WHERE placa = "DDD6666";
SELECT * FROM Veiculos;


DELETE FROM Veiculos WHERE placa = "CBA4321";
SELECT * FROM Veiculos;

CREATE VIEW View_Veiculos_Novos AS SELECT placa, marca, modelo, ano FROM Veiculos WHERE ano >= 2000;
SELECT * FROM View_Veiculos_Novos;

ALTER TABLE Veiculos ADD COLUMN tabela_fipe FLOAT(10) AFTER modelo;
SELECT * FROM Veiculos;

SET SQL_SAFE_UPDATES=0;
UPDATE Veiculos SET tabela_fipe = CASE
	WHEN placa = "ABC1234" THEN 3000
	WHEN placa = "DDD6666" THEN 5000
END;

SELECT * FROM Veiculos;
