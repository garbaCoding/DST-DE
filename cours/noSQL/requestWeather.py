import os 
import requests
from pprint import pprint
from datetime import datetime
from pymongo import MongoClient


KEY = "e055183fdf48d8c71bd9294413a86b5a"
cities = ["Paris", "Toulouse", "Lyon", "Marseille", "Bordeaux", "Nice", "Nantes", "Strasbourg", "Montpellier", "Rennes"]

client = MongoClient(
    host = "127.0.0.1",
    port = 27017,
    username = "datascientest",
    password = "dst123"
)

def make_data(city):
    r = requests.get(
        url="https://api.openweathermap.org/data/2.5/weather?q={}&appid={}".format(
            city, KEY
        )
    )
    data = r.json()
    clean_data = {i: data[i] for i in ["weather", "main"]}
    clean_data["weather"] = clean_data["weather"][0]
    return clean_data


def add_key(data, city):
    current = datetime.now().strftime("%H:%M:%S")
    data["time"] = current
    data["city"] = city

    return data


def add_data(client, cities):

    col = client["sample"]["weather"]

    for city in cities:
        data = make_data(city)
        data = add_key(data, city)
        col.insert_one(data)


add_data(client, cities)

