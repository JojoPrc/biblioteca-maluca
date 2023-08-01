-- Criação do Banco de Dados, se ainda não existir
CREATE DATABASE if not exists biblioteca;

-- Uso do banco de dados "biblioteca" para todas as operações subsequentes
USE biblioteca;

-- Tabela de Autores
-- Criação da tabela "autores" para armazenar informações sobre os autores dos livros
-- Possui as colunas: autor_id (chave primária e autoincremento), nome, nacionalidade, data_nascimento e biografia
CREATE TABLE autores (
    autor_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE,
    biografia TEXT
);

-- Tabela de Livros
-- Criação da tabela "livros" para armazenar informações sobre os livros
-- Possui as colunas: livro_id (chave primária e autoincremento), titulo, editora, ano_publicacao, isbn e autor_id (chave estrangeira referenciando a tabela "autores")
CREATE TABLE livros (
    livro_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    editora VARCHAR(100),
    ano_publicacao INT,
    isbn VARCHAR(20) UNIQUE,
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id) -- Chave estrangeira referenciando a tabela "autores"
);

-- Tabela de Gêneros
-- Criação da tabela "generos" para armazenar informações sobre os gêneros dos livros
-- Possui as colunas: genero_id (chave primária e autoincremento) e nome
CREATE TABLE generos (
    genero_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Tabela de Livros_Generos (Relacionamento Muitos-para-Muitos)
-- Criação da tabela de relacionamento "livros_generos" para associar os livros aos seus gêneros (relacionamento muitos-para-muitos)
-- Possui as colunas: livro_id e genero_id, formando uma chave composta como chave primária
-- As colunas "livro_id" e "genero_id" são chaves estrangeiras referenciando as tabelas "livros" e "generos", respectivamente
CREATE TABLE livros_generos (
    livro_id INT,
    genero_id INT,
    PRIMARY KEY (livro_id, genero_id),
    FOREIGN KEY (livro_id) REFERENCES livros(livro_id), -- Chave estrangeira referenciando a tabela "livros"
    FOREIGN KEY (genero_id) REFERENCES generos(genero_id) -- Chave estrangeira referenciando a tabela "generos"
);

-- Tabela de Editoras
-- Criação da tabela "editoras" para armazenar informações sobre as editoras dos livros
-- Possui as colunas: editora_id (chave primária e autoincremento), nome, endereco e telefone
CREATE TABLE editoras (
    editora_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15)
);

-- Tabela de Exemplares
-- Criação da tabela "exemplares" para armazenar informações sobre os exemplares dos livros
-- Possui as colunas: exemplar_id (chave primária e autoincremento), livro_id e editora_id (chaves estrangeiras referenciando as tabelas "livros" e "editoras", respectivamente), ano_aquisicao e estado
CREATE TABLE exemplares (
    exemplar_id INT AUTO_INCREMENT PRIMARY KEY,
    livro_id INT,
    editora_id INT,
    ano_aquisicao INT,
    estado VARCHAR(50),
    FOREIGN KEY (livro_id) REFERENCES livros(livro_id), -- Chave estrangeira referenciando a tabela "livros"
    FOREIGN KEY (editora_id) REFERENCES editoras(editora_id) -- Chave estrangeira referenciando a tabela "editoras"
);

-- Inserção de registros nas tabelas
-- Inserção de registros na tabela "autores"
INSERT INTO autores (nome, nacionalidade, data_nascimento, biografia) VALUES
    ('Machado de Bolinho', 'Brasileiro', '1839-06-21', 'Machado de pastel foi um importante escritor brasileiro e fritador de bolinho.'),
    ('Chocoloca Elizabeth', 'Inglesa', '1890-09-15', 'chocoloca Elizabeth criadora do endry Pater e o chocolate Filosofal, acho que ela ama um chocolate.'),
    ('Samba Márquez', 'Colombiano', '1927-03-06', 'Samba Márquez foi um renomado escritor colombiano, que curte samba e breja.'),
    ('Aventurista loi', 'Britânica', '1965-07-31', 'Aventurista loi foi uma famosa escritora de romances que sempre esta viajando'),
    ('Jane Maradona', 'Argentina', '1775-12-16', 'Jane Maradona foi uma famosa escritora Argentina do século XIIX.');

-- Inserção de registros na tabela "generos"
INSERT INTO generos (nome) VALUES
    ('Romance'),
    ('Mistério'),
    ('Ficção Científica'),
    ('Fantasia'),
    ('Clássico');

-- Inserção de registros na tabela "livros"
INSERT INTO livros (titulo, editora, ano_publicacao, isbn, autor_id) VALUES
    ('hotdog louco', 'Editora dog', 2006, '978-1234567890', 1),
    ('a barriga gigante', 'Editora bolinha', 2008, '978-9876543210', 2),
    ('fuga do pastel', 'Editora yang', 2000, '978-0123456789', 3),
    ('endry Pater e o chocolate Filosofal', 'Editora bolo',2007, '978-0987654321', 4),
    ('Orgulho e cha preto', 'Editora cha', 2005, '978-9876543210', 5);

-- Inserção de registros na tabela "livros_generos"
INSERT INTO livros_generos (livro_id, genero_id) VALUES
    (1, 5),
    (2, 2),
    (3, 1),
    (4, 4),
    (5, 1);

-- Inserção de registros na tabela "editoras"
INSERT INTO editoras (nome, endereco, telefone) VALUES
    ('Editora dog', 'Rua cachorro quente, 783', '(41) 5263-5268'),
    ('Editora bolinha', 'Avenida chiclete, 456', '(41) 5363-4374'),
    ('Editora yang', 'Praça jack chan, 789', '(41) 2435-6734'),
    ('Editora bolo', 'Estrada chocoloco, 987', '(41) 7364-5463'),
    ('Editora cha', 'Travessa mato, 654', '(41) 7634-9873');

-- Inserção de registros na tabela "exemplares"
INSERT INTO exemplares (livro_id, editora_id, ano_aquisicao, estado) VALUES
    (1, 1, 2010, 'Bom'),
    (1, 2, 2015, 'Regular'),
    (2, 1, 2018, 'Ótimo'),
    (3, 3, 2020, 'Bom'),
    (4, 4, 2019, 'Excelente'),
    (5, 5, 2008, 'Regular');
