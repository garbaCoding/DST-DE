#! /usr/bin/python
from elasticsearch import Elasticsearch, helpers
import csv
import json

# Connexion au cluster
es = Elasticsearch(hosts=["http://localhost:9200"])

# Étape 1 : Définir ton mapping personnalisé
mapping = {
    "mappings": {
    "properties": {
      "Clothing ID": {
        "type": "integer"
      },
      "Age": {
        "type": "integer"
      },
      "Title": {
        "type": "text",
        "analyzer": "english",
        "fielddata": True
      },
      "Review Text": {
        "type": "text",
        "analyzer": "english",
        "fielddata": True
      },
      "Rating": {
        "type": "integer"
      },
      "Recommended IND": {
        "type": "boolean"
      },
      "Positive Feedback Count": {
        "type": "integer"
      },
      "Division Name": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword",
            "ignore_above": 256
          }
        }
      },
      "Department Name": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword",
            "ignore_above": 256
          }
        }
      },
      "Class Name": {
        "type": "text",
        "fields": {
          "keyword": {
            "type": "keyword",
            "ignore_above": 256
          }
        }
      }
    }
  }
}

# Étape 2 : Créer l'index avec ce mapping
if es.indices.exists(index="eval"):
    es.indices.delete(index="eval")  # Supprime si existe déjà
es.indices.create(index="eval", body=mapping)

# Étape 3 : Importer les données CSV
with open('/home/yanngarba/DST-DE/cours/elasticsearch/Womens_Clothing.csv', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    actions = []
    for row in reader:
        # Optionnel : nettoyage ou conversion
        # Convertir certains champs
        row["Age"] = int(row["Age"]) if row["Age"] else None
        row["Rating"] = int(row["Rating"]) if row["Rating"] else None
        row["Clothing ID"] = int(row["Clothing ID"]) if row["Clothing ID"] else None
        row["Positive Feedback Count"] = int(row["Positive Feedback Count"]) if row["Positive Feedback Count"] else None
        row["Recommended IND"] = bool(int(row["Recommended IND"])) if row["Recommended IND"] else None

        actions.append({
            "_index": "eval",
            "_source": row
        })

    helpers.bulk(es, actions)

# Récupération du template
template = es.indices.get_mapping()

# Sauvegarde dans un fichier json
with open("/home/yanngarba/DST-DE/cours/elasticsearch/eval/{}.json".format("index_template"), "w") as f:
  json.dump(dict(template), f, indent=2)