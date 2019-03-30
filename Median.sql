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
