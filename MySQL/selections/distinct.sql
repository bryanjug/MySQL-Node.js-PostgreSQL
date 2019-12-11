-- SELECT DISTINCT author_lname FROM books;

-- -- print them together without duplicates
-- SELECT DISTINCT CONCAT(author_fname, ' ', author_lname) FROM books;

-- seperate, 2 different columns
SELECT DISTINCT author_fname, ' ', author_lname FROM books;
