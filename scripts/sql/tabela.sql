CREATE TABLE ANUNCIOS (
    ID SERIAL NOT NULL PRIMARY KEY,
    Titulo VARCHAR(256) NOT NULL,
    Descricao VARCHAR,
    DataCriacao DATE DEFAULT CURRENT_DATE NOT NULL,
    DataAtualizacao TIMESTAMP
);

ALTER TABLE ANUNCIOS
ADD COLUMN PrecoEstimado NUMERIC;


INSERT INTO ANUNCIOS (Titulo, Descricao, PrecoEstimado)
VALUES
('Palio Weekend 2005 Prata C/ IPVA Pago', 'Palio Weekend 2005 com detalhes de uso (Parachoque Batido) e Ipva pago',5000),
('Chevrolet Corsa 2006 Grafite Motor 1.4 Flex', 'Corsa 2006 sem dividas pendentes, só transferir', 20000)


INSERT INTO ANUNCIOS (titulo, descricao,PrecoEstimado )
VALUES
('Chevrolet Montana 2025 Prata', 'Chevrolet Montana com Motor 1.2 Turbo com Correia Banhada a Oleo', 90000 )