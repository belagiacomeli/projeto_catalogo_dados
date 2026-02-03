-- Criando o DATABASE do Projeto Catálogo de Dados
CREATE DATABASE catalogo_dados;

-- Define o banco de dados ativo onde os comandos SQL serão executados
USE catalogo_dados;

-- -- Criação da tabela cliente (entidade principal)
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    tipo_cliente VARCHAR(20),
    data_cadastro DATE,
    status_cliente VARCHAR(20)
);

-- Criação da tabela dados_pessoais (dados sensíveis)
CREATE TABLE dados_pessoais (
    id_dados_pessoais INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    nome_completo VARCHAR(150),
    data_nascimento DATE,
    genero VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Criação da tabela documento (dados altamente sensíveis)
CREATE TABLE documento (
    id_documento INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    tipo_documento VARCHAR(20),
    numero_documento VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Criação da tabela endereco (dados cadastrais)
CREATE TABLE endereco (
    id_endereco INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    rua VARCHAR(150),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    cep VARCHAR(10),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Criação da tabela contato (dados pessoais de contato)
CREATE TABLE contato (
    id_contato INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    email VARCHAR(100),
    telefone VARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Criação da tabela pedido (dados transacionais)
CREATE TABLE pedido (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT,
  data_pedido DATE,
  valor_total DECIMAL(10,2),
  status_pedido VARCHAR(20),

  tipo_pagamento VARCHAR(30),     
  canal_compra VARCHAR(30),       

  numero_nota_fiscal VARCHAR(30),
  data_emissao_nf DATE,

  FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
