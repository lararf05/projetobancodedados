create database cinema_dados

create table Cliente(
   id_cliente Serial primary key,
   nome VARCHAR(100) not null,
   telefone VARCHAR(20),
   identidade VARCHAR(20) not null,
   email VARCHAR(255) not null

);


CREATE TABLE Filme (
   id_filme SERIAL PRIMARY KEY,
   nome VARCHAR(100) not null,
   genero VARCHAR(20) not null,
   classificacao VARCHAR(20) not null,  
   sinopse TEXT,                    
   duracao TIME not null                     
);


 
create table Sala (
    id_sala SERIAL PRIMARY KEY,
    nome VARCHAR(50) not null,
    capacidade INT not null,
    tipo VARCHAR(50) not null
);


create table Sessao (
    id_sessao Serial PRIMARY KEY,
    id_filme INT,
    id_sala INT,
    data DATE not null,
    hora TIME not null,
    FOREIGN KEY (id_filme) REFERENCES Filme(id_filme),
    FOREIGN KEY (id_sala) REFERENCES Sala (id_sala)
);

ALTER TABLE Sessao
ADD CONSTRAINT unique_session UNIQUE (id_filme, id_sala, data, hora);


CREATE TABLE Ingresso (
    id_ingresso SERIAL PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    id_cliente INT,  
    id_sessao INT,
    preco DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),  
    FOREIGN KEY (id_sessao) REFERENCES Sessao(id_sessao)  
);



select * from cliente; 

select * from filme; 

select * from sala; 

select * from sessao; 

select * from ingresso;


INSERT INTO Cliente (nome, telefone, identidade, email)
VALUES
  ('Sofia Cardoso', '(83) 9897-3421', '123456789', 'sofia13@gmail.com'),
  ('Ana Clara M.', '(83) 8976-4532', '987654321', 'anaclara23@gmail.com'),
  ('João Silva', '(83) 1234-5678', '234567890', 'joao.silva@gmail.com'),
  ('Mariana Lima', '(83) 4321-8765', '112233445', 'mariana.lima@gmail.com');

 


INSERT INTO Filme (nome, genero, classificacao, duracao, sinopse)
VALUES
  ('Zootopia', 'Ação e aventura', '12 anos', '02:42:00', 'Descrição do filme Zootopia'),
  ('Velozes e furiosos 5', 'Ação e aventura', '18 anos', '02:11:00', 'Descrição do filme Velozes e furiosos 5'),
  ('Avatar', 'Drama', '14 anos', '02:42:00', 'Descrição do filme Avatar'),
  ('Harry Potter', 'Terror', '17 anos', '02:32:00', 'Descrição do filme Harry Potter');



INSERT INTO Sala (nome,capacidade, tipo)
VALUES
  ('Sala1', 100, 'Sala Padrão'),
  ('Sala 2', 300, 'Sala IMAX'),
  ('Sala3', 150, 'Sala 4D'),
  ('Sala VIP', 50, 'Sala D-BOX');
 

INSERT INTO Sessao (id_filme, id_sala, data, hora)
VALUES
  (1, 1, '2024-10-25', '14:00'),
  (2, 2, '2024-10-15', '18:00'),
  (3, 3, '2024-10-21', '19:00'),
  (4, 4, '2024-10-25', '22:00');
 

INSERT INTO Ingresso (id_cliente, id_sessao, tipo, preco)
VALUES
  (1, 1, 'Inteira', 20.00),
  (1, 1, 'Meia', 10.00),
  (2, 2, 'Inteira', 25.00),
  (2, 2, 'Meia', 12.50),
  (3, 3, 'Inteira', 30.00),
  (3, 3, 'Meia', 15.00),
  (4, 4, 'Inteira', 40.00),
  (4, 4, 'Meia', 20.00);

 
 
-- relacionamento cliente e ingresso
 
 SELECT 
    c.id_cliente,
    c.nome AS cliente_nome,
    i.id_ingresso,
    i.tipo AS ingresso_tipo,
    i.preco AS ingresso_preco
FROM 
    Cliente c
JOIN 
    Ingresso i ON c.id_cliente = i.id_cliente;



-- relacionamento filme e sessão
   
   SELECT 
    f.id_filme,
    f.nome AS filme_nome,
    s.id_sessao,
    s.data AS sessao_data,
    s.hora AS sessao_hora
FROM 
    Filme f
JOIN 
    Sessao s ON f.id_filme = s.id_filme;


   
-- relacionemento sala e sessão
   
SELECT 
    sa.id_sala,
    sa.nome AS sala_nome,
    s.id_sessao,
    s.data AS sessao_data,
    s.hora AS sessao_hora
FROM 
    Sala sa
JOIN 
    Sessao s ON sa.id_sala = s.id_sala;



-- relacionamento cliente,filme,sala,sessão e ingresso juntos
   
SELECT 
    c.id_cliente,
    c.nome AS cliente_nome,
    i.id_ingresso,
    i.tipo AS ingresso_tipo,
    i.preco AS ingresso_preco,
    f.id_filme,
    f.nome AS filme_nome,
    s.id_sessao,
    s.data AS sessao_data,
    s.hora AS sessao_hora,
    sa.id_sala,
    sa.nome AS sala_nome
FROM 
    Cliente c
JOIN 
    Ingresso i ON c.id_cliente = i.id_cliente
JOIN 
    Sessao s ON i.id_sessao = s.id_sessao
JOIN 
    Filme f ON s.id_filme = f.id_filme
JOIN 
    Sala sa ON s.id_sala = sa.id_sala;

   
    