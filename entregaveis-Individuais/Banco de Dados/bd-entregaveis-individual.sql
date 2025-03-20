create database entregaveis;

use entregaveis;

create table usuario(
idUsuario int primary key auto_increment,
nome varchar(40),
email varchar(40),
telefone varchar(20),
senha varchar(20));

insert into usuario (nome, email, telefone, senha) values 
('João Silva', 'joao.silva@email.com', '(11) 91234-5678', 'senha123'),
('Maria Oliveira', 'maria.oliveira@email.com', '(21) 98765-4321', 'senha456'),
('Carlos Souza', 'carlos.souza@email.com', '(31) 99876-5432', 'senha789');

UPDATE usuario SET senha= 'senha134' WHERE idUsuario = 1;

UPDATE usuario SET senha= 'senha245' WHERE idUsuario = 2;

UPDATE usuario SET senha= 'senha356' WHERE idUsuario = 3;

ALTER TABLE usuario ADD COLUMN dtNasc DATE;

UPDATE usuario SET dtNasc= '1990-10-05' WHERE idUsuario= 1;

UPDATE usuario SET dtNasc= '2005-06-30' WHERE idUsuario= 2;

UPDATE usuario SET dtNasc= '2000-02-27' WHERE idUsuario= 3;

DELETE FROM usuario WHERE idUsuario= 1;

SELECT * FROM usuario WHERE dtNasc != '2005-06-30';

ALTER TABLE usuario MODIFY COLUMN telefone VARCHAR(15);

DESCRIBE usuario;

SELECT * FROM usuario ORDER BY nome;

SELECT * FROM usuario ORDER BY nome DESC;

SELECT * FROM usuario WHERE nome LIKE 'm%';

SELECT * FROM usuario WHERE nome LIKE '%a';

SELECT * FROM usuario WHERE nome LIKE '_a%';

SELECT * FROM usuario WHERE nome LIKE '%z_';

create table empresa(
idEmpresa int primary key auto_increment,
nome varchar(50),
cnpj varchar(18),
email varchar(50),
endereco varchar(100)
);

insert into empresa (nome, cnpj, email, endereco) values
('Tech Solutions', '23.456.789/0001-23', 'contato@techsolutions.com.br', 'Rua das Inovações, 789, Bairro Tecnológico, Cidade Z'),
('Móveis Santos', '34.567.890/0001-34', 'sac@moviessantos.com.br', 'Avenida dos Móveis, 1010, Bairro Móveis, Cidade A'),
('Supermercado ABC', '45.678.901/0001-45', 'atendimento@supermercadoabc.com.br', 'Rua do Comércio, 202, Centro, Cidade B'),
('Construtora Alvorada', '56.789.012/0001-56', 'contato@construtoraalvorada.com.br', 'Avenida Principal, 500, Bairro Construtores, Cidade C'),
('Farmácia Boa Saúde', '67.890.123/0001-67', 'farmacia@boasaude.com.br', 'Rua das Flores, 350, Bairro Jardim, Cidade D');

UPDATE empresa SET email= 'suporte@techsolutions.com.br' WHERE idEmpresa = 1;

UPDATE empresa SET endereco= 'Avenida dos Móveis, 2020, Bairro Móveis, Cidade A' WHERE idEmpresa = 2;

DESCRIBE empresa;

ALTER TABLE empresa MODIFY COLUMN endereco VARCHAR(150);

SELECT * FROM empresa WHERE nome LIKE 'C%';

SELECT * FROM empresa WHERE nome LIKE '%S';

SELECT * FROM empresa ORDER BY endereco DESC;

SELECT * FROM empresa WHERE email LIKE '%h%';

create table sensor(
idSensor int primary key auto_increment,
temperatura decimal(5,2),
umidade int,
statusSensor varchar(50),
constraint chkStatusSensor check (statusSensor in ('ativo', 'inativo'))
);

insert into sensor (temperatura, umidade, statusSensor) values
(22.5, 60, 'ativo'),
(18.3, 55, 'inativo'),
(24.1, 70, 'ativo'),
(20.0, 65, 'ativo'),
(30.2, 80, 'inativo');

SELECT temperatura FROM sensor;

SELECT * FROM sensor WHERE statusSensor = 'ativo';

SELECT * FROM sensor ORDER BY umidade;

SELECT * FROM sensor WHERE temperatura LIKE '2%';

SELECT * FROM sensor WHERE umidade LIKE '%0';

SELECT * FROM sensor WHERE statusSensor LIKE '_n%';

SELECT * FROM sensor WHERE statusSensor LIKE '%v_';