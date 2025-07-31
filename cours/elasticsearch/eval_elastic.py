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
question_number = "5-1"

query_max = {
    "size": 0,
    "aggs": {
        "max_rating": {
            "max": { "field": "Rating" }
        }
    }
}

res_max = client.search(index="eval", body=query_max)
note_max = res_max["aggregations"]["max_rating"]["value"]
print("Note maximale présente dans le dataset :", note_max)


# Copier coller votre requête Kibana ici (SANS l'instruction GET)
query = {
    "size": 0,
    "query": {
        "term": {
            "Rating": note_max
        }
    },
    "aggs": {
        "top_class_names": {
            "terms": {
                "field": "Class Name.keyword"
            }
        },
        "top_terms_review_text": {
            "terms": {
                "field": "Review Text"
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