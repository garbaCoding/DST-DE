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
question_number = "4-2"

# Copier coller votre requête Kibana ici (SANS l'instruction GET)
query = {
  "size": 0,
  "aggs": {
    "extended_rating_stats":{
      "extended_stats": {
        "field": "Rating"
      }
    },
    "avg_rating": {
      "avg": {
        "field": "Rating"
      }
    },
    "median_rating": {
      "percentiles": {
        "field": "Rating",
        "percents": [50]
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