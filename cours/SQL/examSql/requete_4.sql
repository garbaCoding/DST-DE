SELECT
  pokemon.name,
  pokemon.base_total
FROM Pokemonability
JOIN Abilities
  ON pokemonability.ability_id = abilities.ability_id
JOIN Pokemon
  ON pokemonability.pokedex_number = pokemon.pokedex_number
WHERE abilities.name_ability = 'Overgrow'
ORDER BY
  pokemon.base_total DESC;