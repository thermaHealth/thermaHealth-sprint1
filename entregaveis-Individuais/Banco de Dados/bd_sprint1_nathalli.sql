CREATE DATABASE thermaHealth;
USE thermaHealth;

-- funcionarios
CREATE TABLE funcionarios (
	id INT PRIMARY KEY auto_increment,
    matricula INT NOT NULL UNIQUE,
	email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255),
    nome VARCHAR(45),
    sobrenome VARCHAR(50),
    cargo VARCHAR(50),
		constraint chkCargo 
        check(cargo in('diretor', 'coordenador', 'gerente'))
	);

-- hospital
CREATE TABLE hospital (
	id INT PRIMARY KEY auto_increment,
    nome VARCHAR(50),
    cnpj CHAR(18) unique,
    razaoSocial VARCHAR(200),
    email VARCHAR(50) unique,
    telefone INT,
    cep CHAR(9)
);

-- setor (Divisão dentro do hospital, como UTI, laboratório, centro cirúrgico)
CREATE table setor (
	id INT PRIMARY KEY auto_increment,
    nome VARCHAR(50) NOT NULL,
    andar INT
);

-- sensor
CREATE table sensor(
	id INT PRIMARY KEY auto_increment,
	nome VARCHAR(45),
    tipo VARCHAR(45),
    versao VARCHAR(40)
);

-- registro
CREATE table registro (
	id INT PRIMARY KEY auto_increment,
	temperatura FLOAT,
    umidade INT,
    dataHora DATETIME
);

 -- INSERÇÕES
 
-- funcionarios
INSERT INTO funcionarios (matricula, email, senha, nome, sobrenome, cargo)
VALUES 
(12345, 'nathalli.santos@email.com', 'senha123', 'Nathalli', 'Santos', 'diretor'),
(67890, 'beatriz.oliveira@email.com', 'senha456', 'Beatriz', 'Oliveira', 'coordenador'),
(11223, 'lucas.souza@email.com', 'senha789', 'Lucas', 'Souza', 'gerente');

-- hospital
INSERT INTO hospital (nome, cnpj, razaoSocial, email, telefone, cep)
VALUES 
('Hospital Madre Tereza', '12.345.678/0001-90', 'Hospital Madre Tereza S.A.', 'contato@hospitalmadretereza.com', 123456789, '12345-678'),
('Hospital Bom Clima', '98.765.432/0001-10', 'Hospital Bom Clima LTDA', 'bomclima@hospital.com', 987654321, '87654-321');

-- setor
INSERT INTO setor (nome, andar)
VALUES 
('UTI', 1),
('Laboratório', 2),
('Centro Cirúrgico', 3);

-- sensor
INSERT INTO sensor (nome, tipo, versao)
VALUES 
('Sensor Temperatura', 'Temperatura', 'v1.0'),
('Sensor Umidade', 'Umidade', 'v2.1');

-- registro
INSERT INTO registro (temperatura, umidade, dataHora)
VALUES 
(36.5, 50, '2025-03-10 10:00:00'),
(37.2, 60, '2025-03-10 11:00:00'),
(35.8, 55, '2025-03-10 12:00:00');


SELECT * FROM hospital WHERE nome LIKE '%a';