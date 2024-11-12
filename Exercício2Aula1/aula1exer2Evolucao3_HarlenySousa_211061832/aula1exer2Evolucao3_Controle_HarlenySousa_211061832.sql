-- -------- < aula1exer2Evolucao3 > --------
--
--                    SCRIPT DE CONTROLE
--
-- Data Criacao ...........: 28/10/2024
-- Autor(es) ..............: Danilo César Tertuliano Melo, Harleny Angéllica Araújo de Sousa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula1exer2Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 08 tabelas
-- 
-- Ultimas Alteracoes
--         28/10/2024 => criação de script;
--         03/11/2024 => Retirando o uso de localhost;
--                    => Atualizando comandos
--                    => Atualizando nome de banco de dados
-- ---------------------------------------------------------

USE aula1exer2Evolucao3;

-- Criar os privilégios para os diferentes perfis
GRANT SELECT ON aula1exer2Evolucao3.* TO 'empregado';
GRANT INSERT ON aula1exer2Evolucao3.VENDA TO 'empregado';
GRANT INSERT ON aula1exer2Evolucao3.VENDA_CONTEM TO 'empregado';

GRANT SELECT ON aula1exer2Evolucao3.* TO 'gerente';
GRANT INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.* TO 'gerente';
REVOKE INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.PESSOA FROM 'gerente';
REVOKE INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.EMPREGADO FROM 'gerente';
REVOKE INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.GERENTE FROM 'gerente';

GRANT ALL PRIVILEGES ON aula1exer2Evolucao3.* TO 'superior';

-- Criar os usuários e associá-los aos perfis
CREATE USER 'superior' IDENTIFIED BY '1admin';
GRANT ALL PRIVILEGES ON aula1exer2Evolucao3.* TO 'superior';

-- Criar usuários GERENTE
CREATE USER 'anamaria' IDENTIFIED BY '2anam';
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.* TO 'anamaria';

CREATE USER 'ruicarlos' IDENTIFIED BY '3ruic';
GRANT SELECT, INSERT, UPDATE, DELETE ON aula1exer2Evolucao3.* TO 'ruicarlos';

-- Criar usuários EMPREGADO
CREATE USER 'maria' IDENTIFIED BY '4maria';
GRANT SELECT ON aula1exer2Evolucao3.* TO 'maria';
GRANT INSERT ON aula1exer2Evolucao3.VENDA TO 'maria';
GRANT INSERT ON aula1exer2Evolucao3.VENDA_CONTEM TO 'maria';

CREATE USER 'paulo' IDENTIFIED BY '5paulo';
GRANT SELECT ON aula1exer2Evolucao3.* TO 'paulo';
GRANT INSERT ON aula1exer2Evolucao3.VENDA TO 'paulo';
GRANT INSERT ON aula1exer2Evolucao3.VENDA_CONTEM TO 'paulo';

CREATE USER 'jose' IDENTIFIED BY '6jose';
GRANT SELECT ON aula1exer2Evolucao3.* TO 'jose';
GRANT INSERT ON aula1exer2Evolucao3.VENDA TO 'jose';
GRANT INSERT ON aula1exer2Evolucao3.VENDA_CONTEM TO 'jose';

CREATE USER 'giovana' IDENTIFIED BY '7giovana';
GRANT SELECT ON aula1exer2Evolucao3.* TO 'giovana';
GRANT INSERT ON aula1exer2Evolucao3.VENDA TO 'giovana';
GRANT INSERT ON aula1exer2Evolucao3.VENDA_CONTEM TO 'giovana';

CREATE USER 'pedro' IDENTIFIED BY '8pedro';
GRANT SELECT ON aula1exer2Evolucao3.* TO 'pedro';
GRANT INSERT ON aula1exer2Evolucao3.VENDA TO 'pedro';
GRANT INSERT ON aula1exer2Evolucao3.VENDA_CONTEM TO 'pedro';

FLUSH PRIVILEGES;


