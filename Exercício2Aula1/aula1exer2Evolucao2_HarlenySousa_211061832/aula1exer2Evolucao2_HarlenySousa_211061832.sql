-- -------- < aula1exer2Evolucao2 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 20/10/2024
-- Autor(es) ..............: Lucas Lopes Frazão e Harleny Angéllica Araújo de Sousa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--        
-- Ultimas Alteracoes
--   28/11/2024 => Ajusta para melhor apresentacao do script;
--              => Inserindo e modificando tabelas.
-- ---------------------------------------------------------

--Base de Dados
CREATE DATABASE IF NOT EXISTS aula1exer2Evolucao2;

USE aula1exer2Evolucao2;

--Tabelas
CREATE TABLE IF NOT EXISTS PESSOA (
    cpf VARCHAR(11) PRIMARY KEY,
    senha VARCHAR(100) NOT NULL,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS GERENTE (
    idGerente INT PRIMARY KEY,
    formacao VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cpfPessoa VARCHAR(11) UNIQUE,
    FOREIGN KEY (cpfPessoa) REFERENCES PESSOA (cpf)
);

CREATE TABLE IF NOT EXISTS ENDERECO (
    idEndereco INT PRIMARY KEY,
    cep VARCHAR(8) NOT NULL,
    numero INT(3) NOT NULL,
    complemento VARCHAR(255),
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    estado VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS EMPREGADO (
    matricula VARCHAR(20) PRIMARY KEY,
    idEndereco INT NOT NULL,
    cpfPessoa VARCHAR(11) UNIQUE,
    FOREIGN KEY (idEndereco) REFERENCES ENDERECO (idEndereco),
    FOREIGN KEY (cpfPessoa) REFERENCES PESSOA (cpf)
);

CREATE TABLE IF NOT EXISTS TELEFONE (
    matricula INT NOT NULL,
    numeroTel BIGINT NOT NULL,
    PRIMARY KEY (matricula, numeroTel),
    FOREIGN KEY (matricula) REFERENCES EMPREGADO (matricula)
);

CREATE TABLE IF NOT EXISTS AREA (
    idArea INT PRIMARY KEY,
    idGerente INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    FOREIGN KEY (idGerente) REFERENCES GERENTE (idGerente)
);

CREATE TABLE IF NOT EXISTS PRODUTO (
    idProduto INT PRIMARY KEY,
    nomeProduto VARCHAR(255) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    idArea INT NOT NULL,
    FOREIGN KEY (idArea) REFERENCES AREA (idArea)
);

CREATE TABLE IF NOT EXISTS VENDA (
    idVenda INT PRIMARY KEY,
    dataVenda DATE NOT NULL,
    FK_PESSOA_cpf VARCHAR(11) NOT NULL,
    FK_PESSOA_idGerente INT NOT NULL,
    FOREIGN KEY (FK_PESSOA_cpf) REFERENCES PESSOA (cpf),
    FOREIGN KEY (FK_PESSOA_idGerente) REFERENCES GERENTE (idGerente)
);

CREATE TABLE IF NOT EXISTS VENDACONTEM (
    fk_VENDA_idVenda INT NOT NULL,
    fk_PRODUTO_idProduto INT NOT NULL,
    PRIMARY KEY (fk_VENDA_idVenda, fk_PRODUTO_idProduto),
    FOREIGN KEY (fk_VENDA_idVenda) REFERENCES VENDA (idVenda),
    FOREIGN KEY (fk_PRODUTO_idProduto) REFERENCES PRODUTO (idProduto)
);
