-- In a single shortlist column, return each elf's full name (capitalized first letters) if they have tegil in the first name or astar in the last name

SELECT Concat(Concat(Initcap(firstname), ' '), Initcap(lastname)) AS shortlist 
FROM   elves 
WHERE  firstname LIKE '%tegil%' 
        OR lastname LIKE '%astar%'; 
