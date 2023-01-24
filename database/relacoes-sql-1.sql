-- Active: 1674565009107@@127.0.0.1@3306


-- Práticas

CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE phones(
    id TEXT PRIMARY KEY UNIQUE Not NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users(id, name, email, password)
VALUES
("u001", "Luiz", "luiz@mail.com", "lp123456"),
("u002", "Thalita", "thalita@mail.com", "lp123456"),
("u003", "Paulo", "paulo@mail.com", "lp123456");

INSERT INTO phones(id, phone_number, user_id)
VALUES
("p001", "55 14 99636587", "u002"),
("p002", "55 18 99656934", "u001"),
("p003", "55 35 99659687", "u002"),
("p004", "55 11 99651237", "u003");

NSERT INTO phones(id, phone_number, user_id)
VALUES
("p005", "55 14 99999668", "u004"); -- vai dar um erro

SELECT * FROM users;

SELECT * FROM phones;

-- buscar informações entre duas tabelas em comum

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;



CREATE TABLE licenses(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT  NOT NULL
);

CREATE TABLE drivers(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses(id)

);

INSERT INTO licenses(id,register_number, category)
VALUES
("l001", "11111111111", "A"),
("l002", "22222222222", "B");

INSERT INTO drivers(id,name,email,password,license_id)
VALUES
("d001","Luiz", "luiz@email.com", "lp002356", "l001"),
("d002", "Thalita", "thalita@email.com", "lp002356", "l002");

SELECT * FROM drivers;

SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;
