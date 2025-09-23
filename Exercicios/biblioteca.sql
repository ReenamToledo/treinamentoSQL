-- Criar o banco de dados
CREATE DATABASE IF NOT EXISTS biblioteca;
USE biblioteca;

-- Criar tabela autores
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(100) NOT NULL
);

-- Criar tabela livros
CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT,
    CONSTRAINT fk_autor FOREIGN KEY (autor_id) REFERENCES autores(id_autor)
);

-- Inserir dados na tabela autores
INSERT INTO autores (nome_autor) VALUES
('Machado de Assis'),
('Clarice Lispector'),
('Jorge Amado');

-- Inserir dados na tabela livros
INSERT INTO livros (titulo, autor_id) VALUES
('Dom Casmurro', 1),
('A Hora da Estrela', 2),
('Gabriela, Cravo e Canela', 3),
('Memórias Póstumas de Brás Cubas', 1);

SELECT * FROM autores;
SELECT * FROM livros;

/* Exiba os livros com nome dos autores correspondentes */
SELECT livros.titulo, autores.nome_autor FROM livros INNER JOIN autores ON livros.autor_id = autores.id_autor;

INSERT INTO livros (titulo, autor_id) VALUES
('Divergente', NULL);

/* Exiba todos os livros, mostrando o autor quando houver, ou NULL quando não houver autor*/
SELECT livros.titulo, autores.nome_autor FROM livros LEFT JOIN autores ON livros.autor_id = autores.id_autor;

/* LEFT JOIN: retorna todas as linhas da tabela à esquerda e as correspondências da tabela da direita. Quando não tem correspondência, mostra NULL */
/* RIGHT JOIN: retorna todas as linhas da tabela à direita e as correspondências da tabela da esquerda. Quando não tem correspondência, mostra NULL */

/* Exiba todos os autores, com seus livros correspondentes ou NULL caso não tenha livros cadastrados*/
SELECT autores.nome_autor, livros.titulo FROM livros RIGHT JOIN autores ON livros.autor_id = autores.id_autor;

INSERT INTO autores(nome_autor) VALUES
('Luíza Sonza');

INSERT INTO autores(nome_autor) VALUES
('Billie Eilish');

/*Liste todos os livros com seus autores em ordem alfabética pelo título*/
SELECT livros.titulo, autores.nome_autor FROM livros INNER JOIN autores ON livros.autor_id = autores.id_autor ORDER BY livros.titulo ASC;

/*Liste todos os autores e a quantidade de livros que cada um possui*/
SELECT autores.nome_autor, COUNT(livros.id_livro) AS quantidade_livros 
FROM autores 
LEFT JOIN 
livros ON autores.id_autor = livros.autor_id
GROUP BY
autores.id_autor, autores.nome_autor 
ORDER BY 
quantidade_livros DESC;

/*Liste todos os autores que não tem nenhum livro*/
SELECT autores.nome_autor, COUNT(livros.id_livro) AS quantidade_livros 
FROM autores 
LEFT JOIN 
livros ON autores.id_autor = livros.autor_id
GROUP BY autores.nome_autor HAVING COUNT(livros.id_livro) = 0;

/*Busque os títulos dos livros que foram escritos por "Machado de Assis"*/
SELECT livros.titulo FROM livros INNER JOIN autores ON livros.autor_id = autores.id_autor WHERE autores.nome_autor = "Machado de Assis";

/*Exibir o total de livros na tabela*/
SELECT COUNT(livros.titulo) AS quantidade_livro FROM livros;

/*Listar autores e seus livros, odernados pelo nome do autor e depois pelo título do livro*/
SELECT autores.nome_autor, livros.titulo FROM autores INNER JOIN livros ON autores.id_autor = livros.autor_id ORDER BY autores.nome_autor ASC;

/*TRUNCATE: remove todas as linhas a tabela, mantendo a estrutura dela*/

SELECT COUNT(*) AS total_livros_antes FROM livros;

TRUNCATE TABLE livros;

SELECT * FROM livros;

/*RENOMEAR: RENAME*/
RENAME TABLE livros TO obras;
RENAME TABLE obras TO livros;

ALTER TABLE livros RENAME COLUMN titulo TO nome_titulo;

COMMIT;


