/*

There is an events table used to track different key activities taken on a website. 
For this task you need to filter the name field to only show "trained" events. 
Events should be grouped by the day they happened and counted. The description field 
is used to distinguish which items the events happened on.

"events" Table Schema
id
name (String)
created_at (DateTime)
description (String)
The expected results is provided so that you can see what the expected output is 
supposed to look like. Your "actual" output needs to match the expected output.

*/

SELECT DISTINCT
  e.created_at::timestamp::date as day,
  e.description,
  (SELECT COUNT(*) 
  FROM events 
  WHERE created_at::timestamp::date = e.created_at::timestamp::date
  AND description = e.description
  AND name = 'trained') as count
FROM events e
WHERE name = 'trained'
ORDER BY day, e.description
