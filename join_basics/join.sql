-- using join to print for each student his papers
SELECT first_name, title, grade
FROM students
JOIN papers
  ON papers.student_id = students.id;

-- using left join to print for each student his papers 
SELECT 
  first_name, 
  IFNULL(title, 'MISSING')
  , IFNULL(grade, 0)
FROM students
LEFT JOIN papers
  ON papers.student_id = students.id;


-- Getting the avrg grade for each student 
SELECT 
  first_name, 
  AVG(IFNULL(grade, 0)) AS avrg, 
  CASE
      WHEN AVG(IFNULL(grade, 0)) > 75
        THEN 'PASS'
      ELSE 'FAIL'
  END AS passing_status
FROM students
LEFT JOIN papers
  ON papers.student_id = students.id


GROUP BY (id) 
ORDER BY    AVG(IFNULL(grade, 0)) DESC;
