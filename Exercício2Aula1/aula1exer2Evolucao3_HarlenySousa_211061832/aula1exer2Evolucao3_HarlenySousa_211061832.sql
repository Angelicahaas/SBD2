-- -------- < aula1exer2Evolucao3 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 20/10/2024
-- Autor(es) ..............: Danilo César Tertuliano Melo, Harleny Angéllica Araújo de Sousa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--        
-- Ultimas Alteracoes
--   22/10/2024 => Ajusta para melhor apresentacao do script;
--              => Retirada de instrucoes que NAO sao SQL no script
--                 que nao aceita outras instrucoes que nao sejam SQL;
--              => Correcao para nomenclatura das restricoes de integridade
--                 para o padrao exigido na disciplina;
--              => Definicao completa do comportamento das FKs no script 
--   28/10/2024 => Criação das tabelas Area Gerencia e constitui;
--              => Correção das restrições;
--   02/11/2024 => Mudança do nome da Database;
--              => Adicionando tabelas GERENTE E ENDERECO;
--              => Alterando tabela venda_contem;
--              => Exclusão de tabelas Gerencia, constitui, inserido;
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE IF NOT EXISTS aula1exer2Evolucao3;

USE aula1exer2Evolucao3;

-- TABELAS
CREATE TABLE GERENTE (
    idGerente INT NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    formacao VARCHAR(255) NOT NULL,
    CONSTRAINT GERENTE_PK PRIMARY KEY (idGerente),
    CONSTRAINT CPFIDGERENTE_UK UNIQUE (idGerente, cpf)
) ENGINE=InnoDB;


CREATE TABLE ENDERECO (
    idEndereco INT,
    cep VARCHAR(8) NOT NULL,
    numero INT(3) NOT NULL,
    complemento VARCHAR(255),
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    estado VARCHAR(255) NOT NULL,
    CONSTRAINT ENDERECO_PK PRIMARY KEY (idEndereco)
) ENGINE=InnoDB;


CREATE TABLE EMPREGADO (
    cpf VARCHAR(11) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    matricula INT NOT NULL,
    idEndereco INT,
    CONSTRAINT EMPREGADO_PK PRIMARY KEY (matricula),
    CONSTRAINT CPFMATRICULA_UK UNIQUE (cpf, matricula),
    CONSTRAINT ENDERECO_FK FOREIGN KEY (idEndereco) REFERENCES ENDERECO (idEndereco)
) ENGINE=InnoDB;


CREATE TABLE TELEFONE (
    matricula INT NOT NULL,
    telefone BIGINT,
    CONSTRAINT TELEFONE_PK PRIMARY KEY (telefone),
    CONSTRAINT MATRICULA_FK FOREIGN KEY (matricula) REFERENCES EMPREGADO (matricula)
) ENGINE=InnoDB;


CREATE TABLE AREA (
    idArea INT NOT NULL,
    nome VARCHAR(255),
    idGerente INT,
    CONSTRAINT AREA_PK PRIMARY KEY (idArea),
    CONSTRAINT IDGERENTE_FK FOREIGN KEY (idGerente) REFERENCES GERENTE (idGerente)
) ENGINE=InnoDB;


CREATE TABLE VENDA (
    idVenda INT NOT NULL,
    datavenda DATE,
    FK_PESSOA_cpf VARCHAR(11),
    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda),
    CONSTRAINT VENDA_PESSOA_FK FOREIGN KEY (FK_PESSOA_cpf) REFERENCES EMPREGADO(cpf) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB;


CREATE TABLE PRODUTO (
    idProduto INT NOT NULL,
    nome VARCHAR(255),
    valor DECIMAL(10,2),
    idArea int,
    CONSTRAINT PRODUTO_PK PRIMARY KEY (idProduto),
    CONSTRAINT IDAREA_FK FOREIGN KEY (idArea) REFERENCES AREA (idArea) 
) ENGINE=InnoDB;


CREATE TABLE venda_contem (
	idVenda INT,
	idProduto INT,
	CONSTRAINT VENDAS_CONTE_PK PRIMARY KEY (idVenda, idProduto),
	CONSTRAINT IDVENDA_FK FOREIGN KEY (idVenda) REFERENCES VENDA(idVenda),
	CONSTRAINT IDPRODUTO_FK FOREIGN KEY (idProduto) REFERENCES PRODUTO(idProduto)
) ENGINE=InnoDB;

