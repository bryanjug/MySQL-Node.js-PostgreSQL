CREATE TABLE employees (
    id INT NOT NULL AUTO_INCREMENT
    ,first_name VARCHAR(100) NOT NULL
    ,last_name VARCHAR(100) NOT NULL
    ,middle_name VARCHAR(100) NULL
    ,age INT NOT NULL
    ,current_status VARCHAR(100) NOT NULL DEFAULT 'employed'
    ,PRIMARY KEY (id));

INSERT INTO employees(first_name, last_name, age) VALUES
('Dora', 'Smith', 58);

CREATE TABLE cats (
    cat_id INT NOT NULL AUTO_INCREMENT
    ,name VARCHAR(100)
    ,breed VARCHAR(100)
    ,age INT
    ,PRIMARY KEY (cat_id));
    
DESC cats; 

INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
SELECT cat_id, breed, age FROM cats;

SELECT * FROM cats WHERE age=4;

SELECT * FROM cats WHERE name = 'Egg'; #caps doesnt matter

SELECT cat_id, age FROM cats WHERE cat_id = age;

SELECT * FROM cats WHERE cat_id=age;

SELECT name AS cat_name, breed AS cat_breed FROM cats; #changes column name

UPDATE cats SET age=14 WHERE name='misty';

UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';

DELETE FROM cats WHERE name='Egg';

DELETE FROM cats; #deletes all cats

CREATE TABLE shirts (
    shirt_id INT NOT NULL AUTO_INCREMENT
    ,article VARCHAR(10)
    ,color VARCHAR(10)
    ,shirt_size VARCHAR(1)
    ,last_worn INT
    ,PRIMARY KEY (shirt_id));
    
INSERT INTO shirts(article, color, shirt_size, last_worn)
VALUES ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

INSERT INTO shirts(article, color, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50);

SELECT article, color FROM shirts;

SELECT shirt_size, article, color, last_worn FROM shirts WHERE shirt_size='M';

UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';

UPDATE shirts SET last_worn=0 WHERE last_worn=15;

DELETE FROM shirts WHERE last_worn=200;

UPDATE shirts SET shirt_size='XS', color='off white' WHERE color='white';

DELETE FROM shirts WHERE article='tank top';

DELETE FROM shirts;

DROP TABLE shirts;

-- #start commands from file

CREATE TABLE cats
    (
        cat_id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(100),
        age INT,
        PRIMARY KEY(cat_id)
    );
    
INSERT INTO cats(name, age)
VALUES('Charlie', 17);
 
INSERT INTO cats(name, age)
VALUES('Connie', 10);
 
SELECT * FROM cats;
 
source testing/insert.sql

-- #sql string functions

-- CONCAT(x, y, z) #combine data for cleaner output

-- CONCAT(author_fname, ' ', author_lname);

SELECT
    CONCAT(author_fname, ' ', author_lname)
    AS full_name
    FROM books;

SELECT author_fname AS first, author_lname AS last,
    CONCAT(author_fname, ' ', author_lname) AS full
    FROM books;

-- #prints '-' between each data set
SELECT CONCAT_WS('-', title, author_fname, author_lname)
    FROM books;

-- #prints pos(7) and after
SELECT SUBSTRING('hello world', 7);

-- #prints pos(3 through 8)
SELECT SUBSTRING('hello world', 3, 8);

-- #prints 3 from the end and works backwards
SELECT SUBSTRING('hello world', -3);
SELECT SUBSTRING("Where I'm Calling From: Selected Stories", 1, 10); 

SELECT SUBSTRING(title, 1, 10) FROM books;

-- #prints 1-10 chars of titles with '...' after each title
SELECT CONCAT (
    SUBSTRING(title, 1, 10), 
    '...') AS 'short title'
FROM books;

-- prints  hellO w*rld
SELECT REPLACE('hellO world', 'o', '*');

-- inserts and for every space
SELECT
    REPLACE('cheese bread coffee milk', ' ', ' and ');
    
SELECT
    REPLACE(title, 'e', '3') FROM books;
    
SELECT 
    SUBSTRING(
      REPLACE(title, 'e', '3'), 
      1, 10)
FROM books;

-- prints reverse of string
SELECT REVERSE('Hello World');

SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

SELECT CHAR_LENGTH('Hello worlds');

-- list author's last name and length of each name
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;

"Eggers is 6 characters long"

--  list author's last name and length of each name in a sentence
SELECT 
    CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') 
FROM books;

-- sql-format.com

SELECT UPPER('hello World');
SELECT LOWER('hello World');

SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) 
    AS Favorites
FROM books;

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS "full name in caps"
FROM books;

SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));

SELECT
    REPLACE(title, ' ', '->') AS title FROM books;
    
SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;

SELECT CONCAT(title, ' was released in ', released_year) AS "Movie's release dates" FROM books;

SELECT title, CHAR_LENGTH(title) AS "character count" FROM books;

-- print 1-10 characters followed by ''...'', print first (comma)last names, combining strings to show (quantity) + 'in stock'
SELECT 
    CONCAT(SUBSTRING(title, 1, 10), '...') 
        AS 'short title',
    CONCAT(author_fname, ',', author_lname)
        AS author,
    CONCAT(stock_quantity, " in stock")
        AS quantity
FROM books;

-- prints unique items only(no duplicates)
SELECT DISTINCT author_lname FROM books;

SELECT DISTINCT released_year FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;

-- print them together without duplicates
SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) FROM books;

-- seperate, 2 different columns
SELECT DISTINCT author_fname, ' ', author_lname FROM books;

-- list table ordered by the author's last name (ASCENDING)
SELECT author_lname FROM books ORDER BY author_lname;
SELECT released_year FROM books ORDER BY released_year;

-- list table ordered by the author's last name (DESCENDING)
SELECT author_lname FROM books ORDER BY author_lname DESC;

-- orders by the 3rd column
SELECT title, author_fname, author_lname FROM books ORDER BY 3;

-- orders the data so the full name will have to match with other full names to order by
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;

-- only allows first 3 titles
SELECT title FROM books LIMIT 3;

SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;

-- specifies starting point and end point lmits, pagination
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,10;

-- searches query for any char before and after 'da'
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';

-- find where stock quantity is 4 digits/cars long
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '____';

-- finds everything before and after % sign
SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '%\%%';

SELECT title FROM books WHERE title LIKE '%stories%';

-- prints title with most pages
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- print summary containing title and year, for the 3 most recent books
SELECT DISTINCT CONCAT(title, ' - ', released_year) AS 'summary' FROM books ORDER BY released_year DESC LIMIT 3;

-- prints last name that contain spaces
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

-- orders by author's name then by title second
SELECT title, author_lname FROM books ORDER BY author_lname, title;

SELECT CONCAT('MY FAVORITE AUTHOR IS ', UPPER(author_fname), ' ', UPPER(author_lname), '!') AS 'yell' FROM books ORDER BY author_lname;

--finds real amount of rows in a table
SELECT COUNT(*) FROM books;

SELECT COUNT(DISTINCT author_fname, author_lname) FROM books;

--count of 'the' in titles
SELECT COUNT(title) FROM books WHERE title LIKE '%the%';

--GROUP BY gets identical data into rows
--creates a super row for duplicates
SELECT title, author_lname FROM books
    GROUP BY author_lname;

--check for count of subrows
SELECT author_lname, COUNT(*)
FROM books GROUP BY author_lname;

--check for count of subrows showing all subgroups
SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;

--prints years and the amount of dupes
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

--In 1945 1 book(s) released
SELECT CONCAT('In ', released_year, ' ',  COUNT(*), ' book(s) released') AS 'year' FROM books GROUP BY released_year; 

SELECT MIN(released_year) FROM books;
SELECT MAX(released_year) FROM books;

SELECT * FROM books
WHERE pages = (SELECT MIN(pages)
    FROM books);

--prints title and corresponding page number involving subqueries
SELECT title, pages FROM books 
WHERE pages=(SELECT MAX(pages) 
    FROM books);

--prints title and smallest page number at a faster rate
SELECT title, pages FROM books
ORDER BY pages ASC LIMIT 1;

--find year each author published their first book
SELECT author_fname,
    author_lname,
    MIN(released_year)
FROM books
GROUP BY author_lname,
    author_fname;
    
--finds longest page count for each author
SELECT 
    author_fname, author_lname, 
    MAX(pages) 
FROM books 
GROUP BY author_lname, 
    author_fname;

--combines full name and replaces titles
SELECT
    CONCAT(author_fname, ' ', author_lname) AS author,
    MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
    author_fname;
    
SELECT SUM(released_year) FROM books;

SELECT author_fname, author_lname, SUM(pages)
    FROM books
GROUP BY author_lname,
    author_fname;
    
SELECT AVG(released_year) FROM books;

--calc the AVG stock quantity for books released in the same year
SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year;

--shows avg amount of pages for each author
SELECT author_fname, author_lname, AVG(pages) 
    FROM books
GROUP BY author_lname,
    author_fname;
    
--print number of books in database
SELECT COUNT(*) AS '# of books' FROM books;

--print how many books were released each year
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

--print total # of books in stock
SELECT SUM(stock_quantity) FROM books;

--find average released_year for each author
SELECT author_fname, author_lname, AVG(released_year)
    FROM books
GROUP BY author_lname,
    author_fname;
    
--find full name of author who wrong the longest book
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS 'full name', MAX(pages)
    FROM books
GROUP BY pages DESC LIMIT 1;

-- prints year, # of books, and average number of pages
SELECT released_year AS 'year', 
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM books 
GROUP BY released_year;

-- CHAR prevents from printing more than 5 chars, 0-255, faster for fixed length text, use when they dont change
CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10)); 

INSERT INTO dogs (name, breed) VALUES ('princess jane', 'retriever');

-- DECIMAL (total number of digits, # of digits after decimal)
CREATE TABLE items (price DECIMAL(5,2));

INSERT INTO items(price) VALUES(43.3335);

-- store larger numbers using less space, but loses precision
--FLOAT = precision issues at 7 digits, DOUBLE = ~15 digits, adds 0's once precision is lost
CREATE TABLE thingies (price FLOAT);

INSERT INTO thingies(price) VALUES (88775566.45); --prints 88775600

--TIME 'HH:MM:SS'
--DATE 'YYYY-MM-DD'
--DATETIME 'YYYY-MM-DD HH:MM:SS'
CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

--SELECT CURDATE(); - gives current dates
--CURTIME() - gives current time
--NOW() gives current datetime
INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES
    ('microwave', CURDATE(), CURTIME(), NOW());
    
DELETE FROM people WHERE name = 'microwave';

SELECT name, birthdate, DAY(birthdate) FROM people;
SELECT name, birthdate, DAYNAME(birthdate) FROM people;                
SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people; 
SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people; 
SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people; 
SELECT name, birthdt, MONTHNAME(birthdt) FROM people; 
SELECT name, birthdt, MONTH(birthdt) FROM people;
SELECT name, birthtime, HOUR(birthtime) FROM people;

--"2009-10-04 22:23:00" -> "Sunday October 2009"
SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W %M %Y');

-- 10/04/2009
SELECT DATE_FORMAT('2009-10-04 22:23:00', '%m/%d/%Y');

--11/11/1983 at 10:07
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;

--subtracts the date/time from days since birthday
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;            

--adds 1 month, or DATE_SUB
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people; 

SELECT birthdt, (birthdt + INTERVAL 15 MONTH + INTERVAL 10 HOUR) FROM people;

--TIMESTAMP takes up less space when storing time
CREATE TABLE comments (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW());
    
--when the row is changed, the timestamp changes
CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP); --can use two NOW()s

--changes a certain string to a default and changes the timestamp
INSERT INTO comments2 (content) VALUES('lolololol');

UPDATE comments2 SET content='THIS IS NOT FUNNY' WHERE content='lolololol';

SELECT * FROM comments2 ORDER BY changed_at;

CREATE TABLE students (
    name VARCHAR(15),
    grade CHAR(1));

--price < $1 million    
CREATE TABLE inventory (
    item_name VARCHAR(20),
    price DECIMAL(6, 0),
    quantity INT);

--current day in INT
SELECT DATE_FORMAT(NOW(), '%w') + 1;
SELECT DAYOFWEEK(NOW());

--prints sunday
SELECT DATE_FORMAT(NOW(), '%W');

--05/12/2019 
SELECT DATE_FORMAT(NOW(), '%m/%d/%Y');

--date at 3:15
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

--this is my first tweet  | coltscat | 2019-05-12 04:04:34
CREATE TABLE tweets (
    content VARCHAR(100),
    username VARCHAR(20),
    time_created TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP);

SELECT title, released_year FROM books
    WHERE released_year != 2017;
    
SELECT title, author_lname FROM books
    WHERE author_lname = 'Harris';

--finds anything matching w
SELECT title FROM books WHERE title LIKE '%W%';

--choose books that dont start with a w
SELECT title FROM books WHERE title NOT LIKE 'W%';

--finds years above or equal to 2000
SELECT * FROM books WHERE released_year >= 2000 ORDER BY released_year;

--true = 1, false = 0, 'a' < 'b', 'A' = 'a'
SELECT 99 > 1;

--select books written by dave eggers and published after 2010
--&& or AND
SELECT title, author_lname, released_year FROM books WHERE author_lname ='Eggers' AND
    released_year > 2010;
    
SELECT * FROM products WHERE brand = 'lego' AND instock='true';

SELECT * FROM books WHERE author_lname='Eggers' &&
    released_year > 2010 &&
    title LIKE '%novel%';
    
--|| = OR, pipe character
SELECT title, author_lname, released_year FROM books WHERE author_lname ='Eggers' ||
    released_year > 2010;

SELECT title, author_lname, released_year, stock_quantity FROM books WHERE author_lname ='Eggers' ||
    released_year > 2010 OR
    stock_quantity > 100;
    
--select all books published between 2004 and 2015
SELECT title, released_year FROM books WHERE released_year >= 2004 &&
    released_year <= 2015;
    
--BETWEEN x AND y, NOT BETWEEN, good to use CAST to keep BETWEEN the same data type
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;

-- CAST() = change from date to date time, string to date, etc
SELECT name, birthdt FROM people 
    WHERE birthdt BETWEEN CAST('1920-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);

--IN, NOT IN = faster way to use OR
SELECT title, author_lname FROM books
    WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');

SELECT title, released_year FROM books
    WHERE released_year NOT IN (2017, 1985);

--books released after 2000
SELECT title, released_year FROM books
    WHERE released_year >= 2000
    AND released_year NOT IN (2017, 2002) 
ORDER BY released_year;
    
--% = test if something is even
--find all years with odd ints
SELECT title, released_year FROM books
    WHERE released_year >= 2000 AND
    released_year % 2 != 0;

--prints additional information in a new row
SELECT title, released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS GENRE
FROM books;

--ranks stock quantity by amount of stock by stars
SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;

SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 

SELECT title, released_year FROM books
    WHERE released_year < 1980;
    
SELECT title, author_lname FROM books
    WHERE author_lname IN ('Eggers', 'Chabon');
    
SELECT title, author_lname, released_year FROM books  
    WHERE author_lname IN ('Lahiri') &&
    released_year > 2000;

SELECT title, pages FROM books
    WHERE pages BETWEEN 100 AND 200;
    
SELECT title, author_lname FROM books   
    WHERE author_lname LIKE 'C%' ||
    author_lname LIKE 'S%';

SELECT title, author_lname,
    CASE
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just kids' OR 'a heartbreaking work of Staggering Genius' THEN 'Memoir'
        ELSE 'Novel'
    END AS TYPE
FROM books;

SELECT title, author_lname
    CASE
        
    END AS COUNT
FROM books GROUP BY author_lname;

SELECT title, author_lname,
    CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books GROUP BY author_lname, author_fname;

--1:many
INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR (100)
);

--doesnt allow changing of relational id
--INSERT INTO orders (order_date, amount, customer_id) VALUES ('2016/06/06', 33.67, 98); doesnt work
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
);

SELECT id FROM customers WHERE last_name='George';
SELECT * FROM orders WHERE customer_id = 1;

SELECT * FROM orders WHERE customer_id = (
    SELECT id FROM customers
    WHERE last_name = 'George');

--implicit inner join where id = customer id
SELECT first_name, last_name, order_date, amount
    FROM customers, orders 
    WHERE customers.id = orders.customer_id;

--explicit inner join, matches ids from two tables, better to understand
SELECT first_name, last_name, order_date, amount
    FROM customers
    JOIN orders 
    ON customers.id = orders.customer_id;

--arbitrary join - dont do this!
SELECT * FROM customers
    JOIN orders ON customers.id = orders.id;

SELECT first_name, last_name, order_date, amount
    FROM customers
    JOIN orders 
    ON customers.id = orders.customer_id
    ORDER BY order_date;
    
SELECT first_name, 
last_name, 
order_date,
SUM(amount) AS total_spent
    FROM customers
    JOIN orders 
        ON customers.id = orders.customer_id
    GROUP BY orders.customer_id
    ORDER BY total_spent DESC;
    
--left join, takes all info from A, along with the matching records in B
SELECT * FROM customers
    LEFT JOIN orders
        ON customers.id = orders.customer_id;

--replaces NULL to 0
SELECT first_name, 
last_name, 
IFNULL(SUM(amount), 0) AS total_spent
    FROM customers
    LEFT JOIN orders    
      ON customers.id = orders.customer_id
    GROUP BY customers.id
    ORDER BY total_spent;
    
--right join, takes all info from B, along with the matching records in A
SELECT * FROM customers
    RIGHT JOIN orders
    ON customers.id = orders.customer_id;

--inserting with no foreign key restraint
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR (100)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT
);

INSERT INTO orders(order_date, amount, customer_id) VALUES
    ('2017/11/05', 23.45, 45),
    (CURDATE(), 777.77, 109);

SELECT IFNULL(first_name, 'MISSING') AS first,
IFNULL(last_name, 'USER') AS last, 
order_date, 
amount,
SUM(amount)
    FROM customers
    RIGHT JOIN orders
        ON customers.id = orders.customer_id
    GROUP BY first_name, last_name;
    
-- ON DELETE CASCADE, when an order is deleted, delete the corresponding info
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR (100)
);

--deletes relational information once one is deleted
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) 
        REFERENCES customers(id)
        ON DELETE CASCADE
);

DELETE FROM customers WHERE email = 'george@gmail.com';

SELECT * FROM customers
    LEFT JOIN orders
        ON customers.id = orders.customer_id;
        
SELECT * FROM orders
    LEFT JOIN customers
        ON customer_id = orders.customer_id;

--relating ids
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers (
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id)
        REFERENCES students(id)
        ON DELETE CASCADE
);

--prints all duplicates of first name
SELECT first_name,
title,
grade
    FROM students
    JOIN papers
        ON students.id = papers.student_id
    GROUP BY first_name, title
    ORDER BY grade DESC;

--print students who dont have a paper
SELECT first_name,
IFNULL(title, 'MISSING'),
IFNULL(grade, '0') AS grade
    FROM students
    LEFT JOIN papers
        ON students.id = papers.student_id
    GROUP BY first_name, title;
    
--pass or fail check
SELECT first_name,
IFNULL(AVG(grade), '0') AS average,
    CASE
        WHEN AVG(grade) IS NULL THEN 'FAILING'
        WHEN AVG(grade) >= 70 THEN 'PASSING'
        ELSE 'FAILING'
    END AS passing_status
    FROM students
    LEFT JOIN papers
        ON students.id = papers.student_id
    GROUP BY first_name
    ORDER BY grade DESC;

CREATE TABLE reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
    );
    
CREATE TABLE series (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4),
    genre VARCHAR(100)
    );
    
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');

--total # of digits allowed, #s after decimal place
CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
    );

INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

--challenge 1
SELECT title, rating 
    FROM series
    JOIN reviews
        ON series.id = reviews.series_id;

--Challenge 2 AVG rating
SELECT 
title,
AVG(rating) AS avg_rating
    FROM series
    JOIN reviews
        ON series.id = reviews.series_id
    GROUP BY series.id
    ORDER BY avg_rating;
    
--Challenge 3, prints every review by each person
SELECT first_name,
last_name,
rating
FROM reviews
    INNER JOIN reviewers
        ON reviewers.id = reviews.reviewer_id;

--challenge 4 unreviewed series
SELECT title,
rating
    FROM series
    LEFT JOIN reviews
        ON series.id = reviews.series_id
    WHERE rating IS NULL;
    
--challenge 5 - GENRE AVG RATINGS
SELECT genre,
ROUND(
    AVG(rating), 2) 
    AS avg_rating
    FROM series
    INNER JOIN reviews
        ON series.id = reviews.series_id
    GROUP BY genre;

--challenge 6
SELECT first_name,
last_name,
COUNT(rating) AS COUNT,
IFNULL(MIN(rating), 0) AS MIN,
IFNULL(MAX(rating), 0) AS MAX,
ROUND(IFNULL(AVG(rating), 0), 2) AS AVG,
    CASE
        WHEN COUNT(rating) >= 10 THEN 'POWER USER'
        WHEN COUNT(rating) > 0 THEN 'ACTIVE'
        ELSE 'INACTIVE'
    END AS 'INACTIVE'
    --IF(COUNT(rating) >= 1, 'ACTIVE', 'INACTIVE') AS STATUS
    FROM reviewers
    LEFT JOIN reviews
      ON reviewers.id = reviews.reviewer_id
    GROUP BY reviewers.id;

--challenge 7, 3 tables in one
SELECT title,
    rating,
    CONCAT(first_name, ' ', last_name) AS reviewer
FROM reviewers
    INNER JOIN reviews
        ON reviewers.id = reviews.reviewer_id
    INNER JOIN series
        ON series.id = reviews.series_id
    ORDER BY title;

--instagram schema ideology
CREATE TABLE photos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    total INT
    );
    
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    total INT
    );

CREATE TABLE likes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    total INT
    );
    
CREATE TABLE hashtags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    total INT
    );
    
CREATE TABLE followers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    total INT
    );
    
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(15),
    total_photos INT,
    total_comments INT,
    total_likes INT,
    total_hashtags INT,
    total_followers INT
    FOREIGN KEY (total_photos) REFERENCES photos(id)
    FOREIGN KEY (total_comments) REFERENCES comments(id)
    FOREIGN KEY (total_likes) REFERENCES likes(id)
    FOREIGN KEY (total_hashtags) REFERENCES hashtags(id)
    FOREIGN KEY (total_followers) REFERENCES followers(id)
    );

--real instagram    
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
    );

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES users(id)
    );

CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
    );

INSERT INTO photos (image_url, user_id) VALUES
    ('/fdhsjjrj', 1),
    ('/h45u5i56', 2),
    ('/fgkeohj9', 2);
    
SELECT photos.image_url, users.username
    FROM photos
    JOIN users
        ON photos.user_id = users.id;
        
--finding 5 oldest users
SELECT username,
created_at
    FROM users
    ORDER BY created_at
    LIMIT 5;

--top 3 most popular registration date
SELECT DAYNAME(created_at) AS day,
COUNT(*) AS total
    FROM users
    GROUP BY day
    ORDER BY total DESC
    LIMIT 3;

--finds users who never posted a photo
--WHERE photos.id IS NULL
SELECT users.username,
IFNULL(photos.user_id, 0) AS total_photos
    FROM photos
    RIGHT JOIN users
        ON photos.user_id = users.id
    WHERE IFNULL(photos.user_id, 0) = 0
    GROUP BY username
    ORDER BY total_photos;
    
--OR
SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

--identify most popular photo and user who created it
SELECT photos.id AS photo_id,
users.username AS username,
photos.image_url AS photo_link,
COUNT(*) AS total_likes
    FROM photos
    INNER JOIN likes
        ON likes.photo_id = photos.id
    INNER JOIN users
        ON users.id = photos.user_id
    GROUP BY photo_id
    ORDER BY total_likes DESC
    LIMIT 1;
    
--finds total amount of posts for each user
SELECT users.username AS username,
COUNT(photos.id) AS total_posts
    FROM photos
    RIGHT JOIN users
        ON users.id = photos.user_id
    GROUP BY username
    ORDER BY total_posts
    ;

--calculate avg number of photos per user
--total # of photos / total # of users
SELECT
    (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS AVERAGE;

--Five most popular hashtags
SELECT tags.tag_name AS tag_name,
COUNT(photo_tags.tag_id) AS times_used
    FROM photo_tags
    JOIN tags
        ON tags.id = photo_tags.tag_id
    GROUP BY tag_name
    ORDER BY times_used DESC
    LIMIT 5;

--Finding bots - users who have liked every single photo
SELECT users.username AS username,
COUNT(*) AS num_likes
    FROM users
    INNER JOIN likes
        ON users.id = likes.user_id
    GROUP BY likes.user_id
    HAVING num_likes = (SELECT COUNT(*) FROM photos);
    
