SELECT 
  name,
  generation,
  base_total
FROM pokemon p1
WHERE base_total > (
    SELECT AVG(base_total)
    FROM pokemon p2
    WHERE p2.generation = p1.generation
);