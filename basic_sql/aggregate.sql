-- getting the avreage pages for each year
select released_year AS year, COUNT(*) AS boockForYears, AVG(pages) AS avg_pages FROM books
GROUP BY released_year
;

-- getting the avrg released_year for each author 
select  CONCAT('the avg for: ',author_lname, author_fname, ' is ',  AVG(released_year)) FROM books
GROUP BY author_lname, author_fname;

-- find the longest tile name that an author write
SELECT
    title,
    pages,
    CONCAT(author_lname, ' ', author_fname) AS full_author_name
FROM
    books
WHERE
    pages = (SELECT MAX(pages) FROM books);


-- find the longest tile name that an author write with diff methode using order more efitien
SELECT
    title,
    pages,
    CONCAT(author_lname, ' ', author_fname) AS full_author_name
FROM
    books
ORDER BY pages DESC
LIMIT 1;
