SELECT 
  pokemon.name AS name,
  (
    SELECT types.name_type
    FROM PokemonType
    JOIN Types  
      ON pokemontype.type_id = types.type_id
    WHERE pokemontype.pokedex_number = pokemon.pokedex_number
    ORDER BY pokemontype.type_id
    LIMIT 1
  ) AS primary_type,

  (
    SELECT types.name_type
    FROM PokemonType
    JOIN Types  
      ON pokemontype.type_id = types.type_id
    WHERE pokemontype.pokedex_number = pokemon.pokedex_number
    ORDER BY pokemontype.type_id
    LIMIT 1 OFFSET 1
  ) AS secondary_type

FROM Pokemon
ORDER BY pokemon.name;
