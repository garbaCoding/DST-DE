#!/bin/bash

OUTPUT="answers.txt"

echo "📊 RÉSULTATS DES ANALYSES DBT" > $OUTPUT
echo "Généré le: $(date)" >> $OUTPUT
echo "" >> $OUTPUT

# Fonction d'export
export_model() {
    MODEL=$1
    TITLE=$2
    
    echo "" >> $OUTPUT
    echo "========================================" >> $OUTPUT
    echo "$TITLE" >> $OUTPUT
    echo "========================================" >> $OUTPUT
    echo "" >> $OUTPUT
    
    # Compiler le modèle pour obtenir le SQL
    dbt compile --select $MODEL --quiet
    
    # Trouver le fichier SQL compilé
    SQL_FILE="target/compiled/demo_dbt/models/analytics/${MODEL}.sql"
    
    if [ -f "$SQL_FILE" ]; then
        # Exécuter la requête et sauvegarder
        SQL=$(cat "$SQL_FILE")
        snowsql -q "$SQL" -o output_format=psql -o header=true -o timing=false >> $OUTPUT
        echo "✅ $MODEL exporté"
    else
        echo "❌ Fichier compilé non trouvé: $SQL_FILE"
    fi
}

# Exporter tous les modèles analytics
export_model "analytics_3_1_albums_multi_cd" "3.1. Albums avec plus de 1 CD"
export_model "analytics_3_2_tracks_2000_2002" " 3.2. Morceaux produits en 2000 ou 2002"
export_model "analytics_3_3_rock_jazz_tracks" "3.3. Morceaux de Rock et Jazz avec compositeurs"
export_model "analytics_3_4_top_10_longest_albums" "3.4. Top 10 des albums les plus longs (en millisecondes)"
export_model "analytics_3_5_albums_per_artist" "3.5. Nombre d'albums par artiste"
export_model "analytics_3_6_tracks_per_artist" "3.6. Nombre de morceaux par artiste"
export_model "analytics_3_7_top_genre_2000s" "3.7. Donnez le genre de musique le plus écouté dans les années 2000"
export_model "analytics_3_8_playlists_long_tracks" "3.8. Playlists avec morceaux de plus de 4 minutes (240000 ms)"
export_model "analytics_3_9_french_rock_tracks" "3.9. Morceaux de Rock d'artistes français"
export_model "analytics_3_10_avg_size_by_genre" "3.10. Moyenne des tailles des morceaux par genre"
export_model "analytics_3_11_playlists_old_artists" "3.11. Playlists avec morceaux d'artistes nés avant 1990"

echo ""
echo "✅ Export terminé ! Voir: $OUTPUT"