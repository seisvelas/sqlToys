SELECT Concat(Concat(Initcap(firstname), ' '), Initcap(lastname)) AS shortlist 
FROM   elves 
WHERE  firstname LIKE '%tegil%' 
        OR lastname LIKE '%astar%'; 
