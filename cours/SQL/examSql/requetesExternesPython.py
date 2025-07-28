#!/usr/bin/env python3
import psycopg2

def main():
    # Paramètres de connexion
    conn = psycopg2.connect(
        host="localhost",
        port=5433,
        dbname="exam_garbarowitz",
        user="daniel",
        password="daniel"
    )

    conn.autocommit = True

    # Liste des requêtes à exécuter
    queries = {
        "Nombre de Pokémon par type":
        """
        SELECT
            types.name_type,
            COUNT(pokemontype.pokedex_number) AS nb_pokemons
        FROM PokemonType
        JOIN Types
        ON pokemontype.type_id = types.type_id
        GROUP BY types.name_type
        ORDER BY nb_pokemons DESC;
        """,

        "Pokémon avec un nombre de base de points supérieur à 600":
        """
        SELECT name,base_total
        FROM pokemon
        WHERE base_total > 600 
        ORDER BY base_total DESC 
        """,

        "types de Pokémon avec la base de points moyenne":
        """
        SELECT
            types.name_type,
            AVG(pokemon.base_total) AS average_base_total
        FROM PokemonType
        JOIN Types
        ON pokemontype.type_id = types.type_id
        JOIN Pokemon
        ON pokemontype.pokedex_number = pokemon.pokedex_number
        GROUP BY types.name_type
        ORDER BY average_base_total ASC;
        """,

        "Pokemon avec capacité Overgrow":
        """
        SELECT
            pokemon.name,
            pokemon.base_total
        FROM Pokemonability
        JOIN Abilities
        ON pokemonability.ability_id = abilities.ability_id
        JOIN Pokemon
        ON pokemonability.pokedex_number = pokemon.pokedex_number
        WHERE abilities.name_ability = 'Overgrow'
        ORDER BY pokemon.base_total DESC;
        """,
        "Liste des pokémons avec leur type primaire et secondaire":
        """
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
        """,

        "Pokemon avec stats supérieures ou égales à la moyenne":
        """
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
        """,

        "Pokemon avec attacks > 100 et type fire":
        """
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
        GROUP BY name,attacks,types.name_type
        HAVING stats.sp_attack > 100 AND types.name_type = 'fire';
        """,

        "Comparaison de la moyenne entre les stats de chaque génération":
        """
        SELECT
            p1.name AS pokemon_name,
            p1.generation AS pokemon_generation,
            p1.base_total AS total_stats,
        CASE
            WHEN p1.base_total >= (
              SELECT AVG(p2.base_total)
              FROM pokemon p2
              WHERE p2.generation = p1.generation
            ) THEN 'supérieur ou égal à la moyenne'
            WHEN p1.base_total < (
              SELECT AVG(p2.base_total)
              FROM pokemon p2
              WHERE p2.generation <= p1.generation
            ) THEN 'inférieur ou égal à la moyenne'    
        END AS total_stats_comparaison
        FROM pokemon p1
        ORDER BY p1.generation, p1.name;
        """
    }

    # Exécution des requêtes
    try:
        with conn.cursor() as cur:
            for label, sql in queries.items():
                print(f"Démarrage de « {label} »")
                cur.execute(sql)

                rows = cur.fetchall()
                for row in rows[:10]: 
                    print(row)
                if len(rows) > 10:
                    print("---------------")
                print()

    finally:
        conn.close()


if __name__ == "__main__":
    main()