SELECT age, COUNT(id) as total_people FROM people GROUP BY age HAVING COUNT(id) >= 10 ORDER BY age ASC;
