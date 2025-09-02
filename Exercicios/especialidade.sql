INSERT INTO Especialidades(nome) VALUES
('Pediatra'),
('Clínico Geral'),
('Gastroenterologia'),
('Dermatologia');

SELECT * FROM Especialidades;

INSERT INTO Medico(id_crm, nome, telefone, codigo_especialidade) VALUES
('12345', 'Dr. Silva', '4002-8922', 2), 
('12565', 'Dr. Bastos', '5689-8922', 1);

SELECT * FROM Medico;

INSERT INTO Paciente(id_cpf, nome, telefone, email, endereco) VALUES
('1112223334', 'Pedro Paulo', '5555-6666', 'j@gmail.com', 'Rua C, 300'),
('1152224334', 'Paulo Pedro', '5555-9999', 'p@gmail.com',  'Rua C, 200');

SELECT * FROM Paciente;

INSERT INTO Consulta(data_consulta, crm, cpf, diagnostico) VALUES
('2025-08-20', '12345', '1112223334', 'Virose'),
('2025-12-06', '12565', '1152224334', 'Alergia');

SELECT * FROM Paciente;