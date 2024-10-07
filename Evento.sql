-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS evento;
USE evento;

-- Tabela de Eventos
CREATE TABLE IF NOT EXISTS eventos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    local VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Tabela de Produtos
CREATE TABLE IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    descricao TEXT
);

-- Tabela de Estoque
CREATE TABLE IF NOT EXISTS estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Tabela de Atividades
CREATE TABLE IF NOT EXISTS atividades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    evento_id INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    data_hora DATETIME NOT NULL,
    FOREIGN KEY (evento_id) REFERENCES eventos(id)
);

-- Tabela de Vendas
CREATE TABLE IF NOT EXISTS vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    evento_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    data_hora DATETIME NOT NULL,
    FOREIGN KEY (evento_id) REFERENCES eventos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

-- Tabela de Equipes
CREATE TABLE IF NOT EXISTS equipes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    evento_id INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    FOREIGN KEY (evento_id) REFERENCES eventos(id)
);

-- Tabela de Responsáveis
CREATE TABLE IF NOT EXISTS responsaveis (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipe_id INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    contato VARCHAR(50),
    FOREIGN KEY (equipe_id) REFERENCES equipes(id)
);
