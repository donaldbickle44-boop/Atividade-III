CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE usuario(
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
email VARCHAR(100),
senha VARCHAR(100),
tipo VARCHAR(30)
);

CREATE TABLE categoria(
id_categoria INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(50)
);

CREATE TABLE autor(
id_autor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100)
);

CREATE TABLE livro(
id_livro INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(150),
isbn VARCHAR(30),
ano INT,
status VARCHAR(30),
id_categoria INT,
FOREIGN KEY(id_categoria)
REFERENCES categoria(id_categoria)
);

CREATE TABLE livro_autor(
id_livro INT,
id_autor INT,

PRIMARY KEY(id_livro,id_autor),

FOREIGN KEY(id_livro)
REFERENCES livro(id_livro),

FOREIGN KEY(id_autor)
REFERENCES autor(id_autor)
);

CREATE TABLE emprestimo(
id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
data_emprestimo DATE,
data_devolucao DATE,
status VARCHAR(30),
id_usuario INT,
id_livro INT,

FOREIGN KEY(id_usuario)
REFERENCES usuario(id_usuario),

FOREIGN KEY(id_livro)
REFERENCES livro(id_livro)
);

CREATE TABLE contato(
id_contato INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
email VARCHAR(100),
mensagem TEXT
);