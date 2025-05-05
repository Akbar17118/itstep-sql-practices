CREATE TABLE categories(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(255) NOT NULL
);
CREATE TABLE products (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(255) NOT NULL,
	price NUMERIC(10, 2) NOT NULL,
	description TEXT,
	rating REAL DEFAULT 10,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	is_active BLOB DEFAULT 1,
	category_id INTEGER NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories(id)

);

ALTER TABLE products ADD COLUMN category_id INTEGER;



INSERT INTO categories (name) VALUES(
	'ХОЗ-ТОВАРЫ'
);
INSERT INTO categories (name) VALUES(
	'Электроника'
);
INSERT INTO categories (name) VALUES(
	'Хлебо-булочное'
);

SELECT * FROM categories;
SELECT * FROM products;
INSERT INTO products(name, description, price, rating, category_id) VALUES(
	'хлеб', 'ума', 100, 10, 2
);

SELECT 
	p.name AS 'Называние продуст',
	c.name AS 'Название Категорий'
 FROM products p
INNER JOIN  categories c ON c.id == p.category_id 
WHERE p.category_id ==2;

