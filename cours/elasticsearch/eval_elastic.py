#! /usr/bin/python
from elasticsearch import Elasticsearch
import json
import warnings

import warnings
warnings.filterwarnings("ignore")

# Connexion au cluster
client = Elasticsearch(hosts = "http://localhost:9200")

# Préciser le numéro de votre question ici.
# Si vous effectuez plusieurs requêtes pour la même question, écrivez "1-1", "1-2" ext...
question_number = "5-4"

query_max = {
    "size": 0,
    "aggs": {
        "max_rating": {
            "max": { "field": "Rating" }
        }
    }
}

query_min = {
    "size": 0,
    "aggs": {
        "min_rating": {
            "min": { "field": "Rating" }
        }
    }
}

res_max = client.search(index="eval", body=query_max)
note_max = res_max["aggregations"]["max_rating"]["value"]

res_min = client.search(index="eval", body=query_min)
note_min = res_min["aggregations"]["min_rating"]["value"]
print("Note maximale présente dans le dataset :", note_max)
print("Note minimale présente dans le dataset :", note_min)

# Copier coller votre requête Kibana ici (SANS l'instruction GET)
query = {
  "size": 0,
  "query": {
    "range": {
      "Rating": { "lte": 2 }
    }
  },
  "aggs": {
    "par_produit": {
      "terms": { "field": "Class Name.keyword" },
      "aggs": {
        "nombre_avis": { "value_count": { "field": "Rating" } }
      }
    }
  }
}

response = client.search(index="eval", body=query)

# Sauvegarde de la requête et la réponse dans un fichier json
with open("/home/yanngarba/DST-DE/cours/elasticsearch/eval/{}.json".format("q_" + question_number + "_response"), "w") as f:
  json.dump(dict(response), f, indent=2)

with open("/home/yanngarba/DST-DE/cours/elasticsearch/eval/{}.json".format("q_" + question_number + "_request"), "w") as f:
  json.dump(query, f, indent=2)