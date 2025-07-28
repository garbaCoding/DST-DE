from pymongo import MongoClient
from pprint import pprint
import re


client = MongoClient(
    host = "127.0.0.1",
    port = 27017,
    username = "datascientest",
    password = "dst123"
)

col=client["sample"]["weather"]

for i in list(col.find({"weather.main": "Clear"}, {"_id": 0, "city": 1})):
    print(i)

print(
    col.count_documents(
        {"main.temp_min": {"$gte": 287}, "main.temp_max": {"$lte": 291}},
    )
)

for i in list(col.aggregate([{"$group": {"_id": "$weather.main", "nb": {"$sum": 1}}}])):
    print(i)
