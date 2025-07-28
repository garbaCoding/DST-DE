SELECT
  types.name_type,
  COUNT(pokemontype.pokedex_number) AS nb_pokemons
FROM PokemonType
JOIN Types
  ON pokemontype.type_id = types.type_id
GROUP BY
  types.name_type
ORDER BY
  nb_pokemons DESC;