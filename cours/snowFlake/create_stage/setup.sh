#!/bin/bash

# 1. Télécharger les clés AWS depuis un S3 public avec wget

wget -q https://course-snowflakes.s3.eu-west-1.amazonaws.com/config/aws_keys.csv


# 2. Lire les clés depuis le fichier CSV (une seule ligne, pas d’en-tête)

IFS=, read AWS_KEY AWS_SECRET < aws_keys.csv


# 3. Supprimer le fichier local contenant les clés

rm -f aws_keys.csv
QUERY="USE DATABASE dst_db;
USE SCHEMA PUBLIC;
CREATE OR REPLACE STAGE s3_data
  URL = 's3://course-snowflakes/sample/'
  CREDENTIALS = (
    AWS_KEY_ID = '${AWS_KEY}'
    AWS_SECRET_KEY = '${AWS_SECRET}'
  );"

# 4. Créer le stage dans Snowflake

/home/yanngarba/.snowsql/1.3.3/snowsql \
  -a zgiqknz-ky56916 \
  -u GARBACODING \
  -q "$QUERY"


# 5. Supprimer ce script lui-même

