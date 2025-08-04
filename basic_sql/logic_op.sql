-- boocks befffor 1980
-- SELECT * FROM books WHERE released_year < 1980 ;


--books witen by Eggers or Chabon

-- SELECT * FROM books WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';

--books witen by Lahiri after 2000
SELECT * FROM books WHERE author_lname = 'Lahiri' AND  released_year > 2000;


-- books pages between 100 and 200
SELECT * FROM books WHERE  pages > 100 AND  released_year < 200;

-- books where author_lname start with 'C' or 'S'
SELECT * FROM books WHERE  author_lname LIKE 'S%' OR author_lname LIKE 'C%';

