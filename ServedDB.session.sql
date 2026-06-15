-- comando para criar um esquema
CREATE SCHEMA /* chega */ dbex;
/*
 ....
*/
CREATE TABLE dbex.cidades
(
    id serial PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    estado CHAR(2) NOT NULL
);