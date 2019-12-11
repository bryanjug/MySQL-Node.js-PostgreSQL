-- orders the data so the full name will have to match with other full names to order by
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname;