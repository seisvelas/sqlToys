/* this works (I got points!), but occasionally fails tests eg when the median score is a decimal. Unsure why */
/* EDIT: Found bug. If the median is taken of even length table, it's supposed to be average of the two middle scores.
                    This only sometimes works when the two middle items are equal. */
SELECT 
       MIN(r.score),
       (SELECT score FROM 
        (SELECT m.score as score,
                ROW_NUMBER() OVER (ORDER BY score) as rc,
                COUNT(*) OVER () as total_rows
         FROM result m 
         ORDER BY score) t
         WHERE t.rc=t.total_rows::float / 2 + 1)::float as median,
       MAX(r.score)
FROM result r

/* In THEORY, this fix should now take the average of the two: */

SELECT 
       MIN(r.score),
       (SELECT score FROM 
        (SELECT m.score as score,
                ROW_NUMBER() OVER (ORDER BY score) as rc,
                COUNT(*) OVER () as total_rows
         FROM result m 
         ORDER BY score) t
        WHERE t.rc=((t.total_rows / 2) + (t.total_rows / 2 + 1))/2
       )::float as median,
       MAX(r.score)
FROM result r

/* But I still get an error sometimes, perhaps when they give me an odd length table? I don't think so tho,
since the test table appears to always be 100 rows */

/*

For this challenge you need to create a simple SELECT statement. 
Your task is to calculate the MIN, MEDIAN and MAX scores of the 
students from the results table.

Tables and relationship below:

Resultant table:
min
median
max

*/
