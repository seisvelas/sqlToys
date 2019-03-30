WITH t AS (SELECT CASE 
         WHEN p.clan='' OR p.clan=NULL THEN '[no clan specified]'
         ELSE p.clan
       END,
       (SELECT COUNT(*) FROM people WHERE clan=p.clan) as total_people,
       SUM(p.points) as total_points
FROM people p
GROUP BY p.clan)
SELECT RANK() OVER (ORDER BY total_points DESC) as rank, *
FROM t
ORDER BY total_points DESC;

/*

For this challenge you need to create a simple query to display each unique clan with their total 
points and ranked by their total points.

people table schema
name
points
clan
You should then return a table that resembles below

select on
rank
clan
total_points
total_people
The query must rank each clan by their total_points, you must return each unqiue clan and 
if there is no clan name you must replace it with [no clan specified], you must sum the total_points 
for each clan and the total_people within that clan.

##Note The data is loaded from the live leaderboard, 
this means values will change but also could cause the kata to time out retreiving the information.

*/
