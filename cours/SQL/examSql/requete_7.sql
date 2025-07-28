SELECT
  pokemon.name,
  stats.sp_attack AS attacks
FROM PokemonType
JOIN Types
  ON pokemontype.type_id = types.type_id
JOIN Pokemon
  ON pokemontype.pokedex_number = pokemon.pokedex_number
JOIN Stats
  ON stats.pokedex_number = pokemon.pokedex_number
GROUP BY
  name,attacks,types.name_type
HAVING stats.sp_attack > 100 AND types.name_type = 'fire';
