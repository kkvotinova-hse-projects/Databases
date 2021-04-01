-- Database: BOOKSTORE
CREATE DATABASE "BOOKSTORE"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

 -- Таблица покупателей
CREATE TABLE customer (
	id serial NOT NULL,
	name VARCHAR(50) NOT NULL,
	area VARCHAR(100),
	discount float DEFAULT 0.0,
	PRIMARY KEY (id)
);

-- Таблица магазинов
CREATE TABLE store (
	id serial NOT NULL,
	name VARCHAR(100) NOT NULL,
	area VARCHAR(100) NOT NULL,
	commission float DEFAULT 0.0,
	PRIMARY KEY (id)
);

-- Таблица книг
CREATE TABLE book (
	id serial NOT NULL,
	name VARCHAR(100) NOT NULL,
	price float NOT NULL,
	bstorage VARCHAR(50),
	quantity int DEFAULT 0,
	PRIMARY KEY (id)
);

-- Таблица покупок
CREATE TABLE purchase (
	id serial NOT NULL,
	pdate date DEFAULT NOW(),
	seller_id int NOT NULL,
	customer_id int NOT NULL,
	book_id int NOT NULL,
	quantity int DEFAULT 0,
	PRIMARY KEY (id),
	psum float NOT NULL,
	FOREIGN KEY(seller_id) REFERENCES customer(id) ON UPDATE CASCADE,
	FOREIGN KEY(customer_id) REFERENCES customer(id) ON UPDATE CASCADE,
	FOREIGN KEY(book_id) REFERENCES book(id) ON UPDATE CASCADE
);