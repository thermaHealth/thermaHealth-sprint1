CREATE DATABASE hospital;
USE hospital;
CREATE TABLE usuário(
idusuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40) NOT NULL,
cargo VARCHAR(40) NOT NULL,
idade INT,
tempo_na_empresa INT,
estado_civil VARCHAR(30),
email VARCHAR(50) UNIQUE NOT NULL,
senha VARCHAR(50) NOT NULL,
hospital VARCHAR(100) NOT NULL,
telefone VARCHAR(20) UNIQUE NOT NULL,
data_cadastro DATE,
statusmonitoramento VARCHAR(40),
CONSTRAINT chkstatus 
	CHECK(statusmonitoramento IN ('Ativo', 'Inativo'))
);

SELECT * FROM usuário;
SELECT statusmonitoramento AS 'status' FROM usuário;

INSERT INTO usuário (nome, cargo, idade, tempo_na_empresa, estado_civil, email, senha, hospital, telefone, data_cadastro, statusmonitoramento) VALUES 
('Carlos Souza', 'Administrador', 45, 10, 'Casado', 'carlos.souza@email.com', 'senha123', 'Hospital Central', '11987654321', '2024-03-10', 'Ativo');  

INSERT INTO usuário VALUES 
(default, 'Mariana Lima', 'Enfermeira Chefe', 38, 8, 'Solteira', 'mariana.lima@email.com', 'segura456', 'Hospital São Lucas', '11981234567', '2024-02-15', 'Ativo'),  

(default, 'Roberto Mendes', 'Técnico de TI', 32, 5, 'Casado', 'roberto.mendes@email.com', 'tech789', 'Hospital Vida', '11999887766', '2024-01-20', 'Inativo'),  

(default, 'Ana Paula Silva', 'Coordenadora Médica', 50, 15, 'Divorciada', 'ana.paula@email.com', 'medica2024', 'Hospital Saúde Total', '11977665544', '2023-12-05', 'Ativo'),  

(default, 'Lucas Ferreira', 'Gestor de Manutenção', 40, 12, 'Casado', 'lucas.ferreira@email.com', 'manut456', 'Hospital Esperança', '11966554433', '2024-03-01', 'Ativo');  

SELECT * FROM usuário;
SELECT statusmonitoramento AS 'status' FROM usuário;

SELECT nome FROM usuário 
WHERE idusuario = 4;

SELECT * FROM usuário WHERE nome LIKE "%c%";
SELECT * FROM usuário WHERE hospital NOT LIKE "Hospital Vida";
SELECT * FROM usuário 
	WHERE data_cadastro > '2024-02-15';
SELECT nome, cargo, hospital FROM usuário;
SELECT * FROM usuário WHERE statusmonitoramento = 'Ativo';
SELECT * FROM usuário WHERE idade > 40;
SELECT * FROM usuário ORDER BY data_cadastro DESC;
SELECT * FROM usuário WHERE email = 'mariana.lima@email.com';

CREATE TABLE medicao (
    idmedicao INT AUTO_INCREMENT PRIMARY KEY,
    idsensor INT NOT NULL,
    localizacao VARCHAR(100) NOT NULL,
    temperatura DECIMAL(5,2) NOT NULL,
    umidade DECIMAL(5,2) NOT NULL,
    data_hora DATETIME,
    status VARCHAR(20) DEFAULT 'Normal',
    CONSTRAINT chk_status CHECK (status IN ('Normal', 'Alerta', 'Crítico'))
);
 ALTER TABLE medicao DROP constraint chk_status;
ALTER TABLE medicao RENAME COLUMN status TO status_sensor;
ALTER TABLE medicao ADD CONSTRAINT chk_status_sensor
CHECK (status_sensor IN ('Normal', 'Alerta', 'Crítico'));


INSERT INTO medicao (idsensor, localizacao, temperatura, umidade, status_sensor) VALUES 
(1, 'UTI', 22.3, 75.5, 'Normal'),  
(1, 'Centro Cirúrgico', 19.8, 40.3, 'Normal'),
(2, 'Enfermaria', 25.6, 65.3, 'Alerta'),  
(2, 'Sala de Medicamentos', 20.5, 55.1, 'Normal'),  
(2, 'Recepção', 27.2, 70.8, 'Crítico'); 

SELECT * FROM medicao WHERE idsensor = 2;

SELECT * FROM medicao WHERE localizacao LIKE "%c%";

SELECT * FROM medicao WHERE localizacao NOT LIKE "%Recepção%";

SELECT localizacao, temperatura, umidade FROM medicao;

SELECT * FROM medicao WHERE status_sensor = 'Normal';

SELECT * FROM medicao WHERE temperatura > 22;

SELECT * FROM medicao ORDER BY data_hora DESC;

CREATE TABLE manutencao (
idmanutencao INT AUTO_INCREMENT PRIMARY KEY,
tipo_manutencao VARCHAR(50) NOT NULL,
descricao TEXT,
data_manutencao DATETIME,
tecnico_responsavel VARCHAR(100) NOT NULL,
custo DECIMAL(10, 2),
status_manutencao VARCHAR(20) DEFAULT 'Normal',
    CONSTRAINT chk_status_manutencao CHECK (status_manutencao IN ('Concluída', 'Pendente', 'Em andamento'))
);

INSERT INTO manutencao (tipo_manutencao, descricao, data_manutencao, tecnico_responsavel, custo, status_manutencao)
VALUES 
('Preventiva', 'Manutenção preventiva do sensor LM35 na UTI, verificação dos parâmetros de calibração.', '2025-03-01 08:30:00', 'Carlos Oliveira', 150.00, 'Concluída'),
('Corretiva', 'Troca do sensor DHT11 na enfermaria devido à falha na leitura de umidade.', '2025-03-05 10:00:00', 'Maria Souza', 200.00, 'Concluída'),
('Calibração', 'Calibração do sensor LM35 no Centro Cirúrgico para garantir a precisão das medições.', '2025-03-07 14:15:00', 'José Silva', 100.00, 'Pendente'),
('Preventiva', 'Verificação e limpeza do sistema de ventilação e sensores no hospital inteiro.', '2025-03-10 09:00:00', 'Luciana Almeida', 350.00, 'Em andamento'),
('Corretiva', 'Substituição do sensor LM35 no laboratório que apresentou erro nas medições.', '2025-03-12 11:30:00', 'Ricardo Fernandes', 250.00, 'Concluída');

SELECT * FROM manutencao;
SELECT * FROM manutencao WHERE status_manutencao = 'Concluída';
SELECT * FROM manutencao WHERE status_manutencao = 'Pendente';
SELECT * FROM manutencao WHERE status_manutencao = 'Em andamento';
SELECT * FROM manutencao WHERE tecnico_responsavel = 'Carlos Oliveira';
SELECT * FROM manutencao WHERE custo > 200;
SELECT * FROM manutencao WHERE YEAR(data_manutencao) = 2025 AND MONTH(data_manutencao) = 3;
SELECT DISTINCT tipo_manutencao FROM manutencao;
SELECT * FROM manutencao ORDER BY data_manutencao DESC;

CREATE TABLE alarmes (
    idalarme INT AUTO_INCREMENT PRIMARY KEY,
    idsensor INT NOT NULL,
    tipo_alarme VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    resolvido_em DATETIME,
    tecnico_responsavel VARCHAR(100),
    comentario TEXT,
    status_situacao VARCHAR(20)
    CONSTRAINT chk_status_situacao CHECK (status_situacao IN ('Concluída', 'Pendente', 'Em andamento')),
	status_prioridade VARCHAR(20),
    CONSTRAINT chk_status_prioridade CHECK (status_prioridade IN ('Baixa', 'Média', 'Alta'))
);

INSERT INTO alarmes (idsensor, tipo_alarme, descricao, data_hora, resolvido_em, tecnico_responsavel, comentario, status_situacao, status_prioridade) VALUES
(1, 'Temperatura alta', 'Sensor LM35 detectou temperatura acima de 40°C na sala de emergência.', '2025-03-10 08:00:00', '2025-03-10 08:45:00', 'Carlos Oliveira', 'Temperatura estabilizada após ajuste do sistema de climatização.', 'Concluída', 'Alta'),
(2, 'Umidade baixa', 'Sensor DHT11 indicou umidade abaixo de 30% na enfermaria.', '2025-03-10 09:15:00', NULL, 'Maria Souza', 'Ajuste do umidificador necessário.', 'Em andamento', 'Média'),
(2, 'Falha no sensor', 'Sensor de temperatura do Centro Cirúrgico falhou durante a medição.', '2025-03-10 10:30:00', '2025-03-10 11:00:00', 'José Silva', 'Sensor substituído e calibrado.', 'Concluída', 'Alta'),
(1, 'Temperatura alta', 'Sensor LM35 da UTI registrou aumento de temperatura, chegando a 38°C.', '2025-03-10 14:00:00', NULL, 'Luciana Almeida', 'Investigação em andamento.', 'Pendente', 'Média'),
(2, 'Umidade alta', 'Sensor DHT11 da sala de repouso indicou nível de umidade acima de 80%.', '2025-03-10 15:45:00', '2025-03-10 16:30:00', 'Ricardo Fernandes', 'Sistema de ventilação ajustado e nível de umidade estabilizado.', 'Concluída', 'Baixa'),
(2, 'Falha no sensor', 'Sensor de umidade da cozinha apresentou erro nas leituras.', '2025-03-10 17:20:00', NULL, 'Ana Costa', 'Troca do sensor programada.', 'Em andamento', 'Alta');

SELECT tipo_alarme FROM alarmes;
SELECT * FROM alarmes WHERE status_prioridade = 'Alta' AND status_situacao IN ('Em andamento', 'Pendente');
SELECT * FROM alarmes WHERE tecnico_responsavel = 'Carlos Oliveira' AND status_situacao = 'Concluída';
SELECT * FROM alarmes WHERE status_situacao = 'Pendente' AND descricao LIKE '%sensor%';
SELECT * FROM alarmes WHERE descricao LIKE '%falha%' AND status_situacao = 'Resolvido';
SELECT * FROM alarmes WHERE idsensor = 1;
SELECT * FROM alarmes WHERE resolvido_em BETWEEN '2025-03-10 08:00:00' AND '2025-03-10 12:00:00';
SELECT * FROM alarmes ORDER BY data_hora DESC;
SELECT * FROM alarmes WHERE descricao LIKE '%temperatura%';








