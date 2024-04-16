CREATE TABLE pizza_mod (
    id_pizza_mod INT PRIMARY KEY,
    tamanho VARCHAR(50) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    sabor VARCHAR(100) NOT NULL,
    embalagem_id_mod INT NOT NULL,
    pizzaiolo_id_mod INT NOT NULL,
    receita_id_mod INT NOT NULL,
    FOREIGN KEY (embalagem_id_mod) REFERENCES embalagem_mod(id_embalagem_mod),
    FOREIGN KEY (pizzaiolo_id_mod) REFERENCES pizzaiolo_mod(id_pizzaiolo_mod),
    FOREIGN KEY (receita_id_mod) REFERENCES receita_mod(id_receita_mod)
);

CREATE TABLE receita_mod (
    id_receita_mod INT PRIMARY KEY,
    instrucoes TEXT NOT NULL,
    autor VARCHAR(100) NOT NULL
);

CREATE TABLE pizzaiolo_mod (
    id_pizzaiolo_mod INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE embalagem_mod (
    id_embalagem_mod INT PRIMARY KEY,
    material VARCHAR(100) NOT NULL,
    tamanho VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

INSERT INTO pizzaiolo_mod (id_pizzaiolo_mod, nome, salario)
VALUES
    (31, 'Renata', 1200),
    (32, 'Giovanni', 1800),
    (33, 'Camila', 2100),
    (34, 'Raul', 2600),
    (35, 'Natália', 3100),
    (36, 'Marcela', 3600),
    (37, 'Carlos', 4100),
    (38, 'Leticia', 1700),
    (39, 'Roberto', 2200),
    (40, 'Elena', 2700);

INSERT INTO receita_mod (id_receita_mod, instrucoes, autor)
VALUES
    (31, 'Cozinhe a massa por 10 minutos e adicione o molho de tomate.', 'Renata'),
    (32, 'Misture os ingredientes secos, adicione os líquidos e asse por 30 minutos.', 'Giovanni'),
    (33, 'Frite o alho e a cebola, adicione os legumes e cozinhe por 15 minutos.', 'Camila'),
    (34, 'Misture a farinha, os ovos e o leite, frite em óleo quente até dourar.', 'Raul'),
    (35, 'Cozinhe o arroz em água fervente por 15 minutos.', 'Natália'),
    (36, 'Corte os legumes em cubos, misture com a carne e leve ao forno por 45 minutos.', 'Marcela'),
    (37, 'Bata os ovos e o açúcar até obter uma mistura homogênea, asse em banho-maria por 1 hora.', 'Carlos'),
    (38, 'Refogue o frango com os temperos, adicione o molho de tomate e cozinhe por 20 minutos.', 'Leticia'),
    (39, 'Cozinhe as batatas até ficarem macias, amasse-as e tempere com sal e pimenta.', 'Roberto'),
    (40, 'Misture o chocolate com a manteiga derretida, adicione os ovos e a farinha.', 'Elena');

INSERT INTO embalagem_mod (id_embalagem_mod, material, tamanho, preco)
VALUES
    (31, 'Papelão', '20', 15.99),
    (32, 'Plástico', '30', 20.50),
    (33, 'Alumínio', '25', 18.75),
    (34, 'Papel', '15', 10.25),
    (35, 'Plástico', '40', 25.99);

INSERT INTO pizza_mod (id_pizza_mod, tamanho, descricao, preco, sabor, embalagem_id_mod, pizzaiolo_id_mod, receita_id_mod)
VALUES
    (31, 'Grande', 'Pizza de Calabresa', 30.99, 'Calabresa', 31, 31, 31),
    (32, 'Média', 'Pizza de Frango com Catupiry', 25.50, 'Frango com Catupiry', 32, 32, 32),
    (33, 'Pequena', 'Pizza de Margherita', 20.75, 'Margherita', 33, 33, 33),
    (34, 'Média', 'Pizza de Quatro Queijos', 22.25, 'Quatro Queijos', 34, 34, 34),
    (35, 'Grande', 'Pizza de Pepperoni', 28.99, 'Pepperoni', 35, 35, 35);

SELECT p_mod.id_pizza_mod, p_mod.descricao AS Pizza, piz_mod.nome AS Pizzaiolo, p_mod.tamanho
FROM pizza_mod p_mod
INNER JOIN pizzaiolo_mod piz_mod ON p_mod.pizzaiolo_id_mod = piz_mod.id_pizzaiolo_mod;

SELECT id_pizza_mod, descricao AS Pizza, sabor AS Ingredientes
FROM pizza_mod;

SELECT ing_mod.sabor AS Ingrediente, p_mod.descricao AS Pizza
FROM pizza_mod p_mod
INNER JOIN (SELECT DISTINCT id_pizza_mod, sabor FROM pizza_mod) AS ing_mod ON p_mod.id_pizza_mod = ing_mod.id_pizza_mod;

SELECT p_mod.sabor AS Sabor, pi_mod.nome AS Pizzaiolo, r_mod.instrucoes AS Instrucoes
FROM pizza_mod p_mod
INNER JOIN pizzaiolo_mod pi_mod ON p_mod.pizzaiolo_id_mod = pi_mod.id_pizzaiolo_mod
INNER JOIN receita_mod r_mod ON p_mod.receita_id_mod = r_mod.id_receita_mod;
