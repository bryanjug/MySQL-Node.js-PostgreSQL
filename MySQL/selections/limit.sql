-- SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;

-- specifies starting point and end point lmits, pagination
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,10;
