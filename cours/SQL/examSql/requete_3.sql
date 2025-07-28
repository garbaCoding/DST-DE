SELECT
  types.name_type,
  AVG(pokemon.base_total) AS average_base_total
FROM PokemonType
JOIN Types
  ON pokemontype.type_id = types.type_id
JOIN Pokemon
  ON pokemontype.pokedex_number = pokemon.pokedex_number
GROUP BY
  types.name_type
ORDER BY
  average_base_total ASC;