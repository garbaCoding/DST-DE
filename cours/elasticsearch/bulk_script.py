#! /usr/bin/python
from elasticsearch import Elasticsearch, helpers
import csv
import os

# Connexion au cluster
es = Elasticsearch(hosts = "http://localhost:9200")

# Décommenter cette commande si vous utilisez l'installation sécurisée avec 3 nodes

#es = Elasticsearch(hosts = "https://elastic:datascientest@localhost:9200",
#                  ca_certs="./ca/ca.crt")

script_dir = os.path.dirname(os.path.abspath(__file__))
file_path = os.path.join(script_dir, "cars.csv")

with open(file_path, encoding='utf-8') as f:
    reader = csv.DictReader(f)
    helpers.bulk(es, reader, index='cars')