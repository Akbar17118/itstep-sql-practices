
CREATE TABLE authors (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(512) NOT NULL
);

CREATE TABLE books (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(512) NOT NULL,
	authorId INTEGER NOT NULL,
	FOREIGN KEY (authorId) REFERENCES authors (id) ON DELETE CASCADE
);

CREATE TABLE readers (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(512) NOT NULL
);

CREATE TABLE borrows(
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	bookId INTEGER NOT NULL,
	readerId INTEGER NOT NULL,
	timeBorrowed DATETIME DEFAULT CURRENT_TIMESTAMP,
	timeReturned DATETIME,
	FOREIGN KEY (bookId) REFERENCES books (id) ON DELETE CASCADE,
	FOREIGN KEY (readerId) REFERENCES readers (id) ON DELETE CASCADE
);


INSERT INTO authors (name) VALUES ('Lev Tolstoy');
INSERT INTO books (name, authorId) VALUES ('Rath of Life', 1);
INSERT INTO readers (name) VALUES ('Pedro');
INSERT INTO borrows (bookId, readerId, timeBorrowed, timeReturned)
VALUES (1,1,'2025-05-07', '2025-05-13');


SELECT books.name AS books_name, authors.name AS authors_name
FROM books
JOIN authors ON books.authorId = authors.id;

SELECT * FROM borrows WHERE timeReturned IS NULL;

SELECT books.name AS books_name, readers.name AS readers_name,
       borrows.timeBorrowed, borrows.timeReturned
FROM borrows
JOIN books ON borrows.bookId = books.id
JOIN readers ON borrows.readerId = readers.id
WHERE borrows.timeReturned IS NULL;

