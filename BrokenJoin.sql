/*

Timmy works for a statistical analysis company and has been given a task of calculating the highest average salary for a given job, the sample is compiled of 100 applicants each with a job and a salary. Timmy must display each unique job, the total average salary, the total people and the total salary and order by highest average salary. Timmy has some bugs in his query, help Timmy fix his query so he can keep his job!

people table schema
id
name
job table schema
id
people_id
job_title
salary
resultant table schema
job_title (unique)
average_salary (float, 2 dp)
total_people (int)
total_salary (float, 2 dp)

Note: original broken query gone

*/

SELECT 
  j.job_title,
  CAST(ROUND(SUM(j.salary) / COUNT(p), 2) as float) as average_salary,
  COUNT(p.id) as total_people,
  CAST(ROUND(SUM(j.salary), 2) as DOUBLE PRECISION) as total_salary
  FROM people p
  JOIN job j ON p.id=j.people_id
  GROUP BY j.job_title
  ORDER BY average_salary DESC;
