-- SELECT CONCAT(author_fname, ' ', author_lname) AS full_name
-- SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS full_name_capital
-- SELECT CONCAT(title, 'was relase in ', released_year) AS blurp
SELECT title, LENGTH(title) AS lenght
FROM books;
