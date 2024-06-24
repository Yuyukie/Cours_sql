-- SQLite
/*
Creation d'une table avec clés primaire

CREATE TABLE posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT
    title VARCHAR(150),
    content TEXT,
    category VARCHAR(50),
    create_at DATETIME
);

Suppresion d'une table 
DROP TABLE post

Modification du nom d'une table
ALTER TABLE posts RENAME TO post

Modification de nom d'une colonne
ALTER TABLE post RENAME category to tag

Suppresion d'une colonne
ALTER TABLE post DROP category

Ajout d'une colonne
ALTER TABLE post ADD category

exo 1 
Creation d'une BDD avec cles primaire pour des recettes de cuisine

CREATE TABLE recipes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(150),
    slug VARCHAR(50),
    content TEXT,
    duration SMALLINT,
    online BOOLEEAN,
    create_at DATETIME
);

Inserer des donnees dans une table 
INSERT INTO recipes (
        title,
        slug,
        content,
        duration,
        online,
        create_at
    ) 
VALUES (
    'Soupe de poisson',
    'salade-de-fruit',
    'Contenue de test',
    10,
    FALSE,
    1718207664 
),(
    'Soupe de legumes',
    'salade-de-fruit',
    'Contenue de test',
    10,
    FALSE,
    1718207664 
);

Selectionner des donnees specifique dans une table 
SELECT title, duration 
FROM recipes 

Selectionner toutes les donnees dans une table 
SELECT *
FROM recipes 

Selectionner les donnees qui repondent a une condition
SELECT * 
FROM recipes 
WHERE duration < 20  ou WHERE duration BETWEEN 0 AND 30

Supprimer des donnees d'une table
DELETE FROM recipes WHERE title = 'test'; ne pas oublier WHERE ... sinon cela supprime toutes les recettes

Supprimer des donnees d'une table grace a l'id
DELETE FROM recipes WHERE id = '2'; ne pas oublier WHERE ... sinon cela supprime toutes les recettes

Modifier les donnees d'une table
UPDATE recipes SET title = 'Soupe de poisson' WHERE title = 'test2' ;ne pas oublier WHERE ... sinon cela modifie les titres de toutes les recettes
UPDATE recipes SET slug ='soupe de poisson' WHERE id=1
UPDATE recipes SET slug ='soupe de legumes' WHERE id=2

Creation d'un index
CREATE UNIQUE INDEX idx_slug ON recipes (slug)

Supprimer un index 
DROP INDEX idx_slug;

Demande des explications sur une requete 
EXPLAIN QUERY PLAN SELECT * FROM recipes WHERE slug = 'soupe de poisson'

Empecher une valeur NULL
CREATE TABLE recipes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(150) NOT NULL,
    slug VARCHAR(50) NOT NULL UNIQUE,
    content TEXT,
    duration SMALLINT,
    online BOOLEEAN,
    create_at DATETIME
);

JOINTURES

SELECT *
FROM recipes 
LEFT JOIN categories 
ON recipes.category_id = categories.id;
*/

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS recipes;


CREATE TABLE IF NOT EXISTS categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT
);


INSERT INTO categories (title)
VALUES ('Plat'),('Dessert');

CREATE TABLE recipes(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title VARCHAR(150) NOT NULL,
    slug VARCHAR(50) NOT NULL UNIQUE,
    content TEXT,
    category_id INTEGER,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

INSERT INTO recipes (title, slug, category_id)
VALUES
('Creme anglaise', 'creme-anglaise', 2),
('Soupe','Soupe', 1),
('Salade de fruit', ('salade-de-fruit'),NULL);

SELECT title, title
FROM recipes 
LEFT JOIN categories 
ON recipes.category_id = categories.id;
