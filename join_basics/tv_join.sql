-- geting the rating for each book 
SELECT 
  title, 
  rating
FROM series
JOIN reviews
  ON reviews.series_id = series.id;

-- geting the avg rating for each book 
SELECT 
  title, 
  AVG(rating) AS avg_rating
FROM series
JOIN reviews
  ON reviews.series_id = series.id
GROUP BY series.id
ORDER BY avg_rating ;

-- geting the rating with the full name of the persen given it 
SELECT 
  first_name, 
  last_name,
  rating
FROM reviewers
JOIN reviews
  ON reviews.reviewer_id = reviewers.id;
--
-- SELECT 
--   title,
--   rating 
-- FROM series
-- LEFT JOIN reviews
--   ON reviews.series_id = series.id
-- WHERE rating is NULL

SELECT 
  genre, 
  ROUND(AVG(rating ), 2) AS avg_rating
FROM series
JOIN reviews
  ON reviews.series_id = series.id
GROUP BY genre
ORDER BY avg_rating ;

SELECT 
  first_name,
  last_name,
  MIN(IFNULL(rating, 0 )) AS MIN,
  MAX(IFNULL(rating, 0 )) AS MAX,
  COUNT(rating) AS COUNT, 
  AVG(IFNULL(rating, 0)) AS avg_rating,
CASE
  WHEN AVG(IFNULL(rating, 0)) <= 0
    THEN 'NOT_ACTIV'
  ELSE
    'ACTIVE'
END AS 'STATUS'
FROM reviewers
LEFT JOIN reviews
ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;
-- ORDER BY rating;



SELECT 
  title,
  CONCAT(first_name," ", last_name) AS full_name,
  rating
FROM reviewers
JOIN reviews
  ON reviews.reviewer_id = reviewers.id
JOIN series
  ON series.id = reviewers.id
ORDER BY title;



