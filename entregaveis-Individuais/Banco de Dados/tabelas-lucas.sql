Create database hospital;
use hospital;

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    cargo VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    CONSTRAINT chk_cargo CHECK (cargo IN ('gerente', 'coordenador', 'diretor'));


INSERT INTO usuario (nome, sobrenome, cargo, email)
VALUES
('Ana', 'Silva', 'gerente', 'ana.silva@email.com'),
('Carlos', 'Souza', 'coordenador', 'carlos.souza@email.com'),
('Fernanda', 'Oliveira', 'diretor', 'fernanda.oliveira@email.com'),
('Paulo', 'Martins', 'gerente', 'paulo.martins@email.com'),
('Luciana', 'Pereira', 'coordenador', 'luciana.pereira@email.com');

CREATE TABLE hospital (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    localizacao VARCHAR(255) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO hospital (nome, localizacao, telefone, email)
VALUES
('Hospital São Paulo', 'Rua dos Três Irmãos, 123, SP', '11 1234-5678', 'contato@hospitalsaopaulo.com.br'),
('Hospital das Clínicas', 'Avenida Paulista, 1500, SP', '11 2345-6789', 'info@hcdsp.com.br'),
('Hospital de Câncer', 'Rua Dr. José, 456, RJ', '21 3456-7890', 'atendimento@hospcancer.com.br'),
('Hospital Regional', 'Avenida Brasil, 987, MG', '31 4567-8901', 'contact@hospitalregionalmg.com'),
('Hospital Universitário', 'Praça da Liberdade, 400, BH', '31 5678-9012', 'hospitaluniversitario@bh.com');

CREATE TABLE sensor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    versao VARCHAR(20) NOT NULL,
    status VARCHAR(10) NOT NULL,
    CONSTRAINT chk_status CHECK (status IN ('ativo', 'inativo'))
);

INSERT INTO sensor (tipo, versao, status)
VALUES
('Temperatura', 'lm35', 'ativo'),
('umidade', 'dht11', 'inativo');


select * from sensor where tipo like 'u%';
select localizacao from hospital where id = 2;
select * from usuario where nome <> 'lucas';
alter table usuario add column dtnasc Date;
alter table usuario rename column dtnasc to datadenascimento;




