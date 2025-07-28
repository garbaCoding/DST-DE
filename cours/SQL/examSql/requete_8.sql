SELECT 
  p1.name AS pokemon_name,
  p1.generation AS pokemon_generation,
  p1.base_total AS total_stats,
  CASE
    WHEN p1.base_total >= (
      SELECT AVG(p2.base_total)
      FROM pokemon p2
      WHERE p2.generation = p1.generation
    ) THEN 'supérieure ou égal à la moyenne'
    WHEN p1.base_total < (
      SELECT AVG(p2.base_total)
      FROM pokemon p2
      WHERE p2.generation <= p1.generation
    ) THEN 'inférieure ou égal à la moyenne'    
  END AS total_stats_comparaison
FROM pokemon p1
ORDER BY p1.generation, p1.name;