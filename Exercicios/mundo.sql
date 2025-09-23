CREATE DATABASE Mundo;
USE mundo;

CREATE TABLE Pais(
	id_pais INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(35) NOT NULL UNIQUE,
    Continente VARCHAR(35) NOT NULL,
    Populacao REAL,
    PIB REAL,
    Expectativa_vida REAL
);

CREATE TABLE Cidade (
	id_cidade INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(35),
    Pais VARCHAR(35),
    populacao REAL,
    capital VARCHAR(1),
    FOREIGN KEY (Pais) REFERENCES Pais(Nome)
);

CREATE TABLE Rio (
	id_rio INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(35),
    Nascente VARCHAR(35),
    Pais VARCHAR(35),
    Comprimento INT,
    FOREIGN KEY (Nascente) REFERENCES Pais(Nome)
);

INSERT INTO Pais (Nome, Continente, Populacao, PIB, Expectativa_vida) VALUES
('Canada', 'Am. Norte', 30.1, 658, 77.08),
('Mexico', 'Am. Norte', 107.5, 694, 69.1),
('Brasil', 'Am. Sul', 183.3, 10004, 65.2),
('USA', 'Am. Norte', 270.0, 8003, 75.5);

INSERT INTO Cidade(Nome, Pais, Populacao, capital) VALUES
('Washington', 'USA', 3.3, 'S'),
('Monterrey', 'Mexico', 2.0, 'N'),
('Brasilia', 'Brasil', 1.5, 'S'),
('São Paulo', 'Brasil', 15.0, 'N'),
('Ottawa', 'Canada', 0.8, 'S'),
('Cid. Mexico', 'Mexico', 14.1, 'S');

INSERT INTO Rio (Nome, Nascente, Pais, Comprimento) VALUES 
('St. Lawrence', 'USA', 'USA', 3),
('Grande', 'USA', 'Mexico', 2),
('Parana', 'Brasil', 'Brasil', 1),
('Mississipi', 'USA', 'USA', 15);

/*1. Liste todas as cidades e os países aos quais pertencem. */
SELECT Cidade.nome AS Cidade, Pais.Nome AS Pais
FROM Cidade
LEFT JOIN Pais ON Cidade.pais = pais.nome;

/*Liste todas as cidades que são capitais. */
SELECT Cidade.nome, cidade.capital FROM Cidade
LEFT JOIN Pais ON Cidade.pais = pais.nome
WHERE Cidade.capital = 'S';

/*Liste todos os atributos dos países onde a expectativa de vida é menor 
que 70 anos */
SELECT Pais.*, Cidade.nome AS Cidade
FROM Pais
LEFT JOIN Cidade ON Pais.nome = Cidade.pais
WHERE pais.Expectativa_vida <70; 

/*4. Liste todas as capitais e as populações dos países cujos 
PIB é maior que 1 trilhão de dólares. */
SELECT Cidade.nome AS Capital, Cidade.populacao AS Populacao, Pais.nome AS Pais
FROM Cidade
RIGHT JOIN Pais ON Cidade.Pais = Pais.Nome
WHERE Cidade.Capital = 'S' AND Pais.PIB > 1000;

/*5. Qual é o nome e a população da capital do país onde o rio St. Lawrence 
tem sua nascente? */

SELECT Cidade.Nome AS Nome, Cidade.populacao AS Populacao, Rio.nome
FROM Cidade
INNER JOIN Rio ON Rio.pais = cidade.pais
WHERE capital = 'S' AND Rio.nome = 'St. Lawrence';

SELECT * FROM rio;

/*6. Qual é a média da população das cidades que não são capitais? */

SELECT AVG(Cidade.Populacao) AS Media_Populacao
FROM Cidade LEFT JOIN Pais ON Cidade.pais = Pais.nome
WHERE capital <> 'S';

/*7. Para cada continente retorne o PIB média de seus países.*/
SELECT AVG(Pais.PIB) AS PIB_MEDIO, pais.continente
FROM Pais 
GROUP BY Pais.Continente;

/*8. Para cada país onde pelo menos 2 rios tem nascente, encontre o comprimento do menor rio.*/
SELECT MIN(Rio.comprimento), Rio.Nascente
FROM Rio INNER JOIN Pais ON Rio.nascente = Pais.nome
WHERE Rio.nascente = "USA"; 

/*9. Liste os países cujo PIB é o maior que o PIB do Canada.*/
SELECT Pais.nome, Pais.PIB
FROM Pais
GROUP BY Pais.nome
HAVING Pais.PIB > 658;

/*9. Alternativo: */
SELECT Pais.nome, Pais.PIB
FROM Pais
WHERE Pais.PIB > (
 SELECT Pais.PIB
 FROM Pais
 WHERE Pais.nome = "Canada"
);